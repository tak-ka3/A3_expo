module testbench_sync;
        
    // wire/reg
    reg clk;
    reg rst;
    wire out;
    
    // parameter
    parameter CYCLE = 100; // clock cycle
    parameter HALF_CYCLE = 50; // half cycle
    parameter DLY = 50; // delay

    // DUT module
    sync sync_0 (
        .rst(rst),
	.clk(clk),
	.out(out)
    );

    // clock generator
    always begin
        clk = 1;
        #(HALF_CYCLE) clk = 0;
        #(HALF_CYCLE);
    end
    // rst control
    always begin
        rst <= 1'b1;
        #70 rst <= 1'b0;
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
