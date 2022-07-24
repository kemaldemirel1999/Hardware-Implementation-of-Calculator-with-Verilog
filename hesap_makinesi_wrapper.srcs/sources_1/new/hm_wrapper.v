`timescale 1ns / 1ps

module hm_wrapper(
  );
  
  reg clk = 0, rst;
  
  always begin
    clk = #5 ~clk;
  end
  
  initial begin
    rst = 1;
    #100;
    rst = 0;
  end
  
  wire hazir;
  wire gecerli;
  wire tasma;
  (*dont_touch = "true"*) reg [6:0] c_count;
  wire [63:0] sonuc;

  wire clk_deriv;
  wire mmcm_locked;
  wire bitti;
  reg[2:0] tur;
  reg[31:0] sayi1, sayi2;
  
  clk_wiz cw_i
  (
    .clk_in1(clk),
    .clk_out1(clk_deriv),
    .reset(rst),
    .locked(mmcm_locked)
  );
   
  // ----------------------------------------------------------
  // -------------- Asagidakileri degistirebilirsiniz ---------
  // ----------------------------------------------------------

  // Projede gelistirdiginiz modulu
  // bu sekilde olusturup ayni giris
  // cikislari baglayin.
  // Ya da bu ornekle verilen hesap_makinesi
  // modulunun icinde de olusturabilirsiniz.
  hesap_makinesi hm
  (
    .clk(clk_deriv),
    .rst(rst | ~mmcm_locked),
    .tur(tur),
    .sayi1(sayi1),
    .sayi2(sayi2),

    .hazir(hazir),
    .sonuc(sonuc),
    .tasma(tasma),
    .gecerli(gecerli)
  );
  
  // --------------------------------------------------------------------------------------------
  // -------------- Buradan sonraki kodu degistirmeyin (tur değerini değiştirebilirsiniz)--------
  // --------------------------------------------------------------------------------------------
  assign bitti = (&c_count);
  
  reg[31:0] yurutme_zamani;
  reg       saymaya_basla;
  
  always @(posedge clk_deriv) begin
    if(rst | ~mmcm_locked) begin
      c_count <= 0;
      yurutme_zamani <= 0;
      saymaya_basla <= 0;
      sayi1 <= 0;
      sayi2 <= 0;
      tur <= 0; //test etmek istediğiniz işleme uygun tur değerini giriniz.
    end
    else begin
      sayi1 <= sayi1 + 2'b01;
      sayi2 <= sayi2 + 2'b10;
      saymaya_basla <= hazir ? 1'b1 : saymaya_basla;
      if(saymaya_basla)
        yurutme_zamani <= yurutme_zamani + 1;
      else
        yurutme_zamani <= yurutme_zamani;
      if(gecerli)
        c_count <= c_count + 1;
      else
        c_count <= c_count;
    end
  end
  
endmodule
