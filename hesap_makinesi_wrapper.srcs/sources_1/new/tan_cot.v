`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2020 12:39:51
// Design Name: 
// Module Name: tan_cot
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


module tan_cot(
input basla,
input [31:0]sayi,
input clk,
output reg [63:0]tanjant,
output reg tasma=0,
output reg bitti=0
    );

 wire [31:0]sinusnext;
 reg  [31:0]sinus;

 wire [127:0]esasolcunext;
 reg [127:0]esasolcu=0;
 
 wire [63:0]tanjantnext,cotanjantnext;

 wire [31:0]cosinusnext;
 reg  [31:0]cosinus;
 

 wire bittisinyali1next,bittisinyali2_1next,bittisinyali2_2next,bittisinyali3_1next,bittisinyali3_2next;
 reg bittisinyali1=0,bittisinyali2_1=0,bittisinyali2_2=0,bittisinyali3_1=0,bittisinyali3_2=0;
 
 
 virgul_bulma boruvg(
 sayi,
 1,
 esasolcunext,
 bittisinyali1next
 );
 
 Sincosalici sin (
 esasolcu,
 bittisinyali1,
 1,
 sinusnext,
 bittisinyali2_1next
 );
 
 Sincosalici cos (
 esasolcu,
 bittisinyali1,
 0,
 cosinusnext,
 bittisinyali2_2next
 );
 
 bolme Tanjant(
 (bittisinyali2_1 & bittisinyali2_2),
 sinus,
 cosinus,
 tanjantnext,
 bittisinyali3_1next
 );
 
  always@(posedge clk)
  begin
  sinus<=sinusnext;
  cosinus<=cosinusnext;
  bittisinyali1<=bittisinyali1next;
  esasolcu<=esasolcunext;
  bittisinyali2_1<=bittisinyali2_1next;
  bittisinyali2_2<=bittisinyali2_2next;
  tanjant<=tanjantnext;
  bittisinyali3_1<=bittisinyali3_1next;
  bittisinyali3_2<=bittisinyali3_2next;
  bitti<=bittisinyali3_2next;
  
  end
endmodule
