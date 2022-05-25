--1 Crear un Trigger para controlar la inserción de empleados, cuando insertemos un empleado se copiarán datos sobre la inserción en una tabla llamada Control_BD. Los datos que se copiarán son el Número de empleado, El usuario que está realizando la operación, la fecha y el tipo de operación. 

CREATE TABLE ControlBD(
	Emp_No INT NOT NULL,
	Usuario VARCHAR(50) NULL,
  Fecha_Mod DATE NULL,
  Operacion VARCHAR(20) NULL);

DROP TRIGGER ControlBD;

DELIMITER //
CREATE TRIGGER ControlBD AFTER INSERT ON Emp
FOR EACH ROW
BEGIN 
INSERT INTO ControlBD(Emp_No,Usuario,Fecha_Mod,Operacion) VALUES(new.Emp_No,USER(),CURRENT_DATE(),'Insercion');
END //
DELIMITER ;

INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)
VALUES
(8369,'Cabrera','EMPLEADO',7922,'1990-12-17',11400,0,20);


--2 Crear un Trigger que actue cuando se modifique la tabla hospital y sobre todas las tablas con las que esté relacionadas.
DROP TRIGGER update_Hospital;

DELIMITER //
CREATE TRIGGER update_Hospital AFTER UPDATE ON Hospital
FOR EACH ROW
BEGIN
UPDATE Plantilla SET Plantilla.Hospital_Cod=new.Hospital_Cod WHERE Plantilla.Hospital_Cod=old.Hospital_Cod;

UPDATE Doctor SET Doctor.Hospital_Cod=new.Hospital_Cod WHERE Doctor.Hospital_Cod=old.Hospital_Cod;

UPDATE Sala SET Sala.Hospital_Cod=new.Hospital_Cod WHERE Sala.Hospital_Cod=old.Hospital_Cod;
END //
DELIMITER ;

UPDATE Hospital SET Hospital_Cod=23 WHERE Hospital_Cod=22;

SELECT * FROM Hospital;
SELECT * FROM Sala;
SELECT * FROM Plantilla;


--3 Crear un Trigger en la tabla plantilla. Cuando actualicemos la tabla plantilla, debemos comprobar que el hospital que actualizamos existe, si intentamos actualizar el código de hospital, no podremos hacerlo si no existe relación con algún código de hospital. Realizar el mismo Trigger para las tablas relacionadas con Hospital.
DROP TRIGGER update_PlantillaIF;

DELIMITER //
CREATE TRIGGER update_PlantillaIF BEFORE UPDATE ON Plantilla
FOR EACH ROW
IF Hospital.Hospital_Cod IS NOT NULL THEN
BEGIN
UPDATE Plantilla SET Hospital_Cod=new.Hospital_Cod WHERE Plantilla.Hospital_Cod=old.Hospital_Cod;
END //
DELIMITER ;


DROP TRIGGER update_HospitalIF;

DELIMITER //
CREATE TRIGGER update_HospitalIF AFTER UPDATE ON Hospital
FOR EACH ROW
BEGIN
IF Hospital.Hospital_Cod IS NOT NULL THEN
UPDATE Plantilla SET Hospital_Cod=new.Hospital_Cod WHERE Plantilla.Hospital_Cod=old.Hospital_Cod;

UPDATE Doctor SET Hospital_Cod=new.Hospital_Cod WHERE Doctor.Hospital_Cod=old.Hospital_Cod;

UPDATE Sala SET Hospital_Cod=new.Hospital_Cod WHERE Sala.Hospital_Cod=old.Hospital_Cod;
END //
DELIMITER ;
