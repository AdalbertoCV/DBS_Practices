--Adalberto Cerrillo Vazquez 5B
--Ejercicios del Capitulo 4
--HR

--1. Escriba la sentencia SELECT necesaria para que muestre el siguiente resultado.

select employee_id, SUBSTR(TO_CHAR(hire_date),4) as MONTH_HIRED from employees;

--2. Investigue y elabore un ejemplo sobre los siguientes elementos de fecha:

--SCC or C
select to_char(hire_date, 'SCC') from employees;
--imprime siempre el numero 21

--Years in dates YYYY and SYYYY
select to_char(hire_date, 'YYYY') from employees;
select to_char(hire_date, 'SYYYY') from employees;
--Muestra el año completo con los 4 digitos.

--YYY OR YY OR Y
select to_char(hire_date, 'YYY') from employees;
--Muestra los ultimos 3 digitos del año.
select to_char(hire_date, 'YY') from employees;
--Muestra los ultimos 2 digitos del año
select to_char(hire_date, 'Y') from employees;
--Muestra el ultimo digito del año.

--Y,YYY
select to_char(hire_date, 'Y,YYY') from employees;
-- muestra el año en 4 digitos pero con una coma despues del primer digito
--IYYY,IYY,IY,I
select to_char(hire_date, 'IYYY,IYY,IY,I') from employees;
-- muestra el año con 4,3,2 y 1 digito

--YEAR
select to_char(hire_date, 'YEAR') from employees;
--muestra el año en formato escrito

--BC OR AD
select to_char(hire_date, 'BC') from employees;
--Imprime siempre DC


--B.C. OR A.D.
select to_char(hire_date, 'B.C.') from employees;
--Imprime siempre DC

--Q
select to_char(hire_date, 'Q') from employees;

--MM
select to_char(hire_date, 'MM') from employees;
--nos muestra el mes en formato numerico

--MONTH
select to_char(hire_date, 'MONTH') from employees;
--nos muestra el mes en formato escrito

--MON
select to_char(hire_date, 'MON') from employees;
--nos muestra eo mes en formato escrito abreviado en 3 letras

--WW
select to_char(hire_date, 'WW') from employees;

--DD
select to_char(hire_date, 'DD') from employees;
--nos muestra el dia en formato numerico

--DAY
select to_char(hire_date, 'DAY') from employees;
--nos muestra el dia en formato escrito

--DY
select to_char(hire_date, 'DY') from employees;
--nos muestra el dia en el formato escrito abreviado en 3 letras

--J
select to_char(hire_date, 'J') from employees;

--IW
select to_char(hire_date, 'IW') from employees;

--3. Escriba la sentencia SELECT necesaria para que muestre el siguiente resultado.
select last_name, to_char(hire_date,'ddspth') || ' of ' ||to_char(hire_date,'month YYYY HH24:MI:SS') from employees;

--4. ¿En qué consiste el modificador fm?, Elabore un ejemplo.
--Sirve como un conmutador para suprimir los espacios en blanco de los formatos y los ceros iniciales

select to_char(hire_date,'fmmonth YYYY HH24:MI:SS') from employees;

--5. ¿En qué consiste el modificador fx?, Elabore un ejemplo.
--Compara las coincidencias exactas entre el argumento char y la funcion to_date
select to_date(hire_date,'fxdd/mm/yy') from employees;

--6. Explique el resultado de la siguiente consulta:
select last_name, hire_date from employees where hire_date = to_date('May 24, 1999','fxMonth DD, YYYY');
-- Da error porque el formato del mes no coincide por el modificador fx

--7. Escriba la sentencia SELECT necesaria para mostrar la fecha y hora actual bajo el siguiente formato: 
--Hoy es: Martes 11 de Octubre de 2022 y son las: 11:50:00 AM.
select 'Hoy es: '||to_char(sysdate,'fmDay DD') || ' de '|| to_char(sysdate,'fmMonth')||
' de ' ||to_char(sysdate,'fmYYYY') || ' y son las ' || to_char(sysdate,'fmHH:MM:SS PM') from dual;

--8. Escriba la Sentencias SELECT para resolver el siguiente problema:
select hire_date, to_char(add_months(hire_date,6),'fmDay, Month ddth, YYYY') from employees order by hire_date;

--9. Explique para que se utilizan las funciones NVL, NVL2, NULLIF y COALESCE y haga un ejemplo de cada una usando la tabla dual.

--NVL nos sirve para cambiar el valor para cuando se encuentra un valor null
select nvl(null,10) from dual;
--NVL2 nos sirve para cambiar el valor de un nulo o poner otro valor en caso de no encontrarse
select nvl2(null,0,10) from dual;
select nvl2('No null',0,10) from dual;
--NULLIF nos ayuda a hacer null un valor en caso de que dos valores sean iguales
select nullif(6,6) from dual;
select nullif(2,6) from dual;
--COALESCE nos sirve para buscar un valor no nulo entre una serie de n valores, si no se encuentra se regresa null
select coalesce(null,null,null,null,'Hello World') from dual;

--10. Escriba la sentencia SELECT necesaria para que muestre el siguiente resultado.
select last_name, salary, commission_pct,
case when commission_pct is null then salary + 2000
                     else salary + (salary*commission_pct)
                     end "New Salary" from employees;

--11. Usando la función DECODE resuelva el siguiente ejercicio
SELECT last_name, salary,
DECODE (TRUNC(salary/2000, 0),
0, 0.00,
1, 0.09,
2, 0.20,
3, 0.30,
4, 0.40,
5, 0.42,
6, 0.44,
0.45) TAX_RATE
FROM employees;

--12. Escriba una sentencia SELECT que muestre SALARIO_BAJO si gana menos de 5000, SALARIO MEDIO si gana 5000 
--o más y menos de 10000, SALARIO ALTO si gana 10000 o más.

select last_name, salary, 
DECODE (TRUNC(salary/5000, 0),
0, 'Salario Bajo',
1, 'Salario Medio',
'Salario Alto') as "Tipo Salario"
FROM employees;

--13. Elabore una sentencia SELECT que muestre los datos generales y el nivel del salario que le corresponde a cada empleado
--según su salario de acuerdo con la siguiente tabla:
        
select first_name,last_name,email,
DECODE (TRUNC(salary/3000, 0),
0, 'A',
1, 'B',
2, 'C',
3, 'D',
4, 'D',
5, 'E',
6, 'E',
7, 'E',
'F') NIVEL
FROM employees;