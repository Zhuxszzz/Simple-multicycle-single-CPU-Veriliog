`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/21 22:23:49
// Design Name: 
// Module Name: Mux_TwoToOneReg
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


module Mux_TwoToOneReg( Select, DataIn1, DataIn2, DataOut );

    input Select;
    input [4:0] DataIn1;
    input [4:0] DataIn2;
    output reg [4:0] DataOut;

    always@( Select or DataIn1 or DataIn2 ) begin
        if ( Select == 0 )
            DataOut = DataIn1;
        else
            DataOut = DataIn2;
    end

endmodule
