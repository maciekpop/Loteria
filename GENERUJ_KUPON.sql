create or replace PROCEDURE generuj_kupon(id_t in transakcja.id_transakcji%type) IS 
    pl1 smallint;
    pl2 smallint; 
    pl3 smallint;
    pl4 smallint;
    pl5 smallint;
    pl6 smallint;
    id_g gracz.id_gracza%type;
    id_l losowanie.id_losowania%type;
    id_k kupon.id_kuponu%type;
    BEGIN
 
        pl1 := ROUND(DBMS_RANDOM.VALUE(1,49));
 
        pl2 := ROUND(DBMS_RANDOM.VALUE(1,49));
        loop
            exit when pl2 != pl1;
            pl2 := ROUND(DBMS_RANDOM.VALUE(1,49));
        end loop;
 
        pl3 := ROUND(DBMS_RANDOM.VALUE(1,49));
        loop
            exit when pl3 != pl1 and pl3 != pl2;
            pl3 := ROUND(DBMS_RANDOM.VALUE(1,49));
        end loop;
 
        pl4 := ROUND(DBMS_RANDOM.VALUE(1,49));
        loop
            exit when pl4 != pl1 and pl4 != pl2 and pl4 != pl3;
            pl4 := ROUND(DBMS_RANDOM.VALUE(1,49));
        end loop;
 
        pl5 := ROUND(DBMS_RANDOM.VALUE(1,49));
        loop
            exit when pl5 != pl1 and pl4 != pl2 and pl5 != pl3 and pl5 != pl4;
            pl5 := ROUND(DBMS_RANDOM.VALUE(1,49));
        end loop;
 
        pl6 := ROUND(DBMS_RANDOM.VALUE(1,49));
        loop
            exit when pl6 != pl1 and pl6 != pl2 and pl6 != pl3 and pl6 != pl4 and pl6 != pl5;
            pl6 := ROUND(DBMS_RANDOM.VALUE(1,49));
        end loop;
 
 
        select id_gracza, id_losowania
        into id_g, id_l
        from transakcja
        where id_transakcji = id_t;
 
        select id_kuponu.nextval
        into id_k
        from dual;
 
        insert into kupon(id_kuponu, id_gracza, id_losowania, id_transakcji, K1, K2, K3, K4, K5, K6) values (id_k, id_g, id_l, id_t, pl1, pl2, pl3, pl4, pl5, pl6);
        
 
        dodaj_kupon_do_transakcji(id_t);
        
    END;
