 --Adalberto Cerrillo Vazquez 5B
 --Ejercicio Capitulo I
 
 --A: Elabore las siguientes consultas sobre la base de datos HR:

--1. Explique las capacidades de la sentencia SELECT.
      --Proyeccion: Nos permite elegir solo las columnas que queremos ver en nuestra consulta.
      --Seleccion: Nos permite elegir unicamente los registros que queremos ver en nuestra consulta en base
                   --Condiciones o especificaciones
      --Union (Join): Nos permite obtener columnas de dos o mas tablas de la base de datos a la vez.

--2. ¿Cuál es la sintaxis básica de la sentencia SELECT?

--SELECT *|{[DISTINCT] columnA|expresion [alias],...} FROM tabla;

--Ejemplos

SELECT * FROM employees;
SELECT DISTINCT JOB_ID FROM employees;
SELECT salary*12 as "Anual Salary" from employees;

--3. Escriba una sentencia SELECT que calcule el salario diario de un empleado.

SELECT round(salary/30.4,1) as "Salario Diario" from employees;

--4. Escriba una sentencia SELECT para incrementar el salario diario de un empleado 5 pesos.

SELECT round(salary/30.4,1) + 5 as "Salario Diario + 5" from employees;

--5. Tomando en consideración que la comisión de un empleado es parte de su salario, escriba una sentencia que calcule su salario quincenal total (incluya su porcentaje de comisión).

SELECT round(salary/2,1) + (commission_pct/2) as "Salario quincenal + com_pct" from employees;

--6. ¿Cuáles son las 3 formas de representar un alias a una columna?, explicar las diferencias.

-- El modo AS nombreAlias: Se define expicitamente que la columna va a tomar un nuevo nombre
select commission_pct as comm from employees;
-- El modo implicito: Se define el nombre del alias sin escribir la palabra as
select commission_pct comm from employees;
-- Comillas dobles: Para evitar el case_sesnsitive e inlcuir espacios, se debe escribir el alias entre comillas dobles.
select commission_pct "Comission por ventas" from employees;

--7. Escriba una sentencia SELECT que imprima su resultado en el siguiente formato:
          --Juan Pérez tiene un salario de 3000, trabaja en el departamento 30 y su puesto es SA_REP.
select first_name || ' ' || last_name || ' tiene un salario de ' 
||salary || ', trabaja en el departamento '||department_id|| ' y su puesto es ' || job_id || '.' from employees;
--8. Escriba una sentencia SELECT que utilice el operador Q para que imprima su resultado en el siguiente formato:
          --El departamento de VENTAS está ubicado en la localidad 2300 y su jefe tiene el identificador 130.
select q'[ El departamento de ]'|| department_name || q'[ esta ubicado en la localidad ]' || location_id ||
q'[ y su jefe tiene el identificador  ]' || manager_id || q'[.]' from departments;

--9. Escriba una sentencia SELECT que imprima de forma única los identificadores de los puestos que están asignados a los empleados.
select distinct job_id from employees;
--10. Describa la estructura de las 7 tablas de la base de datos RH.

desc countries;
desc departments;
desc employees;
desc job_history;
desc jobs;
desc locations;
desc regions;