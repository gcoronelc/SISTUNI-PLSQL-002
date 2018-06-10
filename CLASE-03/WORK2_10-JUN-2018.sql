
create public database link lnk_robinson
connect to scott identified by tiger
using 'robinson';

select * from emp@lnk_robinson;



