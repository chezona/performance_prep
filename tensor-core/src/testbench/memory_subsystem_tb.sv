`include "caches_if.vh"
`include "arbiter_caches_if.vh"
`include "scratchpad_if.vh"
`include "datapath_cache_if.vh"

module memory_subsystem_tb;
  import "DPI-C" function void mem_init();
  import "DPI-C" function void mem_read(input bit [31:0] address, output bit [31:0] data);
  import "DPI-C" function void mem_write(input bit [31:0] address, input bit [31:0] data);
  import "DPI-C" function void mem_save();

  import caches_pkg::*;
  import types_pkg::*;

  parameter PERIOD = 20;

  logic CLK = 1, nRST;
  always #(PERIOD/2) CLK++;

  datapath_cache_if dcif();
  caches_if cif();
  arbiter_caches_if acif(cif);
  scratchpad_if spif();

  // Holds all memory modules
  memory_subsystem DUT (
    .CLK(CLK),
    .nRST(nRST),
    .dcif(dcif),
    .cif(cif),
    .acif(acif),
    .spif(spif)
  );

  integer i;
  int test_num;
  bit [31:0] read_data;

  task reset_dut;
    begin
      nRST = 0;
      @(posedge CLK);
      @(posedge CLK);
      nRST = 1;
      @(posedge CLK);
    end
  endtask

