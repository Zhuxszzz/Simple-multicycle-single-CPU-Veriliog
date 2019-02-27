`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/12 19:28:52
// Design Name: 
// Module Name: ALUuotDR
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


module ALUoutDR(CLK,Result, DAddr);
    input CLK;
    input [31:0] Result;
    output reg [31:0] DAddr;
    always @(posedge CLK) begin
        DAddr<= Result;
    end
endmodule
