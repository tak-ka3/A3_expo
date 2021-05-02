`timescale 1ns / 1ps

module flipflop_not(
input wire CK, RB,
);

wire D;
reg Q;

always @(posedge CK or posedge RB ) begin
    if(RB==1'b1)
	Q<= 1'b0;
    else
	Q<= D;
end
    assign D=~Q;  // ここでDとQの反転を実行している

endmodule
