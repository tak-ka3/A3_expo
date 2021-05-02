module testbench_async;
        
    // wire/reg
    reg clk;
    reg start;
    wire out;
    
    // parameter
    parameter CYCLE = 100; // clock cycle
    parameter HALF_CYCLE = 50; // half cycle
    parameter DLY = 50; // delay

    // DUT module
    async async_0 (
        .start(start),
	.clk(clk),
	.out(out)
    );

    // clock generator
    always begin
        clk = 1;
        #(HALF_CYCLE) clk = 0;
        #(HALF_CYCLE);
    end
    // start control
    always begin
        start <= 1'b1;
        #70 start <= 1'b0;
        #600;
    end

    // test scenario
    initial begin
        // initialize
        // repeat(10) @(posedge clk); // repeat 10 times
	# 4000;
        $finish;
    end

endmodule

