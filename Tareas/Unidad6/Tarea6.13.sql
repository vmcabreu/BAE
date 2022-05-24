-- Ejercicios PL 4.

-- 1) Codificar un procedimiento que permita borrar un empleado cuyo número se pasará en la llamada.

DROP PROCEDURE borrar_empleado;

DELIMITER //
CREATE PROCEDURE borrar_empleado(
  IN codigo_empleado TINYINT)
  BEGIN
  DELETE FROM empleados WHERE codigo=codigo_empleado;
  SELECT * FROM empleados WHERE codigo=codigo_empleado;
  
END //
DELIMITER ;

CALL borrar_empleado(1);

--EJEMPLO PRACTICO:
DROP PROCEDURE borrar_empleado;

DELIMITER //
CREATE PROCEDURE borrar_empleado(
  IN codigo_empleado TINYINT)
  BEGIN
  DELETE FROM PROFESORES WHERE CODIGO=codigo_empleado;
  SELECT * FROM PROFESORES WHERE CODIGO=codigo_empleado;
  
END //
DELIMITER ;

-- 2) Escribir un procedimiento que modifique la localidad de un departamento. El procedimiento recibirá como parámetros el número del departamento y la localidad nueva.

DROP PROCEDURE modificar_localidad;

DELIMITER //
CREATE PROCEDURE modificar_localidad(
  IN numero_departarmento INT,
  IN localidad_nueva VARCHAR(20))
  BEGIN
  UPDATE departamentos SET localidad=localidad_nueva WHERE ndepartamento=numero_departarmento;
END //
DELIMITER ;
