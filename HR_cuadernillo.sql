--Cuadernillo de consultas
--Adalberto Cerrillo Vazquez 5B
--Elabore las siguientes consultas sobre la base de datos HR:

--1. Consultar el nombre de la región, el nombre del país, datos generales de las localidades y en caso de que una localidad tenga departamentos, 
--mostrar también el nombre del departamento.

select r.region_name, c.country_name, l.*, d.department_name from departments d right outer join locations l on 
(d.location_id = l.location_id) join countries c on (l.country_id = c.country_id) join regions r on ( c.region_id =r.region_id);

--2. Consultar el nombre completo de los empleados que no han generados ningún histórico en un determinado año.

select first_name, last_name from employees where employee_id not in (select employee_id from job_history where to_char(start_date,'yyyy') <> '&year');

--3. Consultar el nombre de los departamentos y el total de empleados que tiene cada uno de ellos, 
--pero sólo mostrar aquellos departamentos que tengan más de 5 empleados.

select d.department_name, count(e.employee_id)"Employees" from employees e join departments d on 
(d.department_id = e.department_id) group by d.department_name having count(*) > 5;

--4. Consultar los datos generales de los históricos (mostrar los datos generales de las tablas que se relacionan con la tabla de JOB_HISTORY).

select e.*, j.*, d.* from job_history jh join employees e on (jh.employee_id = e.employee_id) join jobs j on (jh.job_id = j.job_id)
join departments d on (jh.department_id = d.department_id);

--5. Consultar los nombres de los puestos (job_title) y total de empleados (que no ganen entre 8000 y 12000 y que tengan comisión asignada) 
--que tiene cada uno de ellos, pero sólo mostrar aquellos puestos que tengan más de 3 empleado.

select j.job_title, count(e.employee_id) "Employees" from employees e join jobs j on
(e.job_id = j.job_id) where (e.salary not between 8000 and 12000) and e.commission_pct is not null group by j.job_title having count(*) >3;

--6. Consultar el nombre del empleado que más veces ha cambiado de departamento.
select e.last_name,count(j.department_id) "Number of Departments" from employees e join job_history j on (e.employee_id = j.employee_id)
join departments d on (d.department_id = j.department_id)group by e.last_name
having count(j.department_id) = (select max(count(unique employee_id)) from job_history group by employee_id);

--7. Consultar el nombre del empleado que más veces ha cambiado de puesto.
select e.last_name,count(j.employee_id) "Number of jobs" from employees e join job_history j on (e.employee_id = j.employee_id) group by e.last_name
having count(j.employee_id) = (select max(count(employee_id)) from job_history group by employee_id);

--8. Consultar el nombre de la región que tenga más empleados.
select r.region_name, count(e.employee_id) "Number of Employees" from regions r join countries c on(c.region_id = r.region_id) join
locations l on (l.country_id = c.country_id) join departments d on (d.location_id = l.location_id) join
employees e on (e.department_id = d.department_id) group by r.region_name
having count(e.employee_id) = (select max( count(e.employee_id)) from regions r join countries c on(c.region_id = r.region_id) join
locations l on (l.country_id = c.country_id) join departments d on (d.location_id = l.location_id) join
employees e on (e.department_id = d.department_id) group by r.region_name);

--9. Consultar el nombre de los países que su total de localidades se encuentre por arriba del promedio de localidades por país.
select c.country_name, count(l.location_id) "Number of locations" from countries c join locations l on (l.country_id = c.country_id)
group by c.country_name having(count(l.location_id)) > (select avg(count(l.location_id)) from countries c join 
locations l on (l.country_id = c.country_id) group by location_id);

--10. Consultar el puesto que más empleados tenga.
select j.job_title,(count(e.employee_id))"Number of employees" from jobs j join employees e on (e.job_id = j.job_id) 
group by j.job_title having (count(e.employee_id)) = 
(select max(count(e.employee_id)) from jobs j join employees e on (e.job_id = j.job_id) group by j.job_id);

