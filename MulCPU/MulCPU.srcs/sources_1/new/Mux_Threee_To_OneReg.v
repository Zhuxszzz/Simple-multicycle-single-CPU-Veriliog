`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/11 21:00:12
// Design Name: 
// Module Name: Mux_Threee_To_OneReg
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


module Mux_Three_To_OneReg(CLK,RegDst, Rt, Rd, WriteReg );
    input CLK;
    input [1:0] RegDst;
    input [4:0] Rt;
    input [4:0] Rd;
    output reg [4:0] WriteReg;
    always@(RegDst or Rt or Rd or WriteReg) begin
            case(RegDst)
             2'b00:begin
                  WriteReg= 5'b11111;
              end
              2'b01:begin
                  WriteReg = Rt;
              end
              2'b10:begin
                 WriteReg= Rd;
              end
            endcase
    end

endmodule
