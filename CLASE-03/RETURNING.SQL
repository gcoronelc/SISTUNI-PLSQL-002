create table demo(
    id number(8),
    dato varchar2(50)
);

create sequence sq_dato;

declare
    v_id number(8);
begin
    insert into demo(id, dato) 
    values( sq_dato.nextval, 'PERU CAMPEON')
    RETURNING id into v_id;
    dbms_output.put_line('ID: ' || v_id);
end;




