`timescale 1ns / 1ps

module bit4_plus (
    input wire [3:0] inA,
    input wire [3:0] inB,
    // input wire Cin,
    output wire [3:0] outS2,
    output wire Cout0
);
assign {Cout0, outS2} = inA+inB;
endmodule
