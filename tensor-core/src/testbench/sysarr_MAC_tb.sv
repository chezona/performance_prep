`timescale 1ns/1ps

`include "systolic_array_MAC_if.vh"

// to run this: verilator --binary -j 0 -Wall -Wno-fatal MAC_unit_tb -IMAC_unit -Itestbench -Iinclude --hierarchical --trace
// ./obj_dir/VMAC_unit_tb
// gtkwave waves.vcd --save=mac_debug.gtkw

// to run this: verilator --binary -j 0 -Wall -Wno-fatal MAC_unit_tb -Imodules -Itestbench -Iinclude --hierarchical --trace; ./obj_dir/VMAC_unit_tb; gtkwave waves.vcd --save=mac_debug.gtkw


/* verilator lint_off UNUSEDSIGNAL */
module sysarr_MAC_tb;

    // Parameters
    localparam CLK_PERIOD = 1;

    // Testbench Signals
    logic tb_clk;
    logic tb_nrst;


    // Clk init
    always
    begin
        tb_clk = 1'b0;
        #(CLK_PERIOD/2.0);
        tb_clk = 1'b1;
        #(CLK_PERIOD/2.0);
    end
    
    // sysarr_control_unit_if instance
    systolic_array_MAC_if mac_if();

    sysarr_MAC dut (.clk(tb_clk), .nRST(tb_nrst), .mac_if(mac_if.MAC));
    
    // Test sequence
    initial begin
        // Initialize interface signals
        $dumpfile("waves.vcd");
        $dumpvars();
        tb_nrst = 0;
        #CLK_PERIOD;
        tb_nrst = 1;

        @(posedge tb_clk);
        mac_if.start = 0;
        mac_if.in_value = 16'h4000;
        mac_if.weight = 16'h4700;
        mac_if.in_accumulate = 16'h4500;

        @(posedge tb_clk);
        #(CLK_PERIOD * 2);

        // Startup sequence: first turn MAC_shift on for one cycle then start
        mac_if.MAC_shift = 1;
        #CLK_PERIOD;
        mac_if.MAC_shift = 0;
        mac_if.start = 1;
        #CLK_PERIOD;
        mac_if.start = 0;


        #(CLK_PERIOD*20)

        // @(posedge mac_if.value_ready);
        @(posedge tb_clk)
        #(CLK_PERIOD * 2)
        // Intentionally de-sync inputs from clock edge
        // #(CLK_PERIOD * 0.1)
        // mac_if.in_value = 16'h439a;
        // mac_if.weight = 16'h5c96;
        // mac_if.in_accumulate = 16'h58c3;

        // then set values
        mac_if.in_value = 16'h0000;
        mac_if.weight = 16'h0000;
        mac_if.in_accumulate = 16'h4cc0;

        // Startup sequence: first turn MAC_shift on for one cycle then start
        mac_if.MAC_shift = 1;
        #CLK_PERIOD;
        mac_if.MAC_shift = 0;

        mac_if.start = 1;
        #CLK_PERIOD;
        mac_if.start = 0;


        #(CLK_PERIOD * 6) 

        $finish;
    end

endmodule

