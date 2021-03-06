CREATE OR REPLACE PROCEDURE SP_GET_SUCURSAL
(P_CURSOR OUT NOCOPY SYS_REFCURSOR)
IS
BEGIN
    OPEN P_CURSOR FOR
    SELECT 
        S.CHR_SUCUCODIGO,  
        S.VCH_SUCUNOMBRE, 
        SUM(CASE WHEN M.CHR_MONECODIGO = '01' THEN C.DEC_CUENSALDO ELSE 0 END) AS SOLES,
        SUM(CASE WHEN M.CHR_MONECODIGO = '02' THEN C.DEC_CUENSALDO ELSE 0 END) AS DOLARES
    FROM SUCURSAL S
    JOIN CUENTA C ON S.CHR_SUCUCODIGO = C.CHR_SUCUCODIGO
    JOIN MONEDA M ON C.CHR_MONECODIGO = M.CHR_MONECODIGO
    GROUP BY S.CHR_SUCUCODIGO, S.VCH_SUCUNOMBRE
    ORDER BY 1;
END;

SELECT * FROM SUCURSAL;

SET SERVEROUTPUT ON


DECLARE 
    V_CURSOR SYS_REFCURSOR;    
    V_SUC_CODIGO SUCURSAL.CHR_SUCUCODIGO%TYPE;
    V_SUC_NOMBRE SUCURSAL.VCH_SUCUNOMBRE%TYPE;
    V_SOLES CUENTA.DEC_CUENSALDO%TYPE;
    V_DOLARES CUENTA.DEC_CUENSALDO%TYPE;
BEGIN
    SP_GET_SUCURSAL(V_CURSOR);
    
    LOOP
        FETCH V_CURSOR INTO V_SUC_CODIGO, V_SUC_NOMBRE,V_SOLES, V_DOLARES;
        EXIT WHEN V_CURSOR%NOTFOUND;        
            DBMS_OUTPUT.PUT_LINE(V_SUC_CODIGO || ' - ' || V_SUC_NOMBRE || ' - ' || V_SOLES || ' - ' || V_DOLARES);        
    END LOOP;    
END;

