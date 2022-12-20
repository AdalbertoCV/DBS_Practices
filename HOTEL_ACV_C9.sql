-- CAPITULO 9
-- Adalberto Cerrillo Vazquez
       
INSERT INTO CLI VALUES (CLIENTE_ID_ACV_SEQ.NEXTVAL, 'Adal', 'Cerrillo', 'Vazquez','Villas de Guadalupe', 'Calle girasoles','4921226114');
INSERT INTO CLI VALUES (CLIENTE_ID_ACV_SEQ.NEXTVAL, 'Alexia', 'Hernandez', 'Martinez','SPAUAZ', 'Calle flores','4922221245');
INSERT INTO CLI VALUES (CLIENTE_ID_ACV_SEQ.NEXTVAL, 'Armando', 'Garay', 'Alfaro','Condesa', 'Calle magnolias','4921001212');
INSERT INTO CLI VALUES (CLIENTE_ID_ACV_SEQ.NEXTVAL, 'Michelle', 'Reyes', 'Vazquez','Minera', 'Calle tulipan','4920000000');
INSERT INTO CLI VALUES (CLIENTE_ID_ACV_SEQ.NEXTVAL, 'Juan', 'Garcia', 'Martinez','Zacatecana', 'Calle soledad','4929999999');

INSERT INTO AG VALUES (AGENCIA_ID_ACV_SEQ.NEXTVAL, 'Centro', 'Calle Bugambilias','4931120989');
INSERT INTO AG VALUES (AGENCIA_ID_ACV_SEQ.NEXTVAL, 'Bernardez', 'Calle violetas','4930091212');
INSERT INTO AG VALUES (AGENCIA_ID_ACV_SEQ.NEXTVAL, 'Colinas del padre', 'Calle Fuentes','4921451414');
INSERT INTO AG VALUES (AGENCIA_ID_ACV_SEQ.NEXTVAL, 'Lomas', 'Calle Lilis','4920010101');
INSERT INTO AG VALUES (AGENCIA_ID_ACV_SEQ.NEXTVAL, 'Las Monta�as', 'Calle de lunas','4913455544');

INSERT INTO EP VALUES (EMPLEADO_ID_ACV_SEQ.NEXTVAL, 'Carlos', 'Moreno', 'Perez','4561237890',1);
INSERT INTO EP VALUES (EMPLEADO_ID_ACV_SEQ.NEXTVAL, 'Luis', 'Cardenas', 'Lopez','3234567891',2);
INSERT INTO EP VALUES (EMPLEADO_ID_ACV_SEQ.NEXTVAL, 'Jose', 'Hernandez', 'Bernal','5546789001',3);
INSERT INTO EP VALUES (EMPLEADO_ID_ACV_SEQ.NEXTVAL, 'Javier', 'Perales', 'Rodriguez','8897767788',4);
INSERT INTO EP VALUES (EMPLEADO_ID_ACV_SEQ.NEXTVAL, 'Oliver', 'Tate', 'Gomez','2231112244',5);

INSERT INTO CT VALUES (CATEGORIA_ID_ACV_SEQ.NEXTVAL, '5 Estrellas', 16);
INSERT INTO CT VALUES (CATEGORIA_ID_ACV_SEQ.NEXTVAL, '4 Estrellas', 16);
INSERT INTO CT VALUES (CATEGORIA_ID_ACV_SEQ.NEXTVAL, '3 Estrellas', 16);
INSERT INTO CT VALUES (CATEGORIA_ID_ACV_SEQ.NEXTVAL, '2 Estrellas', 16);
INSERT INTO CT VALUES (CATEGORIA_ID_ACV_SEQ.NEXTVAL, '1 Estrella', 16);

INSERT INTO TH VALUES(TIPO_HAB_ID_ACV_SEQ.NEXTVAL,'Sencilla');
INSERT INTO TH VALUES(TIPO_HAB_ID_ACV_SEQ.NEXTVAL,'Premium');
INSERT INTO TH VALUES(TIPO_HAB_ID_ACV_SEQ.NEXTVAL,'De lujo');
INSERT INTO TH VALUES(TIPO_HAB_ID_ACV_SEQ.NEXTVAL,'Comercial');
INSERT INTO TH VALUES(TIPO_HAB_ID_ACV_SEQ.NEXTVAL,'Primera Clase');

