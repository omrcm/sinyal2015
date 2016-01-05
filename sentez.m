
 Fs=3600;
 gecikme=round(Fs/10); 
 notalar=[]; 
 
 dur=Fs/10000;
 oktdgs=3; %oktav'a eklenmek istenen deger oktdegis degiskeniyle eklenecek[-3,+3]. 
 % dosya acma ve okuma islemi bu alanda basliyor. fopen ile dosya aciliyor ve aldigi 2. parametre ile de 
 % read yani okuma izni veriliyor.
 dosya=fopen('notalar.txt','r'); 
 % actigimiz ve izin verdigimiz dosya icindeki bosluklari temizliyor ve vurgul ile ayiriyoruz
 % sonrasinda da okuyup degiskenlere atiyoruz
 [nota,oktav,olcu]=textread('notalar.txt','%s%d%s','delimiter',',');
 % fclose ile dosyamizi kapatiyoruz
 fclose(dosya);
 
 frekans=zeros(1,length(nota)); 
 if oktdgs ~=0 %oktdegis degiskeninde degisiklik yapılması durumunda islenecek sart.  
   for j=1:length(oktav) %text'ten cekilen oktav degerleri dongu icerisinde degistirilecek. 
         oktav(j)=oktav(j)+oktdgs;  
   end 
 end 
 for i=1:length(nota) 
     % yukarda okudugumuz dosyanin icinden gelen her bir degeri frek fonksiyonuna yolluyoruz ve frekanslarini hesapliyoruz
     frekans(i)=frek(nota{i},oktav(i)); 
     
     %note fonksiyonu cagırılarakta sin sinyalleri cizildi. 
     [sindalga,t]=note(frekans(i),str2num(olcu{i}));
     notalar=[notalar sindalga dur]; 
 end   
 for i=1:length(notalar) 
     if (i+gecikme)<length(notalar) 
         notalar(i+gecikme)=notalar(i+gecikme)+0.3*notalar(i);  
     end 
 end 
 notalar = notalar/max(abs(notalar)); 
 plot(notalar) 
 sound(notalar,Fs); 
