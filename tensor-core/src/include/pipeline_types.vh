// /* PIPELINE TYPES INTERFACE */

// `ifndef PIPELINE_PKG_VH
// `define PIPELINE_PKG_VH
// `include "isa_types.vh"

// package pipeline_pkg;
//     import isa_pkg::*;

//     // FETCH -> SB LATCH:
//     typedef struct packed {
//         fetch_t fetch_out;
//     } fd_t;

//     // SB -> EXECUTE LATCH:
//     typedef struct packed {
//         issue_t sb_out;
//     } 

//     //  EXECUTE -> WRITEBACK LATCH:
//     typedef struct packed {
//         eif_output_t execute_out;
//     }  ew_t;

// endpackage;
// `endif
