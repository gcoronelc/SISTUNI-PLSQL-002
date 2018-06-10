create or replace procedure pr117
is
  cursor c_dept is select * from dept; 
  emps number;
  planilla number; 
  cad varchar2(100);
begin
  for r in c_dept loop
    select count(*), sum(nvl(sal,0)) into emps, planilla 
      from emp where deptno = r.deptno;
    cad := r.deptno || ' - ' || emps || ' - ' || nvl(planilla,0); 
    dbms_output.put_line(cad);
  end loop; 
end;

call pr117(); 
