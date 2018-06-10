
-- Procedimiento que retorna un cursor

create or replace procedure sp_get_emps
( p_deptno in EMP.DEPTNO%type, p_cursor out nocopy SYS_REFCURSOR)
is
begin
    OPEN p_cursor FOR 
        SELECT * FROM emp 
        WHERE DEPTNO = p_deptno;
end;

declare
    v_cursor SYS_REFCURSOR;
    v_deptno number(5) := 10;
    v_rec  scott.EMP%rowtype;
begin
    sp_get_emps( v_deptno, v_cursor );
    loop
        fetch v_cursor into v_rec;
        exit when v_cursor%notfound;
        DBMS_OUTPUT.PUT_LINE( v_rec.ename || ' - ' || v_rec.sal );
    end loop;
    close v_cursor;
end;


select * from scott.DEPT;




