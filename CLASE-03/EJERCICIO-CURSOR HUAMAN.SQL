CREATE OR REPLACE PROCEDURE SCOTT.PR115
IS
cursor c_emp is select * from SCOTT.emp;
r emp%rowtype;
begin
open c_emp;
loop
fetch c_emp into r;--TRAE LA PRIMERA FILA
exit when c_emp%notfound;
 dbms_output.put_line(r.empno||' - '||r.ename);
close c_emp;
end;
/
--ejecutar
exec SCOTT.PR115();