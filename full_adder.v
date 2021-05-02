`timescale 1ns / 1ps

module full_gate (
    input wire inA,
    input wire inB,
    input wire Cin,
    output wire outS2, Cout0
);
    wire outS;
    wire Cout, Cout2;

    half_gate half_gate_0(
	.inA(inA),
	.inB(inB),
	.outS(outS),
	.outC(Cout)
    );

    half_gate half_gate_1(
	.inA(Cin),
	.inB(outS),
	.outS(outS2),
	.outC(Cout2)
    );

    or_gate or_gate_0(
	.inA(Cout2),
	.inB(Cout),
	.out(Cout0)
    );

    
endmodule
