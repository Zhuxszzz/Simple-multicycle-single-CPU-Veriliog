`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/11 19:38:39
// Design Name: 
// Module Name: PC
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


module PC(
 input   CLK,RST,PCWre,
   input   [31:0] nextPC,
   output  reg [31:0] curPC
    );
    always@(negedge CLK) begin
        if( RST == 0 ) curPC <= 0;
        else if (PCWre) curPC <= nextPC;
      end
  endmodule