INSERT INTO HB VALUES (HABITACION_ID_ACV_SEQ.NEXTVAL,'Habitacion 1', 1);
INSERT INTO HB VALUES (HABITACION_ID_ACV_SEQ.NEXTVAL,'Habitacion 2', 2);
INSERT INTO HB VALUES (HABITACION_ID_ACV_SEQ.NEXTVAL,'Habitacion 3', 3);
INSERT INTO HB VALUES (HABITACION_ID_ACV_SEQ.NEXTVAL,'Habitacion 4', 4);
INSERT INTO HB VALUES (HABITACION_ID_ACV_SEQ.NEXTVAL,'Habitacion 5', 5);

INSERT INTO HT VALUES (HOTEL_ID_ACV_SEQ.NEXTVAL, '23/01/93','Hotel Lion','4432125678','Centro', 'Calle Plata',1);
INSERT INTO HT VALUES (HOTEL_ID_ACV_SEQ.NEXTVAL, '21/02/96','Hotel Diamante','9983456655','Bernardez', 'Calle Palomas',2);
INSERT INTO HT VALUES (HOTEL_ID_ACV_SEQ.NEXTVAL, '13/01/98','Hotel Golden','0091123434','Lomas del pedregal', 'Calle Fauces',3);
INSERT INTO HT VALUES (HOTEL_ID_ACV_SEQ.NEXTVAL, '23/06/07','Hotel Brisa','8874443322','Las colinas', 'Calle Alamos',4);
INSERT INTO HT VALUES (HOTEL_ID_ACV_SEQ.NEXTVAL, '20/01/20','Hotel Gaviota','4920033211','Mercurio', 'Calle Tornasol',5);

INSERT INTO HH VALUES (1,1,1);
INSERT INTO HH VALUES (2,2,1);
INSERT INTO HH VALUES (3,3,1);
INSERT INTO HH VALUES (4,4,1);
INSERT INTO HH VALUES (5,5,1);

INSERT INTO RS VALUES (RESERVA_ID_ACV_SEQ.NEXTVAL, 1,1,1,1,'20/08/22','21/08/22',900);
INSERT INTO RS VALUES (RESERVA_ID_ACV_SEQ.NEXTVAL, 2,2,2,2,'21/08/22','22/08/22',800);
INSERT INTO RS VALUES (RESERVA_ID_ACV_SEQ.NEXTVAL, 3,3,3,3,'22/08/22','23/08/22',1100);
INSERT INTO RS VALUES (RESERVA_ID_ACV_SEQ.NEXTVAL, 4,4,4,4,'23/08/22','24/08/22',1500);
INSERT INTO RS VALUES (RESERVA_ID_ACV_SEQ.NEXTVAL, 5,5,5,5,'24/08/22','25/08/22',1000);

-----------------------------------------------------------------------------------------

commit;

-----------------------------------------------------------------------------------------
---consultando las inserciones

select * from CLI;
select * from AG;
select * from EP;
select * from CT;
select * from TH;
select * from HB;
select * from HT;
select * from HH;
select * from RS;

-----------------------------------------------------------------------------------------
--------UPDATE

UPDATE HT SET NOMBRE = 'Hotel Mexico' WHERE ID_HOTEL = 1;
UPDATE HB SET NOMBRE = 'Habitacion 100' WHERE ID_HABITACION = 2;
UPDATE EP SET APELLIDO_PATERNO = 'Hudson' WHERE ID_EMPLEADO = 1;
UPDATE EP SET APELLIDO_MATERNO = 'Phillips' WHERE ID_EMPLEADO = 2;
UPDATE AG SET COLONIA = 'Las fuentes' WHERE ID_AGENCIA = 1;

-----------------------------------------------------------------------------------------
--------DELETES

DELETE FROM RS WHERE ID_CLIENTE =1;
DELETE FROM RS WHERE ID_EMPLEADO =3;
DELETE FROM HH WHERE ID_HOTEL = 1;
DELETE FROM HT WHERE ID_HOTEL = 1;
DELETE FROM CLI WHERE ID_CLIENTE = 1;