--DATOS
CREATE DATABASE Hospital_BD 

USE Hospital_BD

CREATE TABLE Dept
(
	Dept_No INT NOT NULL,
	DNombre VARCHAR(50) NULL,
	Loc  VARCHAR(50) NULL
);

CREATE TABLE Emp
(
	Emp_No INT NOT NULL,
	Apellido VARCHAR(50) NULL,
	Oficio VARCHAR(50) NULL,
	Dir INT NULL,
	Fecha_Alt DATE NULL,
	Salario NUMERIC(9,2) NULL,
	Comision NUMERIC(9,2) NULL,
	Dept_No INT NULL
);

CREATE TABLE Hospital
(
	Hospital_Cod INT  NOT NULL,
	Nombre VARCHAR(50) NULL,
	Direccion VARCHAR(50) NULL,
	Telefono VARCHAR(50) NULL,
	Num_Cama INT  NULL
);

CREATE TABLE Doctor
(
	Doctor_No INT NOT NULL,
	Hospital_Cod INT NOT NULL,
	Apellido VARCHAR(50) NULL,
	Especialidad VARCHAR(50) NULL
);

CREATE TABLE Sala
(
	Sala_Cod INT NOT NULL,	
	Hospital_Cod INT NOT NULL,
	Nombre VARCHAR(50) NULL,
	Num_Cama INT NULL
);

CREATE TABLE Plantilla
(
	Empleado_No INT  NOT NULL,
	Sala_Cod INT NOT NULL,
	Hospital_Cod INT NOT NULL,
	Apellido VARCHAR(50) NULL,
	Funcion VARCHAR(50) NULL,
	T VARCHAR(15) NULL,
	Salario NUMERIC(9,2) NULL
);

CREATE TABLE Enfermo
(
	Inscripcion INT  NOT NULL,
	Apellido VARCHAR(50) NULL,
	Direccion VARCHAR(50) NULL,
	Fecha_Nac VARCHAR(50) NULL,
	S VARCHAR(2) NULL,
	NSS INT NULL
);	

INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(10,'CONTABILIDAD','ELCHE');
INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(20,'INVESTIGACION','MADRID');
INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(30,'VENTAS','BARCELONA');
INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(40,'PRODUCCION','SalaMANCA');

INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)
VALUES
(7369,'SANCHEZ','EMPLEADO',7902,'1980-12-17',10400,0,20),
(7499,'ARROYO','VENDEDOR',7698,'1981-02-22',208000,39000,30),
(7521,'Sala','VENDEDOR',689,'1981-02-22',162500,65000,30),
(7566,'JIMENEZ','DIRECTOR',7839,'1981-04-02',386750,0,20),
(7654,'MARTIN','VENDEDOR',7698,'1981-09-28',182000,182000,30),
(7698,'NEGRO','DIRECTOR',7839,'1981-05-01',370500,0,30),
(7782,'CEREZO','DIRECTOR',7839,'1981-06-09',318500,0,10),
(7788,'NINO','ANALISTA',7566,'1987-03-30',390000,0,20),
(7839,'REY','PRESIDENTE',0,'1981-11-17',650000,0,10),
(7844,'TOVAR','VENDEDOR',7698,'1981-09-08',195000,0,30),
(7876,'ALONSO','EMPLEADO',7788,'1987-05-03',143000,0,20),
(7900,'JIMENO','EMPLEADO',7698,'1981-12-03',123500,0,30),
(7902,'FERNANDEZ','ANALISTA',7566,'1981-12-03',390000,0,20),
(7934,'MU�OZ','EMPLEADO',7782,'1982-06-23',169000,0,10),
(7119,'SERRA','DIRECTOR',7839,'1983-11-19',225000,39000,20),
(7322,'GARCIA','EMPLEADO',7119,'1982-10-12',129000,0,20);

INSERT INTO Hospital(Hospital_Cod,Nombre,Direccion,Telefono, Num_Cama) VALUES(19,'Provincial','O Donell 50','964-4256',502);
INSERT INTO Hospital(Hospital_Cod,Nombre,Direccion,Telefono, Num_Cama) VALUES(18,'General','Atocha s/n','595-3111',987);
INSERT INTO Hospital(Hospital_Cod,Nombre,Direccion,Telefono, Num_Cama) VALUES(22,'La Paz','Castellana 1000','923-5411',412);
INSERT INTO Hospital(Hospital_Cod,Nombre,Direccion,Telefono, Num_Cama) VALUES(45,'San Carlos','Ciudad Universitaria','597-1500',845);

INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES(22,386,'Cabeza D.','Psiquiatria');
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES(22,398,'Best D.','Urologia');
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES(19,435,'L�pez A.','Cardiologia');
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES(22,453,'Galo D.','Pediatria');
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES(45,522,'Adams C.','Neurologia');
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES(18,585,'Miller G.','Ginecologia');
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES(45,607,'Chuki P.','Pediatria');
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES(18,982,'Cajal R.','Cardiologia');

INSERT INTO Sala VALUES(1,22,'Recuperacion',10);
INSERT INTO Sala VALUES(1,45,'Recuperacion',15);
INSERT INTO Sala VALUES(2,22,'Maternidad',34);
INSERT INTO Sala VALUES(2,45,'Maternidad',24);
INSERT INTO Sala VALUES(3,19,'Cuidados Intensivos',21);
INSERT INTO Sala VALUES(3,18,'Cuidados Intensivos',10);
INSERT INTO Sala VALUES(4,18,'Cardiologia',53);
INSERT INTO Sala VALUES(4,45,'Cardiologia',55);
INSERT INTO Sala VALUES(6,19,'Psiquiatricos',67);
INSERT INTO Sala VALUES(6,22,'Psiquiatricos',118);

INSERT INTO Plantilla(Hospital_Cod,Sala_Cod,Empleado_No,Apellido, Funcion, T, Salario)
VALUES
(22,6,1009,'Higueras D.','Enfermera','T',200500),
(45,4,1280,'Amigo R.','Interino','N',221000),
(19,6,3106,'Hernandez','Enfermero','T',275000),
(19,6,3754,'Diaz B.','Enfermera','T',226200),
(22,1,6065,'Rivera G.','Enfermera','N',162600),
(18,4,6357,'Karplus W.','Interino','T',337900),
(22,1,7379,'Carlos R.','Enfermera','T',211900),
(22,6,8422,'Bocina G.','Enfermero','M',183800),
(45,1,8526,'Frank H.','Enfermera','T',252200),
(22,2,9901,'Nunez C.','Interino','M',221000);

INSERT INTO Enfermo(Inscripcion,Apellido,Direccion,Fecha_Nac,S,NSS)
VALUES
(10995,'Lagu�a M.','Goya 20','16-may-56','M',280862422),
(14024,'Fern�ndez M.','Recoletos 50','21-may-60','F',284991452),
(18004,'Serrano V.','Alcala 12','23-jun-67','F',321790059),
(36658,'Domin S.','Mayor 71','01-ene-42','M',160654471),
(38702,'Neal R.','Orense 11','18-jun-40','F',380010217),
(39217,'Cervantes M.','Peran 38','29-feb-52','M',440294390),
(59076,'Miller B.','Lopez de Hoyos 2','16-sep-45','F',311969044),
(63827,'Ruiz P.','Ezquerdo 103','26-dic-80','M',100973253),
(64823,'Fraiser A.','Soto 3','10-jul-80','F',285201776),
(74835,'Benitez E.','Argentina','05-oct-57','M',154811767);


--1
DROP TRIGGER borrarsala;

DELIMITER //
CREATE TRIGGER borrarsala BEFORE DELETE ON Sala
FOR EACH ROW
BEGIN
-- Usa este
DELETE FROM Plantilla WHERE Plantilla.Sala_Cod=old.Sala_Cod;
--
DELETE Plantilla FROM Sala JOIN Plantilla ON old.Sala_Cod=Plantilla.Sala_Cod WHERE old.Sala_Cod=Plantilla.Sala_Cod;
END //
DELIMITER ;

DELETE FROM Sala WHERE Sala_Cod=2;

SELECT * FROM Sala;
SELECT * FROM Plantilla;


--2
DROP TRIGGER update_sala;

DELIMITER //
CREATE TRIGGER update_sala AFTER UPDATE ON Sala
FOR EACH ROW
BEGIN
UPDATE Plantilla SET Plantilla.Sala_Cod=new.Sala_Cod WHERE Plantilla.Sala_Cod=old.Sala_Cod;
END //
DELIMITER ;

UPDATE Sala SET Sala_Cod=6 WHERE Sala_Cod=7;

SELECT * FROM Sala;
SELECT * FROM Plantilla;

--3
DROP TRIGGER borrar_Hospital;

DELIMITER //
CREATE TRIGGER borrar_Hospital AFTER DELETE ON Hospital
FOR EACH ROW
BEGIN
DELETE FROM Plantilla WHERE Plantilla.Hospital_Cod=old.Hospital_Cod;

DELETE FROM Doctor WHERE Doctor.Hospital_Cod=old.Hospital_Cod;

DELETE FROM Sala WHERE Sala.Hospital_Cod=old.Hospital_Cod;
END //
DELIMITER ;

DELETE FROM Hospital WHERE Hospital_Cod=18;

SELECT * FROM Hospital;
SELECT * FROM Sala;
SELECT * FROM Plantilla;
