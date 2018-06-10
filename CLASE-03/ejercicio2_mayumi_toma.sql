create or replace procedure cursor1  
is
cursor c_emp is select * from emp; r emp%rowtype;
begin
  open c_emp; 
  loop
    fetch c_emp into r;
    exit when c_emp%notfound; 
    dbms_output.put_line(r.empno || ' - ' || r.ename);
  end loop;
  close c_emp;
end;
/

call cursor1();
