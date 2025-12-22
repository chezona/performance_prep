// mapped needs this
`include "cache_control_if.vh"
//`include "cpu_ram_if.vh"
`include "caches_if.vh"
`include "datapath_cache_if.vh"
`include "caches_pkg.vh"
// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module icache_tb;

  // clock period
  parameter PERIOD = 20;

  // signals
  logic CLK = 1, nRST;

  // clock
  always #(PERIOD/2) CLK++;


  // interface
  datapath_cache_if dcif();
  caches_if cif0();   
  // test program
  test PROG (CLK,dcif,cif0,nRST);  
  // DUT
  icache  DUT_icache(.CLK(CLK),.nRST(nRST), .cif(cif0), .dcif(dcif));


endmodule

program test(input logic CLK, datapath_cache_if.cache my_dcif, caches_if my_cif0, output logic nrst); 
int test_num;
parameter PERIOD = 10;

import caches_pkg::*;

  task reset_dut;
    begin
      write('0,'0,'1,'0);
      // Activate the design's reset (does not need to be synchronize with clock)
      nrst = 1'b0;
      
      
      // Wait for a couple clock cycles
      @(posedge CLK);
      
      // Release the reset
      @(negedge CLK);
      nrst = '1;
      
      // Wait for a while before activating the design
      @(posedge CLK);
    end
  endtask

  task write(
      logic   local_imemREN, 
      word_t local_imemaddr,
      logic local_iwait,
      word_t local_iload
  );
  begin
      my_dcif.imemREN = local_imemREN;
      my_dcif.imemaddr = local_imemaddr;

      my_cif0.iwait = local_iwait;
      my_cif0.iload = local_iload;
  end
  endtask



    // test
    initial begin
      test_num = -1;
      reset_dut;
      #(PERIOD * 5)
      // imemREN, imemaddr, iwait, iload
      
     // first fetch will be a miss, data invalid
      test_num = test_num + 1;   // test case 0
      write('1, 32'b111100, '1, '0);
      #(PERIOD * 5)

      write('1, 32'b111100, '0, 32'h8);
      #(PERIOD * 5)

      // second fetch will be a ihit, data valid & tag match
      test_num = test_num + 1;   // test case 0
      write('1, 32'b111100, '1, '0);
      #(PERIOD * 5)

    // test some other places
     test_num = test_num + 1;   // test case 0
      write('1, 32'b101100, '1, '0);
      #(PERIOD * 5)
       write('1, 32'b101100, '0, 32'hffffffff);
      #(PERIOD * 5)

       test_num = test_num + 1;   
     write('1, 32'b101100, '1, '0);
      #(PERIOD * 5)
    

    // same index differnt tag
     test_num = test_num + 1;   
      write('1, 32'b10111100, '1, '0);
      #(PERIOD * 5)
      // that is a miss, need to reaplce that row and get data from ram
       test_num = test_num + 1;   
      write('1, 32'b10111100, '0, 32'hFEEDCAFE);
      #(PERIOD * 5)


      #(PERIOD * 10)
      #(PERIOD * 10)
      $finish;
      

    end
endprogram