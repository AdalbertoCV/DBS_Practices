--- Adalberto Cerrillo Vazquez 5B
----------------Transacciones HOTEL

---Escenario 1

select * from tipo_habitacion_acv;
update tipo_habitacion_acv set descripcion='Normal' where id_tipo=1;
select * from tipo_habitacion_acv;
delete from tipo_habitacion_acv where id_tipo=2;
commit;

---Escenario 2

select * from habitacion_acv;
update habitacion_acv set nombre = 'Habitacion 2' where id_habitacion=2;
select * from habitacion_acv;
savepoint actualizado;
delete from habitacion_acv where id_habitacion= 1;
savepoint eliminado;
insert into habitacion_acv values(6,'Habitacion nueva',2);
select * from habitacion_acv;
rollback to actualizado;
rollback;
select * from habitacion_acv;

---Escenario 3

select * from agencia_acv;
update agencia_acv set colonia = 'Las orquideas' where id_agencia = 5;
select * from agencia_acv;
select * from hotel_acv.agencia_acv;
commit;
select * from hotel_acv.agencia_acv;

---Escenario 4

select * from hotel_acv;
update hotel_acv set nombre = 'Hotel Baruk' where id_hotel=3;
select * from hotel_acv.hotel_acv;
update hotel_acv.hotel_acv set nombre='Hotel Star' where id_hotel=3;
commit;
select * from hotel_acv;
select * from hotel_acv.hotel_acv;

---Escenario 5

select * from categoria_acv;
update categoria_acv set descripcion= '5 estrellas deluxe' where id_categoria = '5';
delete from categoria_acv where descripcion='Sencilla';
create table x(
   id_x number
);
rollback;
select * from categoria_acv;