--Adalberto Cerrillo Vazquez 5B
--Ejercicios del capitulo 6
-- Base de datos Hotel

--ACTIVIDAD 2: Para la base de datas de “Hotel”, elabore 3 sentencias SELECT para cada uno de los siguientes tipos de JOIN:

--• NATURAL JOIN
select * from hotel_acv natural join categoria_acv;
-- se muestran todos los hoteles y las categorias que tienen asignadas
select * from habitacion_acv natural join tipo_habitacion_acv;
--se muestran todas las habitaciones y sus tipos asignados
select * from habitacion_acv natural join habitacion_hotel_acv;
--se muestran las habitaciones que estan asociadas a algun hotel

--• JOIN USING
select * from agencia_acv join empleado_acv using (id_agencia);
--se muestran las agencias que tienen empleados asignados y su informacion, usando el id de la agencia como columna
select * from agencia_acv join empleado_acv using(telefono);
--Se muestran las agencias que tienen emplados asignados y que su telefono sea el mismo (no va a regresar datos)
select nombre, apellido_paterno from cliente_acv join reserva_acv using(id_cliente);
--Se muestran los clientes que han realizado reservaciones.

--• JOIN ON
select a.* from agencia_acv a join empleado_acv e on (a.id_agencia = e.id_agencia);
--se muestran las agencias que tienen empleados asignados y su informacion, donde el id de la agencia sea igual en ambas tablas
select h.* from habitacion_acv h join tipo_habitacion_acv t on(h.id_tipo = t.id_tipo);
--se muestran las habitaciones y sus tipos asociados donde el id tipo coincida en ambas tablas
select c.nombre, c.apellido_paterno, r.fecha_inicio from cliente_acv c join reserva_acv r on (c.id_cliente = r.id_cliente);
--se muestran los clientes que tienen reservaciones y su fecha de inicio, donde el id del cliente sea igual en ambas tablas.

--• SELF-JOIN
--alter table para agregar un gerente para los empleados.
alter table empleado_acv add id_gerente number;
select emp.* from empleado_acv emp join empleado_acv man on (emp.id_gerente = man.id_empleado);

--• NONEQUIJOIN*
--creando una tabla de rango de precios
create table precio_reserva(
    tipo_reserva varchar2(10),
    precio_min number,
    precio_max number
);

insert into precio_reserva values('Simple',300,499);
insert into precio_reserva values('Regular',500,799);
insert into precio_reserva values('Plus',800,1099);
insert into precio_reserva values('Deluxe',1100,3000);

select r.id_cliente, p.tipo_reserva from reserva_acv r join precio_reserva p on r.precio between p.precio_min and p.precio_max;

--• LEFT OUTER JOIN
select a.id_agencia, a.colonia, e.nombre, e.apellido_paterno from agencia_acv a left outer join empleado_acv e 
on (a.id_agencia= e.id_agencia);
--muestra las agencias que tengan empleados asignados, y tambien las agencias sin empleados asignados mostrandolos como null
select h.nombre, t.descripcion from habitacion_acv h left outer join tipo_habitacion_acv t on 
(h.id_tipo = t.id_tipo);
--muestra las habitaciones que tengan un tipo asignado, y tambien las habitaciones que no lo tengan mostrando el tipo como null
select h.id_hotel, h.nombre, c.descripcion from hotel_acv h left outer join categoria_acv c on
(h.id_categoria = c.id_categoria);
--muestra los hoteles que tengan asignados una categoria, y los que no la tengan mostrandolas como null

--• RIGHT OUTER JOIN
select a.id_agencia, a.colonia, e.nombre, e.apellido_paterno from agencia_acv a right outer join empleado_acv e 
on (a.id_agencia= e.id_agencia);
--muestra todos los empleados y muestra las agencias que tengan empleados asignados.
select h.nombre, t.descripcion from habitacion_acv h right outer join tipo_habitacion_acv t on 
(h.id_tipo = t.id_tipo);
--muestra todos los tipos de habitacion y muestra las habitacion que tengan un tipo asignado
select h.id_hotel, h.nombre, c.descripcion from hotel_acv h right outer join categoria_acv c on
(h.id_categoria = c.id_categoria);
--muestra todas las categorias y muestra solo los hoteles que tengan una categoria asignada

--• FULL OUTER JOIN
select a.id_agencia, a.colonia, e.nombre, e.apellido_paterno from agencia_acv a full outer join empleado_acv e 
on (a.id_agencia= e.id_agencia);
--muestra todos los empleados y muestra todas las agencias incluyendo datos que no coinciden
select h.nombre, t.descripcion from habitacion_acv h full outer join tipo_habitacion_acv t on 
(h.id_tipo = t.id_tipo);
--muestra todos los tipos de habitacion y muestra todas las habitaciones incluyendo datos que no coinciden
select h.id_hotel, h.nombre, c.descripcion from hotel_acv h full outer join categoria_acv c on
(h.id_categoria = c.id_categoria);
--muestra todas las categorias y muestra todos los hoteles incluyendo datos que no coinciden

--• CROSS JOIN
select * from hotel_acv cross join agencia_acv;
select * from empleado_acv cross join cliente_acv;
select * from habitacion_acv cross join categoria_acv;