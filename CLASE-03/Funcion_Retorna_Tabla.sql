-- ============================================
-- Funcion que retorna una resultado
-- ============================================

Create Type mytype As Object(
       field1 Number,
       field2 Varchar2(50)
);

Create Type mytypelist As Table Of mytype;

Create Or Replace Function pipelineme
Return mytypelist Pipelined
Is
  v_mytype mytype;
Begin
     For r In (Select * From emp) Loop
         v_mytype := mytype( r.empno, r.ename );
         Pipe Row (v_mytype);
     End Loop;
     Return;
End pipelineme;

Create Or Replace Function pipelineme2
( coddept Number )
Return mytypelist Pipelined
Is
  v_mytype mytype;
Begin
     For r In (Select * From emp Where deptno = coddept) Loop
         v_mytype := mytype( r.empno, r.ename );
         Pipe Row (v_mytype);
     End Loop;
     Return;
End pipelineme2;

Select * From Table(pipelineme);

Select * From Table(pipelineme2(30));

