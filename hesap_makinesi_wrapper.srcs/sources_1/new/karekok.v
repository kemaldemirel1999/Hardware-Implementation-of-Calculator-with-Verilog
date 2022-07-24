`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2020 22:56:08
// Design Name: 
// Module Name: karekok
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


module karekok(
   input basla,
    input [31:0] sayi,
    output reg [63:0] sonuc = 0,
    output reg tasma=0,
    output reg bitti=0
    );
    
    reg [31:0] X,A,T;
    reg [15:0] Q;
    reg [63:0] yazmac;
    integer i;
    always@ (*) begin
        if(basla)   begin
            T = 0;
            Q = 0;
            X = sayi;
            yazmac[63:32] = 0;
            yazmac[31:0] = X;
            for (i=0; i<16; i=i+1)  begin
                yazmac = yazmac<<2;
                T = yazmac[63:32] - {14'b00000000000000,Q,2'b01};
                Q = Q<<1;
                if (T >= 0 && T[31] != 1) begin
                    yazmac[63:32] = T;
                    Q[0] = 1;
                end 
            end
            sonuc = Q;
            sonuc = sonuc << 24;
            bitti=1;
        end
        else    begin
           
        end
        $display("ROOT-%b",Q);
    end
    
endmodule
  
