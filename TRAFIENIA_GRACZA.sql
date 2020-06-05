create or replace function trafienia_gracza(kup in kupon.id_kuponu%type)
return smallint
is
    k1 smallint; l1 smallint;
    k2 smallint; l2 smallint; 
    k3 smallint; l3 smallint;
    k4 smallint; l4 smallint;
    k5 smallint; l5 smallint;
    k6 smallint; l6 smallint;
    traf smallint;
    los losowanie.id_losowania%type;
begin
    
    traf := 0;
    
    select id_losowania
    into los
    from kupon
    where id_kuponu = kup;
    
    select K1, K2, K3, K4, K5, K6
    into k1, k2, k3, k4, k5, k6
    from kupon
    where id_kuponu = kup;
 
    select L1, L2, L3, L4, L5, L6
    into l1, l2, l3, l4, l5, l6
    from losowanie
    where id_losowania = los;
 
    if k1 = l1 or k1 = l2 or k1 = l3 or k1 = l4 or k1 = l5 or k1 = l6 then
        traf := traf + 1;
    end if;
    if k2 = l1 or k2 = l2 or k2 = l3 or k2 = l4 or k2 = l5 or k2 = l6 then
        traf := traf + 1;
    end if;
    if k3 = l1 or k3 = l2 or k3 = l3 or k3 = l4 or k3 = l5 or k3 = l6 then
        traf := traf + 1;
    end if;        
    if k4 = l1 or k4 = l2 or k4 = l3 or k4 = l4 or k4 = l5 or k4 = l6 then
        traf := traf + 1;
    end if;        
    if k5 = l1 or k5 = l2 or k5 = l3 or k5 = l4 or k5 = l5 or k5 = l6 then
        traf := traf + 1;
    end if;        
    if k6 = l1 or k6 = l2 or k6 = l3 or k6 = l4 or k6 = l5 or k6 = l6 then
        traf := traf + 1;
    end if;
    
    return traf;
 
end;
