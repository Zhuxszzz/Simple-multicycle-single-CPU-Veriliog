`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/11 20:54:21
// Design Name: 
// Module Name: Mux_Two_To_One_A
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


module Mux_Two_To_One_A(CLK, ALUSrcA, DataIn1, sa, DataOut );
    inout CLK;
    input ALUSrcA;
    input [31:0] DataIn1;
    input [31:0] sa;
    output reg [31:0] DataOut;

    always@( negedge CLK) begin
        if ( ALUSrcA == 0 )
            DataOut = DataIn1;
        else
            DataOut = sa; // 对sa进行扩展
    end

endmodule
