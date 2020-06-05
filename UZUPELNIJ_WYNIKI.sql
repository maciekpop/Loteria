create or replace procedure uzupelnij_wyniki(id_l in number, il_traf in smallint)
is
begin
 
    if il_traf = 3 then 
        update wyniki
        set trojki = trojki + 1
        where id_wynikow = id_l;
    end if;
 
    if il_traf = 4 then 
        update wyniki
        set czworki = czworki + 1
        where id_wynikow = id_l;
    end if;
 
    if il_traf = 5 then 
        update wyniki
        set piatki = piatki + 1
        where id_wynikow = id_l;
    end if;
 
    if il_traf = 6 then 
        update wyniki
        set szostki = szostki + 1
        where id_wynikow = id_l;
    end if;
end;
