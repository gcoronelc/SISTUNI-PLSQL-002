CREATE OR REPLACE PROCEDURE SCOTT.FIND_EMP(COD SCOTT.EMP.EMPNO%TYPE)
IS
SALARIO SCOTT.EMP.SAL%TYPE;
BEGIN
--2 EXCEPCIONES:
--NO_DATA_FOUND
-- TOO_MANY_ROWS
SELECT SAL INTO SALARIO
FROM SCOTT.EMP
WHERE SCOTT.EMP.EMPNO=COD;

DBMS_OUTPUT.PUT_LINE('SALARIO: '|| SALARIO);
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('C�DIGO NO EXISTE');
END;



CALL SCOTT.FIND_EMP(46464);

