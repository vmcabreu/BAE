-- 7) Modificar el Trigger del ejercicio 4, utilizando control de errores, si la operación es correcta, se insertará en la tabla de controltrigger la hora y campo insertado y que ha sido correcto, en caso contrario, incorrecto.

CREATE TABLE ControlTrigger(
  Fecha_Mod DATE NULL,
	Emp_No INT NOT NULL,
	Apellido VARCHAR(50) NULL,
	Oficio VARCHAR(50) NULL,
	Dir INT NULL,
	Fecha_Alt DATE NULL,
	Salario NUMERIC(9,2) NULL,
	Comision NUMERIC(9,2) NULL,
	Dept_No INT NULL);
	
	
ALTER TABLE ControlTrigger ADD chec varchar(15);



DROP TRIGGER IF EXISTS ControlBDError;

DELIMITER //
CREATE TRIGGER ControlBDError AFTER INSERT ON Emp
FOR EACH ROW
BEGIN 
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
INSERT INTO ControlTrigger VALUES(CURRENT_DATE(),new.Emp_No,new.Apellido,new.Oficio,new.Dir,new.Fecha_Alt,new.Salario,new.Comision,new.Dept_No,CURRENT_TIME(), 'Error');
END;
INSERT INTO ControlTrigger VALUES(CURRENT_DATE(),new.Emp_No,new.Apellido,new.Oficio,new.Dir,new.Fecha_Alt,new.Salario,new.Comision,new.Dept_No,CURRENT_TIME(), 'Correcto');
END //
DELIMITER ;

INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)
VALUES
(8369,'Cabrera','EMPLEADO',7922,'1990-12-17',11400,0,20);

INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)
VALUES
(8369,'Cabrera',125,7922,'1990-12-17','11400',0,20);

INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(10.5,'CONTABILIDAD','ELCHE');


-- 8) Crear un trigger que guarde los datos en la tabla controltrigger cuando se realice la baja de un empleado.


DROP TRIGGER IF EXISTS ControlTriggerBaja;

DELIMITER //
CREATE TRIGGER ControlTriggerBaja BEFORE DELETE ON Emp
FOR EACH ROW
BEGIN 
INSERT INTO ControlTrigger VALUES(CURRENT_DATE(),old.Emp_No,old.Apellido,old.Oficio,old.Dir,old.Fecha_Alt,old.Salario,old.Comision,old.Dept_No);
END //
DELIMITER ;
DELETE FROM Emp WHERE Emp_No=8369;
SELECT * FROM ControlTrigger;

-- 9) Crear un Trigger que guarde los datos en la tabla ControlTrigger cuando se relice una modificación en un empleado. Guardar la hora de la actualización en un campo aparte en la tabla ControlTrigger. (Añadir un campo).

ALTER TABLE ControlTrigger ADD Hora TIME;

DROP TRIGGER IF EXISTS ControlTriggerUpdate;

DELIMITER //
CREATE TRIGGER ControlTriggerUpdate AFTER UPDATE ON Emp
FOR EACH ROW
BEGIN 
INSERT INTO ControlTrigger VALUES(CURRENT_DATE(),new.Emp_No,new.Apellido,new.Oficio,new.Dir,new.Fecha_Alt,new.Salario,new.Comision,new.Dept_No,CURRENT_TIME());
END //
DELIMITER ;
UPDATE Emp SET Apellido='Fernandez' WHERE Emp_No=8369;
SELECT * FROM ControlTrigger;
