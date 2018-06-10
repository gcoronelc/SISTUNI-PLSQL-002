create or replace procedure scott.PR_001
is
  cursor c_demo is select * from dept;
  r dept%rowtype;
begin
  open c_demo;
  fetch c_demo into r; -- trae la primera fila.
  close c_demo;
  dbms_output.put_line('deptno: ' || r.deptno);
  dbms_output.put_line('dname: ' || r.dname);
  dbms_output.put_line('loc: ' || r.loc);
end;

call scott.PR_001()

