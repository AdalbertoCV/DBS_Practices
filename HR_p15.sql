create or replace view DEPT50 as select employee_id "EMPNO", last_name "EMPLOYEE", department_id "DEPTNO"
from employees where department_id = 50 with read only;
select * from DEPT50;