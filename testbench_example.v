module testbench_example;
    
    // parameter
    parameter CYCLE = 1000; // clock cycle
    parameter HALF_CYCLE = 500; // half cycle
    parameter DLY = 500; // delay
    
    // wire/reg
    reg clk;
    reg inA;
    wire out1,out2;

    // DUT module
    example example_0 (
        .inA(inA),
	.clk(clk),
        .out1(out1),
	.out2(out2)
    );

    // clock generator
    always begin
        clk = 1'b1;
        #(HALF_CYCLE) clk = 1'b0;
        #(HALF_CYCLE);
    end

    integer i;
    // test scenario
    initial begin
        // initialize
	i = 0;
        inA = 1'b0;
        
        // for xor_gate
        // inA = 1'b0;
        // #2000 $display("inA=%b out1=%b out2=%b", inA,out1, out2);
        // inA = 1'b1;
        // #2000 $display("inA=%b out1=%b out2=%b", inA,out1, out2);
	for (i = 0; i < 20; i=i+1) begin
	    inA = ~inA;
	    # 2300;
	end

        repeat(10) @(posedge clk); // repeat 10 times
        $finish;
    end

endmodule
