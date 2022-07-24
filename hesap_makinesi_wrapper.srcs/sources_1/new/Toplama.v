`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2020 23:13:58
// Design Name: 
// Module Name: Toplama
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


module Toplama(
input basla,
    input [31:0]sayi1,
    input [31:0]sayi2,
    output reg [63:0]sonuc=0,
    output reg tasma=0,
    output reg bitti=0
    );
    reg [32:0]temp_sayi1;
    reg [32:0]temp_sayi2;
    reg [32:0] carry;
    integer i;
    always@ (*) begin
        if(basla)   begin
            temp_sayi1 = 0;
            temp_sayi2 = 0;
            carry = 0;
            temp_sayi1[31:0] = sayi1;
            temp_sayi2[31:0] = sayi2;
            for(i=0; (temp_sayi2 != 0) && (i<32); i = i+1)   begin
                carry = temp_sayi1 & temp_sayi2;
                temp_sayi1 = temp_sayi1 ^ temp_sayi2;
                temp_sayi2 = carry << 1;
            end
            if( temp_sayi2 == 0) begin
                sonuc[31:16] = temp_sayi1[15:0];
                sonuc[63:32] = temp_sayi1[32:16];
                //sonuc = temp_sayi1;
            end
           bitti=1;
            end
//        else   begin
//            sonuc = 0;
      
//        end
    end
    
endmodule
