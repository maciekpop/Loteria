create or replace procedure przeprowadz_losowanie(id_l in losowanie.id_losowania%type) is
dlos losowanie.data_losowania%type;
lkup integer;
cursor kupon_cur is select * from kupon where id_losowania = id_l;
this kupon%rowtype;
traf smallint;
id_k kupon.id_kuponu%type;
begin
update losowanie
set czy_otwarte = 'nie'
where id_losowania = id_l;
open kupon_cur;
 
execute immediate 'begin generuj_liczby(:id_l); end;' using id_l;
loop
    fetch kupon_cur into this;
    traf := trafienia_gracza(this.id_kuponu);
    execute immediate 'begin uzupelnij_wyniki(:id_l, :traf); end;' using id_l, traf;
    exit when kupon_cur%notfound;
end loop;
close kupon_cur;
execute immediate 'begin podzial_pieniedzy(:id_l); end;' using id_l;
open kupon_cur;
loop
    fetch kupon_cur into this;
    id_k := this.id_kuponu;
    execute immediate 'begin przydziel_graczowi_nagrode(:id_k); end;' using id_k;
    exit when kupon_cur%notfound;
end loop;
close kupon_cur;
select data_losowania
into dlos
from losowanie
where id_losowania = id_l;
stworz_losowanie(dlos + 1, ustal_kumulacje(id_l));
end;
