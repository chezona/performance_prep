`ifndef DATAPATH_CACHE_IF_VH
`define DATAPATH_CACHE_IF_VH

// types
`include "isa_types.vh"
`include "datapath_types.vh"
`include "sp_types_pkg.vh"

interface datapath_cache_if;
  // import types
  import isa_pkg::*;
  import datapath_pkg::*;
  import sp_types_pkg::*;

// datapath signals
  // stop processing
  logic               halt;

// Icache signals
  // hit and enable
  logic               ihit, imemREN;
  // instruction addr
  word_t             imemload, imemaddr;

// Dcache signals
  // hit, atomic and enables
  logic               dhit, datomic, dmemREN, dmemWEN, flushed;
  // data and address
  word_t              dmemload, dmemstore, dmemaddr;

// Scratchpad signals
  // logic mhit; // -> could change this to be 1 for load done, 2 for store done
  // matrix_ls_t         matrix_ls;
  // logic gemm_done;
  // logic m_ld_done; // needed?

  logic gemm_complete, store_complete, load_complete;

  instrFIFO_t     sp_out; 
  logic           sp_write;

  // datapath ports
  modport dp (
    input   ihit, imemload, dhit, dmemload,  
    input   load_complete, gemm_complete, store_complete,
    output  halt, imemREN, imemaddr, dmemREN, dmemWEN,
            dmemstore, dmemaddr, sp_out, sp_write
  );

  modport tb (
    output  ihit, imemload, dhit, dmemload,
    output  load_complete, gemm_complete, store_complete,
    input   halt, imemREN, imemaddr, dmemREN, dmemWEN,
            dmemstore, dmemaddr, sp_out, sp_write
  );

  // cache block ports
  modport cache (
    input   halt, imemREN, dmemREN, dmemWEN, datomic,
            dmemstore, dmemaddr, imemaddr,
    output  ihit, dhit, imemload, dmemload, flushed
  );

  // icache ports
  modport icache (
    input   imemREN, imemaddr,
    output  ihit, imemload
  );

  // dcache ports
  modport dcache (
    input   halt, dmemREN, dmemWEN,
            datomic, dmemstore, dmemaddr,
    output  dhit, dmemload, flushed
  );
endinterface

`endif //DATAPATH_CACHE_IF_VH