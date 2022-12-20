--Adalberto Cerrillo Vazquez
-- Ejercicios capitulo 2

--B) Elabore 3 consultas sobre la base de datos “HOTEL” para cada una de las siguientes opciones:

--1. = y <>
select * from empleado_acv where id_agencia = 1;
select * from empleado_acv where apellido_materno = 'Phillips';
select * from empleado_acv where nombre = 'Luis';
select * from empleado_acv where telefono <> '4561237890';
select * from empleado_acv where id_empleado <> 1;
select * from empleado_acv where apellido_paterno <> 'Hudson';
--2. > y <
select * from reserva_acv where precio > 1000;
select * from reserva_acv where fecha_inicio < '24/08/22';
select * from reserva_acv where fecha_fin > '23/08/22';
--3. >= y <=
select * from reserva_acv where precio <= 1200;
select * from habitacion_hotel_acv where cantidad >= 2;
select * from hotel_acv where fecha_construccion <= '01/01/2000';
--4. Between y not between
select * from reserva_acv where precio between 800 and 100;
select * from habitacion_hotel_acv where cantidad not between 1 and 3;
select * from hotel_acv where fecha_construccion between '01/01/98' and '01/01/99';
--5. In y not in
select * from reserva_acv where precio in (800,900,1000);
select * from cliente_acv where id_cliente in (1,2) and colonia not in ('Minera');
select * from reserva_acv where fecha_inicio not in ('21/08/22','24/08/22');
--6. Like y not like (usar en al menos 1 consulta, ESCAPE)
select * from hotel_acv where colonia not like '%e%';
select * from cliente_acv where nombre like 'A%';
select * from categoria_acv where IVA like '%/%' escape '/';
--7. Is null e is not null
select * from categoria_acv where descripcion is not null;
select * from cliente_acv where calle is null;
select * from empleado_acv where id_agencia is null;
--8. And
select * from reserva_acv where fecha_inicio > '21/08/22' and precio >1000;
select * from cliente_acv where nombre like '%a%' and colonia like '%e%';
select * from empleado_acv where apellido_paterno like '%s%' and telefono like '323%';
--9. Or
select * from empleado_acv where apellido_paterno like '%s' or apellido_paterno like '%z';
select * from cliente_acv where nombre like 'J%' or nombre like 'M%';
select * from reserva_acv where precio = 1000 or precio = 800;
--10. Uso de paréntesis
select * from reserva_acv where precio = 1000 or (fecha_inicio>'21/08/22' and fecha_fin='24/08/22');
select * from empleado_acv where (nombre like 'J%' and apellido_paterno like 'H%') or id_empleado in (3,5);
select * from habitacion_acv where id_habitacion in (1,5) and (id_tipo = 2 or nombre like '% %');
--11. Precedencia de operadores
select * from cliente_acv where apellido_materno like '%e%' or apellido_materno like '%s%' and colonia like '%e%';
select * from habitacion_acv where nombre is null or id_tipo in (1,5) and nombre like '% %';
select * from reserva_acv where precio = 1000 or precio <900 and precio>600;
--12. Order by
select * from cliente_acv order by nombre asc, apellido_paterno desc;
select * from reserva_acv order by fecha_inicio desc;
select * from empleado_acv order by apellido_materno desc, nombre asc;
--13. Variables de sustitución con &
select * from empleado_acv where nombre = '&nombre';
select * from habitacion_acv where nombre = '&nombre' and id_tipo = &id_tipo;
select * from reserva_acv where precio between &precio1 and &precio2;
--14. Variables de sustitución con &&
select * from reserva_acv where precio = &&precio1 or (precio >&&precio1 and precio<1300);
select * from cliente_acv where apellido_paterno = '&&apellido' or apellido_materno = '&&apellido';
select &&columna from empleado_acv where &&columna = '&valor';
--15. Define y undefine
define client_name = 'Alexia'
select * from cliente_acv where nombre = '&&client_name';
undefine;

define start_date = '23/08/22'
select * from reserva_acv where fecha_inicio = '&&start_date';
undefine;

define apellido = 'Hudson'
select * from empleado_acv where apellido_paterno = '&&apellido' or apellido_materno = '&&apellido';
undefine;