CREATE OR REPLACE TRIGGER tr_test_emp
AFTER INSERT OR DELETE OR UPDATE ON emp
BEGIN 
  if inserting then
  dbms_output.put_line('Nuevo empleado se ha insertado');
  elsif updating then
  dbms_output.put_line('Nuevo empleado se ha modificado');
  elsif deleting then
  dbms_output.put_line('Nuevo empleado se ha eliminado');
  end if;
  END tr_test_emp;