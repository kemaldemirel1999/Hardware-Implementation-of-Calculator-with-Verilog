`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2020 12:48:08
// Design Name: 
// Module Name: hesap_makinesi
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


module hesap_makinesi(
  input         clk,
  input         rst,
  
  input[2:0]    tur,
  input[31:0]   sayi1,
  input[31:0]   sayi2,
  
  output reg      hazir=0,
  
  output reg[63:0]  sonuc=0,
  output reg       tasma=0,
  output reg       gecerli=0
  );
 wire [63:0]sonuc1next,sonuc2next,sonuc3next,sonuc4next,sonuc5next,sonuc6next,sonuc7next;
 wire tasma1;
 wire bitti1next,bitti2next,bitti3next,bitti4next,bitti5next,bitti6next,bitti7next;
 reg bitti1,bitti2,bitti3,bitti4,bitti5,bitti6,bitti7;
 reg [63:0]sonuc1,sonuc2,sonuc3,sonuc4,sonuc5,sonuc6,sonuc7;
 
 Toplama toplama(
 (tur==0 && !rst),sayi1,sayi2,sonuc1next,tasma1,bitti1next);
 
 cikarma cikarma(
 (tur==1 && !rst),sayi1,sayi2,sonuc2next,tasma1,bitti2next);
 
 carpma carpma(
 (tur==2 && !rst),sayi1,sayi2,sonuc3next,tasma1,bitti3next);
 
 bolme bolme(
 (tur==3 && !rst),sayi1,sayi2,sonuc4next,tasma1,bitti4next);
 
 karekok karekok(
 (tur==4 && !rst),sayi1,sonuc5next,tasma1,bitti5next);
 
 tan_cot tanjant(
 (tur==5 && !rst),sayi1,clk,sonuc6next,tasma1,bitti6next);
 
 Tancot kotanjant(
 (tur==6 && !rst),sayi1,clk,sonuc7next,tasma1,bitti7next);
  
  
  always@(posedge clk)
  begin
  if(rst)
  begin
  tasma=0;
  hazir=0;
  sonuc=0;
  end
  else
  begin
  
  case(tur)
 
  0:begin sonuc<=sonuc1next; hazir<=bitti1next;end 
  1:begin sonuc<=sonuc2next; hazir<=bitti2next;end 
  2:begin sonuc<=sonuc3next; hazir<=bitti3next;end 
  3:begin sonuc<=sonuc4next; hazir<=bitti4next;end
  4:begin sonuc<=sonuc5next; hazir<=bitti5next;end
  5:begin sonuc<=sonuc6next; hazir<=bitti6next;end
  6:begin sonuc<=sonuc7next; hazir<=bitti7next;end
  endcase
 
  tasma<=tasma1;

  gecerli=hazir;
  end
  end 
  
endmodule
