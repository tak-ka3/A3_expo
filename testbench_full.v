module testbench_full;
    
    // parameter
    parameter CYCLE = 1000; // clock cycle
    parameter HALF_CYCLE = 500; // half cycle
    parameter DLY = 500; // delay
    
    // wire/reg
    reg clk;
    wire inA, inB, Cin;
    wire outS_full_gate, outC_full_gate;

    // DUT module
    full_gate full_gate_0 (
        .inA(inA),
        .inB(inB),
	.Cin(Cin),
        .outS2(outS_full_gate),
	.Cout0(outC_full_gate)
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
        inA = 1'b0; inB = 1'b0; Cin = 1'b0;
        #100 $display("inA=%b inB=%b outS=%b outC=%b", inA, inB, outS_full_gate, outC_full_gate);
        inA = 1'b1; inB = 1'b0; Cin = 1'b0;
        #100 $display("inA=%b inB=%b outS=%b outC=%b", inA, inB, outS_full_gate, outC_full_gate);  
        inA = 1'b0; inB = 1'b1; Cin = 1'b0;
        #100 $display("inA=%b inB=%b outS=%b outC=%b", inA, inB, outS_full_gate, outC_full_gate);  
        inA = 1'b1; inB = 1'b1; Cin = 1'b0;
        #100 $display("inA=%b inB=%b outS=%b outC=%b", inA, inB, outS_full_gate, outC_full_gate);
        inA = 1'b0; inB = 1'b0; Cin = 1'b1;
        #100 $display("inA=%b inB=%b outS=%b outC=%b", inA, inB, outS_full_gate, outC_full_gate);
        inA = 1'b1; inB = 1'b0; Cin = 1'b1;
        #100 $display("inA=%b inB=%b outS=%b outC=%b", inA, inB, outS_full_gate, outC_full_gate);  
        inA = 1'b0; inB = 1'b1; Cin = 1'b1;
        #100 $display("inA=%b inB=%b outS=%b outC=%b", inA, inB, outS_full_gate, outC_full_gate);  
        inA = 1'b1; inB = 1'b1; Cin = 1'b1;
        #100 $display("inA=%b inB=%b outS=%b outC=%b", inA, inB, outS_full_gate, outC_full_gate);

        repeat(10) @(posedge clk); // repeat 10 times
        $finish;
    end

endmodule
