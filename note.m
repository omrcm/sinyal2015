
function [x] = note( lover, higher )  %x bir değer dönderen ve 2 parametre alan bir note isimli fonksiyon.
  t=lover:(higher-lover)/100:higher;%higher ve lover arasında değişen bir sınır.
  x=sin(t);%x sinüs sinyali istendiği için
  plot(x);%oluşturulan sinyalin grafiği
end
