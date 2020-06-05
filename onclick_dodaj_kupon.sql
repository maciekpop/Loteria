declare
id_g gracz.id_gracza%type;
id_l losowanie.id_losowania%type;
id_t transakcja.id_transakcji%type;
id_k kupon.id_kuponu%type;
c smallint; 
c1 smallint := 5;
proc_str varchar2(200 char);
e_error exception;
begin
 select id_gracza into id_g from gracz where upper(username) = v('APP_USER');
 select id_losowania into id_l from losowanie where czy_otwarte = 'tak';
 select count(*) into c from transakcja where data_transakcji is null and id_gracza = id_g;

 if c = 0 then
    if :ku1 != :ku2 and :ku1 != :ku3 and :ku1 != :ku4 and :ku1 != :ku5 and :ku1 != :ku6 then
        c1 := c1 - 1;
    end if;
    if :ku2 != :ku3 and :ku2 != :ku4 and :ku2 != :ku5 and :ku2 != :ku6 then
        c1 := c1 - 1;
    end if;
    if :ku3 != :ku4 and :ku3 != :ku5 and :ku3 != :ku6 then
        c1 := c1 - 1;
    end if;
    if :ku4 != :ku5 and :ku4 != :ku6 then
        c1 := c1 - 1;
    end if;
    if :ku5 != :ku6 then
        c1 := c1 - 1;
    end if;

    if c1 = 0 then
        
        proc_str := 'begin generuj_transakcje(:id_g, :id_l); end;';
        execute immediate proc_str using id_g, id_l;
        select id_transakcji into id_t from transakcja where data_transakcji is null and id_gracza = id_g;
        proc_str := 'begin dodaj_kupon_do_transakcji(:id_t); end;';
        execute immediate proc_str using id_t;
        select id_kuponu.nextval into id_k from dual;
        insert into kupon(id_kuponu, id_gracza, id_losowania, id_transakcji, K1, K2, K3, K4, K5, K6) 
        values (id_k, id_g, id_l, id_t, :ku1, :ku2, :ku3, :ku4, :ku5, :ku6);
        
    else
       raise e_error;
    end if;

 else
  
    if :ku1 != :ku2 and :ku1 != :ku3 and :ku1 != :ku4 and :ku1 != :ku5 and :ku1 != :ku6 then
        c1 := c1 - 1;
    end if;
    if :ku2 != :ku3 and :ku2 != :ku4 and :ku2 != :ku5 and :ku2 != :ku6 then
        c1 := c1 - 1;
    end if;
    if :ku3 != :ku4 and :ku3 != :ku5 and :ku3 != :ku6 then
        c1 := c1 - 1;
    end if;
    if :ku4 != :ku5 and :ku4 != :ku6 then
        c1 := c1 - 1;
    end if;
    if :ku5 != :ku6 then
        c1 := c1 - 1;
    end if;

    if c1 = 0 then
        select id_transakcji into id_t from transakcja where data_transakcji is null and id_gracza = id_g;
        proc_str := 'begin dodaj_kupon_do_transakcji(:id_t); end;';
        execute immediate proc_str using id_t;
        select id_kuponu.nextval into id_k from dual;
        insert into kupon(id_kuponu, id_gracza, id_losowania, id_transakcji, K1, K2, K3, K4, K5, K6) 
        values (id_kuponu.nextval, id_g, id_l, id_t, :ku1, :ku2, :ku3, :ku4, :ku5, :ku6);

    else
        raise e_error;
    end if;

end if;

end;