module testbench_ripple4;
    
    // parameter
    parameter CYCLE = 1000; // clock cycle
    parameter HALF_CYCLE = 500; // half cycle
    parameter DLY = 500; // delay
    
    // wire/reg
    reg clk;
    reg [3:0] inA;
    reg [3:0] inB;
    reg Cin;
    wire [3:0] outS_ripple4_gate;
    wire outC_ripple4_gate;

    // DUT module
    ripple4_gate ripple4_gate_0 (
        .inA(inA),
        .inB(inB),
	    .Cin(Cin),
        .outS2(outS_ripple4_gate),
	    .Cout0(outC_ripple4_gate)
    );

    // clock generator
    always begin
        clk = 1'b1;
        #(HALF_CYCLE) clk = 1'b0;
        #(HALF_CYCLE);
    end
    integer i;
    integer j;
    // test scenario
    initial begin
        // initialize
        inA=0;
        inB=0;
        Cin = 1'b0;
        for(i = 0; i < 16; i = i+1) begin
            inA = inA + 1;
            for (j = 0; j < 16;j = j+1) begin
                inB <= inB+1;
                #10;
            end
        end
        # 10000;

        $finish;
    end

endmodule

