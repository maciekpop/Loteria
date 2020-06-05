create or replace procedure zatwierdz_transakcje(id_tr in transakcja.id_transakcji%type)
is
dlos losowanie.data_losowania%type;
dtran transakcja.data_transakcji%type;
id_los transakcja.id_losowania%type;
nal transakcja.naleznosc%type;
begin
    
    select id_losowania
    into id_los
    from transakcja
    where id_transakcji = id_tr;
    
    select data_losowania
    into dlos
    from losowanie
    where id_losowania = id_los;
 
    select naleznosc
    into nal
    from transakcja
    where id_transakcji = id_tr;
 
    dtran := current_timestamp;
    if dtran < dlos then
        update transakcja
        set data_transakcji = dtran
        where id_transakcji = id_tr;
        update wyniki
        set pieniadze_z_kuponow = pieniadze_z_kuponow + nal
        where id_wynikow = id_los;
        update gracz
        set saldo = saldo - nal
        where id_gracza = (select id_gracza from transakcja where id_transakcji = id_tr);
    else
        delete from kupon
        where id_transakcji = id_tr;
        delete from transakcja
        where id_transakcji = id_tr;
 
    end if;
end;
