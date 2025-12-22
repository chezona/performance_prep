`ifndef FU_SCALAR_LS_IF_VH
`define FU_SCALAR_LS_IF_VH

`include "datapath_types.vh"

interface fu_scalar_ls_if;

  // import types
  import isa_pkg::*;
  import datapath_pkg::*;

  word_t imm, dmemload, dmemaddr, dmem_in, dmemstore, rs1, rs2;
  scalar_mem_t mem_type;
  logic dmemWEN, dmemREN, dhit_in, enable;
  regbits_t rd_in, rd;
  dhit_t dhit;

  modport sls (
    input enable, imm, mem_type, rs1, rs2, dmem_in, dhit_in, rd_in, 
    output dmemaddr, dmemREN, dmemWEN, dmemstore, dmemload, dhit, rd
  );

  modport tb (
    input dmemaddr, dmemREN, dmemWEN, dmemstore, dmemload, dhit, rd,
    output enable, imm, mem_type, rs1, rs2, dmem_in, dhit_in, rd_in
  );

  modport dcache (
    input dmemREN, dmemWEN, dmemstore, dmemaddr,
    output dmem_in, dhit_in
  );

endinterface
`endif //FU_SCALAR_IF_VH
