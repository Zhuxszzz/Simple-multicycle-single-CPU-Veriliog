`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/25 00:05:33
// Design Name: 
// Module Name: nextPC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module nextPC(
    input[1:0] PCSrc,
    input[31:0] curPC,
    input[31:0] Imme,
    input[27:0] jumpaddress,
    output reg [31:0] nextPC
 );
    always @(curPC or PCSrc) begin
             case(PCSrc)
             2'b00: nextPC = curPC + 4;
             2'b01: nextPC = curPC + 4+(Imme << 2);
             2'b10:begin 
             nextPC = curPC + 4;
             nextPC[27:0] = jumpaddress[27:0];
             end
             //2'b11:nextPC=curPC;
             endcase
    end
endmodule
