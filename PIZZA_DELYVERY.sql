--1.	Consulte el nombre del cliente que más ordenes ha realizado.
select c.nombre, c.apellido, count(o.id_orden)"Numero de ordenes" from cliente_acv c join orden_acv o on 
(o.id_cliente = c.id_cliente) group by c.nombre, c.apellido having count(o.id_orden)= 
(select max(count(o.id_orden)) from cliente_acv c join orden_acv o on 
(o.id_cliente = c.id_cliente) group by c.nombre, c.apellido);
--2.	Consulte el nombre del empleado que más ordenes ha registrado.
select e.nombre, e.apellido, count(o.id_orden)"Numero de ordenes" from empleado_acv e join orden_acv o on 
(o.id_empleado_tomada= e.id_empleado) group by e.nombre, e.apellido having count(o.id_orden)= 
(select max(count(o.id_orden)) from empleado_acv e join orden_acv o on 
(o.id_empleado_tomada = e.id_empleado) group by e.nombre, e.apellido);
--3.	Consulte el nombre del empleado que más ordenes ha entregado.
select e.nombre, e.apellido, count(o.id_orden)"Numero de ordenes" from empleado_acv e join orden_acv o on 
(o.id_empleado_entrega= e.id_empleado) group by e.nombre, e.apellido having count(o.id_orden)= 
(select max(count(o.id_orden)) from empleado_acv e join orden_acv o on 
(o.id_empleado_entrega = e.id_empleado) group by e.nombre, e.apellido);
--4.	Consulte el nombre de los empleados que han registrado ordenes, pero no han entregado órdenes.
select e.nombre, e.apellido from empleado_acv e join orden_acv o on (e.id_empleado = o.id_empleado_tomada) minus
select e.nombre, e.apellido from empleado_acv e join orden_acv o on (e.id_empleado = o.id_empleado_entrega);
--5.	Consulte el id y la descripción de los vehículos que no han sido usados para entregar órdenes.
select id_vehiculo, detalles from vehiculo_acv where id_vehiculo not in (select id_vehiculo from orden_acv);
--6.	Consulte el nombre de los clientes que han realizado ordenes cuyo total es mayor al promedio.
select c.nombre, c.apellido, total from cliente_acv c join orden_acv o on (c.id_cliente = o.id_cliente)
where total > (select avg(total) from orden_acv);
--7.	Consulte el nombre del cliente con la orden con mayor total.
select c.nombre, c.apellido, total from cliente_acv c join orden_acv o on (c.id_cliente = o.id_cliente)
where total = (select max(total) from orden_acv);
--8.	Consulte el nombre del país con más clientes
select u.pais, count(c.id_cliente) "Numero de clientes" from ubicacion_acv u join cliente_acv c
on (c.id_ubicacion = u.id_ubicacion) group by u.pais having count(c.id_cliente) = 
(select max(count(c.id_cliente)) from ubicacion_acv u join cliente_acv c
on (c.id_ubicacion = u.id_ubicacion) group by u.pais);
--9.	Consulte el nombre del país con más empleados
select u.pais, count(e.id_empleado) "Numero de empleados" from ubicacion_acv u join empleado_acv e
on (e.id_ubicacion = u.id_ubicacion) group by u.pais having count(e.id_empleado) = 
(select max(count(e.id_empleado)) from ubicacion_acv u join empleado_acv e
on (e.id_ubicacion = u.id_ubicacion) group by u.pais);
--10.	Consulte el nombre del país que tenga clientes, pero no empleados.
select u.pais from ubicacion_acv u join cliente_acv c on (c.id_ubicacion = u.id_ubicacion) minus
select u.pais from ubicacion_acv u join empleado_acv e on (e.id_ubicacion = u.id_ubicacion);
--11.	Consulte el nombre de la ciudad desde donde se han entregado más órdenes.
select u.ciudad, count(o.id_empleado_entrega) "Ordenes entregadas" from ubicacion_acv u join empleado_acv e on
(e.id_ubicacion = u.id_ubicacion) join orden_acv o on (e.id_empleado = o.id_empleado_entrega) 
group by u.ciudad having count(o.id_empleado_entrega) =
(select max(count(o.id_empleado_entrega)) from ubicacion_acv u join empleado_acv e on
(e.id_ubicacion = u.id_ubicacion) join orden_acv o on (e.id_empleado = o.id_empleado_entrega) 
group by u.ciudad);
--12.	Consulte el tipo de vehículo que haya realizado una entrega en un día en específico.
select tp.descripcion from tipo_vehiculo_acv tp join vehiculo_acv v on (tp.codigo_tipo = v.codigo_tipo) 
join orden_acv o on (o.id_vehiculo = v.id_vehiculo) where fecha_entrega = '&fecha';
--13.	Consulte el nombre de los empleados que tienen estatus de entregas como ‘No entregadas’
select e.nombre, e.apellido from empleado_acv e join orden_acv o on (e.id_empleado = o.id_empleado_entrega) join
status_orden_acv so on (so.codigo_status = o.codigo_status) where so.descripcion = 'No entregada';
--14.	Consulte el nombre de los clientes que han cancelado órdenes.
select c.nombre, c.apellido from cliente_acv c join orden_acv o on (c.id_cliente = o.id_cliente) join
status_orden_acv so on (o.codigo_status = so.codigo_status) where so.descripcion = 'Cancelada';
--15.	Consulte los datos generales del tipo de base más popular.
select tb.id_tipo_base,tb.descripcion,tb.precio, count(po.id_tipo_base)"Numero de pedidos" from tipo_base_acv tb join pizzas_ordenadas_acv po on
(po.id_tipo_base = tb.id_tipo_base) join orden_acv o on (o.id_orden = po.id_orden) group by tb.id_tipo_base,tb.descripcion,tb.precio having 
count(po.id_tipo_base) = (select max(count(po.id_tipo_base)) from tipo_base_acv tb join pizzas_ordenadas_acv po on
(po.id_tipo_base = tb.id_tipo_base) join orden_acv o on (o.id_orden = po.id_orden) group by tb.id_tipo_base,tb.descripcion,tb.precio);
--16.	Consulte la ciudad de los empleados que han realizado entregas en hoverboard.
select u.ciudad from ubicacion_acv u join empleado_acv e on (e.id_ubicacion = u.id_ubicacion) join
orden_acv o on (o.id_empleado_entrega = e.id_empleado) join vehiculo_acv v on (v.id_vehiculo = o.id_vehiculo)
join tipo_vehiculo_acv tv on (tv.codigo_tipo = v.codigo_tipo) where tv.descripcion = 'Hoverboard';
--17.	Consulte todas las ordenes exceptuando las ordenes no entregadas y canceladas.
select o.* from orden_acv o join status_orden_acv so on (so.codigo_status = o.codigo_status) minus
select o.* from orden_acv o join status_orden_acv so on (so.codigo_status = o.codigo_status)
where so.descripcion in ('No entregada','Cancelada');
--18.	Consulte el país del empleado con menos órdenes.
select u.pais from ubicacion_acv u join empleado_acv e on (e.id_ubicacion = u.id_ubicacion) where 
e.nombre in (select nombre from (select e.nombre, e.apellido, count(o.id_orden)"Numero de ordenes" from empleado_acv e join orden_acv o on 
(o.id_empleado_tomada= e.id_empleado) group by e.nombre, e.apellido having count(o.id_orden)= 
(select min(count(o.id_orden)) from empleado_acv e join orden_acv o on 
(o.id_empleado_tomada = e.id_empleado) group by e.nombre, e.apellido)));
--19.	Consulte el total de extras ordenados.
select count(pe.numero_extra)"Extras ordenados" from extras_acv e join pizzas_extras_acv pe on (e.id_extra = pe.id_extra) join
pizzas_ordenadas_acv po on (po.numero_pizza = pe.numero_pizza) join orden_acv o on (o.id_orden = po.id_orden);
--20.	Consulte el total de pizzas con base tradicional ordenadas desde un país en específico.
select count(po.id_tipo_base) from tipo_base_acv tb join pizzas_ordenadas_acv po on
(po.id_tipo_base = tb.id_tipo_base) join orden_acv o on (po.id_orden = o.id_orden) join
cliente_acv c on (c.id_cliente = o.id_cliente) join ubicacion_acv u on 
(u.id_ubicacion = c.id_ubicacion) where u.pais = '&Pais' and tb.descripcion = 'Base Tipica';
--21.	Consulte el nombre de los clientes que paguen con tarjeta de crédito y de débito.
select c.nombre, c.apellido from cliente_acv c join metodos_pago_acv mp on (mp.codigo_metodo = c.codigo_metodo)
where mp.descripcion = 'Tarjeta de credito' union 
select c.nombre, c.apellido from cliente_acv c join metodos_pago_acv mp on (mp.codigo_metodo = c.codigo_metodo)
where mp.descripcion = 'Tarjeta de debito';
--22.	Consulte la cantidad de ordenes pagadas en efectivo.
select count(mp.codigo_metodo) from metodos_pago_acv mp join cliente_acv c on (c.codigo_metodo = mp.codigo_metodo)
join orden_acv o on (o.id_cliente = c.id_cliente) where mp.descripcion = 'Efectivo';
--23.	Consulte todas las ordenes excepto las pagadas con cupones de descuento.
select o.* from metodos_pago_acv mp join cliente_acv c on (c.codigo_metodo = mp.codigo_metodo)
join orden_acv o on (o.id_cliente = c.id_cliente) minus 
select o.* from metodos_pago_acv mp join cliente_acv c on (c.codigo_metodo = mp.codigo_metodo)
join orden_acv o on (o.id_cliente = c.id_cliente) where mp.descripcion = 'Cupon de descuento';
--24.	Consulte el promedio de total pagado con cada método de pago.
--25.	Consulte el promedio total pagado desde cada país.
