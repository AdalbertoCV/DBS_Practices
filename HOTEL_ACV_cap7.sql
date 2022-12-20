--Ejercicios Capitulo 7
-- Adalberto Cerrillo Vazquez 5B
-- Base de datos Hotel

--B: Para la base de datos de “HOTEL”:

--Elaborar 3 sentencias de subconsultas con operadores de un sólo registro.
select apellido_paterno from cliente_acv where colonia = (select colonia from cliente_acv where id_cliente=2);
-- Muestra a los clientes que vivan en la misma colonia que el cliente 2
select apellido_paterno from empleado_acv where id_agencia = (select id_agencia from empleado_acv where id_empleado =1);
-- Muestra a los empleados que sean compañeros de el empleado 1
select nombre from hotel_acv where id_categoria = (select id_categoria from categoria_acv where descripcion= 'De lujo');
-- No smuestra todos los hoteles categorizados como de lujo.

--Elaborar 3 sentencias de subconsultas con operadores de múltiples registros.
select id_hotel from reserva_acv where precio > any (select max(precio) from reserva_acv group by id_empleado);
-- Muestra los id de los hoteles que tengan un precio de reserva mayor segun cada empleado que ha registrado su reserva
select colonia from cliente_acv where length(colonia) >all(select length(colonia) from hotel_acv);
--Muestra las colonias de los clientes cuyo nombre sea mas largo que todos los nombres de las colonias de los hoteles
select calle from cliente_acv where length(calle) <any(select length(calle) from hotel_acv);
--Muestra las calles de los clientes cuyo nombre sea mas corte que cualqier nombre de calle de los hoteles

--Elaborar 3 sentencias de subconsultas en la cláusula HAVING.
select min(precio) from reserva_acv group by id_empleado having min(precio) > (select avg(precio) from reserva_acv);
--Muestra el precio minimo de reserva registrada por cada empleado, cuyo precio minimo sea mayor al promedio de los precios.
select min(length(apellido_paterno)) from empleado_acv group by id_agencia having min(length(apellido_paterno)) < 
(select min(length(apellido_paterno)) from cliente_acv);
-- nos muestra la longitud minima de los apellidos de los empleados de cada agencia, simepre y cuando sea menor que la longitud minima de
-- los apellidos de los clientes
select max(length(colonia)) from hotel_acv group by id_categoria having max(length(colonia)) > 
(select avg(length(colonia)) from cliente_acv);
-- muestra la longitud maxima de la colonia de cada categoria de hotel, siempre y cuando sean mayors que la longitud
--promedio de las colonias de los clientes.

--Elaborar 3 sentencias de subconsultas con el operador EXISTS.
select * from agencia_acv where not exists (select * from empleado_acv where empleado_acv.id_agencia = agencia_acv.id_agencia);
-- muestra las agencias que no tienen empleados asignados
select * from agencia_acv where exists (select * from empleado_acv where empleado_acv.id_agencia = agencia_acv.id_agencia);
-- muestra las agencias con empleados asignados
select * from categoria_acv where not exists (select * from hotel_acv where hotel_acv.id_categoria = categoria_acv.id_categoria);
-- muestra las categorias que no tienen hoteles asignados
