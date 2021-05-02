`timescale 1ns / 1ps

module Latch(
input wire D, CK,
output reg Q
);

// いずれかの入力信号に変化があったら必ず実行するという意味
always @* begin
    if (CK == 1'b1)
	Q <= D;
end

endmodule
