`ifndef FETCH_IF_VH
`define FETCH_IF_VH

`include "isa_types.vh"

interface fetch_if;
  import isa_pkg::*;

  logic freeze, misprediction, imemREN, br_jump, jump, missed;
  word_t imemload, pc_prediction, instr, pc, correct_pc, imemaddr;

  modport ft (
    input imemload, freeze, jump, missed, pc_prediction, misprediction, correct_pc, br_jump,
    output imemREN, instr, pc, imemaddr
  );

  modport tb (
    input imemREN, instr, pc, imemaddr,
    output imemload, freeze, pc_prediction, misprediction, correct_pc, br_jump
  );

endinterface

`endif
