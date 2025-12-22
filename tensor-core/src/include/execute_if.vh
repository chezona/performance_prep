`ifndef EXECUTE_IF_VH
`define EXECUTE_IF_VH

`include "datapath_types.vh"
`include "isa_types.vh"
`include "sp_types_pkg.vh"


// IGNORE
// SCratchpad fifo signals
// wen, wdata outpputs for me inputs for fifo
// full output fifo input execute (while its not full you can push data)
// when ouptut is not full WEN is high  (37 bit bus write data)

// 37 bit fifo, MSB (1 = Load, 0 = store), 4 bits for matrix, 32 bit address
// for gemm instr only bottom 16 bits have data, rest is 0
// {2'b(Load1, store2, gemm3), 32'b(address or gemm buffer -> 16 0s), 4'b(matrix_rd), 5'b(stride)}

// {2'b(store?)(load?), 4'd(matrix_rd), 32,d(matrix address)} MATRIX LS
// {2'b11, 4'b(new weight?)000, 16'd0, 16'(gemm select)} GEMM Ops


interface execute_if;
  import datapath_pkg::*; 
  import isa_pkg::*;
  import sp_types_pkg::*;

  // Branch FU
  logic bfu_enable;
  logic br_jump;
  // logic bfu_branch_gate_sel;
  logic [1:0] bfu_j_type;
  logic bfu_predicted_outcome;
  branch_t bfu_branch_type;
  word_t bfu_reg_a, bfu_reg_b, bfu_current_pc, bfu_imm;

  // Scalar ALU FU
  word_t salu_port_a, salu_port_b;
  aluop_t salu_aluop;
  logic salu_enable;

  // Scalar Load/Store FU
  word_t sls_imm, sls_rs1, sls_rs2, sls_dmem_in;
  logic sls_dhit_in, sls_enable;
  scalar_mem_t sls_mem_type;

  // MLS FU
  logic           mls_enable;
  matrix_mem_t    mls_ls_in;
  matbits_t       mls_rd_in;
  word_t          mls_rs_in, mls_imm_in;

  // Gemm FU
  logic gemm_enable, gemm_new_weight_in;
  matbits_t gemm_rs1_in, gemm_rs2_in, gemm_rs3_in, gemm_rd_in;
  logic gemm_done;
  
  // output
  eif_output_t eif_output;

  logic halt;
  logic spec;
  regbits_t rd;

  logic gemm_complete, store_complete, load_complete;

  modport eif (
    input gemm_complete, store_complete, load_complete,
          // lw and alu destination
          rd,
          // Branch FU
          bfu_enable, bfu_branch_type, bfu_reg_a, bfu_reg_b, bfu_current_pc, bfu_imm, bfu_predicted_outcome, bfu_j_type,
          // Scalar ALU FU
          salu_aluop, salu_port_a, salu_port_b, salu_enable,
          // Scalar Load/Store FU
          sls_enable, sls_imm, sls_rs1, sls_rs2, sls_dmem_in, sls_dhit_in, sls_mem_type,
          // Matrix Load/Store FU
          mls_enable, mls_ls_in, mls_rd_in, mls_rs_in, mls_imm_in,
          // GEMM FUsadsaf
          gemm_enable, gemm_new_weight_in, gemm_rs1_in, gemm_rs2_in, gemm_rs3_in, gemm_rd_in,
          // halt
          halt,
          // spec 
          spec,
    output eif_output
  );

  modport tbif (
    input eif_output,
    output// lw and alu destination
          rd,
          // Branch FU
          bfu_enable, bfu_branch_type, bfu_reg_a, bfu_reg_b, bfu_current_pc, bfu_imm, bfu_predicted_outcome,
          // Scalar ALU FU
          salu_aluop, salu_port_a, salu_port_b, salu_enable,
          // Scalar Load/Store FU
          sls_enable, sls_imm, sls_rs1, sls_rs2, sls_dmem_in, sls_dhit_in, sls_mem_type,
          // MLS FU
          mls_enable, mls_ls_in, mls_rd_in, mls_rs_in, mls_imm_in,
          // GEMM FU
          gemm_enable, gemm_new_weight_in, gemm_rs1_in, gemm_rs2_in, gemm_rs3_in, gemm_rd_in,
          // halt
          halt,
          // spec
          spec
  );

endinterface

`endif


