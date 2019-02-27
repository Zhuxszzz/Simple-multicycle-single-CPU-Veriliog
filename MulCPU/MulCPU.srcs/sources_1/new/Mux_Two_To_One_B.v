`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/11 20:55:40
// Design Name: 
// Module Name: Mux_Two_To_One_B
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


module Mux_Two_To_One_B(CLK, ALUSrcB, DataIn1, DataIn2, DataOut );
    input CLK;
    input ALUSrcB;
    input [31:0] DataIn1;
    input [31:0] DataIn2;
    output reg [31:0] DataOut;

    always@(negedge CLK) begin
        if ( ALUSrcB == 0 )
            DataOut = DataIn1;
        else
            DataOut = DataIn2;
    end

endmodule
