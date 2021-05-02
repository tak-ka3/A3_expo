`timescale 1ns / 1ps

module sync (
    input wire rst,
    input wire clk,
    output wire out
);
    reg [1:0] cnt;
    reg out_reg;
    // start

    always @(posedge clk or posedge rst) begin
           if (rst == 1) begin
                out_reg <= 1;
                cnt <= 0; 
           end
           else begin
                if (cnt < 3) begin
                    out_reg <= 0;
                    cnt <= cnt+1;
                end
                else begin
                    out_reg <= 1;
                    cnt <= 0;
                end
           end
    end
    always @(negedge rst) begin
        out_reg = 0;
        cnt = 0;
    end


    assign out = out_reg;

endmodule
