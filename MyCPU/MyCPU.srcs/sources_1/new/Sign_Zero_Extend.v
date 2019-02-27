`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/21 22:25:00
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


module Sign_Zero_Extend( Imm_Number, ExtSel, Result );

    input [15 :0] Imm_Number;
    input ExtSel;
    output  [31:0] Result;

  	assign Result[15:0] = Imm_Number[15:0];
	assign Result[31:16] = (ExtSel)? ((Imm_Number[15]) ? 16'hffff : 16'h0000) : 16'h0000;
endmodule
