create or replace function SCOTT.fn_date_str
(FECHA date) return varchar2
is
begin
    return to_char(FECHA,'DD/MM/YYYY');
end;

SELECT SCOTT.fn_date_str(SYSDATE) FROM DUAL;

create or replace function SCOTT.fn_time_str
(FECHA date) return varchar
is
begin
    return to_char(FECHA,'HH24:MM:SS');
end;

SELECT SCOTT.fn_time_str(SYSDATE) FROM DUAL;


