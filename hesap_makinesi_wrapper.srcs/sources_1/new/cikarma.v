`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2020 10:30:32
// Design Name: 
// Module Name: cikarma
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


module cikarma(
input basla,
input[31:0] sayi1,// Cikarilan sayi
input[31:0] sayi2,// Cikan sayi
output reg [63:0] sonuc=0,
output reg tasma=0,
output reg bitti=0// Unsigned 2 sayi oldugu icin pozitif + negatif sayida tasma olmayacaktir 
 );
 
 
 reg[63:0] sayi1_temp,sayi2_temp;   
 
 reg[63:0] sayi2_tumleyen=0; 
 integer i=0,tut=0;
 
 reg[63:0] ara_sonuc=0;

 always@(*) begin
 if(basla)
 begin
     sayi1_temp=sayi1<<16;
     sayi2_temp=sayi2<<16;
     sonuc=0;   
     
     sayi2_tumleyen=~sayi2_temp+1; 

     sonuc= sayi1_temp+sayi2_tumleyen;
   bitti=1;
  end   
 end

endmodule

