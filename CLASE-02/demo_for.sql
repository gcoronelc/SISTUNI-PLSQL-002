
create or replace procedure scott.demo_for_01
is
begin
  for n in 1 .. 10 loop
    dbms_output.put_line( 'n = ' || n );
  end loop;
end;

call demo_for_01();

create or replace procedure scott.demo_for_02
is
begin
  for n in reverse 1 .. 10 loop
    dbms_output.put_line( 'n = ' || n );
  end loop;
end;

call demo_for_02();

create or replace procedure scott.demo_for_03
is
begin
  for rec in (select * from emp) loop
    dbms_output.put_line( rec.empno || ' - ' || rec.ename );
  end loop;
end;

call demo_for_03();


create or replace procedure scott.demo_for_04
is
  n number := 1000;
begin
  for n in reverse 1 .. 10 loop
    dbms_output.put_line( 'n = ' || n );
  end loop;
  dbms_output.put_line( 'n = ' || n );
end;

call demo_for_04();



