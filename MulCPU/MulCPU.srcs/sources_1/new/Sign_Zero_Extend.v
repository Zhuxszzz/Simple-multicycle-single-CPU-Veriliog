`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/11 20:47:30
// Design Name: 
// Module Name: Sign_Zero_Extend
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


module Sign_Zero_Extend( CLK,Imm_Number, ExtSel, Result );
 input CLK;
    input [15 :0] Imm_Number;
    input ExtSel;
    output  reg [31:0] Result;
    always@(Imm_Number or ExtSel)begin
  	Result[15:0] = Imm_Number[15:0];
	 Result[31:16] = (ExtSel)? (Imm_Number[15] ? 16'hffff : 16'h0000) : 16'h0000;
	 end
endmodule

