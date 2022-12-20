--Adalberto Cerrillo Vazquez 5B
--Ejercicios capitulo 6
-- Base de datos HR

--ACTIVIDAD 1: Elabore las siguientes consultas sobre la base de datos HR:

--1. Mencione los diferentes tipos de uniones que maneja Oracle.

--Natural Join: la union de dos tablas, basada en las columnas en ambas tablas que tengan el mismo nombre, y que ademas,
-- los valores de todas las columnas sean iguales.

--Self Join: La union de una tabla consigo misma, mediante la seleccion de una columna que sea equivalente en la tabla 
--(ejemplo de la tabla empleados con el id del empleado y el id del manager)

--Nonequijoin: La union de dos tablas que no usa el operador "=", si no, puede usar otros operadores
--para determinar el match de valores de las columnas correspondientes.

--Outer Joins: La union de dos tablas donde se muestran tanto los resultados que coinciden como los que no coinciden (nulos).
--tenemos 3 tipos los cuales son

--LEFT: Muestra los datos que coinciden y los que no coinciden en la tabla izquierda
--RIGHT: Muestra los datos que coinciden y los que no coinciden en la tabla derecha
--FULL: Muestra los datos que coinciden y los que no tanto en la tabla izquierda como en la derecha.

--Producto Cartesiano: Se produce basicamente cuando hay errores en la forma de haer el join, es cuando cada elemento de la tabla uno,
--se relaciona con todos los elementos de la tabla 2.

----------------------------------------------------------------------------------------------------------------------------------------

--2. Mencione las características de un NATURAL JOIN.

--Es un equijoin
--Retorna los valores que coincidan en todas las columnas que tengan el mismo nombre en cambas tablas
--Si dos columnas se llaman igual pero tienen distinto tipo de dato, se genera un error.

----------------------------------------------------------------------------------------------------------------------------------------

--3. Explique las diferencias entre un NATURAL JOIN y un JOIN USING.

--Basicamente la clausula join nos sirve para seleccionar una columna para realizar el join, esto en caso,
-- de que al comparar todas las columnas con el mismo nombre los datos no coincidan.

-----------------------------------------------------------------------------------------------------------------------------------------

--4. Explique el funcionamiento de cada una de las siguientes consultas:

select * from locations natural join countries;
--realiza la union de las tablas locations y countries donde los datos de las columnas con el mismo nombre
--(country_id) coincidan.

select * from locations, countries where locations.country_id = countries.country_id;
-- Se realiza una union sin hacer uso de la clausula join, si no, con la clausula where, pero el resultado es el mismo.

select * from jobs natural join countries;
-- se crea un producto cartesiano porque las tablas seleccionadas no tienen columnas en comun.

select * from jobs,countries;
--Se crea nuevamente un producto cartesiano, pero esta vez es solo porque se muestran todos los datos de las dos tablas,
-- sin realizar ninguna union.

-------------------------------------------------------------------------------------------------------------------------------------

--5. Explique el funcionamiento de cada una de las siguientes consultas:

select * from locations join countries using(country_id);
-- se realiza una union de las dos tablas, indicando que se mostraran los datos donde la columna
-- country_id de ambas tablas coincida.

select * from locations, countries where locations.country_id = countries.country_id;
-- el resultado sigue siendo el mismo con este tipo de union, y es como si se usara una clausula using,
--ya que lo que comparamos es justamente la columna country_id.

select * from jobs join countries using;
-- Nos da un error, ya que para usar la clausula using debemos indicar la columna que se elegira para realizar el join.

--------------------------------------------------------------------------------------------------------------------------------------

--6. Elabore una sentencia SELECT que muestre el siguiente resultado:

select e.employee_id,e.last_name, j.start_date, e.hire_date, j.end_date,e.job_id as "Current Job", j.job_id as "Previous Job" from employees e join job_history j on 
e.employee_id = j.employee_id;

----------------------------------------------------------------------------------------------------------------------------------------

--7. Elabore una sentencia SELECT que muestre el siguiente resultado:

select e.first_name ||' ' || e.last_name  || ' is manager of the ' || d.department_name || ' department.'  as "Managers" from employees e 
join departments d on e.department_id = d.department_id;

----------------------------------------------------------------------------------------------------------------------------------------

--8. Explique el funcionamiento de cada una de las siguientes consultas:

select d.department_name from departments d join locations l on (l.location_id = d.location_id) where d.department_name like 'P%';
-- Regresa el nombre de los departamentos que esten en la misma ubicacion, y que inicion con la letra P, (uniendo primero y luego limitando).
select d.department_name from departments d join locations l on (l.location_id = d.location_id and d.department_name like 'P%');
-- Regresa el nombre de los departamentos que esten en la misma ubicacion, y que inicion con la letra P, (uniendo y limitando a la vez).

---------------------------------------------------------------------------------------------------------------------------------------

--9. Elabore las sentencias necesarias para crear la tabla e insertar los datos de lo siguiente:

create table job_grades(
   grade_level char(1),
   lowest_sal number,
   highest_sal number
);


insert into job_grades values('A', 1000,2999);
insert into job_grades values('B', 3000,5999);
insert into job_grades values('C', 6000,9999);
insert into job_grades values('D', 10000,14999);
insert into job_grades values('E', 15000,24999);
insert into job_grades values('F', 25000,40000);

---------------------------------------------------------------------------------------------------------------------------------------------

--10. Elabore una sentencia SELECT que muestre el siguiente resultado:

select e.last_name, e.salary, j.grade_level from employees e join job_grades j on e.salary between j.lowest_sal and j.highest_sal;
----------------------------------------------------------------------------------------------------------------------------------------------

--11. Explique el funcionamiento de cada una de las siguientes consultas:

select e.employee_id, e.department_id emp_dept_id, d.department_id dep_dept_id, d.department_name from departments d
left outer join employees e on (d.department_id = e.department_id) where d.department_name like 'P%';
-- Muestra los nombres de los departamentos que inician con la letra P y que tienen empleados,
-- pero si no tiene empleados, igualmente muestra los datos del departamento.

select e.employee_id, e.department_id emp_dept_id, d.department_id dep_dept_id, d.department_name from departments d
join employees e on (d.department_id = e.department_id) where d.department_name like 'P%';
--Muestra los nombres de los departamentos que inician con la letra P y que tienen empleados (omite los departamentos que no tienen un empleado asignado).

-----------------------------------------------------------------------------------------------------------------------------------------

--12. Elabore una sentencia SELECT que muestre el siguiente resultado:

select j.job_id JOBS_IN_JOB_HISTORY, e.job_id JOBS_IN_EMPLOYEES from job_history j right outer join employees e
on (j.job_id = e.job_id) order by j.job_id, e.job_id;

--------------------------------------------------------------------------------------------------------------------------------------------

--13. Elabore una sentencia SELECT que muestre el siguiente resultado:

select e.last_name, d.department_name from employees e full outer join departments d
on (e.department_id = d.department_id) where e.department_id is null;

-------------------------------------------------------------------------------------------------------------------------------------------

--14. Explique el funcionamiento de la siguiente consulta:
--En esta consulta se hizo una union de la tabla regions con countries con un cross join

select r.region_name, c.country_name from regions r cross join countries c;

---------------------------------------------------------------------------------------------------------------------------------------------

--15. Elabore una Sentencia SELECT que muestre todos los empleados que hay registrados en la tabla, 
--y en de que tengan un departamento asignado, mostrar el nombre de dicho departamento.

select e.employee_id, e.last_name, d.department_name from employees e left outer join departments d on (e.department_id = d.department_id);
