`include "fu_scalar_ls_if.vh"
`include "datapath_types.vh"
`include "isa_types.vh"

module fu_scalar_ls (
    input logic CLK, nRST,
    fu_scalar_ls_if.sls sls_if
);

    import isa_pkg::*;
    import datapath_pkg::*;

    typedef enum logic { 
        idle, latched
    } state_t;

    state_t state, next_state;

    word_t latched_dmemaddr, next_dememaddr, latched_dmemstore, next_dmemstore, next_addr, addr;
    logic latched_dmemREN, next_dmemREN, latched_dmemWEN, next_dmemWEN, latched_enable;
    regbits_t latched_rd, next_rd;


    always_ff @(posedge CLK, negedge nRST) begin
        if (!nRST) begin
            state <= idle;
            latched_enable <= '0;
            latched_dmemaddr <= '0;
            latched_dmemstore <= '0;
            latched_dmemREN <= '0;
            latched_dmemWEN <= '0;
            latched_rd <= '0;
        end
        else begin
            state <= next_state;
            latched_enable <= sls_if.enable;
            latched_dmemaddr <= next_addr;
            latched_dmemstore <= next_dmemstore;
            latched_dmemREN <= next_dmemREN;
            latched_dmemWEN <= next_dmemWEN;
            latched_rd <= next_rd;
        end
    end

    assign addr = sls_if.imm + sls_if.rs1;

    always_comb begin
        next_addr = latched_dmemaddr;
        next_dmemstore = latched_dmemstore;
        next_dmemREN = latched_dmemREN;
        next_dmemWEN = latched_dmemWEN;
        next_rd = latched_rd;
        if (!latched_enable && sls_if.enable) begin
            next_addr = addr;
            next_dmemstore = sls_if.rs2;
            next_dmemREN = (sls_if.mem_type == LOAD);
            next_dmemWEN = (sls_if.mem_type == STORE);
            next_rd = sls_if.rd_in;
        end
        else if (sls_if.dhit_in) begin
            next_addr = '0;
            next_dmemstore = '0;
            next_dmemREN = '0;
            next_dmemWEN = '0;
            next_rd = '0;
        end
    end
    
    always_comb begin
        next_state = state;
        sls_if.dmemaddr = '0;
        sls_if.dmemstore = '0;
        sls_if.dmemWEN = '0;
        sls_if.dmemREN = '0;
        sls_if.dmemstore = '0;
        sls_if.dhit = dhit_na;
        sls_if.dmemload = '0;
        sls_if.rd = '0;
        if (sls_if.enable) begin
            casez (state) 
                idle: begin
                    if (next_dmemWEN) begin
                        sls_if.dmemaddr = addr;
                        next_state = latched;
                        sls_if.dmemWEN = next_dmemWEN;
                        sls_if.dmemstore = sls_if.rs2;
                    end 
                    else if (next_dmemREN) begin
                        sls_if.dmemaddr = addr;
                        next_state = latched;
                        sls_if.dmemREN = next_dmemREN;
                    end
                    else begin
                        next_state = idle;
                    end
                end
                latched: begin
                    if (latched_dmemWEN) begin
                        sls_if.dmemaddr = latched_dmemaddr;
                        sls_if.dmemWEN = latched_dmemWEN;
                        sls_if.dmemstore = latched_dmemstore;
                        if (sls_if.dhit_in) begin
                            next_state = idle;
                            // sls_if.dmemWEN = '0;
                            sls_if.dhit = dhit_store;
                        end
                    end 
                    else if (latched_dmemREN) begin
                        sls_if.dmemaddr = latched_dmemaddr;
                        sls_if.dmemREN = latched_dmemREN;
                        sls_if.rd = latched_rd;
                        if (sls_if.dhit_in) begin
                            next_state = idle;
                            sls_if.dmemload = sls_if.dmem_in;
                            // sls_if.dmemREN = '0;
                            sls_if.dhit = dhit_load; 
                        end
                    end
                end
            endcase
        end
    end

endmodule
