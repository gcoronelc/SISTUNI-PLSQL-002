CREATE OR REPLACE FUNCTION RECURSOS.FN_VAL_EMP(
    P_EMP_ID RECURSOS.EMPLEADO.IDEMPLEADO%TYPE
)
RETURN NUMBER
IS
    V_CONT NUMBER;
BEGIN 
	SELECT COUNT(1) INTO V_CONT
	FROM EMPLEADO WHERE IDEMPLEADO = P_EMP_ID;
	RETURN V_CONT;
END;

SELECT RECURSOS.FN_VAL_EMP( 'E0002' ) FROM DUAL;

SELECT * FROM RECURSOS.EMPLEADO;


CREATE OR REPLACE PROCEDURE RECURSOS.PR_DATOS_DPTO(
    P_IDDEPARTAMENTO RECURSOS.EMPLEADO.IDDEPARTAMENTO%TYPE,
    P_EMPS OUT NUMBER,
    P_PLANILLA OUT NUMBER)
IS
BEGIN
    SELECT COUNT(*), SUM(SUELDO + NVL(COMISION,0))
    INTO P_EMPS, P_PLANILLA
    FROM EMPLEADO
    WHERE IDDEPARTAMENTO = P_IDDEPARTAMENTO;
END;


DECLARE
    V_EMPS NUMBER(5);
    V_PLANILLA NUMBER(10,2);
BEGIN
  RECURSOS.PR_DATOS_DPTO( 100, V_EMPS, V_PLANILLA );
  DBMS_OUTPUT.PUT_LINE('EMPS: ' || V_EMPS);
  DBMS_OUTPUT.PUT_LINE('PLANILLA: ' || V_PLANILLA);
END;
