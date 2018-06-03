--CREAR UN PROCEDIMIENTO PARA CONSULTAR LOS DATOS DE UN DEPARTAMENTO
CREATE OR REPLACE PROCEDURE SCOTT.PRCONSU
(COD DEPT.DEPTNO%TYPE)
IS
    R DEPT%ROWTYPE;
BEGIN
     SELECT * INTO R
     FROM DEPT
     WHERE DEPTNO = COD;
     dbms_output.put_line('Codigo: '||r.deptno);
     dbms_output.put_line('Nombre: '||r.dname);
     dbms_output.put_line('Localización: '||r.loc);
END;
/
--COMPROBANDO EL PROCEDURE
CALL SCOTT.PRCONSU(10);


