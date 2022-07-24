`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2020 11:00:15
// Design Name: 
// Module Name: Sincosalici
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


module Sincosalici(
input [127:0]esasolcu,
input basla,sinmi_cosmu,
output reg [255:0]sinyadacos=0,
reg bitti=0
    );
    
 reg [255:0]sineksili=0;
 reg [255:0]sinartili=0;
 reg [255:0]coseksili=0;
 reg [255:0]cosartili=0;
 reg [255:0]sineksilinext=0;
 reg [255:0]sinartilinext=0;
 reg [255:0]coseksilinext=0;
 reg [255:0]cosartilinext=0;
 
 
 reg [255:0]faktoriyel[31:0];
 reg [4047:0]faktoriyelcarpim[31:0];
 integer i=0;
 
 initial begin 
 for(i=1;i<=32;i=i+1)
     begin
     if(i==1)
    faktoriyel[0]=10**21; //**21
    else
    faktoriyel[i-1]=(i-1)*10**21;
    end
 
 for(i=1;i<=32;i=i+1)
     begin
     if(i==1)
     begin
     faktoriyelcarpim[i-1]=faktoriyel[i-1];
     end
     else
     faktoriyelcarpim[i-1]=faktoriyelcarpim[i-2]*faktoriyel[i-1];
    end

 end
  
    
 always@*
 begin 
 sinartili=0;
 sineksili=0;
 cosartili=0;
 coseksili=0;  
 coseksilinext=0;
 sinartilinext=0;
 sineksilinext=0;
 cosartilinext=0;
 if(basla)
 begin
    if(sinmi_cosmu)
    begin
        for(i=0;i<=15;i=i+1)
            begin
            sineksili=sineksilinext;
            sinartili=sinartilinext;
            if(i%2==1)
                begin
                sineksilinext=sineksili+((esasolcu)**(2*i+1))*10**26/((faktoriyelcarpim[2*i+1]));
                
                end
            else begin
                sinartilinext=sinartili+((esasolcu)**(2*i+1))*10**26/((faktoriyelcarpim[2*i+1]));
               
                end
       end  
       sinyadacos=(sinartilinext>sineksilinext)? sinartilinext-sineksilinext:sineksilinext-sinartilinext; 
    end
    else
    begin
        for(i=0;i<=15;i=i+1)
            begin
            coseksili=coseksilinext;
            cosartili=cosartilinext;
            if(i%2==1)
                begin
                coseksilinext=coseksili+((esasolcu)**(2*i))*10**26/((faktoriyelcarpim[2*i])); 
              
                end
            else 
                begin
                cosartilinext=cosartili+((esasolcu)**(2*i))*10**26/((faktoriyelcarpim[2*i]));
             
            end 
        end   
        sinyadacos=(coseksilinext>cosartilinext)? coseksilinext-cosartilinext: cosartilinext-coseksilinext; 
    end
   
   
   bitti=1; 
 end    
    
    
 end   
    
endmodule
