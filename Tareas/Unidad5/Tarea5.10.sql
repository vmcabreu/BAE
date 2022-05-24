--Una clínica registra los pacientes en una tabla llamada pacientes y en otra tabla denominada obrassociales almacena los datos de las obras sociales que atiende.
--1- Elimine las tablas si existen.
DROP TABLE IF EXISTS PACIENTES;
DROP TABLE IF EXISTS OBRASSOCIALES;

--2- Cree las tablas:
CREATE TABLE PACIENTES(
    DOCUMENTO CHAR(8),
    NOMBRE VARCHAR(30),
    DOMICILIO VARCHAR(30),
    CODIGOOBRASOCIAL TINYINT UNSIGNED);

CREATE TABLE OBRASSOCIALES(
    CODIGO TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    NOMBRE VARCHAR(15),
    DOMICILIO VARCHAR(30),
    PRIMARY KEY (CODIGO));
    
--3- Ingrese algunos registros:
INSERT INTO PACIENTES VALUES(22333444,'Juan Lopez','Guemes 235',1);
INSERT INTO PACIENTES VALUES(23444555,'Analia Juarez','Avellanada 367',1);
INSERT INTO PACIENTES VALUES(24555666,'Juan Lopez','Guemes 235',2);
INSERT INTO PACIENTES VALUES(25666777,'Jose Ferrero','Urquiza 312',3);
INSERT INTO PACIENTES VALUES(26777888,'Juan Lopez','Guemes 235',1);

--4- La clínica ya no atiende a pacientes de la obra social PAMI. Se quiere eliminar de la tabla obrassociales a dicha obra social y de la tabla pacientes a todos los pacientes que de PAMI:
  
  DELETE PACIENTES,OBRASSOCIALES FROM PACIENTES JOIN OBRASSOCIALES ON PACIENTES.CODIGOOBRASOCIAL=OBRASSOCIALES.CODIGO WHERE OBRASSOCIALES.NOMBRE='PAMI';


--5- Verifique las eliminaciones.
