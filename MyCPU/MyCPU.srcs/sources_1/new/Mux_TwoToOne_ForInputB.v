`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/21 23:40:55
// Design Name: 
// Module Name: Mux_TwoToOne_ForInputB
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

module Mux_TwoToOne( ALUSrcB, DataIn1, DataIn2, DataOut );

    input ALUSrcB;
    input [31:0] DataIn1;
    input [31:0] DataIn2;
    output reg [31:0] DataOut;

    always@( ALUSrcB or DataIn1 or DataIn2 ) begin
        if ( ALUSrcB == 0 )
            DataOut = DataIn1;
        else
            DataOut = DataIn2;
    end

endmodule