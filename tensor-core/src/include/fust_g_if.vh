`ifndef FUST_G_IF_VH
`define FUST_G_IF_VH
`include "datapath_types.vh"

interface fust_g_if;
  import datapath_pkg::*;

  // Inputs from dispatch
  logic en;
  logic [1:0] t1;
  logic [1:0] t2;
  logic [1:0] t3;
  //logic fu; //dont need op idx with 1 row in FUST
  fust_g_row_t fust_row;
  logic flush;
  logic resolved;

  // Inputs from issue
  logic busy;

  // Outputs of stage
  fust_g_t fust;
    
  modport FUSTG (
      input en, fust_row, busy, t1, t2, t3, flush, resolved,
      output fust
  );

endinterface
`endif
