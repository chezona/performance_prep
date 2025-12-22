/*
  Eric Villasenor
  evillase@gmail.com

  cpu memory interface
  some redundancy so testbench can control ram
*/
`ifndef CPU_RAM_IF_VH
`define CPU_RAM_IF_VH

// typedefs
`include "isa_types.vh"
`include "ram_pkg.vh"

interface cpu_ram_if;
  // import types
  import ram_pkg::*;
  import isa_pkg::*;

  // ram signals
  logic               ramREN, ramWEN;
  word_t              ramaddr, ramstore, ramload;
  ramstate_t          ramstate;

  // cpu signals
  logic               memREN, memWEN;
  word_t              memaddr, memstore;


  // cpu ports
  modport cpu (
    input   ramstate, ramload,
    output  memaddr, memREN, memWEN, memstore
  );

  // ram ports
  modport ram (
    input   ramaddr, ramstore, ramREN, ramWEN,
    output  ramstate, ramload
  );

  // unused and may change
  modport sdram (
    input   ramaddr, ramstore, ramREN, ramWEN,
    output  ramstate, ramload
  );
endinterface

`endif //CPU_RAM_IF_VH