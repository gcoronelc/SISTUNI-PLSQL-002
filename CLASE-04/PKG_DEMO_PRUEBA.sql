
SET SERVEROUT on 

-- Prueba 01

declare
    n1 number;
    n2 number;
    suma number;
begin
    -- datos
    n1 := 14;
    n2 := 12;
    -- Proceso
    suma := PKG_DEMO.SUMA(n1, n2);
    -- Reporte
    dbms_output.put_line( 'Número 1: ' || n1 );
    dbms_output.put_line( 'Número 2: ' || n2 );
    dbms_output.put_line( 'Suma: ' || suma );
end;


