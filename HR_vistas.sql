--Ejercicios Capitulo 11: VISTAS
--Adalberto Cerrillo Vázquez - 5B
--Base de datos HR

--Actividad 1: Para la base de datos HR, elabore lo siguiente:

--1. Explique en qué consiste una vista.

--Consiste en una representacion de un subconjunto de datos de una o mas tablas y sirve para simplificar 
--consultas complejas.

--2. Mencione las ventajas de las vistas.

--Restringe el acceos a los datos
-- Facilita las consultas complejas
-- Presentar vistas diferentes de la misma informacion
-- para darle independencia a los datos

--3. Mencione las características de una vista simple y de una vista compleja.

--Una vista simple, no puede usar funciones, no contiene agrupamiento, utiliza operaciones DML  y se representa informacion de una sola tabla
--Una vista compleja, puede usar funciones, contiene agrupamiento, no siempre utiliza operaciones DML y se representa informacion de una o mas tablas

--4. Explique el funcionamiento de la siguiente vista:

create view dept_sal as select d.department_name, sum(e.salary) from departments d left outer join employees e 
on d.department_id = e.department_id group by department_name order by department_name;
--da un error, porque en la columna que usa la funcion sum, no se indica un alias para que la vista lo interprete.

--5. Elabore una sentencia SELECT para crear una Vista que muestre el Nombre del Puesto, la suma de los salarios asignados a ese puesto, 
--el salario más alto y el salario más bajo que se haya asignado a un empleado en ese puesto.

create view job_sals as select j.job_title, sum(e.salary) "Sum salary", max(e.salary)"Max salary", min(e.salary) "Min Salary" from employees e join jobs j on 
(e.job_id = j.job_id) group by job_title;

select * from job_sals;

--6. Mencione las reglas para poder ejecutar sentencias DML a través de una vista, para:

--a) insertar datos. 
--No se pueden insertar datos si la vista contiene funciones de grupo, la clausula distinct, la psudocolumna rownum
--columnas definidas con expresiones y las columnas con datos no nulos que no hayan sido seleccionados en la vista

--b) modificar datos.
--No se pueden modificar datos si la vista contiene funciones de grupo, una clausula group by, 
--la clausula distinct, la psudocolumna rownum y columnas definidas con expresiones

--c) eliminar datos.
--No se pueden eliminar datos si la vista contiene funciones de grupo, una clausula group by, 
--la clausula distinct y la psudocolumna rownum

--7. Elabore una vista que muestre el siguiente resultado:
create view dep_staff_sal as select d.department_id, count(e.employee_id) "Staff", sum(e.salary) "Salaries", d.department_name from departments d join employees e
on (d.department_id= e.department_id) group by d.department_id, d.department_name;

select * from dep_staff_sal;

--8. Elabore una vista que muestre un listado de los empleados que ganen mas de $10,000.00. 
--A través de la vista tratar de registrar un empleado que gane $8,000.00. 
--Alterar la vista para agregar la opción WITH CHECK OPTION. 
--Nuevamente, a través de la vista tratar de registrar un empleado que gane $8,000.00. Explicar el comportamiento de todo el ejercicio.
create or replace view emp_sal as select employee_id,last_name, salary, email, hire_date, job_id from employees where salary > 10000;
select * from emp_sal;
insert into emp_sal values (207,'Turner',8000,'ATURNER','20/02/05','IT_PROG');
--se inserta
create or replace view emp_sal as select employee_id,last_name, salary, email, hire_date, job_id from employees where salary > 10000 WITH CHECK OPTION CONSTRAINT emp_sal_ck;
insert into emp_sal values (207,'Turner',8000, 'ATURNER','20/02/05','IT_PROG');
--no se inserta

--9. Elabore una vista de solo lectura. Trate de agregar un registro a través de la vista. Explique el comportamiento.
create view dept_80 as select  employee_id,last_name, salary, email, hire_date, job_id from employees where department_id = 80 WITH READ ONLY;
insert into dept_80 values (207,'Turner',8000, 'ATURNER','20/02/05','IT_PROG');
-- aparece un mensaje que nos indica que no podemos realizar una operacion dml en una vista de solo lectura.

--10. Elabore una sentencia para borrar una de las vistas anteriormente creadas.

drop view dept_80;
drop view emp_sal;