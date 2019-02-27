`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/21 16:49:05
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
    input CLK,
    input Reset,//
    input PCWre,//Í£»úÖ¸Áî
    input [31:0] nextPC,
    output reg [31:0] curPC
    );
    always @(posedge CLK or negedge Reset)
          begin
      if(Reset==0) begin
        curPC = 0;
       end
       else if(PCWre)begin
/*         case(PCSrc)
         2'b00: Address=Address+4;
         2'b01:Address={Address+4+Immediate*4};
         2'b10:begin 
         Address=Address+4;
         Address={Address[31:28],Immediate[27:2],2'b00};
         end
         endcase*/
            curPC = nextPC;
         end
        end
endmodule
