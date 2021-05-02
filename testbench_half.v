module testbench_half;
    
    // parameter
    parameter CYCLE = 1000; // clock cycle
    parameter HALF_CYCLE = 500; // half cycle
    parameter DLY = 500; // delay
    
    // wire/reg
    reg clk;
    reg inA, inB;
    wire outS_half_gate, outC_half_gate;

    // DUT module
    half_gate half_gate_0 (
        .inA(inA),
        .inB(inB),
        .outS(outS_half_gate),
	.outC(outC_half_gate)
    );

    // clock generator
    always begin
        clk = 1'b1;
        #(HALF_CYCLE) clk = 1'b0;
        #(HALF_CYCLE);
    end

    // test scenario
    initial begin
        // initialize
        inA = 1'b0; inB = 1'b0;
        
        // for nand_gate
        inA = 1'b0; inB = 1'b0;
        #100 $display("inA=%b inB=%b outS=%b outC=%b", inA, inB, outS_half_gate, outC_half_gate);
        inA = 1'b1; inB = 1'b0;
        #100 $display("inA=%b inB=%b outS=%b outC=%b", inA, inB, outS_half_gate, outC_half_gate);  
        inA = 1'b0; inB = 1'b1;
        #100 $display("inA=%b inB=%b outS=%b outC=%b", inA, inB, outS_half_gate, outC_half_gate);  
        inA = 1'b1; inB = 1'b1;
        #100 $display("inA=%b inB=%b outS=%b outC=%b", inA, inB, outS_half_gate, outC_half_gate);

        repeat(10) @(posedge clk); // repeat 10 times
        $finish;
    end

endmodule