--11. Consultar el nombre de todos los empleados registrados en la base de datos y si están asignados a algún departamento, 
--mostrar también el nombre del departamento, en caso contrario mostrar la leyenda “no está asignado a ningún departamento”.
select last_name,nvl(to_char(department_id),'no está asignado a ningún departamento.') "Department" from employees;

--12. Consultar el nombre de la región y el total de países que tiene cada una de ellas,
--pero sólo mostrar cuyo total de países se encuentre por debajo de la media.
select r.region_name, count(c.country_id) "Number of countries" from regions r join countries c on (c.region_id = r.region_id) group by
r.region_name having count(c.country_id)< (select avg(count(c.country_id)) from 
 regions r join countries c on (c.region_id = r.region_id) group by r.region_name);
 
--13. Consultar los datos generales de los empleados que han cambiado de puesto pero no de departamento.
select * from employees where employee_id in (select employee_id from employees intersect select employee_id from job_history
minus select e.employee_id from employees e join job_history j on (e.department_id = j.department_id));

--14. Consultar los datos generales de los empleados que han cambiado de departamento pero no de puesto.
select * from employees where employee_id not in (select e.employee_id from employees e join job_history j on (e.department_id = j.department_id))
minus select * from employees where employee_id in (select employee_id from employees intersect select employee_id from job_history);

--15. Consultar el nombre del empleado que más ha cambiado tanto de puesto como de departamento.
select e.last_name, count(j.department_id) "Department moves", count(j.job_id)"Job moves"
from employees e join job_history j on (j.employee_id = e.employee_id) 
group by e.last_name having count(j.department_id) = (select max(count(j.department_id))
from employees e join job_history j on (j.employee_id = e.employee_id) 
group by e.last_name) and count(j.job_id) = (select max(count(j.job_id))
from employees e join job_history j on (j.employee_id = e.employee_id) 
group by e.last_name);

--16. Consultar el nombre de los empleados, el porcentaje de comisión y una leyenda que indique 
--“Tiene comisión asignada” o “No tiene comisión asignada”.
select last_name, nvl2(commission_pct,'No tiene comision asignada','Tiene comision asignada') "Commission" from employees;

--17. Consultar el nombre de los empleados, su salario y una leyenda que indique:
--“Salario de Nivel 1” si gana más de 12,000.00.
--“Salario de Nivel 2” si gana entre 8,000.00 y 12,000.00.
--“Salario de Nivel 3” si gana menos de 8,000.00.
select last_name, salary, case
when salary > 12000 then 'Salario de Nivel 1'
when salary between 8000 and 12000 then 'Salario de Nivel 2'
else 'Salario de Nivel 3' end "Nivel" from employees;

--18. Consultar el nombre de los países en lo que no haya empleados trabajando.
select country_name from countries where country_name not in (select c.country_name from countries c join locations l on (c.country_id = l.country_id) join departments d on
(d.location_id = l.location_id) join employees e on (e.department_id = d.department_id));

--19. Consultar el nombre del departamento más popular (Departamento que más empleados tenga).
select d.department_name, count(e.employee_id)"Number of employees" from departments d join employees e on (e.department_id = d.department_id)
group by d.department_name having count(e.employee_id) = (select max(count(e.employee_id)) from 
departments d join employees e on (e.department_id = d.department_id)
group by d.department_name);

--20. Consultar el nombre del departamento, el total de empleados que tiene cada uno de ellos y una leyenda que indique:
--“Departamento con muchos empleados” si tiene más de 15 empleados.
--“Departamento con pocos empleados” si tiene entre 8 y 15 empleados.
--“Departamento con muy pocos empleados” si tiene menos de 8 empleados.
select d.department_name, count(e.employee_id) "Number of employees", case
when count(e.employee_id) > 15 then 'Departamento con muchos empleados'
when count(e.employee_id) between 8 and 15 then 'Departamento con pocos empleados'
else 'Departamento con muy pocos empleados' end "Description"
from departments d join employees e on (e.department_id = d.department_id)
group by d.department_name;
