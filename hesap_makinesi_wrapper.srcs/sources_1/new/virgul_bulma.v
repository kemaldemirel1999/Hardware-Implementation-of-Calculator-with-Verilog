`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2020 10:15:26
// Design Name: 
// Module Name: virgul_bulma
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


module virgul_bulma(
input [31:0]sayi,
input aktiflestir,
output reg [127:0]esasolcu=0,
reg bitti=0
    );
  reg[127:0]placeholder3=0;  
  reg[127:0]tamkisim=0;
  integer i=0;
 always@*
 begin
      if(aktiflestir)
      begin
        tamkisim=sayi[31:16]*10**(16);
        for(i=0;i<=15;i=i+1)
        begin
         placeholder3=placeholder3+(sayi[15-i]*(10**16))/(2**(i+1));
         end        
         esasolcu=(((tamkisim+placeholder3)%(2*10**(16)))*314159);
        placeholder3=0;
        bitti=1;
      end
 end
    
    
endmodule

    

