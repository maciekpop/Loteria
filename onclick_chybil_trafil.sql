declare
id_g gracz.id_gracza%type;
id_l losowanie.id_losowania%type;
id_t transakcja.id_transakcji%type;
c smallint; 
proc_str varchar2(200 char);
ex exception;
begin
 select id_gracza into id_g from gracz where upper(username) = v('APP_USER');
 select id_losowania into id_l from losowanie where czy_otwarte = 'tak';
 select count(*) into c from transakcja where data_transakcji is null and id_gracza = id_g;

 if c = 0 then     
   proc_str := 'begin generuj_transakcje(:id_g, :id_l); end;';
   execute immediate proc_str using id_g, id_l;
   select id_transakcji into id_t from transakcja where data_transakcji is null and id_gracza = id_g;
   generuj_kupon(id_t);

 else
   select id_transakcji into id_t from transakcja where data_transakcji is null and id_gracza = id_g;
   generuj_kupon(id_t);

end if;

exception
  when no_data_found then raise ex;
end;