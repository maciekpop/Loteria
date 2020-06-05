create or replace PROCEDURE generuj_liczby(id_l in losowanie.id_losowania%type) IS 
    pl1 smallint;
    pl2 smallint; 
    pl3 smallint;
    pl4 smallint;
    pl5 smallint;
    pl6 smallint;
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
 
        UPDATE losowanie
        SET 
        L1 = pl1,
        L2 = pl2,
        L3 = pl3,
        L4 = pl4,
        L5 = pl5,
        L6 = pl6
        WHERE id_losowania = id_l;
        
        
    END;
