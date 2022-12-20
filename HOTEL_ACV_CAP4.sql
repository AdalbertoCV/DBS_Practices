--Adalberto Cerrillo Vazquez 5B
--Ejercicios Capitulo 4
--Base de datos Hotel

--B) Elabore 2 consultas sobre la base de datos “HOTEL” para cada una de las siguientes opciones:

--• Sentencias SELECT que utilicen la función TO_CHAR para fechas.
select to_char(fecha_construccion,'dd.mon.yyyy') from hotel_acv;
select 'El hotel fue construido en el año: ' || to_char(fecha_construccion,'Year') from hotel_acv;

--• Sentencias SELECT que utilicen la función TO_CHAR para Números.
select to_char(precio,'$99,999.00') precio from reserva_acv;
select to_char(precio,'L99999') precio from reserva_acv;

--• Sentencias SELECT que utilicen la función TO_DATE.
select to_date(fecha_construccion,'dd-mm-yyyy') from hotel_acv;
select fecha_construccion from hotel_acv where fecha_construccion>to_date('13-01-1998','dd-mm-yyyy');

--Sentencias SELECT que utilicen la función TO_NUMBER.
select to_number(telefono) + 1 from cliente_acv;
select to_number(substr(fecha_fin,1,2)) from reserva_acv;

--• Sentencias SELECT que utilicen funciones anidadas.
select to_number(substr(to_char(fecha_construccion),1,2)) from hotel_acv;
select to_date(concat(substr(fecha_construccion,1,2),'/01/00'), 'dd-mm-yy') from hotel_acv;

--• Sentencias SELECT para cada una de las funciones GENERALES
select nvl(id_categoria,1) from hotel_acv;
select nvl(id_tipo,3) from habitacion_acv;
select nvl2(id_categoria,2,1) from hotel_acv;
select nvl2(id_tipo,1,3) from habitacion_acv;
select nullif(id_categoria,4) from hotel_acv;
select nullif(id_tipo,2) from habitacion_acv order by id_tipo;
select coalesce(null,null,null,fecha_construccion) from hotel_acv;
select coalesce(nullif(id_tipo,2),null,null,10) from habitacion_acv;

--• Sentencias SELECT que utilicen la expresión CASE.
select nombre,id_tipo, 
 case id_tipo when 1 then 1000
              when 2 then 2000
              when 3 then 3000
              else 4000 end precio from habitacion_acv;
  
select nombre, fecha_construccion,
case when fecha_construccion < '01/01/00' then 'viejo'
     when fecha_construccion between '01/01/00' and '01/01/10' then 'regular'
     else 'nuevo' end estado_hotel from hotel_acv;
     
--• Sentencias SELECT que utilicen la función DECODE.
SELECT id_empleado,apellido_paterno,
DECODE(mod(id_empleado,2),0,'Matutino','Vespertino') turno from empleado_acv;

select id_tipo, nombre,
DECODE(id_tipo, 1, 1000,2,2000,3,3000,4000) precio from habitacion_acv;
