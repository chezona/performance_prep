`include "datapath_cache_if.vh"
`include "caches_if.vh"
`include "arbiter_caches_if.vh"
`include "scratchpad_if.vh"
`include "systolic_array_if.vh"

module memory_systolic_array (
    input logic CLK, nRST,
    datapath_cache_if dcif,
    caches_if cif,
    arbiter_caches_if acif,
    scratchpad_if spif
);

    // Internal interface for scratchpad/SA
    systolic_array_if saif();

    // Arbiter
    memory_arbiter_basic ARB (
        .CLK(CLK),
        .nRST(nRST),
        .acif(acif),
        .spif(spif.arbiter)
    );

    // Instruction cache
    icache ICACHE (
        .CLK(CLK),
        .nRST(nRST),
        .cif(cif),
        .dcif(dcif)
    );

    // Data cache
    dcache DCACHE (
        .CLK(CLK),
        .nRST(nRST),
        .cif(cif),
        .dcif(dcif),
        .acif(acif)
    );

    // Scratchpad
    scratchpad SP (
        .CLK(CLK),
        .nRST(nRST),
        .spif(spif.sp)
    );

    systolic_array SA (
        .clk(CLK),
        .nRST(nRST),
        .memory(saif.memory_array)
    );

    always_comb begin
        saif.weight_en = spif.weight_enable;
        saif.input_en = spif.input_enable;
        saif.partial_en = spif.partial_enable;
        saif.row_in_en = spif.weight_input_row_sel;
        saif.row_ps_en = spif.partial_sum_row_sel;
        saif.array_in = spif.weight_input_data;
        saif.array_in_partials = spif.partial_sum_data;
        spif.drained = saif.drained;
        spif.fifo_has_space = saif.fifo_has_space;
        spif.psumout_data = saif.array_output;
        spif.psumout_row_sel_in = saif.row_out;
        spif.psumout_en = saif.out_en;
    end

endmodule