`ifndef SCOREBOARD_IF_VH
`define SCOREBOARD_IF_VH
`include "isa_types.vh"
`include "datapath_types.vh"

interface scoreboard_if;
    import isa_pkg::*;
    import datapath_pkg::*;

    // inputs
    fetch_t fetch;
    // logic flush;

    wb_t wb_issue;
    wb_ctr_t wb_dispatch;
    // word_t s_wdata;

    // execute signals
    logic branch_miss, branch_resolved;
    logic [4:0] fu_ex;

    logic freeze;
    logic jump;

    logic halt, fetch_halt;

    issue_t out;
    
    modport SB (
        input fetch, wb_issue, wb_dispatch, branch_miss, branch_resolved, fu_ex,
        output out, freeze, jump, halt, fetch_halt
    );

    modport tb (
        input out, freeze, jump, halt,
        output fetch, wb_issue, wb_dispatch, branch_miss, branch_resolved, fu_ex
    );
    

endinterface
`endif
