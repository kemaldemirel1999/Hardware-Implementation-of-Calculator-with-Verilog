`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2020 21:34:12
// Design Name: 
// Module Name: bolme
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


module bolme(
input basla,
input[31:0] sayi1,
    input[31:0] sayi2,
    output reg [63:0] sonuc,
    output reg bitti=0,
    output reg tasma=0
    );

    reg[47:0] Q=47'b0;
    reg[79:0] A_X;
    integer i;
   

 
    always@*begin
   if(basla && sayi2!=0)
   begin
    $display("sayi %d",sayi1);
    A_X[47:0]=sayi1<<16;
    A_X[79:48]=32'b0;

        for(i=0;i<48;i=i+1)begin

          A_X=A_X<<1;
          Q=Q<<1;

             if(A_X[79:48]>=sayi2)begin
                Q[0]=1;
                A_X[79:48]= A_X[79:48]-sayi2;
             end
         
        end
       sonuc=Q<<16;
       bitti=1;
    end
  
end
  
  
  
   
endmodule
