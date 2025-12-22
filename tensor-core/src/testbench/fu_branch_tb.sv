`include "fu_branch_if.vh"
`include "isa_types.vh"

import isa_pkg::*;

`timescale 1ns / 10ps

module fu_branch_tb;

// Parameters
localparam CLK_PERIOD = 1;

// Testbench Signals
logic tb_clk;
logic tb_nrst;
logic tb_enable;
logic [0:15] tb_count;

always
begin
    tb_clk = 1'b0;
    #(CLK_PERIOD/2.0);
    tb_clk = 1'b1;
    #(CLK_PERIOD/2.0);
end

fu_branch_if fubif ();
fu_branch DUT (.CLK(tb_clk), .nRST(tb_nrst), .fubif(fubif));

string tb_test_case = "INIT";

initial begin
    // Power on Reset
    tb_nrst = 1'b1;
    tb_enable = 1'b0;
    fubif.branch_type = BT_BEQ;
    fubif.j_type = 2'd0;
    fubif.reg_a = '0;
    fubif.reg_b = '0;
    fubif.enable = '0;
    fubif.imm = '0;
    #(CLK_PERIOD*2);
    tb_nrst = 1'b1;
    #(CLK_PERIOD*2);

    // Init
    fubif.branch = 1'b1;
    fubif.current_pc = '0;
    fubif.imm = 32'd100;
    fubif.enable = '1;

    // BEQ: Case 1
    tb_test_case = "BEQ 1";
    fubif.branch_type = BT_BEQ;
    fubif.reg_a = 32'd10;
    fubif.reg_b = 32'd10;
    fubif.current_pc = 32'd0;
    #(CLK_PERIOD*10);

    // BEQ: Case 2
    tb_test_case = "BEQ 2";
    fubif.branch_type = BT_BEQ;
    fubif.reg_a = 32'd10;
    fubif.reg_b = 32'd8;
    fubif.current_pc = 32'd4;
    #(CLK_PERIOD*10);

    // BNE: Case 1
    tb_test_case = "BNE 1";
    fubif.branch_type = BT_BNE;
    fubif.reg_a = 32'd10;
    fubif.reg_b = 32'd8;
    fubif.current_pc = 32'd8;
    #(CLK_PERIOD*10);

    // BNE: Case 2
    tb_test_case = "BNE 2";
    fubif.branch_type = BT_BNE;
    fubif.reg_a = 32'd10;
    fubif.reg_b = 32'd10;
    fubif.current_pc = 32'd12;
    #(CLK_PERIOD*10);

    // BLT: Case 1
    tb_test_case = "BLT 1";
    fubif.branch_type = BT_BLT;
    fubif.reg_a = 32'd8;
    fubif.reg_b = 32'd10;
    fubif.current_pc = 32'd16;
    #(CLK_PERIOD*10);

    // BLT: Case 2
    tb_test_case = "BLT 2";
    fubif.branch_type = BT_BLT;
    fubif.reg_a = 32'd10;
    fubif.reg_b = 32'd8;
    fubif.current_pc = 32'd20;
    #(CLK_PERIOD*10);

    // BGE: Case 1
    tb_test_case = "BGE 1";
    fubif.branch_type = BT_BGE;
    fubif.reg_a = 32'd10;
    fubif.reg_b = 32'd8;
    fubif.current_pc = 32'd24;
    #(CLK_PERIOD*10);

    // BGE: Case 2
    tb_test_case = "BGE 2";
    fubif.branch_type = BT_BGE;
    fubif.reg_a = 32'd8;
    fubif.reg_b = 32'd10;
    fubif.current_pc = 32'd28;
    #(CLK_PERIOD*10);

    // BLTU: Case 1
    tb_test_case = "BLTU 1";
    fubif.branch_type = BT_BLTU;
    fubif.reg_a = 32'd8;
    fubif.reg_b = 32'd10;
    fubif.current_pc = 32'd32;
    #(CLK_PERIOD*10);

    // BLTU: Case 2
    tb_test_case = "BLTU 2";
    fubif.branch_type = BT_BLTU;
    fubif.reg_a = 32'd10;
    fubif.reg_b = 32'd8;
    fubif.current_pc = 32'd36;
    #(CLK_PERIOD*10);

    // BLTU: Case 3
    tb_test_case = "BLTU 3";
    fubif.branch_type = BT_BLTU;
    fubif.reg_a = 32'd8;
    fubif.reg_b = 32'h80000000;
    fubif.current_pc = 32'd40;
    #(CLK_PERIOD*10);

    // BLTU: Case 4
    tb_test_case = "BLTU 4";
    fubif.branch_type = BT_BLTU;
    fubif.reg_a = 32'h80000000;
    fubif.reg_b = 32'd8;
    fubif.current_pc = 32'd48;
    #(CLK_PERIOD*10);

    // BGEU: Case 1
    tb_test_case = "BGEU 1";
    fubif.branch_type = BT_BGEU;
    fubif.reg_a = 32'd10;
    fubif.reg_b = 32'd8;
    fubif.current_pc = 32'd52;
    #(CLK_PERIOD*10);

    // BGEU: Case 2
    tb_test_case = "BGEU 2";
    fubif.branch_type = BT_BGEU;
    fubif.reg_a = 32'd8;
    fubif.reg_b = 32'd10;
    fubif.current_pc = 32'd56;
    #(CLK_PERIOD*10);

    // BGEU: Case 3
    tb_test_case = "BGEU 3";
    fubif.branch_type = BT_BGEU;
    fubif.reg_a = 32'h7FFFFFFF;
    fubif.reg_b = 32'd10;
    fubif.current_pc = 32'd60;
    #(CLK_PERIOD*10);

    // BGEU: Case 4
    tb_test_case = "BGEU 4";
    fubif.branch_type = BT_BGEU;
    fubif.reg_a = 32'd10;
    fubif.reg_b = 32'h7FFFFFFF;
    fubif.current_pc = 32'd64;
    #(CLK_PERIOD*10);

    // BGEU: Case 5
    tb_test_case = "BGEU 5";
    fubif.branch_type = BT_BGEU;
    fubif.reg_a = 32'hFFFFFFFF;
    fubif.reg_b = 32'd10;
    fubif.current_pc = 32'd68;
    #(CLK_PERIOD*10);

    // BGEU: Case 6
    tb_test_case = "BGEU 6";
    fubif.branch_type = BT_BGEU;
    fubif.reg_a = 32'd10;
    fubif.reg_b = 32'hFFFFFFFF;
    fubif.current_pc = 32'd72;
    #(CLK_PERIOD*10);

    // JAL: Case 1
    tb_test_case = "JAL 1";
    fubif.j_type = 2'd1;
    fubif.current_pc = 32'd76;
    fubif.imm = 32'h0000_0100;
    #(CLK_PERIOD*10);

    // JALR: Case 1
    tb_test_case = "JALR 1";
    fubif.j_type = 2'd2;
    fubif.reg_a = 32'h0000_0020;
    fubif.imm = 32'h0000_0100;
    #(CLK_PERIOD*10);

    tb_enable = 1'b0;
    #(CLK_PERIOD*10);

    $stop;
end

endmodule