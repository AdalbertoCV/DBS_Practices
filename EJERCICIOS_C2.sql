-- Ejercicios Cap 2
-- Adalberto Cerrillo Vazquez

--A)

--1. Elaborar una sentencia SELECT que muestre los datos generales de los empleados que laboran en el puesto ‘SA_REP’.
select * from employees where job_id = 'SA_REP';
--2. Elaborar una sentencia SELECT que muestre los datos generales de los empleados que fueron contratados el 24 de marzo de 2005.
select * from employees where hire_date= '24/03/05';
--3. ¿Cuál es el formato de fecha por default?
select sysdate from dual;
--4. Elaborar una sentencia SELECT que muestre los datos generales de los empleados que fueron contratados antes del 19 de enero del 2004.
select * from employees where hire_date < '19/01/04';
--5. Elaborar una sentencia SELECT que muestre los datos generales de los empleados que ganan entre 3000 y 10000.
select * from employees where salary between 3000 and 10000;
--6. Elaborar una sentencia SELECT que muestre los datos generales de los empleados que ganan 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000 y 10000.
select * from employees where salary in (1000,2000,3000,4000,5000,6000,7000,8000,9000,10000);
--7. Elaborar una sentencia SELECT que muestre los datos generales de los empleados cuyo nombre contenga la letra ‘a’.
select * from employees where first_name like '%a%';
--8. Elaborar una sentencia SELECT que muestre los datos generales de los puestos cuyo ID contenga un guion bajo ( _ ). Ingresar un nuevo
--puesto que no contenga guion bajo en su Id para comprobar.
select * from employees where job_id like '%_%' escape '/';
insert into jobs values ('ABCDE', 'New Super Job', 2000,6000);
--9. Elaborar una sentencia SELECT que muestre los datos generales de los empleados que tiene una comisión asignada.
select * from employees where commission_pct is not null;
--10. Elaborar una sentencia SELECT que muestre los datos generales de los empleados cuyo nombre no contenga la letra ‘a’ y que ganen más de 7500.
select * from employees where first_name not like '%a%' and salary > 7500;
--11. Elaborar una sentencia SELECT que muestre los datos generales de los empleados cuyo puesto sea SA_REP y que ganen más de 12000 o cuyo puesto sea AD_PRES.
select * from employees where (job_id = 'SA_REP' and salary > 12000) or job_id = 'AD_PRES';
--12. Elaborar una sentencia SELECT que muestre los datos generales de los empleados ordenados por apellido de forma ascendente y por nombre de forma descendente.
select * from employees order by last_name asc, first_name desc;
--13. Elaborar una sentencia SELECT que muestre los datos generales de los empleados cuyo nombre no contenga la letra ‘a’.
select * from employees where first_name not like '%a%';
--14. Elaborar una sentencia SELECT que muestre los datos generales de los empleados utilizando variables de sustitución y la reutilización de al menos una de ellas.
select * from employees where job_id = '&job_id' and salary= &&emp_salary or (salary between &&emp_salary and &emp_salary2);
--15. Elaborar una sentencia SELECT que muestre los datos generales de los empleados utilizando el comando DEFINE.
define emp_job_id = 'AD_PRES'
select * from employees where job_id = '&&emp_job_id';
undefine;