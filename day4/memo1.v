`timescale 1ns / 1ps

// Block RAM (Read-First mode) example code 
// For more information, please refer to Xilinx UG473 and UG687
// UG473: https://japan.xilinx.com/support/documentation/user_guides/j_ug473_7Series_Memory_Resources.pdf
// UG687: https://japan.xilinx.com/support/documentation/sw_manuals_j/xilinx14_7/xst_v6s6.pdf

module memo_ripple4 ( 
    input wire  clk, we,
    input wire [4:0] addr,
    input wire [3:0] w_data,
    input wire Cin1,
    output wire [3:0] outS,
    output wire Cout
);

    reg [3:0] mem [0:31];
    reg [3:0] mem_out;
    reg [4:0] cnt;

    initial begin
        $readmemh("/home/denjo/Xilinx/source/day4/mem.hex", mem);
    end
    
    always @(posedge clk) begin
        if (we) mem[addr] <= w_data;  // synchronous write
        mem_out <= mem[addr];  // synchronous read
    end

    ripple4_gate ripple4_gate0(
	.inA(mem[addr]),
	.inB(mem[addr+1]),
	.Cin(Cin1),
	.outS2(outS),
	.Cout0(Cout)
    );
    
endmodule


