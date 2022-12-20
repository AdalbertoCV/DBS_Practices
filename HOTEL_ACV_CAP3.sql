--Adalberto Cerrillo Vazquez 5B
--Ejercicios Capitulo 3 Parte 2 (Hotel)

--B) Elabore 2 consultas sobre la base de datos “HOTEL” para cada una de las siguientes opciones:

--• LOWER
select lower(apellido_paterno) from empleado_acv;
select lower(id_tipo || nombre) as "Habitacion" from habitacion_acv;
--• UPPER
select upper(apellido_paterno || '  ' || apellido_materno) from cliente_acv;
select upper(colonia || calle) from cliente_acv;
--• INITCAP
select initcap(calle) from agencia_acv;
select initcap(nombre || ' ' || colonia || ' ' || calle) from hotel_acv;
--• CONCAT
select concat('Employee name is: ', nombre) as "Employee name" from empleado_acv;
select concat('The hotel address is: ', colonia) as "Colonia Hotel" from hotel_acv;
--• SUBSTR
select substr(nombre,1,3) as from cliente_acv;
select substr(telefono,-1) as "Last digit" from cliente_acv;
--• LENGTH
select nombre from cliente_acv where length(nombre) >5;
select colonia from agencia_acv where length(colonia) =6;
--• INSTR
select nombre, instr(nombre,'e') as "is e?" from empleado_acv;
select telefono, instr(telefono,'8') as "digit 8" from cliente_acv;
--• LPAD | RPAD
select lpad(telefono,15,'->') from empleado_acv;
select rpad(telefono,15,'<-') from empleado_acv;
select lpad(colonia,20,'¿') from agencia_acv;
select rpad(colonia,20,'?') from agencia_acv;
--• TRIM
select trim('a' from apellido_paterno) from cliente_acv;
select trim('4' from telefono) from cliente_acv;
--• REPLACE
select replace(telefono,'492','744') from cliente_acv;
select replace(apellido_paterno,'a','*') from empleado_acv;
--• ROUND
select round(precio + 1000.523412,3) from reserva_acv;
select round(precio + 1000.523412,-3) from reserva_acv;
--• TRUNC
select trunc(precio + 1000.523412,3) from reserva_acv;
select trunc(precio + 1000.523412,-3) from reserva_acv;
--• MOD
select mod(IVA,2) from categoria_acv;
select mod(precio,7) * 100 from reserva_acv;
--• ROUND PARA FECHAS
select round(fecha_construccion + 365) from hotel_acv;
select round(fecha_construccion - (365*10)) from hotel_acv;
--• TRUNC PARA FECHAS
select trunc(fecha_construccion + 365) from hotel_acv;
select trunc(fecha_construccion - (365*10)) from hotel_acv;
--• OPERADORES ARTIMETICOS CON FECHA
select sysdate-fecha_construccion from hotel_acv;
select (sysdate-fecha_construccion)/365 as "Años de existencia" from hotel_acv;
--• MONTHS_BETWEEN
select MONTHS_BETWEEN(SYSDATE, fecha_construccion) from hotel_acv;
select MONTHS_BETWEEN('01-01-80', fecha_construccion) from hotel_acv;
--• ADD_MONTHS
select add_months(fecha_construccion,6) from hotel_acv;
select add_months(fecha_construccion,-6) from hotel_acv;
--• NEXT_DAY
select next_day(fecha_construccion, 'LUNES') from hotel_acv;
select next_day(fecha_construccion, 'DOMINGO') from hotel_acv;
--• LAST_DAY
select last_day(fecha_construccion) from hotel_acv;
select last_day(fecha_construccion + 365) from hotel_acv;