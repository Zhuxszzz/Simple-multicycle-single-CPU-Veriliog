`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/15 11:38:42
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(
   CLK,RST,zero,sign,opcode,PCWre,ALUSrcA,ALUSrcB,DBDataSrc,RegWre,WrRegDSrc,InsMemRW,mRD,mWR,IRWre,ExtSel,PCSrc,RegDst,ALUop,Instate
    );
    input CLK,RST,zero,sign;
    input [5:0] opcode;
    output reg PCWre,ALUSrcA,ALUSrcB,DBDataSrc,RegWre,WrRegDSrc,InsMemRW,mRD,mWR,IRWre,ExtSel;
    output reg [1:0] PCSrc,RegDst;
     output reg [2:0] ALUop,Instate;
    reg [2:0]state;
     reg [2:0]Q;
     reg [2:0]next_pos;
     
     initial begin
         InsMemRW = 1;
         state = 0;
     end
     
     always @( posedge CLK )begin
         case(state)
             3'b000:begin
                 //RegWre = 0;
                 state = 001;
                 mRD = 0;
                 mWR = 0;
             end
             3'b001:begin
                 //RegWre = 0; 
                 mRD = 0;
                 mWR = 0;
                 case(opcode)
                     6'b111000:begin
                        state = 000;
                         mWR = 0;
                       
                     end
                     6'b111001:begin
                        state = 000;                      
                         mWR = 0;
                     end
                     6'b111010:begin//jal
                         state = 000;
                         //PCSrc = 2'b11;
                         mWR = 0;
                         //RegWre = 0;
                         //RegDst = 2'b00;
                     end
                     6'b111111:begin
                         state = 000;
                         //RegWre = 0;
                     end
                     6'b110100,6'b110101,6'b110110:begin
                         state = 101;
                     end
                     6'b110000,6'b110001:begin
                         state = 010;
                     end
                     default:begin
                         state = 110;
                     end
                 endcase            
             end
             3'b010:begin
                 state = 011;
                 case(opcode)
                     6'b110000:begin//sw
                         //RegWre = 0;
                         mRD = 0;
                         mWR = 1;
                     end
                     6'b110001:begin//lw
                         //RegWre = 0;
                         mWR = 0;
                         mRD = 1;
                     end
                 endcase
             end
             3'b011:begin
                 case(opcode)
                     6'b110000:begin
                         state = 000;
                         //RegWre = 0; 
                         mRD = 0;
                         mWR = 0;
                     end    
                     6'b110001:begin
                         state = 100;
                         mRD = 0;
                         mWR = 0;
                         //RegWre = 1;            
                     end
                 endcase
                 
             end
             3'b100:begin
                 state = 000;
                 mRD = 0;
                 mWR = 0;
                 //RegWre = 0;
             end
             3'b101:begin
                 state = 000;
                 mRD = 0;
                 mWR = 0;
                 //RegWre = 0;
             end
             3'b110:begin
                 state = 111;
                 mRD = 0;
                 mWR = 0;
                 //RegWre = 1;
              end   
              3'b111:begin
                 state = 000;
                 mRD = 0;
                 mWR = 0;
                 //RegWre = 0;
              end
         endcase
     end    
 
     always @(*) begin
         Instate = state;
         if( state == 3'b001 )begin
             if( opcode == 6'b111010 )begin
                 RegWre = 1;
             end
             else RegWre = 0;
         end
         else if( state == 3'b111)begin
             RegWre = 1;
         end
         else if( state == 3'b100 )begin
             RegWre = 1;
         end
         else begin
             RegWre = 0;
         end
     end
     
     always @( negedge CLK )begin
         case(state)
             3'b000:begin
                 PCWre = 0;
                 IRWre = 1;
             end
             3'b001:begin
                 IRWre = 0;
                 PCWre = 0;
                 case(opcode)
                     6'b111000:begin
                         PCWre = 1;
                         IRWre = 0;
                     end
                     6'b111001:begin
                         PCWre = 1;
                         IRWre = 0;
                     end
                     6'b111010:begin//jal
                         PCWre = 1;
                         IRWre = 0;
                     end
                     6'b111111:begin
                         PCWre = 0;
                         IRWre = 0;
                     end
                 endcase            
             end
             3'b010:begin
                 PCWre = 0;
                 IRWre = 0;
             end
             3'b011:begin
                 case(opcode)
                     6'b110000:begin
                         IRWre = 0;
                         PCWre = 1;
                     end    
                     6'b110001:begin
                         PCWre = 0;
                         IRWre = 0;       
                     end
                 endcase
                 
             end
             3'b100:begin
                 IRWre = 0;
                 PCWre = 1;
             end
             3'b101:begin
                 IRWre = 0;
                 PCWre = 1;
             end
             3'b110:begin
                 IRWre = 0;
                 PCWre = 0;
              end   
              3'b111:begin
                 IRWre = 0;
                 PCWre = 1;
              end
         endcase
     end
     
     always @( opcode or sign or zero ) begin
         case(opcode)
             6'b000000: begin//add
                 ALUSrcA = 0;
                 ALUSrcB = 0;
                 DBDataSrc = 0;
                 RegDst = 2'b10;
                 ExtSel = 1;
                 PCSrc = 2'b00;
                 ALUop = 3'b000;
                 WrRegDSrc = 1;
             end
             6'b000001: begin//sub
                 ALUSrcA = 0;
                 ALUSrcB = 0;
                 DBDataSrc = 0;
                 RegDst = 2;
                 ExtSel = 1;
                 PCSrc = 2'b00;
                 ALUop = 3'b001;
                 WrRegDSrc = 1;
             end
             6'b000010: begin//3:addi
                 ALUSrcA = 0;
                 ALUSrcB = 1;
                 DBDataSrc = 0;
                 RegDst = 1;
                 ExtSel = 1;
                 PCSrc = 2'b00;
                 ALUop = 3'b000;
                                 WrRegDSrc = 1;
             end
             6'b010001: begin//4:andi
                 ALUSrcA = 0;
                 ALUSrcB = 1;
                 DBDataSrc = 0;
                 RegDst = 1;
                 ExtSel = 0;
                 PCSrc = 2'b00;
                 ALUop = 3'b100;
                  WrRegDSrc = 1;
             end
             6'b010000: begin
                 ALUSrcA = 0;
                 ALUSrcB = 0;
                 DBDataSrc = 0;
                 InsMemRW = 1;
                 RegDst = 2;
                 ExtSel = 1;
                 PCSrc = 2'b00;
                 ALUop = 3'b100;
                 WrRegDSrc = 1;
             end
             6'b010010: begin//6:ori
                 ALUSrcA = 0;
                 ALUSrcB = 1;
                 DBDataSrc = 0;
                 InsMemRW = 1;
                 RegDst = 1;
                 ExtSel = 0;
                 PCSrc = 2'b00;
                 ALUop = 3'b011;
               WrRegDSrc = 1;
             end
             6'b010011: begin//7:xori
                 ALUSrcA = 0;
                 ALUSrcB = 1;
                 DBDataSrc = 0;
                 RegDst = 1;
                 ExtSel = 1;
                 PCSrc = 2'b00;
                 ALUop = 3'b111;
               WrRegDSrc = 1;
             end
             6'b011000: begin
                 ALUSrcA = 1;
                 ALUSrcB = 0;
                 DBDataSrc = 0;
                 RegDst = 2;
                 ExtSel = 1;
                 PCSrc = 2'b00;
                 ALUop = 3'b010;
                  WrRegDSrc = 1;
             end
             6'b100110: begin
                 ALUSrcA = 0;
                 ALUSrcB = 1;
                 DBDataSrc = 0;
                 RegDst = 1;
                 ExtSel = 1;
                 PCSrc = 2'b00;
                 ALUop = 3'b110;
                 WrRegDSrc = 1;
             end
             6'b100111: begin//9:slt
                  ALUSrcA = 0;
                  ALUSrcB = 0;
                  DBDataSrc = 0;
                  RegDst = 2'b10;
                  ExtSel = 1;
                  PCSrc = 2'b00;
                  ALUop = 3'b110;
                  WrRegDSrc = 1;
              end           
             6'b110000: begin//10:sw
                 ALUSrcA = 0;
                 ALUSrcB = 1;
                 DBDataSrc = 0;
                 RegDst = 0;
                 ExtSel = 1;
                 PCSrc = 2'b00;
                 ALUop = 3'b000;
                  WrRegDSrc = 1;
             end
             6'b110001: begin//11:lw
                 ALUSrcA = 0;
                 ALUSrcB = 1;
                 DBDataSrc = 1;
                 RegDst = 1;
                 ExtSel = 1;
                 PCSrc = 2'b00;
                 ALUop = 3'b000;
                WrRegDSrc = 1;
             end
             6'b110100: begin//12:beq
                 ALUSrcA = 0;
                 ALUSrcB = 0;
                 DBDataSrc = 0;
                 RegDst = 1;
                 ExtSel = 1;
                 if (zero == 0 ) begin
                 PCSrc = 2'b00;
                 end
                 else begin
                 PCSrc = 2'b01; 
                 end
                 ALUop = 3'b001;
                 WrRegDSrc = 1;
             end
             6'b110101: begin
                 ALUSrcA = 0;
                 ALUSrcB = 0;
                 DBDataSrc = 0;
                 RegDst = 1;
                 ExtSel = 1;
                 if (zero == 0 ) begin
                 PCSrc = 2'b01;
                 end
                 else begin
                 PCSrc = 2'b00; 
                 end
                 ALUop = 3'b001;
                    WrRegDSrc = 1;
             end
             6'b110110: begin//14:bltz
                 ALUSrcA = 0;
                 ALUSrcB = 0;
                 DBDataSrc = 0;
                 RegDst = 1;
                 ExtSel = 1;
                 if (sign == 0 ) begin
                 PCSrc = 2'b00;
                 end
                 else begin
                 PCSrc = 2'b01; 
                 end
                 ALUop = 3'b001;
          WrRegDSrc = 1;
             end
             6'b111000: begin//15:j
                 ALUSrcA = 0;
                 ALUSrcB = 0;
                 DBDataSrc = 0;
                 RegDst = 1;
                 ExtSel = 1;
                 PCSrc = 2'b11;
                 ALUop = 3'b000;
              WrRegDSrc = 1;
             end
             6'b111001: begin
                 ALUSrcA = 0;
                 ALUSrcB = 0;
                 DBDataSrc = 0;
                 RegDst = 1;
                 ExtSel = 1;
                 PCSrc = 2'b10;
                 ALUop = 3'b000;
                   WrRegDSrc = 1;
             end
             6'b111010: begin//16:jal
                 ALUSrcA = 0;
                 ALUSrcB = 0;
                 DBDataSrc = 0;
                 RegDst = 2'b00;
                 ExtSel = 1;
                 PCSrc = 2'b11;
                 ALUop = 3'b000;
                 WrRegDSrc = 0;
             end            
             6'b111111: begin
                 ALUSrcA = 0;
                 ALUSrcB = 0;
                 DBDataSrc = 0;
                 RegDst = 1;
                 ExtSel = 1;
                 PCSrc = 2'b00;
                 ALUop = 3'b000;
                 WrRegDSrc = 1;
             end            
         endcase
     end
 endmodule
