--- Adalberto Cerrillo Vazquez 5B
----------------Transacciones RH

---Escenario 1

SELECT * FROM pais_acv;
UPDATE pais_acv set nombre_pais = 'Nueva Guinea' where id_pais='NG';
SELECT * FROM pais_acv;
DELETE FROM pais_acv where id_pais='ZW';
commit;

---Escenario 2

SELECT * FROM empleado_acv;
UPDATE empleado_acv set apellido = 'Curry' where id_empleado=100;
SELECT * FROM empleado_acv;
savepoint actualizacion;
delete from empleado_acv where id_empleado = 211;
SELECT * FROM empleado_acv;
savepoint eliminado;
insert into empleado_acv values (EMPLOYEE_ID_SEQ_ACV.NEXTVAL, 'Angel','Garcia','Agarc','651.505.4176','22/09/20','IT_PROG', 10000,null,100,60);
SELECT * FROM empleado_acv;
rollback to eliminado;
SELECT * FROM empleado_acv;
rollback;
SELECT * FROM empleado_acv;

---Escenario 3

SELECT * FROM region_acv;
UPDATE region_acv set nombre_region='America' where id_region=2;
SELECT * FROM region_acv;
select * from RH_ACV.region_acv;
commit;
select * from RH_ACV.region_acv;

---Escenario 4

select * from departamento_acv;
update departamento_acv set nombre_departamento = 'Admin' where id_departamento=10;
select * from RH_ACV.departamento_acv;
update RH_ACV.departamento_acv set nombre_departamento='Admin' where id_departamento=10;
commit;
select * from departamento_acv;

---Escenario 5

select * from empleo_acv;
update empleo_acv set nombre_empleo= 'CEO' where id_empleo = 'AD_PRES';
delete from empleo_acv where salario_maximo=6000;
create table x(
   id_x number
);
rollback;
select * from empleo_acv;