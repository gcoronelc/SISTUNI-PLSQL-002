--CREANDO TABLA PARA REGISTROS
Create table SCOTT.Sal_History(
       EmpNO number(4) not null,
       SalOld Number(7,2) null,
       SalNew Number(7,2) null,
       StartDate Date not null,
       SetUser Varchar2(30) not null
);


CREATE OR REPLACE TRIGGER SCOTT.tr_UpdateEmpSal
       AFTER  INSERT OR UPDATE ON EMP
       FOR EACH ROW
         BEGIN 
           INSERT INTO Sal_History(EmpNo, SalOld,SalNew,StartDate,SetUser)
             Values( :New.EmpNo, :Old.Sal,:New.Sal,sysdate,USER);
End tr_UpdateEmpSal;  