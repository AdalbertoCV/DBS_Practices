---Adalberto Cerrillo Vazquez
--Ejercicio hr capitulo 9


INSERT INTO region_acv(ID_REGION, NOMBRE_REGION)
SELECT REGION_ID, REGION_NAME FROM HR.REGIONS ;

INSERT INTO pais_acv (ID_PAIS, NOMBRE_PAIS, ID_REGION)
SELECT COUNTRY_ID, COUNTRY_NAME, REGION_ID FROM HR.COUNTRIES;

INSERT INTO ubicacion_acv(ID_UBICACION, CALLE, CODIGO_POSTAL, CIUDAD, ESTADO, ID_PAIS)
SELECT LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE, COUNTRY_ID FROM HR.LOCATIONS;

INSERT INTO departamento_acv SELECT * FROM HR.DEPARTMENTS;

INSERT INTO empleado_acv SELECT * FROM HR.EMPLOYEES;

ALTER TABLE departamento_acv DROP CONSTRAINT EMP_DEP_ACV_FK;

INSERT INTO empleo_acv SELECT * FROM HR.JOBS;

INSERT INTO registro_empleo_acv SELECT * FROM HR.JOB_HISTORY;
----------------------------------------------------------------------------------------------------------
INSERT INTO REG VALUES(REGIONS_ID_SEQ_ACV.NEXTVAL,'South America');
INSERT INTO REG VALUES(REGIONS_ID_SEQ_ACV.NEXTVAL,'North America');
INSERT INTO REG VALUES(REGIONS_ID_SEQ_ACV.NEXTVAL,'America Central');
INSERT INTO REG VALUES(REGIONS_ID_SEQ_ACV.NEXTVAL,'Africa Central');
INSERT INTO REG
VALUES(REGIONS_ID_SEQ_ACV.NEXTVAL,'Oceania');
------------------------------------------------------------------------------------------------------------
INSERT INTO UB VALUES(LOCATIONS_ID_SEQ_ACV.NEXTVAL,'Calle buenavista','98612','Zacatecas','Zacatecas','MX');
INSERT INTO UB VALUES(LOCATIONS_ID_SEQ_ACV.NEXTVAL,'Calle Margaritas','90231','San Luis Potosi','San Luis Potosi','MX');
INSERT INTO UB VALUES(LOCATIONS_ID_SEQ_ACV.NEXTVAL,'Calle Gardenias','88932','Toluca','Estado de Mexico','MX');
INSERT INTO UB VALUES(LOCATIONS_ID_SEQ_ACV.NEXTVAL,'takizawa st','23512','Kyoto','Kyoto','JP');
INSERT INTO UB VALUES(LOCATIONS_ID_SEQ_ACV.NEXTVAL,'Dillon st','11112','Los Angeles','California','US');
-----------------------------------------------------------------------------------------------------------
INSERT INTO DP VALUES (DEPARTMENT_ID_SEQ_ACV.NEXTVAL, 'security',null,3000);
INSERT INTO DP VALUES (DEPARTMENT_ID_SEQ_ACV.NEXTVAL, 'online sales',null,3100);
INSERT INTO DP VALUES (DEPARTMENT_ID_SEQ_ACV.NEXTVAL, 'mantaining',null,3200);
INSERT INTO DP VALUES (DEPARTMENT_ID_SEQ_ACV.NEXTVAL, 'product aprobattion',null,3300);
INSERT INTO DP VALUES (DEPARTMENT_ID_SEQ_ACV.NEXTVAL, 'call attention',null,3400);
-----------------------------------------------------------------------------------------------------------
INSERT INTO EPDO VALUES(EMPLOYEE_ID_SEQ_ACV.NEXTVAL, 'Adal','Cerrillo','ACERRILLO','651.505.4876','22/09/20','IT_PROG', 10000,null,100,60);
INSERT INTO EPDO VALUES(EMPLOYEE_ID_SEQ_ACV.NEXTVAL, 'Alexia','Hernandez','AHERNANDEZ','652.505.4876','22/09/20','IT_PROG', 20000,null,100,60);
INSERT INTO EPDO VALUES(EMPLOYEE_ID_SEQ_ACV.NEXTVAL,'Isaac','Rivas','IRIVAS', '653.505.4876','21/09/20','IT_PROG', 15000,null,100,60);
INSERT INTO EPDO VALUES(EMPLOYEE_ID_SEQ_ACV.NEXTVAL,'Armando','Garay','AGARAY', '654.505.4876','24/09/20','IT_PROG', 10000,null,100,60);
INSERT INTO EPDO VALUES(EMPLOYEE_ID_SEQ_ACV.NEXTVAL,'Juan','Garcia','JGARCIA', '655.505.4876','27/09/20','IT_PROG', 9000,null,100,60);
-------------------------------------------------------------------------------------------------------------
COMMIT;
---consultando las inserciones

SELECT * FROM REG;
SELECT * FROM UB;
SELECT * FROM DP;
SELECT * FROM EPDO;

------------------------------------------------------------------------------------------------------------
---Updates

UPDATE DP set NOMBRE_DEPARTAMENTO ='Online Marketing' WHERE ID_DEPARTAMENTO=20;
UPDATE DP set NOMBRE_DEPARTAMENTO ='Purchaces' WHERE ID_DEPARTAMENTO=30;
UPDATE EPDO set NOMBRE = 'Stephen' where ID_EMPLEADO = 100;
UPDATE EPDO set NOMBRE = 'Erick' where ID_EMPLEADO = 112;
UPDATE REG set NOMBRE_REGION = 'Middle East' where ID_REGION = 4;

------------------------------------------------------------------------------------------------------------
---Deletes

DELETE FROM DP WHERE ID_DEPARTAMENTO = 120; 
DELETE FROM DP WHERE NOMBRE_DEPARTAMENTO = 'Construction';
DELETE FROM EPDO WHERE NOMBRE = 'Britney';
DELETE FROM EPDO WHERE APELLIDO = 'Gates';
DELETE FROM REG_EP WHERE FECHA_INICIO = '13/01/01';