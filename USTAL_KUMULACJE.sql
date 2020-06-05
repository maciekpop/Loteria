create or replace function ustal_kumulacje(id_w in wyniki.id_wynikow%type) return losowanie.kumulacja%type
is
suma losowanie.kumulacja%type;
kum losowanie.kumulacja%type;
tro wyniki.trojki%type;
czw wyniki.czworki%type;
pia wyniki.piatki%type;
szo wyniki.szostki%type;
za_3 wyniki.za_1_3%type;
za_4 wyniki.za_1_4%type;
za_5 wyniki.za_1_5%type;
za_6 wyniki.za_1_6%type;
pzk wyniki.pieniadze_z_kuponow%type;
begin
 
    select kumulacja
    into kum
    from losowanie
    where id_losowania = id_w;
    
    select trojki, czworki, piatki, szostki, za_1_3, za_1_4, za_1_5, za_1_6, pieniadze_z_kuponow
    into tro, czw, pia, szo, za_3, za_4, za_5, za_6, pzk
    from wyniki
    where id_wynikow = id_w;
 
    suma := 0;
    suma := suma + pzk + kum - tro*za_3 - czw*za_4 - pia*za_5 - szo*za_6;
    
    return suma;
end;