//TODO: WIP
//   task write_icache(
//       logic   local_imemREN, 
//       word_t  local_imemaddr
//   );
//     begin
//       dcif.imemREN = local_imemREN;
//       dcif.imemaddr = local_imemaddr;
//     end
//   endtask

  task write_dcache(
      logic   local_dmemREN,
      logic   local_dmemWEN,
      word_t  local_dmemaddr,
      word_t  local_dmemstore
  );
    begin
      dcif.dmemREN = local_dmemREN;
      dcif.dmemWEN = local_dmemWEN;
      dcif.dmemaddr = local_dmemaddr;
      dcif.dmemstore = local_dmemstore;
    end
  endtask

  initial begin
    static string test_name = "Reset";
    static string major_test_name = "Reset";
    spif.psumout_en = 1'b0;
    spif.drained = 1'b0;
    mem_init();
    test_num = 0;
    reset_dut();
    acif.ramstate = FREE;
    acif.ramload = 32'h0;
    dcif.dmemREN = '0;
    dcif.dmemWEN = '0;
    dcif.dmemaddr = '0;
    dcif.dmemstore = '0;

    // Test 1: Write and read Dcache
    // DCACHE TESTS
    test_name = "Write and read Dcache";
    $display("Test 1: Write and read Dcache");
    test_num = test_num + 1;
    acif.ramstate = ACCESS;
    //first write has to be a miss
    write_dcache(0, 1, 32'h00000100, 32'hFEEDCAFE); //store FEEDCAFE IN address 100
    acif.ramstate = BUSY;
    @(posedge CLK);
    #10;
    acif.ramstate = ACCESS;
    write_dcache(0, 1, 32'h00000100, 32'hFEEDCAFF); //store FEEDCAFF in address 100
    acif.ramstate = BUSY;
    @(posedge CLK);
    #10;

    #1000

    //TODO: later
    //mem_read(32'hFEEDCAFE, );




    //ICACHE TESTS





    //SCRATCHPAD TESTS
    acif.ramstate = FREE;
    acif.ramload = 32'h0;
    write_dcache(0,0,0,0);
    
    spif.instrFIFO_WEN = 1'b0;
    nRST = 1;
    #(PERIOD);

    nRST = 0;
    #(PERIOD * 2);

    nRST = 1;
    #(PERIOD);

    @(posedge CLK);
    
    major_test_name = "No bank conflicts";

    test_name = "Load Instruction 1";
    @(negedge CLK);
    
    spif.instrFIFO_WEN = 1'b1;
    //spif.instrFIFO_wdata = {2'b01, 4'h2, 32'h00000004};
    spif.instrFIFO_wdata.opcode = 2'd1;
    spif.instrFIFO_wdata.ls_matrix_rd_gemm_new_weight = 6'h05;
    spif.instrFIFO_wdata.ls_addr_gemm_gemm_sel = 32'h00000004;
    #(PERIOD);
    spif.instrFIFO_WEN = 1'b0;
    #(PERIOD*25);

    test_name = "Load Instruction 2";
    @(negedge CLK);
    
    spif.instrFIFO_WEN = 1'b1;
    //spif.instrFIFO_wdata = {2'b01, 4'h6, 32'd36};\
    spif.instrFIFO_wdata.opcode = 2'd1;
    spif.instrFIFO_wdata.ls_matrix_rd_gemm_new_weight = 6'h15;
    spif.instrFIFO_wdata.ls_addr_gemm_gemm_sel = 32'd36;
    #(PERIOD);
    spif.instrFIFO_WEN = 1'b0;
    #(PERIOD*25);
    spif.drained = 1'b1;

    test_name = "Load Instruction 3";
    @(negedge CLK);
    
    spif.instrFIFO_WEN = 1'b1;
    //spif.instrFIFO_wdata = {2'b01, 4'ha, 32'd68};
    spif.instrFIFO_wdata.opcode = 2'd1;
    spif.instrFIFO_wdata.ls_matrix_rd_gemm_new_weight = 6'h25;
    spif.instrFIFO_wdata.ls_addr_gemm_gemm_sel = 32'd68;
    #(PERIOD);
    // spif.instrFIFO_WEN = 1'b1;
    // spif.instrFIFO_wdata.opcode = 2'd2;
    // spif.instrFIFO_wdata.ls_matrix_rd_gemm_new_weight = 6'h15;
    // spif.instrFIFO_wdata.ls_addr_gemm_gemm_sel = 32'd100;
    // #(PERIOD);
    spif.instrFIFO_WEN = 1'b0;
    #(PERIOD*25);

    test_name = "GEMM";
    @(negedge CLK);
    
    spif.instrFIFO_WEN = 1'b1;
    //spif.instrFIFO_wdata = {2'b11, 4'b1000, 32'h0000ea62};
    spif.instrFIFO_wdata.opcode = 2'd3;
    spif.instrFIFO_wdata.ls_matrix_rd_gemm_new_weight = 6'b100000;
    spif.instrFIFO_wdata.ls_addr_gemm_gemm_sel = {8'b0, 6'h35, 6'h25, 6'h15, 6'h05};
    #(PERIOD);
    spif.instrFIFO_WEN = 1'b0;
    #(PERIOD*25);

    spif.psumout_en = 1'b1;
    spif.psumout_data = 64'hffffffffffffffff;
    spif.psumout_row_sel_in = 2'd0;
    #(PERIOD);
    spif.psumout_data = 64'hffffffffffffffff;
    spif.psumout_row_sel_in = 2'd1;
    #(PERIOD);
    spif.psumout_data = 64'hffffffffffffffff;
    spif.psumout_row_sel_in = 2'd2;
    #(PERIOD);
    spif.psumout_data = 64'hffffffffffffffff;
    spif.psumout_row_sel_in = 2'd3;
    #(PERIOD);
    spif.psumout_en = 1'b0;
    #(PERIOD*25);

    test_name = "Store Instruction";
    spif.instrFIFO_WEN = 1'b1;
    spif.instrFIFO_wdata.opcode = 2'd2;
    spif.instrFIFO_wdata.ls_matrix_rd_gemm_new_weight = 6'h35;
    spif.instrFIFO_wdata.ls_addr_gemm_gemm_sel = 32'd132;
    #(PERIOD);
    spif.instrFIFO_WEN = 1'b0;
    #(PERIOD*25);

    major_test_name = "B2B";
    test_name = "GEMM->Store";
    spif.instrFIFO_WEN = 1'b1;
    spif.instrFIFO_wdata.opcode = 2'd3;
    spif.instrFIFO_wdata.ls_matrix_rd_gemm_new_weight = 6'b100000;
    spif.instrFIFO_wdata.ls_addr_gemm_gemm_sel = {8'b0, 6'h35, 6'h25, 6'h15, 6'h05};
    #(PERIOD);
    spif.instrFIFO_WEN = 1'b1;
    spif.instrFIFO_wdata.opcode = 2'd2;
    spif.instrFIFO_wdata.ls_matrix_rd_gemm_new_weight = 6'h35;
    spif.instrFIFO_wdata.ls_addr_gemm_gemm_sel = 32'd164;
    #(PERIOD);
    spif.instrFIFO_WEN = 1'b0;
    #(PERIOD*25);

    test_name = "Store->GEMM";
    spif.instrFIFO_WEN = 1'b1;
    spif.instrFIFO_wdata.opcode = 2'd2;
    spif.instrFIFO_wdata.ls_matrix_rd_gemm_new_weight = 6'h35;
    spif.instrFIFO_wdata.ls_addr_gemm_gemm_sel = 32'd196;
    #(PERIOD);
    spif.instrFIFO_WEN = 1'b1;
    spif.instrFIFO_wdata.opcode = 2'd3;
    spif.instrFIFO_wdata.ls_matrix_rd_gemm_new_weight = 6'b100000;
    spif.instrFIFO_wdata.ls_addr_gemm_gemm_sel = {8'b0, 6'h35, 6'h25, 6'h15, 6'h05};
    #(PERIOD);
    spif.instrFIFO_WEN = 1'b0;
    #(PERIOD*25);

    // test_name = "Store Instruction";
    // spif.instrFIFO_WEN = 1'b1;
    // //spif.instrFIFO_wdata = {2'b10, 4'h2, 32'd36};
    // spif.opcode = 2'd2;
    // spif.ls_matrix_rd_gemm_new_weight = 6'h25;
    // spif.ls_addr_gemm_gemm_sel = 32'd100;
    // #(PERIOD);
    // spif.instrFIFO_WEN = 1'b0;
    // #(PERIOD*25);

    // test_name = "Load Instruction 2";
    
    // spif.instrFIFO_WEN = 1'b1;
    // spif.instrFIFO_wdata = {2'b01, 4'hf, 32'hf0f0f0f0};
    // #(PERIOD);
    // spif.instrFIFO_WEN = 1'b0;
    // #(PERIOD*25);

    $display("All tests passed!");
    $stop;
  end
endmodule