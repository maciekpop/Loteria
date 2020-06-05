create or replace procedure podzial_pieniedzy(id_w in wyniki.id_wynikow%type)
is 
l_tr integer;
l_cz integer;
l_pi integer;
l_sz integer;
kum integer;
begin
    select szostki, piatki, czworki, trojki
    into l_sz, l_pi, l_cz, l_tr
    from wyniki
    where id_wynikow = id_w;
 
    select kumulacja
    into kum
    from losowanie
    where id_losowania = id_w;
 
    if l_tr != 0 then
        update wyniki
        set za_1_3 = kum*0.34/l_tr
        where id_wynikow = id_w;
    else 
        update wyniki
        set za_1_3 = kum*0.34
        where id_wynikow = id_w;
    end if;
 
    if l_cz != 0 then
        update wyniki
        set za_1_4 = kum*0.15/l_cz
        where id_wynikow = id_w;
    else 
        update wyniki
        set za_1_4 = kum*0.15
        where id_wynikow = id_w;
    end if;
 
    if l_pi != 0 then
        update wyniki
        set za_1_5 = kum*0.08/l_pi
        where id_wynikow = id_w;
    else 
        update wyniki
        set za_1_5 = kum*0.08
        where id_wynikow = id_w;
    end if;
 
    if l_sz != 0 then
        update wyniki
        set za_1_6 = kum*0.43/l_sz
        where id_wynikow = id_w;
    else         
        update wyniki
        set za_1_6 = kum*0.43
        where id_wynikow = id_w;
    end if;
 
end;
