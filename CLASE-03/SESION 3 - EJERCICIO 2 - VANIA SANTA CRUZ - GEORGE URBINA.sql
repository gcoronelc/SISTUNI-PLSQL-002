
CREATE OR REPLACE PROCEDURE SP_GET_EMPLEADO
(P_CURSOR1 OUT NOCOPY SYS_REFCURSOR)
IS
BEGIN
    OPEN P_CURSOR1 FOR
    SELECT E.CHR_EMPLCODIGO,
    E.VCH_EMPLPATERNO || ' ' || E.VCH_EMPLMATERNO || ', ' || E.VCH_EMPLNOMBRE AS NOMBRE,    
    SUM(CASE WHEN C.CHR_MONECODIGO = '01' THEN 1 ELSE 0 END) AS SOLES,
    SUM(CASE WHEN C.CHR_MONECODIGO = '02' THEN 1 ELSE 0 END) AS DOLARES
    FROM EMPLEADO E
    JOIN MOVIMIENTO M ON E.CHR_EMPLCODIGO= M.CHR_EMPLCODIGO
    JOIN CUENTA C ON C.CHR_EMPLCREACUENTA= E.CHR_EMPLCODIGO
    GROUP BY E.CHR_EMPLCODIGO, E.VCH_EMPLPATERNO || ' ' || E.VCH_EMPLMATERNO || ', ' || E.VCH_EMPLNOMBRE
    ORDER BY 1;
END;

SET SERVEROUTPUT ON

DECLARE 
    V_CURSOR1 SYS_REFCURSOR;    
    V_SUC_CODIGO1 EMPLEADO.CHR_EMPLCODIGO%TYPE;
    V_SUC_NOMBRE1 varchar2(100);
    V_SOLES1 MOVIMIENTO.DEC_MOVIIMPORTE%TYPE;
    V_DOLARES1 MOVIMIENTO.DEC_MOVIIMPORTE%TYPE;
BEGIN
    SP_GET_EMPLEADO(V_CURSOR1);
    
    LOOP
        FETCH V_CURSOR1 INTO V_SUC_CODIGO1, V_SUC_NOMBRE1,  V_SOLES1,  V_DOLARES1;
        EXIT WHEN V_CURSOR1%NOTFOUND;  
            DBMS_OUTPUT.PUT_LINE(V_SUC_CODIGO1);        
    END LOOP;       
END;
