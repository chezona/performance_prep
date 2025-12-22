`ifndef FETCH_STAGE_IF_VH
`define FETCH_STAGE_IF_VH

`include "isa_types.vh"

interface fetch_stage_if;
  import isa_pkg::*;

  logic imemREN;
  word_t imemload;
  word_t imemaddr;
  
  // Branch Resolution Interface
  logic update_btb;
  logic branch_outcome, predicted_outcome;
  word_t update_pc;
  word_t branch_target;
  
  // Pipeline Control
  logic freeze;
  logic jump;
  logic br_jump;
  logic misprediction;
  logic halt;
  word_t correct_pc;
  
  // Outputs
  word_t pc;
  word_t instr;
  word_t predicted_pc;

  modport fs (
    input imemload, freeze, misprediction, correct_pc, halt,
    input update_btb, branch_outcome, update_pc, branch_target, jump, br_jump,
    output pc, instr, imemREN, predicted_outcome, imemaddr
  );

  modport tb (
    output imemload, freeze, misprediction, correct_pc, 
    output update_btb, branch_outcome, update_pc, branch_target, jump, br_jump,
    input pc, instr, imemREN, predicted_outcome, imemaddr
  );
endinterface

`endif