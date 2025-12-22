/*  Writeback Module
    Module Description:
        This module will be responsible to writeback to the register file. Current implementation will include two circular buffer, one for ALU operations, the other for Loads to the register file.

        Buffers are used in specific situations, either for speculative stores during a branch, when both ALU and Scalar Load is ready at the same time, or if the current buffer has values already into it. 

        An important of the Writeback module would be its ablility to handle speculative writebacks. When speculative w_data come in, it is placed in its respective buffer, the data is written back only when the branch unit confirms that the branch is correct. If the branch is incorrect, the write pointer is reset to the original place in each buffer and the buffer continues normal operations. In order to determine jump state, we have a two state state machine for normal operation and speculative operations. The speculative operation is transitioned into upon a spec bit, the write pointer is saved and handled with upon a branch miss or branch resolved signal. This would transition back to the normal state to resume normal operations.

        Future Directions: 
*/

`include "datapath_types.vh"
`include "isa_types.vh"
`include "writeback_if.vh"



module writeback
(
    input logic CLK, 
    input logic nRST,
    writeback_if.wb wbif // WRITEBACK IF
);
// Importing types
import datapath_pkg::*;
import isa_pkg::*;

localparam BUFFER_DEPTH = 4;
localparam BUFFER_WIDTH = $bits(wb_t);

/* ALU Buffer Module Signals */

// ALU Data In Singals
wb_t alu_din;
// ALU Data Out Signals
wb_t alu_dout;
// ALU write enable and read enable
logic alu_write, alu_read; 
// ALU read and write pointers
logic [2:0] alu_wptr, alu_rptr, next_alu_wptr, next_alu_rptr;
// ALU internal counter for data in
logic [2:0] alu_count, next_alu_count;
// Packed array holding the ALU data
logic [BUFFER_DEPTH - 1: 0][BUFFER_WIDTH - 1: 0] alu_buffer, next_alu_buffer;
// ALU Buffer Empty and Full Signals
logic alu_full, alu_empty;

/* Load Buffer Module Signals */

// Load Data In Singals
wb_t load_din;
// Load Data Out Signals
wb_t load_dout;
// Load write enable and read enable
logic load_write, load_read; 
// Load read and write pointers
logic [2:0] load_wptr, load_rptr, next_load_wptr, next_load_rptr;
// Load internal counter for data in
logic [2:0] load_count, next_load_count;
// Packed array holding the Load data
logic [BUFFER_DEPTH - 1: 0][BUFFER_WIDTH - 1: 0] load_buffer, next_load_buffer;
// Load Buffer Empty and Full Signals
logic load_empty, load_full;

/* Jump Data Signals */
wb_t jump_din;

/* Writeback Data signals */

typedef enum logic {
    IDLE = 0, 
    SPEC = 1
    } state_t;
state_t state, next_state;

// Next Writeback out
wb_t next_wbout;
// Wb en (For arbitration between load and alu)
logic wb_sel, next_wb_sel;

// Previous Specbit Logic
logic prev_spec;
// Writeback Saved Spec Write Pointers
logic [2:0] spec_alu_wptr, next_spec_alu_wptr;
// Writeback Saved Spec Write Counter
logic [2:0] spec_write, next_spec_write;
// Writeback Clean Data Count
logic [2:0] clean_count, next_clean_count;

always_ff @(posedge CLK, negedge nRST) begin : writeback_ff
    if (!nRST) begin
        // Writeback Signals
        state <= IDLE;
        wb_sel <= 0;
        prev_spec <= 0;
        spec_alu_wptr <= 0;
        clean_count <= 0;
        spec_write <= 0;
        // ALU Buffer Signals
        alu_buffer <= '0;
        alu_wptr <= 0;
        alu_rptr <= 0;
        alu_count <= 0;
        // Load Buffer Signals
        load_buffer <= '0;
        load_wptr <= 0;
        load_rptr <= 0;
        load_count <= 0;
        
        
    end
    else begin
        state <= next_state;
        wb_sel <= next_wb_sel;
        prev_spec <= wbif.branch_spec;
        spec_alu_wptr <= next_spec_alu_wptr;
        clean_count <= next_clean_count;
        spec_write <= next_spec_write;
        
        alu_buffer <= next_alu_buffer;
        alu_wptr <= next_alu_wptr;
        alu_rptr <= next_alu_rptr;
        alu_count <= next_alu_count;

        load_buffer <= next_load_buffer;
        load_wptr <= next_load_wptr;
        load_rptr <= next_load_rptr;
        load_count <= next_load_count;
    end
end

always_comb begin : wb_out_logic
    next_state = state;
    next_wb_sel = wb_sel;
    
    next_spec_alu_wptr = spec_alu_wptr;
    next_clean_count = clean_count;
    next_spec_write = spec_write;

    next_alu_buffer = alu_buffer;
    next_alu_wptr = alu_wptr;
    next_alu_rptr = alu_rptr;
    alu_dout = '0;
    alu_din.reg_en = 1;
    alu_din.reg_sel = wbif.alu_reg_sel;
    alu_din.wdat = wbif.alu_wdat;
    alu_din.alu_done = 1;
    alu_din.jump_done = 0;
    alu_din.load_done = 0;
    alu_read = 0;
    alu_write = 0;

    next_load_buffer = load_buffer;
    next_load_wptr = load_wptr;
    next_load_rptr = load_rptr;
    load_dout = '0;
    load_din.reg_en = 1;
    load_din.reg_sel = wbif.load_reg_sel;
    load_din.wdat = wbif.load_wdat;
    load_din.load_done = 1;
    load_din.alu_done = 0;
    load_din.jump_done = 0;
    load_read = 0;
    load_write = 0;

    jump_din.reg_en = 1;
    jump_din.reg_sel = wbif.jump_reg_sel;
    jump_din.wdat = wbif.jump_wdat;
    jump_din.jump_done = 1;
    jump_din.alu_done = 0;
    jump_din.load_done = 0;

    wbif.wb_out.reg_en = 0;
    wbif.wb_out.reg_sel = '0;
    wbif.wb_out.wdat = '0;
    wbif.wb_out.alu_done = '0;
    wbif.wb_out.jump_done = '0;
    wbif.wb_out.load_done = '0;
        /* IDLE Cases:
            Spec High: Spec just went high so data going into buffer should be accounted for as a speculative writeback. Take record of alu_wptr and alu_count to determine size of and position of buffer when writing back.

            Normal:
                ALU Done and Load Done and buffers empty: Load wdat gets written back and the alu wdat would be placed in buffer.

                ALU Done and Load Done and buffers not empty: Both values would go to the buffer as there are older values that need to get written back.

                ALU Done only: If either buffer not empty, then send to  ALU buffer. Else bypass buffer and write back.

                Load Done only: If either buffer not empty, the send to Load buffer. Else bypass buffer and writeback.

            SPEC:
                Keep track of write count and write pointer, if branch mispredict set write pointer to oringinal place. Only can read a value out of buffer for the count of the buffer at the point of spec. If branch correct, continue normal operations. Both scenarios go back to IDLE.
        */
    case (state)
        IDLE: begin
            if(!prev_spec && wbif.branch_spec && !wbif.branch_correct) begin // If spec goes high
                next_state = SPEC;
                next_spec_alu_wptr = alu_wptr; // Current Wptr is saved as any val onward is spec

                // writing alu data that is speculative
                alu_write = 1;
                next_alu_buffer[alu_wptr] = alu_din;
                next_alu_wptr = ((alu_wptr + 1) == BUFFER_DEPTH ? 0 : alu_wptr + 1);
                next_spec_write = spec_write + 1;

                // Checking if Anything Can be Written Back
                if (!alu_empty && !load_empty) begin // Both not empty
                    next_wb_sel = !wb_sel;

                    if (wb_sel) begin
                        alu_read = 1;
                        wbif.wb_out = alu_buffer[alu_rptr];
                        // wbif.wb_out.alu_done = 1'b1;
                        next_alu_buffer[alu_rptr] = '0;
                        next_alu_rptr = ((alu_rptr + 1) == BUFFER_DEPTH ? 0 : alu_rptr + 1);
                        next_clean_count = alu_count - 1; // 1 less clean data value
                    end
                    else begin
                        load_read = 1;
                        wbif.wb_out = load_buffer[load_rptr];
                        // wbif.wb_out.load_done = 1'b1;
                        next_load_buffer[load_rptr] = '0;
                        next_load_rptr = ((load_rptr + 1) == BUFFER_DEPTH ? 0 : load_rptr + 1);
                        next_clean_count = alu_count;
                    end
                end

                else if (!alu_empty && load_empty) begin // load buffer empty, alu buffer not empty
                    alu_read = 1;
                    wbif.wb_out = alu_buffer[alu_rptr];
                    // wbif.wb_out.alu_done = 1'b1;
                    next_alu_buffer[alu_rptr] = '0;
                    next_alu_rptr = ((alu_rptr + 1) == BUFFER_DEPTH ? 0 : alu_rptr + 1);
                    next_clean_count = alu_count - 1; // 1 less clean data value
                end

                else if (alu_empty && !load_empty) begin // load buffer not empty, alu buffer empty
                    load_read = 1;
                    wbif.wb_out = load_buffer[load_rptr];
                    // wbif.wb_out.load_done = 1'b1;
                    next_load_buffer[load_rptr] = '0;
                    next_load_rptr = ((load_rptr + 1) == BUFFER_DEPTH ? 0 : load_rptr + 1);
                    next_clean_count = alu_count;
                end
            end

            else if (wbif.jump_done && wbif.alu_done && wbif.load_done) begin // jump alu load done
                /* If a jump is high, it takes immediate priority over all done signals */

                // This specific case would not happen cause alu and jump would never happen be done at the same time as the are issued one clock cycle at a time
            end

            else if (wbif.jump_done && wbif.alu_done && !wbif.load_done) begin // jump alu done
                // This specific case would not happen cause alu and jump would never happen be done at the same time as the are issued one clock cycle at a time
            end

            else if (wbif.jump_done && !wbif.alu_done && wbif.load_done) begin // jump load done
                load_write = 1;
                next_load_buffer[load_wptr] = load_din;
                next_load_wptr = ((load_wptr + 1) == BUFFER_DEPTH ? 0 : load_wptr + 1);

                wbif.wb_out = jump_din;
                // wbif.wb_out.jump_done = 1'b1;
            end

            else if (wbif.jump_done && !wbif.alu_done && !wbif.load_done) begin // jump done
                // Bypass all buffers and immediately write data in reg file
                wbif.wb_out = jump_din;
                // wbif.wb_out.jump_done = 1'b1;
            end

            else if (!wbif.jump_done && wbif.alu_done && wbif.load_done) begin // alu load done
                if (!alu_empty || !load_empty) begin // At least one buffer has data
                    alu_write = 1;
                    next_alu_buffer[alu_wptr] = alu_din;
                    next_alu_wptr = ((alu_wptr + 1) == BUFFER_DEPTH ? 0 : alu_wptr + 1);

                    load_write = 1;
                    next_load_buffer[load_wptr] = load_din;
                    next_load_wptr = ((load_wptr + 1) == BUFFER_DEPTH ? 0 : load_wptr + 1);

                    // Checking if Anything Can be Written Back
                    if (!alu_empty && !load_empty) begin // Both not empty
                        next_wb_sel = !wb_sel;

                        if (wb_sel) begin
                            alu_read = 1;
                            wbif.wb_out = alu_buffer[alu_rptr];
                            next_alu_buffer[alu_rptr] = '0;
                            next_alu_rptr = ((alu_rptr + 1) == BUFFER_DEPTH ? 0 : alu_rptr + 1);
                        end
                        else begin
                            load_read = 1;
                            wbif.wb_out = load_buffer[load_rptr];
                            next_load_buffer[load_rptr] = '0;
                            next_load_rptr = ((load_rptr + 1) == BUFFER_DEPTH ? 0 : load_rptr + 1);
                        end
                    end

                    else if (!alu_empty && load_empty) begin // load buffer empty, alu buffer not empty
                        alu_read = 1;
                        wbif.wb_out = alu_buffer[alu_rptr];
                        next_alu_buffer[alu_rptr] = '0;
                        next_alu_rptr = ((alu_rptr + 1) == BUFFER_DEPTH ? 0 : alu_rptr + 1);
                    end

                    else if (alu_empty && !load_empty) begin // load buffer not empty, alu buffer empty
                        load_read = 1;
                        wbif.wb_out = load_buffer[load_rptr];
                        next_load_buffer[load_rptr] = '0;
                        next_load_rptr = ((load_rptr + 1) == BUFFER_DEPTH ? 0 : load_rptr + 1);
                    end
                end
                else begin // Both Buffers are empty
                    alu_write = 1;
                    next_alu_buffer[alu_wptr] = alu_din;
                    next_alu_wptr = ((alu_wptr + 1) == BUFFER_DEPTH ? 0 : alu_wptr + 1);

                    wbif.wb_out = load_din;
                end
            end

            else if (!wbif.jump_done && wbif.alu_done && !wbif.load_done) begin // alu done
                if (!alu_empty || !load_empty) begin // At least one buffer has data
                    alu_write = 1;
                    next_alu_buffer[alu_wptr] = alu_din;
                    next_alu_wptr = ((alu_wptr + 1) == BUFFER_DEPTH ? 0 : alu_wptr + 1);

                    // Checking if Anything Can be Written Back
                    if (!alu_empty && !load_empty) begin // Both not empty
                        next_wb_sel = !wb_sel;

                        if (wb_sel) begin
                            alu_read = 1;
                            wbif.wb_out = alu_buffer[alu_rptr];
                            next_alu_buffer[alu_rptr] = '0;
                            next_alu_rptr = ((alu_rptr + 1) == BUFFER_DEPTH ? 0 : alu_rptr + 1);
                        end
                        else begin
                            load_read = 1;
                            wbif.wb_out = load_buffer[load_rptr];
                            next_load_buffer[load_rptr] = '0;
                            next_load_rptr = ((load_rptr + 1) == BUFFER_DEPTH ? 0 : load_rptr + 1);
                        end
                    end

                    else if (!alu_empty && load_empty) begin // load buffer empty, alu buffer not empty
                        alu_read = 1;
                        wbif.wb_out = alu_buffer[alu_rptr];
                        next_alu_buffer[alu_rptr] = '0;
                        next_alu_rptr = ((alu_rptr + 1) == BUFFER_DEPTH ? 0 : alu_rptr + 1);
                    end

                    else if (alu_empty && !load_empty) begin // load buffer not empty, alu buffer empty
                        load_read = 1;
                        wbif.wb_out = load_buffer[load_rptr];
                        next_load_buffer[load_rptr] = '0;
                        next_load_rptr = ((load_rptr + 1) == BUFFER_DEPTH ? 0 : load_rptr + 1);
                    end
                end
                else begin // Both Buffers are empty
                    wbif.wb_out = alu_din;
                end
            end

            else if (!wbif.jump_done && !wbif.alu_done && wbif.load_done) begin // load done
                if (!alu_empty || !load_empty) begin // At least one buffer has data
                    load_write = 1;
                    next_load_buffer[load_wptr] = load_din;
                    next_load_wptr = ((load_wptr + 1) == BUFFER_DEPTH ? 0 : load_wptr + 1);

                    // Checking if Anything Can be Written Back
                    if (!alu_empty && !load_empty) begin // Both not empty
                        next_wb_sel = !wb_sel;

                        if (wb_sel) begin
                            alu_read = 1;
                            wbif.wb_out = alu_buffer[alu_rptr];
                            next_alu_buffer[alu_rptr] = '0;
                            next_alu_rptr = ((alu_rptr + 1) == BUFFER_DEPTH ? 0 : alu_rptr + 1);
                        end
                        else begin
                            load_read = 1;
                            wbif.wb_out = load_buffer[load_rptr];
                            next_load_buffer[load_rptr] = '0;
                            next_load_rptr = ((load_rptr + 1) == BUFFER_DEPTH ? 0 : load_rptr + 1);
                        end
                    end

                    else if (!alu_empty && load_empty) begin // load buffer empty, alu buffer not empty
                        alu_read = 1;
                        wbif.wb_out = alu_buffer[alu_rptr];
                        next_alu_buffer[alu_rptr] = '0;
                        next_alu_rptr = ((alu_rptr + 1) == BUFFER_DEPTH ? 0 : alu_rptr + 1);
                    end

                    else if (alu_empty && !load_empty) begin // load buffer not empty, alu buffer empty
                        load_read = 1;
                        wbif.wb_out = load_buffer[load_rptr];
                        next_load_buffer[load_rptr] = '0;
                        next_load_rptr = ((load_rptr + 1) == BUFFER_DEPTH ? 0 : load_rptr + 1);
                    end
                end
                else begin // Both Buffers are empty
                    wbif.wb_out = load_din;
                end
            end

            else begin                                                          // nothing done
                // Checking if Anything Can be Written Back
                if (!alu_empty && !load_empty) begin // Both not empty
                    next_wb_sel = !wb_sel;

                    if (wb_sel) begin
                        alu_read = 1;
                        wbif.wb_out = alu_buffer[alu_rptr];
                        next_alu_buffer[alu_rptr] = '0;
                        next_alu_rptr = ((alu_rptr + 1) == BUFFER_DEPTH ? 0 : alu_rptr + 1);
                    end
                    else begin
                        load_read = 1;
                        wbif.wb_out = load_buffer[load_rptr];
                        next_load_buffer[load_rptr] = '0;
                        next_load_rptr = ((load_rptr + 1) == BUFFER_DEPTH ? 0 : load_rptr + 1);
                    end
                end

                else if (!alu_empty && load_empty) begin // load buffer empty, alu buffer not empty
                    alu_read = 1;
                    wbif.wb_out = alu_buffer[alu_rptr];
                    next_alu_buffer[alu_rptr] = '0;
                    next_alu_rptr = ((alu_rptr + 1) == BUFFER_DEPTH ? 0 : alu_rptr + 1);
                end

                else if (alu_empty && !load_empty) begin // load buffer not empty, alu buffer empty
                    load_read = 1;
                    wbif.wb_out = load_buffer[load_rptr];
                    next_load_buffer[load_rptr] = '0;
                    next_load_rptr = ((load_rptr + 1) == BUFFER_DEPTH ? 0 : load_rptr + 1);
                end
            end
        end

        SPEC: begin
            if (wbif.alu_done && wbif.branch_spec && !wbif.branch_correct) begin // ALU done while spec
                alu_write = 1;
                next_spec_write = spec_write + 1;
                next_alu_buffer[alu_wptr] = alu_din;
                next_alu_wptr = ((alu_wptr + 1) == BUFFER_DEPTH ? 0 : alu_wptr + 1);
                // Checking if Anything Can be Written Back
                if (!alu_empty && !load_empty && (clean_count > 0)) begin // Both not empty
                    next_wb_sel = !wb_sel;

                    if (wb_sel) begin
                        alu_read = 1;
                        wbif.wb_out = alu_buffer[alu_rptr];
                        next_alu_buffer[alu_rptr] = '0;
                        next_alu_rptr = ((alu_rptr + 1) == BUFFER_DEPTH ? 0 : alu_rptr + 1);
                        next_clean_count = clean_count - 1;
                    end
                    else begin
                        load_read = 1;
                        wbif.wb_out = load_buffer[load_rptr];
                        next_load_buffer[load_rptr] = '0;
                        next_load_rptr = ((load_rptr + 1) == BUFFER_DEPTH ? 0 : load_rptr + 1);
                    end
                end

                else if (!alu_empty && load_empty && (clean_count > 0)) begin // load buffer empty, alu buffer not empty
                    alu_read = 1;
                    wbif.wb_out = alu_buffer[alu_rptr];
                    next_alu_buffer[alu_rptr] = '0;
                    next_alu_rptr = ((alu_rptr + 1) == BUFFER_DEPTH ? 0 : alu_rptr + 1);
                    next_clean_count = clean_count - 1;
                end

                else if (alu_empty && !load_empty) begin // load buffer not empty, alu buffer empty
                    load_read = 1;
                    wbif.wb_out = load_buffer[load_rptr];
                    next_load_buffer[load_rptr] = '0;
                    next_load_rptr = ((load_rptr + 1) == BUFFER_DEPTH ? 0 : load_rptr + 1);
                end
            end

            if (wbif.branch_correct || wbif.branch_mispredict) begin // Branch Outcome
                next_state = IDLE;
                if (wbif.branch_mispredict) begin
                    next_alu_wptr = spec_alu_wptr; // set alu wptr to where spec data started
                end
                next_spec_alu_wptr = 0;
                next_clean_count = 0;
                next_spec_write = 0;                
            end
        end
    endcase  
end

always_comb begin : Count
    next_alu_count = alu_count;
    next_load_count = load_count;

    if (wbif.branch_mispredict) begin
        next_alu_count = alu_count - spec_write;
    end
    else if (alu_read && !alu_write) begin
        next_alu_count = alu_count - 1; 
    end
    else if (!alu_read && alu_write) begin
        next_alu_count = alu_count + 1;
    end

    if (load_read && !load_write) begin
        next_load_count = load_count - 1;
    end
    else if (!load_read && load_write) begin
        next_load_count = load_count + 1;
    end
end

// Full Empty Signals
assign alu_full = (alu_count == BUFFER_DEPTH);
assign alu_empty = (alu_count == 0);
assign load_full = (load_count == BUFFER_DEPTH);
assign load_empty = (load_count == 0);

endmodule
