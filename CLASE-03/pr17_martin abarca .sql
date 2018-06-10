create or replace procedure scott.pr_cursor2
is
cursor c_demo is select * from dept;
emps number;
planilla number;
cad varchar2(100);
begin

for r in c_demo 
loop
 select count(*),sum(nvl(sal,0)) into emps, planilla
 from emp where deptno=r.deptno;
 cad:= r.deptno || '-' || emps || '-' || nvl(planilla,0);
 dbms_output.PUT_LINE(cad);
end loop;
end;
call scott.pr_cursor2();