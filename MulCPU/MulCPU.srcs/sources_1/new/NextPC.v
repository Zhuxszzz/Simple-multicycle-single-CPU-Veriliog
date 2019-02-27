`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/11 19:41:12
// Design Name: 
// Module Name: NextPC
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


module NextPC(
input CLK,
    input[1:0] PCSrc,
    input[31:0] ExtOut,
    input[31:0] curPC,
    input[31:0] ReadData1,
    input[25:0] add,
    output reg [31:0] nextPC
 );
   always @(negedge CLK) begin
        case(PCSrc)
            2'b00:  nextPC = curPC + 4; // normal
            2'b01:  nextPC = curPC+4+4*ExtOut; // beq
            2'b10:  nextPC = ReadData1; // jr
            2'b11: begin //j jal
                nextPC[27:2] = add;
                nextPC[1:0] = 2'b00;
            end
        endcase
    end
endmodule