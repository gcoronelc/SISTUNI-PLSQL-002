create or replace  procedure SCOTT.SP_LISTA_DEP_CURSOR
      IS
      CURSOR C_EMP IS SELECT  * FROM EMP;
      r EMP%rowtype;
BEGIN 
        OPEN C_EMP;
        LOOP 
                FETCH C_EMP INTO r;
                EXIT  WHEN  C_EMP%NOTFOUND;
                DBMS_OUTPUT.PUT_LINE(r.empno  ||  ' - ' || r.ename );
        END LOOP;
END;        
        
CALL SCOTT.SP_LISTA_DEP_CURSOR();