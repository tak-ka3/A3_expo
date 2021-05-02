module testbench_bit4_plus;
    
    // parameter
    parameter CYCLE = 1000; // clock cycle
    parameter HALF_CYCLE = 500; // half cycle
    parameter DLY = 500; // delay
    
    // wire/reg
    reg clk;
    reg [3:0] inA;
    reg [3:0] inB;
    wire [3:0] Sout;
    wire Cout;

    // DUT module
    bit4_plus bit4_plus_0 (
        .inA(inA),
        .inB(inB),
        .outS2(Sout),
	.Cout0(Cout)
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
