function [x]=note(lover,higher) %x bir değer dönderen ve 2 parametre alan bir note isimli fonksiyon.
fs=8192; %gelen notalara ait ornek baslangic frekansi. Bu degere gore digerlerinin durumu aliniyor
a=1;
tpl=0;
harmonik={1 0.8 0.4 0.1};
t=0:1/fs:higher-(1/fs); 

for h=1:length(harmonik)
   x=harmonik{h}*sin(2*pi*lover*t*a); %harmonik hesaplama formulu
   tpl=tpl+x;%tum harmoniler toplaniyor ve tpl degiskenine ataniyor
   a=a+1;
end

   z1=linspace(0,1.5,length(t)/4);
   z2=linspace(1.5,1,length(t)/8);
   z3=linspace(1,1,length(t)/2);
   z4=linspace(1,0,length(t)/8);
   zarf=[z1 z2 z3 z4];
   x=x.*zarf;
 echo=((x-(fs/10))*30/100)+x; %geri gonderilecek deger hesaplaniyor ve ekrana yazdiriliyor
end
