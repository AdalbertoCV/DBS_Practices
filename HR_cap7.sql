--Ejercicios Capitulo 7
-- Adalberto Cerrillo Vazquez 5B
-- Base de datos HR

--1. Mencione en qué partes de la Sentencia SELECT se puede utilizar una SUBCONSULTA.

-- Se utiliza despues de la consulta principal, en una condicion where seguida de algun operador para comparar.

--2. Mencione los lineamientos para usar SUBCONSULTAS.

--Las sunconsultas deben estar entre parentesis
--Se colocan en la parte derecha de la comparacion para hacerlo legible
-- se usan operadores single row para subsconsultas single-row y operadores multiple-row para sunconsultas multipple-row

--3. Explique la diferencia entre los dos tipos de SUBCONSULTAS que existen

--Las subconsultas single row devuelven solamente un valor y se comparan con comparadores single row <= >= = > < <>
--Las subconsultas multiple row devuelven un conjuntos de valores y se comparan con comparadores multiple row in, any, all

--4. 4. Elabore una sentencia SELECT que muestre a todos los empleados que tengan el mismo JOB_ID del empleado 141.
select last_name, job_id from employees where job_id = (select job_id from employees where employee_id = 141);

--5. Elabore una sentencia SELECT que muestre el nombre del puesto cuyo salario promedio 
--(el salario promedio se obtiene con los salarios asignados en la tabla empleados)
--sea el más bajo de todos los salarios promedio de los diferentes puestos.

select job_title from jobs where job_id =(select job_id from employees group by job_id having avg(salary) = 
(select min(avg(salary)) from employees group by job_id ));

--6. Explique el funcionamiento de la siguiente consulta:
select last_name from employees where manager_id in (select employee_id from employees where department_id in 
(select department_id from departments where location_id in 
(select location_id from locations where country_id = 'UK' )));
--Nos muestra los apellidos de los empleados cuyo manager trabaja en reino unido.

--7. Explique el funcionamiento de la siguiente consulta:

select job_title from jobs natural join employees group by job_title having avg(salary) = (select max(avg(salary)) from employees 
group by job_id);
-- No smuestra el puesto que tiene el salario promedio mas grande de todos los salrios promedio de los puestos

--8. Explique el funcionamiento de cada una de las siguientes consultas:
select last_name from employees where salary > all(select salary from employees where department_id = 80);
--nos muestra el apellido de los empleados que tienen un salario mayor a todos los empleados del departamento 80
select last_name from employees where salary > (select max(salary) from employees where department_id = 80);
-- nos muestra el apellido de los empleados que tienen un sueldo mayor al salario maximo del departamento 80

--9. Elabore una sentencia SELECT que muestre a los empleados que menos ganan en cada uno de los departamentos.
select last_name from employees where salary in (select min(salary) from employees group by department_id);

--10. Explique el funcionamiento de la siguiente consulta:
select last_name from employees where employee_id not in (select manager_id from employees where manager_id is not null);
-- nos muestra a todos los empleados que no son managers