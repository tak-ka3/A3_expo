module testbench_memo_ripple4;
    
    // parameter
    parameter CYCLE = 1000; // clock cycle
    parameter HALF_CYCLE = 500; // half cycle
    parameter DLY = 500; // delay
    
    // wire/reg
    reg clk, we;
    reg [4:0] addr;
    reg [3:0] w_data;
    wire [3:0] outS;
    wire Cout;

    // DUT module
    memo_ripple4 memo_ripple4_0 (
        .clk(clk),
        .we(we),
        .addr(addr),
	.w_data(w_data),
	.outS(outS),
	.Cout(Cout)
    );

    // clock generator
    always begin
        clk = 1'b1;
        #(HALF_CYCLE) clk = 1'b0;
	addr = addr+1;
//	$display("r_data=%b", r_data);
        #(HALF_CYCLE);
    end
    // test scenario
//    integer i;
    initial begin
	we = 1;
	addr = 0;
	w_data = 0;
//	for (i = 0; i < 10; i = i+1) begin
//	   addr = addr +1;
//	   #500;
//	end
    end

endmodule

