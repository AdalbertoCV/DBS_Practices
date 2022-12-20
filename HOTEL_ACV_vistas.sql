-- Ejercicios Capitulo 11: VISTAS
--Adalberto Cerrillo Vazquez 5B
-- Base de datos Hotel

--1. Elabore 3 vistas sencillas y elabore las sentencias SELECT para consultar los datos de dichas vistas.
create view clientes as select nombre,apellido_paterno, telefono from cliente_acv;
select * from clientes;
create view emp_ag_1 as select nombre,apellido_paterno from empleado_acv where id_agencia = 1;
select * from emp_ag_1;
create view hot_cat_3 as select nombre from hotel_acv where id_categoria=3;
select * from hot_cat_3;

--2. Elabore 3 vistas complejas sencillas y elabore las sentencias SELECT para consultar los datos de dichas vistas.
create view sum_precios as select id_hotel,sum(precio) "Suma Precios" from reserva_acv group by id_hotel;
select * from sum_precios;
create view ag_emp as select e.nombre, e.apellido_paterno, a.id_agencia from empleado_acv e
join agencia_acv a on (e.id_agencia = a.id_agencia);
select * from ag_emp;
create view max_min_precios as select id_hotel, max(precio) "Precio Maximo", min(precio) "Precio Minimo" from reserva_acv group by id_hotel;
select * from max_min_precios;

--3. Modifique 1 vista sencilla y 1 vista compleja.
create or replace view clientes as select nombre,apellido_paterno, telefono, 'Colonia: ' || colonia "Nombre Colonia" from cliente_acv;
select * from clientes;
create or replace view max_min_precios as select id_hotel, max(precio) "Precio Maximo", min(precio) "Precio Minimo" ,
avg(precio) "Precio Promedio" from reserva_acv group by id_hotel;
select * from max_min_precios;

--4. Elabore una vista sencilla que cumpla con las características necesarias para poder ejecutar sentencias DML a través de ella.

create view emp_ag_4 as select id_empleado, nombre, apellido_paterno, telefono, id_agencia from empleado_acv where id_agencia = 4;
select * from emp_ag_4;

--a. Inserte registros por medio de la vista
insert into emp_ag_4 values (6, 'Alexander','Turner','4443321598',4);
select * from emp_ag_4;
--b. Modifique registros por medio de la vista.
update emp_ag_4 set nombre = 'Alex' where id_empleado = 6;
select * from emp_ag_4;
--c. Elimine registros por medio de la vista.
delete from emp_ag_4 where id_empleado = 6;
select * from emp_ag_4;

--5. Elabore 2 vistas con la cláusula WITH CHECK OPTION y elabore las sentencias necesarias para comprobar la restricción de la vista.
create view emp_ag_3 as select id_empleado, nombre, apellido_paterno, telefono, id_agencia from empleado_acv where id_agencia = 3
WITH CHECK OPTION CONSTRAINT emp_ag_3_ck;
select * from emp_ag_3;
insert into emp_ag_3 values (6, 'Alexander','Turner','4443321598',4);
--No se agrega el registro porque la agencia del empleado no es la 3, como se indica en la vista.

create view precios_mayores as select id_reserva,id_cliente,id_empleado,id_hotel,id_habitacion, fecha_inicio, fecha_fin, precio 
from reserva_acv where precio>1000 WITH CHECK OPTION CONSTRAINT precios_may_ck;
select * from precios_mayores;
insert into precios_mayores values (6,2,1,1,1,'01/11/22','02/11/22',900);
--No se agrega el registro ya que el precio es menor a 1000, violando el check option.

--6. Elabore 2 vistas con la cláusula WITH READ ONLY y elabore las sentencias necesarias para comprobar la restricción de la vista.
create view hab_tipo_2 as select id_habitacion,nombre, id_tipo from habitacion_acv where id_tipo=2 WITH READ ONLY;
select * from hab_tipo_2;
insert into hab_tipo_2 values (7,'Habitacion super cool',2);
-- salta el mensaje que indica que no se pueden realizar operaciones dml en una vista de solo lectura

create view cant_hab_hot as select id_hotel, id_habitacion, cantidad from habitacion_hotel_acv where cantidad=1 WITH READ ONLY;
select * from cant_hab_hot;
insert into cant_hab_hot values (6,4,1);
-- salta el mensaje que indica que no se pueden realizar operaciones dml en una vista de solo lectura

--7. Elabore la sentencia necesaria para borrar una vista.
drop view hab_tipo_2;
drop view cant_hab_hot;