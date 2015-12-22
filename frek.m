%%default olarak oktav(o) parametresini 4 olarak ayarladık. eger bir deger yollanmaz ise oktav 4 kabul edilir
function[frek] = frek(n,o=4)
    
    %%notalar.txt dosyasında da açıkladığımız gibi notalar ve frekanslarındaki ilişki tamsayı ast veya üstü katıdır. bu yüzden "do" 
    %%sesi baslangıç olarak alınır 
    baseDo = 16.35;
    
    %%Tüm notalar için aynı işlemi tekrarlamamak için istenilen oktavdaki Do notasının değeri
    doOktav = baseDo*(2^o);
  

    oranDo = 1;
    oranRe = 1.122;
    oranMi = 1.259;
    oranFa = 1.333;
    oranSol = 1.5;
    oranLa = 1.682;
    oranSi = 1.888;
    
    %%performans açısından switch case karar operatörü kullanıldı. hem kodun okunması hemde daha performanslı olduğu için
    switch nota
        case "Do"
            frek = doOktav*oranDo;    
        break
        
        case "Re"
            frek = doOktav*oranRe;
        break
        
        case "Mi"
            frek = doOktav*oranMi;
        break
        
        case "Fa"
            frek = doOktav*oranFa;
        break
        
        case "Sol"
            frek = doOktav*oranSol;
        break
        
        case "La"
            frek = doOktav*oranLa;
        break
        
        case "Si"
            frek = doOktav*oranSi;
        break
        
        otherwise
            disp("hatalı nota.")
        break
    end
