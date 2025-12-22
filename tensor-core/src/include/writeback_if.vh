/*
    Interface signals for the Writeback Module
*/

`ifndef WRITEBACK_IF_VH
`define WRITEBACK_IF_VH
`include "datapath_types.vh"
`include "isa_types.vh"

interface writeback_if;
    import datapath_pkg::*;
    import isa_pkg::*;

    // Inputs from Functional Units
    // ALU_out, alu_done
    // Scalar_load, L/S done
    word_t alu_wdat, load_wdat, jump_wdat;
    logic  branch_mispredict, branch_spec, branch_correct;
    logic alu_done, load_done, jump_done;
    regbits_t alu_reg_sel, load_reg_sel, jump_reg_sel;

    // Possible other done flags? 
    // Outputs of stage
    wb_t wb_out;
    
    modport wb (
        input alu_wdat, load_wdat, branch_mispredict, branch_spec, branch_correct, alu_done, 
        load_done, alu_reg_sel, load_reg_sel, jump_wdat, jump_done, jump_reg_sel,
        output wb_out
    );

endinterface
`endif

