-- BLOQUE ANONIMO

SET SERVEROUTPUT ON

DECLARE
  SFECHA VARCHAR2(40);
BEGIN
  SFECHA := TO_CHAR( SYSDATE, 'dd/mm/yyyy hh24:mm:ss' );
  DBMS_OUTPUT.PUT_LINE( 'HOY ES: ' || SFECHA );
END;
/


-- FUNCION

CREATE OR REPLACE FUNCTION SCOTT.FN_SUMA( A NUMBER, B NUMBER )
RETURN NUMBER
IS
  C NUMBER;
BEGIN
  C := A + B;
  RETURN C;
END;
/


SELECT SCOTT.FN_SUMA(5,8) FROM DUAL;


-- PROCEDIMIENTO

CREATE OR REPLACE PROCEDURE SCOTT.PR_SUMA( A NUMBER, B NUMBER )
IS
  C NUMBER;
BEGIN
  C := A + B;
  DBMS_OUTPUT.PUT_LINE( 'A: ' || A );
  DBMS_OUTPUT.PUT_LINE( 'B: ' || B );
  DBMS_OUTPUT.PUT_LINE( 'C: ' || C );
END;
/


CALL SCOTT.PR_SUMA( 6, 5 );


-- PROCEDIMIENTO - VERSION 2

CREATE OR REPLACE PROCEDURE SCOTT.PR_SUMA2
( A IN NUMBER, B IN NUMBER, C OUT NUMBER )
IS
BEGIN
  C := A + B;
END;
/

DECLARE
  A NUMBER := 8;
  B NUMBER := 12;
  C NUMBER;
BEGIN
  SCOTT.PR_SUMA2( A, B, C );
  DBMS_OUTPUT.PUT_LINE( 'A: ' || A );
  DBMS_OUTPUT.PUT_LINE( 'B: ' || B );
  DBMS_OUTPUT.PUT_LINE( 'C: ' || C );
END;
/


