create or replace procedure scott.pr_cursor
is
cursor c_demo is select * from dept;
r dept%rowtype;
begin
open c_demo;
fetch c_demo into r;
close c_demo;
dbms_output.put_line('deptno: ' || r.deptno);
dbms_output.put_line('deptno: ' || r.dname);
dbms_output.put_line('deptno: ' || r.loc);
end;

declare
begin
 scott.pr_cursor;
end;