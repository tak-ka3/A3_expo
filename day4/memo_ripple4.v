`timescale 1ns / 1ps

module memo_ripple4_gate (
    input wire [3:0] inA,
    input wire [3:0] inB,
    input wire Cin,
    output wire [3:0] outS2,
    output wire Cout0
);
wire [4:0] ca;
assign ca[0] = Cin;

genvar i;
generate
    for (i = 0; i<4; i=i+1) begin
	full_gate full_gate_0(
	    .inA(inA[i]),
	    .inB(inB[i]),
	    .Cin(ca[i]),
	    .outS2(outS2[i]),
	    .Cout0(ca[i+1])
	);
    end
endgenerate
assign Cout0 = ca[4];
endmodule
