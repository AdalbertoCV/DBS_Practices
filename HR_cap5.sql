--Adalberto Cerrillo Vazquez 5B
--Ejercicios Capitulo 5
--Base de datos 

--1. ¿Qué son las funciones de grupo?
--Son funciones que se ejecutan sobre un conjunto de registros a la vez y retornando un resultado
--sobre todo el conjunto.

--2. Explique el funcionamiento de cada una de las siguientes consultas:
select sum(2) from employees;
--realiza dos veces la suma de todos los registros de la tabla
select sum(salary) from employees;
-- realiza la suma de todos los salarios de los empleados
select sum(distinct salary) from employees;
--realiza la suma de todos los salarios de los empleados (pero sin repetir valores, los salarios iguales solo se consideran una vez)
select sum(commission_pct) from employees;
-- realiza la suma de todas las comisiones de los empleados

--3. Explique el funcionamiento de cada una de las siguientes consultas:
select avg(2) from employees;
--saca el promedio de 2
select avg(salary) from employees;
--saca el salario promedio de los empleados
select avg(distinct salary) from employees;
-- sacca el salario promedio de los empleados sin repetir valores
select avg(commission_pct) from employees;
--saca el promedio de comisiones de los empleados

--4. Explique el funcionamiento de cada una de las siguientes consultas:
select min(commission_pct), max(commission_pct) from employees;
-- nos da la comision minima de los empleados y la comision maxima
select min(start_date), max(end_date) from job_history;
-- nos muestra la primera fecha en que se inicio un trabajo, y la ultima fecha en que se termino un trabajo.
select min(job_id), max(job_id) from employees;
-- nos muestra el job_id menor alfabeticamente y mayor alfabeticamente

--5. Explique el funcionamiento de cada una de las siguientes consultas:
select department_id, sum(commission_pct) from employees where commission_pct is not null group by department_id;
-- nos muestra la suma de las comisiones de los departmanetos con empleados que tienen comision
select department_id, job_id, sum(commission_pct) from employees where commission_pct is not null group by department_id, job_id;
-- nos muestra la suma de las comisiones de los puestos y departamentos que tienen empleados con comision

--6. Explique el funcionamiento de la siguiente consulta:
select department_id, avg(salary) from employees group by department_id having avg(salary) > 8000;
--nos muestra el salario promedio de los departamentos que tengan un promedio mayor a 8000

--7. Explique el funcionamiento de la siguiente consulta:
select department_id, count(*) from job_history where department_id in (50,60,80,110) group by department_id;
-- nos muestra la cantidad de trabajos registrados en los departamentos 50,60,80 y 110

--8. Explique el funcionamiento de la siguiente consulta:
select department_id, count(*) from job_history where department_id in (50,60,80,110) group by department_id having count(*) >1;
-- nos muestra la cantidad de trabajos registrados para los departamentos 50,60,80 y 110 siempre y cuando haya mas de un trabajo

--9. Elabore una sentencia SELECT que indique la cantidad de empleados que hay en cada departamento 
--(únicamente interesa contar a los empleados que ganan más de 5000 y que tengan una comisión asignada).
select department_id, count(*) from employees where salary>500 and commission_pct is not null group by department_id;

--10. Elabore una sentencia SELECT que indique la cantidad de empleados que hay en cada puesto de trabajo 
--(únicamente interesa contar a los empleados que tengan más de 10 de antigüedad) 
--y sólo mostrar los puestos que tengan más de 10 empleados asignados.
select job_id, count(*) from employees where ((sysdate - hire_date)/365) >10 group by job_id having count(*) >10;