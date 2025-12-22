`include "caches_if.vh"
`include "arbiter_caches_if.vh"
`include "scratchpad_if.vh"

module memory_arbiter_basic_tb;

  import caches_pkg::*;
  import types_pkg::*;

  parameter PERIOD = 20;

  logic CLK = 1, nRST;
  always #(PERIOD/2) CLK++;

  caches_if cif();
  arbiter_caches_if acif(cif);
  scratchpad_if spif();

  memory_arbiter_basic DUT (
    .CLK(CLK),
    .nRST(nRST),
    .acif(acif),
    .spif(spif.arbiter)
  );

  integer i;
  logic [63:0] expected_load_data [0:3];
  logic [63:0] expected_store_data [0:3];

  task reset_dut;
    begin
      nRST = 0;
      @(posedge CLK);
      @(posedge CLK);
      nRST = 1;
      @(posedge CLK);
    end
  endtask

  task check_state;
    input [3:0] expected_state;
    begin
      #1;
      $display("Checking state: expected=%b, actual=%b, spif.sLoad=%b, spif.sStore=%b, time=%t", 
               expected_state, DUT.arbiter_state, spif.sLoad, spif.sStore, $time);
      if (DUT.arbiter_state !== expected_state) begin
        $display("ERROR: Expected state %b, got %b at time %t", 
                 expected_state, DUT.arbiter_state, $time);
        $stop;
      end
    end
  endtask

  initial begin
    spif.sLoad = 0;
    spif.sStore = 0;
    cif.iREN = 0;
    cif.dREN = 0;
    cif.dWEN = 0;
    acif.ramstate = FREE;
    spif.load_addr = 32'h1000;
    spif.store_addr = 32'h2000;
    spif.store_data = 64'hDEADBEEFCAFEFACE;
    cif.iaddr = 32'h3000;
    cif.daddr = 32'h4000;
    cif.dstore = 32'hBEEFBEEF;

    for (i = 0; i < 4; i++) begin
      expected_load_data[i] = '0;
      expected_store_data[i] = '0;
    end

    // Test 1: Reset
    $display("Test 1: Resetting DUT...");
    reset_dut();
    check_state(4'b0000);

    // Test 2: SP_LOAD with four iterations
    $display("Test 2: Testing SP_LOAD for four 64-bit values...");
    spif.sLoad = 1;
    @(posedge CLK);
    check_state(4'b0001);

    for (i = 0; i < 4; i++) begin
      // SP_LOAD1
      acif.ramstate = BUSY;
      @(posedge CLK);
      check_state(4'b0001); // SP_LOAD1
      acif.ramstate = ACCESS;
      acif.ramload = 32'h12345678 + (i * 32'h11111111);
      @(posedge CLK);
      check_state(4'b0010); // SP_LOAD2

      // SP_LOAD2
      acif.ramstate = BUSY;
      @(posedge CLK);
      check_state(4'b0010);
      acif.ramstate = ACCESS;
      acif.ramload = 32'h9ABCDEF0 + (i * 32'h11111111);
      #1;
      if (!spif.sLoad_hit) begin
        $display("ERROR: sLoad_hit not asserted for load %d at %t", i, $time);
        $stop;
      end
      else begin
        $display("load hit signal passed at %t", $time);
      end
      @(posedge CLK);
      #1;
      expected_load_data[i] = {32'h9ABCDEF0 + (i * 32'h11111111), 32'h12345678 + (i * 32'h11111111)};
      if (spif.load_data !== expected_load_data[i]) begin
        $display("ERROR: Load %d data mismatch, expected %h, got %h at %t", 
                 i, expected_load_data[i], spif.load_data, $time);
        $stop;
      end
      else begin
        $display("Correct Data at %t", $time);
      end
      $display("Load %d: addr1=%h, addr2=%h, data=%h, sLoad_row=%d", 
               i, spif.load_addr + (i * 32'd16), spif.load_addr + (i * 32'd16) + 32'd8, 
               spif.load_data, spif.sLoad_row);
      if (i < 3) check_state(4'b0001); // Back to SP_LOAD1
      else check_state(4'b0000); // IDLE after last load
    end
    spif.sLoad = 0;

    // Test 3: SP_STORE with four iterations
    $display("Test 3: Testing SP_STORE for four 64-bit values...");
    spif.sStore = 1;
    @(posedge CLK);
    check_state(4'b0011); // SP_STORE1

    for (i = 0; i < 4; i++) begin
      // SP_STORE1
      acif.ramstate = BUSY;
      @(posedge CLK);
      check_state(4'b0011);
      acif.ramstate = ACCESS;
      @(posedge CLK);
      check_state(4'b0100); // SP_STORE2

      // SP_STORE2
      acif.ramstate = BUSY;
      @(posedge CLK);
      check_state(4'b0100);
      acif.ramstate = ACCESS;
      #1;
      if (!spif.sStore_hit) begin
        $display("ERROR: sStore_hit not asserted for store %d at %t", i, $time);
        $stop;
      end
      else begin
        $display("store hit signal passed at %t", $time);
      end
      @(posedge CLK);
      #1;
      expected_store_data[i] = spif.store_data;
      $display("Store %d: addr1=%h, data1=%h, addr2=%h, data2=%h, expected=%h", 
               i, spif.store_addr + (i * 32'd16), spif.store_data[31:0],
               spif.store_addr + (i * 32'd16) + 32'd8, spif.store_data[63:32], 
               expected_store_data[i]);
      if (i < 3) check_state(4'b0011); // Back to SP_STORE1
      else check_state(4'b0000); // IDLE after last store
    end
    spif.sStore = 0;

    $display("Test 4: All signals on, expecting SP_LOAD priority");
    reset_dut();
    spif.sLoad = 1;
    spif.sStore = 1;
    cif.dREN = 1;
    cif.dWEN = 1;
    cif.iREN = 1;
    @(posedge CLK);
    #1;
    check_state(4'b0001);
    spif.sLoad = 0;
    @(posedge CLK);
    #1;
    check_state(4'b0000);
    @(posedge CLK);
    #1;
    check_state(4'b0011);
    spif.sStore = 0;
    @(posedge CLK);
    #1;
    check_state(4'b0000);
    @(posedge CLK);
    #1;
    check_state(4'b0101);

    $display("All tests passed!");
    $stop;
  end
endmodule