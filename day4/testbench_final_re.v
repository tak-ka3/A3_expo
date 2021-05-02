module testbench_final_ref;
    
    // parameter
    parameter CYCLE = 1000; // clock cycle
    parameter HALF_CYCLE = 500; // half cycle
    parameter DLY = 500; // delay
    
    // wire/reg
    reg clk, we;
    reg [4:0] addr;
    reg [3:0] w_data;
    reg Cin;
    wire [3:0] outS;
    wire Cout;
    wire [3:0] r_data_ref; // outSと結果を比較


    // DUT module
    memo_ripple4 memo_ripple4_0 (
        .clk(clk),
        .we(we),
        .addr(addr),
	.w_data(w_data),
	.Cin1(Cin),
	.outS(outS),
	.Cout(Cout)
    );

    bram_ref bram_ref_0(
	.clk(clk),
	.we(we),
	.addr(addr),
	.w_data(w_data),
	.r_data(r_data_ref)
    );

    // clock generator
    always begin
        clk = 1'b1;
        #(HALF_CYCLE) clk = 1'b0;
//	$display("r_data=%b", r_data);
        #(HALF_CYCLE);
	if (outS != r_data_ref) begin
	    $display("error address is %x", addr);
	end
    addr = addr+1;
    end
//    always begin
//	#(HALF_CYCLE*2) addr = addr +1;
//    end
    // test scenario
//    integer i;
    initial begin
	we = 0;
	addr = 0;
	w_data = 0;
	Cin = 0;
//	for (i = 0; i < 10; i = i+1) begin
//	   addr = addr +1;
//	   #500;
//	end
    # 10000;
    end

endmodule

