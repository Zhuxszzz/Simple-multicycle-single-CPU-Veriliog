`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/21 22:26:27
// Design Name: 
// Module Name: Mux_TwoToOne_ForInputA
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


module Mux_TwoToOne_ForInputA( ALUSrcA, DataIn1, sa, DataOut );

    input ALUSrcA;
    input [31:0] DataIn1;
    input [31:0] sa;
    output reg [31:0] DataOut;

    always@( ALUSrcA or DataIn1 or sa ) begin
        if ( ALUSrcA == 0 )
            DataOut = DataIn1;
        else
            DataOut = sa; // 对sa进行扩展
    end

endmodule
