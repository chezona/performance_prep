// Writeback unit testbench
// tahan

`timescale 1ns/1ps
`include "writeback_if.vh"

module writeback_tb;

    // Clock and Reset
    logic CLK;
    logic nRST;

    // Instantiate Interface
    writeback_if wbif();

    // DUT (Device Under Test) Instantiation
    writeback DUT (
        .CLK(CLK),
        .nRST(nRST),
        .wbif(wbif)
    );

    // Clock Generation
    always #5 CLK = ~CLK;  // 10 ns clock period
    integer test_num;

    // word_t alu_wdat, load_wdat;
    // logic  branch_mispredict, branch_spec, branch_correct;
    // logic alu_done, load_done;
    // regbits_t alu_reg_sel, load_reg_sel;

    // Test Sequence
    initial begin
        
        /* Test Case 0: nRST */
        test_num = 0;
        CLK = 0;
        nRST = 0;
        wbif.alu_wdat = '0;
        wbif.load_wdat = '0;
        wbif.jump_wdat = 0;

        wbif.branch_mispredict = 0;
        wbif.branch_spec = 0;
        wbif.branch_correct = 0;

        wbif.alu_done = 0;
        wbif.load_done = 0;
        wbif.jump_done = 0;

        wbif.alu_reg_sel = '0;
        wbif.load_reg_sel = '0;
        wbif.jump_reg_sel = '0;

        @(posedge CLK);
        nRST = 1;  
        @(posedge CLK);

        /* Test Case 1: Normal Writeback ALU operations, no tie 
            Expected Output: Each input would be written back normally
        */
        test_num = test_num + 1;
        for (integer i = 1; i < 9; i++) begin
            wbif.alu_wdat = i * 1000;
            wbif.alu_done = 1;
            wbif.alu_reg_sel = i;
            @(posedge CLK);
        end
        wbif.alu_wdat = '0;
        wbif.alu_done = 0;
        wbif.alu_reg_sel = '0;
        @(posedge CLK);

        /* Test Case 2: Normal Writeback Load Operations, no tie 
            Expected Output: Each input would be written back normally 
        */
        test_num = test_num + 1;

        for (integer i = 1; i < 9; i++) begin
            wbif.load_wdat = i * 10000;
            wbif.load_done = 1;
            wbif.load_reg_sel = i;
            @(posedge CLK);
        end
        wbif.load_wdat = 32'd0;
        wbif.load_done = 0;
        wbif.load_reg_sel = 0;
        @(posedge CLK);
        /* Test Case 3: Writeback Tie Nothing in Buffer 
            Expected Output: In the event where both ALU and Load data is ready when both buffers are empty, the Load wdat is preferenced and written back while the ALU data is stored in a buffer
        */
        test_num = test_num + 1;

        wbif.load_wdat = 32'd420;
        wbif.load_done = 1;
        wbif.load_reg_sel = 5;

        wbif.alu_wdat = 32'd69;
        wbif.alu_done = 1;
        wbif.alu_reg_sel = 7;
        @(posedge CLK);



        /* Test Case 4: Wb from buffer no new Wdata
            Expected Outputs: Based on the previous clock period, because there is data in the buffer from the tie, it should write it back the ALU data stored in the buffer
        */
        test_num = test_num + 1;
        wbif.load_wdat = 32'd0;
        wbif.load_done = 0;
        wbif.load_reg_sel = 0;

        wbif.alu_wdat = 32'd0;
        wbif.alu_done = 0;
        wbif.alu_reg_sel = 0;
        @(posedge CLK);

        /* Test Case 5: Writeback Tie, Fill Up Buffers */
        test_num = test_num + 1;

        for (integer i = 1; i < 9; i++) begin
            wbif.load_wdat = i * 200;
            wbif.load_done = 1;
            wbif.load_reg_sel = i;
            wbif.alu_wdat = i * 100;
            wbif.alu_done = 1;
            wbif.alu_reg_sel = i*2;
            @(posedge CLK);
        end
        

        /* Test Case 6: Test Wb_Sel logic, no new input data*/
        test_num = test_num + 1;
        wbif.load_wdat = 32'd0;
        wbif.load_done = 0;
        wbif.load_reg_sel = 0;

        wbif.alu_wdat = 32'd0;
        wbif.alu_done = 0;
        wbif.alu_reg_sel = 0;
        repeat (10) @(posedge CLK);

        /* Test Case 7: Speculative Data no values in Buffer*/
        test_num = test_num + 1;
        wbif.branch_spec = 1;
        for (integer i = 1; i < 9; i++) begin
            wbif.alu_wdat = i;
            wbif.alu_done = 1;
            wbif.alu_reg_sel = i;
            @(posedge CLK);
        end

        /* Test Case 8: Branch Success Wb*/
        test_num = test_num + 1;
        wbif.alu_wdat = '0;
        wbif.alu_done = 0;
        wbif.alu_reg_sel = '0;
        wbif.branch_spec = 0;
        wbif.branch_correct = 1;
        @(posedge CLK);
        wbif.branch_correct = 0;
        repeat (12) @(posedge CLK);
        

        /* Test Case 9: Speculative Data no values in Buffer*/
        test_num = test_num + 1;

        wbif.branch_spec = 1;
        for (integer i = 1; i < 9; i++) begin
            wbif.alu_wdat = i;
            wbif.alu_done = 1;
            wbif.alu_reg_sel = i;
            @(posedge CLK);
        end

        /* Test Case 10: Branch Mispredict (Check Index))*/
        test_num = test_num + 1;

        wbif.alu_wdat = '0;
        wbif.alu_done = 0;
        wbif.alu_reg_sel = '0;
        wbif.branch_spec = 0;
        wbif.branch_mispredict = 1;
        @(posedge CLK);
        wbif.branch_mispredict = 0;
        repeat (15) @(posedge CLK);

        /* Test Case 11: Spec Data With Values in Buffer (Check for initial Writeback)*/
        test_num = test_num + 1;
        wbif.branch_spec = 1;
        for (integer i = 1; i < 5; i++) begin
            wbif.alu_wdat = 32'hDEADBEEF;
            wbif.alu_done = 1;
            wbif.alu_reg_sel = i;
            @(posedge CLK);
        end
        wbif.branch_spec = 0;
        wbif.branch_correct = 1;
        @(posedge CLK);
        wbif.branch_correct = 0;
        // Fill up Both Buffers
        for (integer i = 1; i < 8; i++) begin
            wbif.load_wdat = 32'hCAFEBABE;
            wbif.load_done = 1;
            wbif.load_reg_sel = i;
            wbif.alu_wdat = 32'hADDADD0;
            wbif.alu_done = 1;
            wbif.alu_reg_sel = i;
            @(posedge CLK);
        end

        wbif.load_wdat = 32'd0;
        wbif.load_done = 0;
        wbif.load_reg_sel = 0;

        wbif.branch_spec = 1;
        for (integer i = 1; i < 5; i++) begin
            wbif.alu_wdat = 32'hFADEFADE;
            wbif.alu_done = 1;
            wbif.alu_reg_sel = i;
            @(posedge CLK);
        end

        /* Test Case 12: Branch Mispredict (Check for Valid Writebacks)*/
        test_num = test_num + 1;
        wbif.alu_wdat = '0;
        wbif.alu_done = 0;
        wbif.alu_reg_sel = '0;
        wbif.branch_spec = 0;
        wbif.branch_mispredict = 1;
        @(posedge CLK);
        wbif.branch_mispredict = 0;
        repeat (15) @(posedge CLK);

        /* Test Case 13: Jump data with nothing in buffers */
        test_num = test_num + 1;

        wbif.jump_wdat = 32'hB00BB00B;
        wbif.jump_done = 1;
        wbif.jump_reg_sel = 12;
        @(posedge CLK);

        wbif.jump_wdat = '0;
        wbif.jump_done = 0;
        wbif.jump_reg_sel = '0;
        @(posedge CLK);

        /* Test Case 14: Jump done with Load done Tie */
        test_num = test_num + 1;

        wbif.jump_wdat = 32'hB00BB00B;
        wbif.jump_done = 1;
        wbif.jump_reg_sel = 12;

        wbif.load_wdat = 32'hCAFEBABE;
        wbif.load_done = 1;
        wbif.load_reg_sel = 3;
        @(posedge CLK);


        wbif.jump_wdat = '0;
        wbif.jump_done = 0;
        wbif.jump_reg_sel = 0; 

        wbif.load_wdat = '0;
        wbif.load_done = 0;
        wbif.load_reg_sel = 0;
        @(posedge CLK);

        /* Test Case 15: Jump with data in Buffer */
        test_num = test_num + 1;

        wbif.branch_spec = 1;
        for (integer i = 1; i < 5; i++) begin
            wbif.alu_wdat = 32'hDEADBEEF;
            wbif.alu_done = 1;
            wbif.alu_reg_sel = i;
            @(posedge CLK);
        end
        wbif.branch_spec = 0;
        wbif.branch_correct = 1;
        @(posedge CLK);
        wbif.branch_correct = 0;
        // Fill up Both Buffers
        for (integer i = 1; i < 8; i++) begin
            wbif.load_wdat = 32'hCAFEBABE;
            wbif.load_done = 1;
            wbif.load_reg_sel = i;
            wbif.alu_wdat = 32'hADDADD0;
            wbif.alu_done = 1;
            wbif.alu_reg_sel = i;
            @(posedge CLK);
        end

        wbif.load_wdat = 32'd0;
        wbif.load_done = 0;
        wbif.load_reg_sel = 0;

        wbif.alu_wdat = 32'd0;
        wbif.alu_done = 0;
        wbif.alu_reg_sel = 0;

        wbif.jump_wdat = 32'hB00BB00B;
        wbif.jump_done = 1;
        wbif.jump_reg_sel = 12;
        @(posedge CLK);

        wbif.jump_wdat = '0;
        wbif.jump_done = 0;
        wbif.jump_reg_sel = '0;
        @(posedge CLK);

        $stop;
    end
endmodule

