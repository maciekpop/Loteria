declare
id_t transakcja.id_transakcji%type;
ex exception;
begin
  select id_transakcji into id_t from transakcja
  where data_transakcji is null and id_gracza = (select id_gracza from gracz where upper(username)=v('APP_USER'));
  anuluj_transakcje(id_t);

  exception
    when no_data_found then raise ex;
end;