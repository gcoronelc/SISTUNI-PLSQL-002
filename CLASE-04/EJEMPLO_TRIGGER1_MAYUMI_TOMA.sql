CREATE OR REPLACE TRIGGER scott.tr_test_emp 
AFTER INSERT OR DELETE OR UPDATE ON emp 
for each row
BEGIN
  if inserting then
    dbms_output.put_line( 'nuevo empleado se ha insertado' );
  Elsif updating then
    dbms_output.put_line( 'un empleado se ha modificado' );
  Elsif deleting then
    dbms_output.put_line( 'un empleado se ha eliminado' ); 
  end if;
END tr_test_emp;
