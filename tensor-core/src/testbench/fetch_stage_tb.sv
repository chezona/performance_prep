`include "fetch_stage_if.vh"
`include "isa_types.vh"

import isa_pkg::*;

`timescale 1ns / 10ps

module fetch_stage_tb;

// Parameters
localparam CLK_PERIOD = 1;

// Testbench Signals
logic tb_clk;
logic tb_nrst;
logic tb_ihit;
logic tb_enable;
logic [0:15] tb_count;

always
begin
    tb_clk = 1'b0;
    #(CLK_PERIOD/2.0);
    tb_clk = 1'b1;
    #(CLK_PERIOD/2.0);
end

fetch_stage_if fsif ();
fetch_stage DUT (.CLK(tb_clk), .nRST(tb_nrst), .ihit(tb_ihit), .fsif(fsif));

string tb_test_case = "";

initial begin
    tb_nrst = 1'b1;
    tb_ihit = '0;
    fsif.imemload = '0;
    fsif.freeze = '0;
    fsif.misprediction = '0;
    fsif.correct_pc = '0;
    fsif.update_btb = '0;
    fsif.branch_outcome = '0;
    fsif.update_pc = '0;
    fsif.branch_target = '0;

    tb_test_case = "Reset DUT";
    #(CLK_PERIOD * 2);
    tb_nrst = 1'b0;
    #(CLK_PERIOD * 2);
    tb_nrst = 1'b1;
    #(CLK_PERIOD * 2);

    tb_test_case = "Basic Fetch";
    tb_ihit = 1'b1;
    fsif.imemload = 32'h00000080;
    #(4);
    assert(fsif.pc == 32'h00000010);
    assert(fsif.instr == fsif.imemload);

    tb_test_case = "BP";
    fsif.update_btb = 1'b1;
    fsif.update_pc = 32'h80000000;
    fsif.branch_target = 32'h80000100;
    fsif.branch_outcome = 1'b1;
    #(4);
    fsif.update_btb = 1'b0;

    fsif.misprediction = 1'b1;
    fsif.correct_pc = 32'h80000000;
    #(4);
    fsif.misprediction = 1'b0;
    assert(fsif.pc == 32'h80000000);

    $stop;
end

endmodule