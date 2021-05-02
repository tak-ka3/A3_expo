`timescale 1ns / 1ps

module half_gate (
    input wire inA,
    input wire inB,
    output wire outS,
    output wire outC
);
    xor_gate xor_gate_0(
	.inA(inA),
	.inB(inB),
	.out(outS)
    );
    and_gate and_gate_0(
	.inA(inA),
	.inB(inB),
	.out(outC)
    );

endmodule
