`ifndef FU_BRANCH_IF_VH
`define FU_BRANCH_IF_VH

`include "isa_types.vh"

interface fu_branch_if;
  import isa_pkg::*;

  // branch_fu should just take in which of the 6 branch types the instr, extra logic in the sb should be limited to decoding and out of order

  logic enable, branch, branch_outcome; 
  // logic branch_gate_sel; - branch_gate_sel should be based on what the branch type is from the sb
  logic predicted_outcome, miss, update_btb, resolved, br_jump;
  branch_t branch_type; // this should be branch_t type
  logic [1:0] j_type;
  word_t reg_a, reg_b, current_pc, imm, updated_pc, correct_pc, update_pc, branch_target, jump_dest, jump_wdat;

  modport br (
    input enable, branch, branch_type, reg_a, reg_b, current_pc, imm, predicted_outcome, j_type,
    output branch_outcome, miss, correct_pc, update_btb, update_pc, branch_target, resolved, jump_dest, jump_wdat, br_jump
  );

  modport tb (
    output enable, branch, branch_type, reg_a, reg_b, current_pc, imm, predicted_outcome, j_type,
    input branch_outcome, miss, correct_pc, update_btb, update_pc, branch_target, resolved, jump_dest, jump_wdat, br_jump
  );
endinterface

`endif
