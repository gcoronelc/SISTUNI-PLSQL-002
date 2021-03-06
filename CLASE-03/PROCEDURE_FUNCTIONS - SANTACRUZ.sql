/*CREATE OR REPLACE FUNCTION '[ESQUEMA][NOMBRE FUNCION][PARAMETROS DE ENTRADA]'
RETURN [TIPO DE DATO DE RETORNO]
IS
[DECLARACION DE VARIABLES DE LA FUNCION]
BEGIN
[DEFEINICION DE LA FUNCION]
END;
*/

CREATE OR REPLACE FUNCTION VENTAS.FN_VAL_EMP(
    P_ID_EMP VENTAS.EMPLEADO.IDEMP%TYPE
)
RETURN NUMBER
IS
    V_CONT NUMBER;
    
BEGIN 
	
   SELECT COUNT(*) INTO V_CONT FROM EMPLEADO  WHERE IDEMP=P_ID_EMP;     
    RETURN V_CONT;            
END;

   SELECT FN_VAL_EMP(1002) FROM DUAL;

	
 
/**************************************************************************
Ejercicio 2.1

FN_DATE_STR

Funci�n para convertir una fecha a
formato DD/MM/YYYY

 TO_CHAR(tsltz_col, 'DD-MON-YYYY HH24:MI:SSxFF')
*/

SELECT TO_CHAR(SYSDATE-100,'DD/MM/YYYY') FROM DUAL;

CREATE OR REPLACE FUNCTION FN_DATE_STR (P_FECHA DATE)

RETURN VARCHAR2

IS

V_FECHA VARCHAR2(12);

BEGIN

SELECT TO_CHAR(P_FECHA,'DD/MM/YYYY') INTO V_FECHA FROM DUAL;

RETURN V_FECHA;
END;

 SELECT FN_DATE_STR(SYSDATE) FROM DUAL;

/**************************************************************************
Ejercicio 2.2

FN_TIME_STR

Funci�n para convertir una fecha a
formato HH:MM:SS 
*/


SELECT current_timestamp FROM DUAL;

select to_char(sysdate, 'HH:MI:SS') from dual; 
CREATE OR REPLACE FUNCTION FN_TIME_STR (P_FECHA DATE)

RETURN VARCHAR2

IS

V_FECHA VARCHAR2(12);

BEGIN

SELECT TO_CHAR(P_FECHA,' HH:MI:SS') INTO V_FECHA FROM DUAL;

RETURN V_FECHA;
END;
 SELECT FN_TIME_STR(SYSDATE) FROM DUAL;



Ejercicio 2.3
====================

Desarrollar un procedimiento que permita
registrar un nuevo empleado en esquema VENTAS.

CREATE OR REPLACE PROCEDURE PR_INSERT_EMPLEADO(
    P_IDDEMP EMPLEADO.IDEMP%TYPE,
    P_NOMBRE EMPLEADO.NOMBRE%TYPE,
    P_APELLIDO EMPLEADO.APELLIDO%TYPE,
    P_EMAIL EMPLEADO.EMAIL%TYPE,
    P_TELEFONO EMPLEADO.TELEFONO%TYPE)
IS
BEGIN

INSERT INTO EMPLEADO VALUES(P_IDDEMP,P_NOMBRE,P_APELLIDO,P_EMAIL,P_TELEFONO);
DBMS_OUTPUT.PUT_LINE('INSERCION CORRECTA: ' || P_NOMBRE  );
END;

PR_INSERT_EMPLEADO(1009,'JUAN','CARBAJAL','CJUAM@GMAIL.COM','97845621');

DECLARE
   
BEGIN
  PR_INSERT_EMPLEADO(1011,'JUAN','CARBAJAL','CJUAM@GMAIL.COM','97845621');
  DBMS_OUTPUT.PUT_LINE('EMPS:' );
 
END;
SELECT * FROM EMPLEADO



Ejercicio 2.4
====================

Desarrollar un procedimiento que permita
registrar una nueva venta en esquema VENTAS.

CREATE OR REPLACE PROCEDURE PR_INSERT_VENTA(
    P_IDVENTA VENTA.IDVENTA%TYPE,
    P_CLIENTE VENTA.CLIENTE%TYPE,
    P_IDEMP EMPLEADO.IDEMP%TYPE,
    P_FECHA VENTA.FECHA%TYPE,
    P_IMPORTE VENTA.IMPORTE%TYPE)
IS
BEGIN

INSERT INTO VENTA VALUES(P_IDVENTA,P_CLIENTE,P_IDEMP,P_FECHA,P_IMPORTE);
--SELECT*FROM VENTA WHERE IDVENTA=P_IDVENTA;
END;


DECLARE
   
BEGIN
  PR_INSERT_VENTA(2001,'GIAN LUCA',1001,SYSDATE,100);
  DBMS_OUTPUT.PUT_LINE('EMPS:' );
 
END;

SELECT*FROM VENTA;