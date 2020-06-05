create or replace procedure przydziel_graczowi_nagrode(id_k in kupon.id_kuponu%type)
is
traf smallint;  
id_l losowanie.id_losowania%type;
id_g gracz.id_gracza%type;
begin
    
    select id_losowania
    into id_l
    from kupon
    where id_kuponu = id_k;
 
    select id_gracza
    into id_g
    from kupon
    where id_kuponu = id_k;
    
    select trafienia_gracza(id_k)
    into traf
    from dual;
    if traf = 0 or traf = 1 or traf = 2 then
        update kupon
        set wygrana = 0
        where id_kuponu = id_k;
    end if;
 
    if traf = 3 then
        update kupon
        set wygrana = (select za_1_3 from wyniki where id_wynikow = id_l)
        where id_kuponu = id_k;
        update gracz
        set saldo = saldo + (select za_1_3 from wyniki where id_wynikow = id_l)
        where id_gracza = id_g;
    end if;
 
    if traf = 4 then
        update kupon
        set wygrana = (select za_1_4 from wyniki where id_wynikow = id_l)
        where id_kuponu = id_k;
        update gracz
        set saldo = saldo + (select za_1_4 from wyniki where id_wynikow = id_l)
        where id_gracza = id_g;
    end if;
 
    if traf = 5 then
        update kupon
        set wygrana = (select za_1_5 from wyniki where id_wynikow = id_l)
        where id_kuponu = id_k;
        update gracz
        set saldo = saldo + (select za_1_5 from wyniki where id_wynikow = id_l)
        where id_gracza = id_g;
    end if;
 
    if traf = 6 then
        update kupon
        set wygrana = (select za_1_6 from wyniki where id_wynikow = id_l)
        where id_kuponu = id_k;
        update gracz
        set saldo = saldo + (select za_1_6 from wyniki where id_wynikow = id_l)
        where id_gracza = id_g;
    end if;
 
end;
