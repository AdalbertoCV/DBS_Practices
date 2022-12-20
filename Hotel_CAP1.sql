--Adalberto Cerrillo Vazquez 5B
--Ejercicio Capitulo 1

--B) Elabore 3 consultas sobre la base de datos “HOTEL” para cada una de las siguientes opciones:

--1. Expresiones

-- El precio de 3 noches de reserva en el hotel
select (precio * 3) from reserva_acv;
-- La mitad de las habitaciones del hotel
select (cantidad/2) from habitacion_hotel_acv;
-- El 50% del iva de la categoria
select (iva/2) from categoria_acv;

--2. Concatenación

select nombre || apellido_paterno || apellido_materno from cliente_acv;
select colonia || calle from hotel_acv;
select apellido_paterno || apellido_materno || telefono from empleado_acv;

--3. Concatenación con valor literal

select 'El nombre del cliente es: ' || nombre ||' '|| apellido_paterno||' ' || apellido_materno from cliente_acv;
select 'El hotel se encuentra en la colonia ' || colonia || ' en la calle '|| calle from hotel_acv;
select 'El empleado de apellidos ' || apellido_paterno || ' ' || apellido_materno ||
' tiene el telefono '|| telefono from empleado_acv;

--4. Operador Q

select  q'[ La agencia con identificador ]' || id_agencia ||  q'[ se encuentra en la colonia ]' || colonia
||  q'[ y en la calle ]' || calle from agencia_acv;
select  q'[ el cliente ]' || id_cliente ||  q'[ vive en la colonia ]' || colonia ||
q'[ y su contacto es: ]' || telefono from cliente_acv;
select  q'[ El empleado con nombre ]' || nombre ||  q'[ ]' || apellido_paterno  ||q'[ ]'||
apellido_materno || q'[ trabaja en la agencia con id:  ]'|| id_agencia from empleado_acv;

--5. Alias (para cada tipo)

select colonia || ' ' || calle as domicilio_cliente from cliente_acv;
select nombre || ' ' || apellido_paterno || ' ' || apellido_materno as nombre_empleado from empleado_acv;
select telefono as tel_agencia from agencia_acv;

select telefono tel_cliente from cliente_acv;
select fecha_construccion fc from hotel_acv;
select nombre NOM, apellido_paterno AP, apellido_materno AM from empleado_acv;

select nombre || ' ' || apellido_paterno || ' ' || apellido_materno "Nombre del empleado" from empleado_acv;
select id_hotel "Id del hotel" from hotel_acv;
select nombre "Nombre de la habitacion" from habitacion_acv;

--6. Distinct

select distinct id_agencia from empleado_acv;
select distinct fecha_fin from reserva_acv;
select distinct precio from reserva_acv;