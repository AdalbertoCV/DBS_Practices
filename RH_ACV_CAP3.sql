 --Adalberto Cerrillo Vazquez - 5B
 --Ejercicios Capitulo 3
 
 --A) Elabore las siguientes consultas sobre la base de datos RH:
 
 --1. Mencione la diferencia que hay entre las funciones SINGLE-ROW y MULTIPLE-ROW.

--R: Las funciones SINLGE-ROW, devuelven un resultado para cada registro que se trabaja, mientras las
-- MULTIPLE-ROW devuelve un resultado para un conjunto de registros a la vez.

--2. Menciones 5 características de una función SINGLE-ROW.

--R: Acepta argumentos y devuelve un valor.
     -- devuelve un resultado por registro
     -- actua sobre el registro que se esta devolviendo
     -- Puede modificar el tipo de datos
     -- acepta argumentos que pueden ser columnas o expresiones.
     
--3. Las funciones SINGLE-ROW se pueden clasificar en:
--R: Generales, numericas, caracteres, de fechas y de conversion

--4. Escriba una sentencia SELECT que muestre el siguiente resultado:

select 'The job id for ' || upper(apellido) || ' es ' || id_empleo as "EMPLOYEE_DETAILS" from empleado_acv;

--5. Explique la diferencia que hay entre las siguientes consultas:

--La diferencia es que los datos son sensibles a las mayusculas/minusculas, por tanto, en una se busca el dato en minusculas
--sin convertirlo, en la segunda sentencia primero se convierte a minusculas y despues se compara.. es por eso que se encuentra el registro.

--6. Elabore una sentencia SELECT que muestre el siguiente resultado (Solo muestra a los empleados que su last_name termina con la letra “n”):
select id_empleado, concat(nombre,apellido) as "Nombre", length(apellido), INSTR(apellido,'a') as "contains a?"
from empleado_acv where apellido like '%n';

--7. Explique el comportamiento de las siguientes sentencias:

select initcap(21/7) from dual;
--Muestra el resultado de la division
select initcap(SYSDATE) from dual;
--Muestra la fecha del sistema
select initcap('init cap or init_cap or init%cap') from dual;
--Muestra el mensaje escrito pero pone todas las primeras letras en mayuscula

--8. Elabore una sentencia SELECT que muestre un listado de países cuyo nombre tenga una longitud mínima de 10 caracteres.

select nombre_pais, length(nombre_pais) from pais_acv where length(nombre_pais) >= 10;

--9. Explique el comportamiento de las siguientes sentencias:

select lpad(1000+200.55,14,'*') from dual;
-- Rellena la consulta por la parte izquierda con la cantidad indicada y la cadena indicada
select rpad(1000+200.55,14,'*') from dual;
-- Rellena la consulta por la parte derecha con la cantidad indicada y la cadena indicada
select lpad(sysdate,14,'*') from dual;
-- Rellena la consulta con la fecha actual, la cantidad total indicada y la cadena indicada por la izquierda
select rpad(sysdate,14,'*') from dual;
-- Rellena la consulta con la fecha actual, la cantidad total indicada y la cadena indicada por la derecha

--10. Explique el comportamiento de las siguientes sentencias:

select trim(trailing 'e' from 1+2.14||' is a pie') from dual;
-- Corta la letra e de la cadena
select trim(both '*' from '*******Hidden*******') from dual;
-- Corta todos los asteriscos de la cadena
select trim(1 from sysdate) from dual;
-- Si el dia o el año contienen unos en los extremos los corta.

--11. Explique el comportamiento de las siguientes sentencias:

select replace('1#3#5#7#9#','#','->') from dual;
-- reemplaza todos los gatos con la flecha
select replace('1#3#5#7#9#','#') from dual;
-- Elimina todos los gatos de la cadena

--12. Explique el comportamiento de las siguientes sentencias:

select round(1601.916718,1) from dual;
-- redondea el numero a solo un decimal
select round(1601.916718,2) from dual;
-- redondea el numero a dos decimales
select round(1601.916718,-3) from dual;
-- recorre el punto 3 decimales y lo redondea
select round(1601.916718) from dual;
--redondea el numero al entero

--13. Explique el comportamiento de las siguientes sentencias:

select trunc(1601.916718,1) from dual;
-- corta el numero a solo un decimal sin redondear
select trunc(1601.916718,2) from dual;
-- corta el numero a dos decimales sin redondear
select trunc(1601.916718,-3) from dual;
-- recorre el numero tres decimales y lo corta sin redondear
select trunc(1601.916718) from dual;
-- corta el numero al entero sin redondear

--14. Explique el comportamiento de las siguientes sentencias:

select mod(6,2)from dual;
-- obtiene el resto entre 6 y 2 (0)
select mod(5,3)from dual;
-- obtiene el resto entre 5 y 3 (2)
select mod(7,35)from dual;
-- obtiene el resto entre 7 y 35 (7)
select mod(5.2,3)from dual;
-- obtiene el resto entre 5.2 y 3 (2.2)

--15. Interprete el formato RR y el formato YY para cada ejemplo (llenar cada espacio en blanco con el año en 4 dígitos (ej. 1995) según corresponda).

----||Current Year|| Specified Date || RR Format || YY Format ||------------
----------------------------------------------------------------------------
----||  1994      || 27-OCT-95      ||  1995     ||  1995     ||------------
----------------------------------------------------------------------------
----||  1994      || 27-OCT-17      ||  2017     ||  1917     ||------------
----------------------------------------------------------------------------
----||  2001      || 27-OCT-17      ||  2017     ||  2017     ||------------
----------------------------------------------------------------------------
----||  2048      || 27-OCT-52      ||  2052     ||  1952     ||------------
----------------------------------------------------------------------------
----||  2051      || 27-OCT-47      ||  2047     ||  2047


--16. Elabore una sentencia SELECT que muestre el siguiente resultado

select id_empleado,fecha_contratacion, (sysdate-fecha_contratacion) as "Tenure",
add_months(fecha_contratacion,6) as "Review", next_day(fecha_contratacion, 'VIERNES') as "Next Day",
last_day(fecha_contratacion) as "Last Day" from empleado_acv;

--17. Elabore una sentencia SELECT que muestre el siguiente resultado.

select id_empleado, fecha_contratacion, round(fecha_contratacion, 'MONTH'),trunc(fecha_contratacion, 'MONTH') from empleado_acv;