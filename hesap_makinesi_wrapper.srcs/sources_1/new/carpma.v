`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2020 22:10:07
// Design Name: 
// Module Name: carpma
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


module carpma(
     input basla,
    input [31:0]sayi1,
    input [31:0]sayi2,
    output reg [63:0]sonuc,
    output reg tasma=0,
    output reg bitti=0
    );
    integer i;
    reg onceki_bit;
    reg [31:0] temp_cikarma = 0;
    always @ (*)    begin
        if(basla)   begin
            sonuc[31:0] = sayi2;
            sonuc[63:32] = 0;
            onceki_bit = 0;
            
            for(i=32; i != 0; i=i-1)    begin
                if({sonuc[0],onceki_bit} == 2'b00)  begin
                    onceki_bit = sonuc[0];
                    sonuc = sonuc >> 1;
                    sonuc[63] = sonuc[62];
                end
                else if({sonuc[0],onceki_bit} == 2'b01) begin   //  TOPLAMA
                    sonuc[63:32] = sonuc[63:32] + sayi1;
                    onceki_bit = sonuc[0];
                    sonuc = sonuc >> 1;
                end
                else if({sonuc[0],onceki_bit} == 2'b10) begin   //    CIKARMA
                    temp_cikarma = sayi1;
                    temp_cikarma = ~temp_cikarma +1;
                    sonuc[63:32] = sonuc[63:32] + temp_cikarma;
                    onceki_bit = sonuc[0];
                    sonuc = sonuc >> 1;
                    sonuc[63] = sonuc[62];
                end
                else if({sonuc[0],onceki_bit} == 2'b11) begin
                    onceki_bit = sonuc[0];
                    sonuc = sonuc >> 1;
                    sonuc[63] = sonuc[62];
                end  
            end
          bitti=1;  
        end
        else    begin
            sonuc = 0;
            
        end
    end
endmodule