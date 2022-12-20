--Adalberto Cerrillo Vazquez 5B
-- Ejercicios Capitulo 5
-- Base de datos Hotel

--B: Elabore 2 consultas para la base de datos “Hotel” para cada una de las siguientes funciones:

--AVG
select avg(precio) PROMEDIO_PRECIO from reserva_acv;
select avg(cantidad) PROMEDIO_HABITACIONES from habitacion_hotel_acv;

--SUM
select sum(precio) GANANCIA_TOTAL from reserva_acv;
select sum(cantidad) TOTAL_HABITACIONES from habitacion_hotel_acv;

--MAX
select max(precio) PRECIO_MAS_ALTO from reserva_acv;
select max(iva) IVA_MAXIMO from categoria_acv;

--MIN
select min(precio) PRECIO_MAS_BAJO from reserva_acv;
select min(iva) IVA_MINIMO from categoria_acv;

--COUNT(*)
select count(*) RESERVAS from reserva_acv;
select count(*) NUMERO_DE_CLIENTES from cliente_acv;

--COUNT(columna)
select count(id_tipo) cantidad_tipo_2 from habitacion_acv where id_tipo = 2;
select count(iva) iva_16 from categoria_acv where iva=16;

--DISTINCT en funciones de grupo
select count(distinct id_tipo) cantidad_tipos from habitacion_acv;
select count(distinct id_agencia) agencias_trabajadores from empleado_acv;

--Elabore 3 sentencias con group by
select id_agencia, count(*) total_empleados from empleado_acv group by id_agencia;
select id_tipo, count(*) total_habitaciones from habitacion_acv group by id_tipo;
select id_categoria, count(*) total_hoteles from hotel_acv group by id_categoria;

--Elabore 3 sentencias con having
select id_hotel, id_habitacion, cantidad from habitacion_hotel_acv group by id_hotel, id_habitacion, cantidad
having cantidad > 1;
-- muestra los hoteles que tengan mas de una habitacion en especifico
select id_agencia, count(*) total_empleados from empleado_acv group by id_agencia having count(*)>3;
-- muestra las agencias que tengan mas de 3 empleados
select id_categoria, count(*) total_hoteles from hotel_acv group by id_categoria having count(*)> 2;
-- muestra las categorias que tengan mas de 2 hoteles

--Elabore 3 sentencias con anidación de funciones de grupo
select avg(count(distinct id_categoria)) promedio_hoteles_categoria from hotel_acv group by id_categoria;
-- muestra el promedio de los hoteles por categoria
select max(count(distinct id_categoria)) maximo_hoteles_categoria from hotel_acv group by id_categoria;
-- muestra el maximo de hoteles por categoria
select min(count(distinct id_categoria)) minimo_hoteles_categoria from hotel_acv group by id_categoria;
-- muestra el minimo de hoteles por categoria