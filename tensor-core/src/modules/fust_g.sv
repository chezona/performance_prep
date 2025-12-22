`include "fust_g_if.vh"
`include "datapath_types.vh"

module fust_g (
    input logic CLK, nRST,
    fust_g_if.FUSTG fuif
);

  import datapath_pkg::*;

  fust_g_t fust;
  
  always_ff @(posedge CLK, negedge nRST) begin
    if (~nRST)
      fuif.fust <= '0;
    else
      fuif.fust <= fust;
  end

  always_comb begin
    fust = fuif.fust;
   
    fust.op = fuif.en ? fuif.fust_row : fuif.fust.op;
    fust.busy = fuif.busy;

    fust.t1 = fuif.t1;
    fust.t2 = fuif.t2;
    fust.t3 = fuif.t3;

    if (fuif.flush && fust.op.spec) begin
      fust = '0;
    end

    if (fuif.flush && fust.op.spec) begin
      fust.op.spec = '0;
    end
  end

endmodule
