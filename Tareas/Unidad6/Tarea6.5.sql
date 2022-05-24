-- Una empresa almacena los datos de sus empleados en una tabla llamada `empleados`.
-- 1- Eliminamos la tabla, si existe y la creamos.
DROP TABLE empleados IF EXISTS ;

CREATE TABLE empleados(
  documento CHAR(8) PRIMARY KEY NOT NULL,
  nombre VARCHAR(20),
  apellido VARCHAR(20),
  sueldo DECIMAL(6,2),
  cantidadhijos INT ,
  seccion VARCHAR (20)
 );
-- 2- Ingrese algunos registros.
 INSERT INTO empleados VALUES('22222222','Juan','Perez',300,00,2,'Contaduria');
 INSERT INTO empleados VALUES('22333333','Luis','Lopez',300,00,0,'Contaduria');
 INSERT INTO empleados VALUES ('22444444','Marta','Perez',500,00,1,'Sistemas');
 INSERT INTO empleados VALUES('22555555','Susana','Garcia',400,00,2,'Secretaria');
 INSERT INTO empleados VALUES('22666666','Jose Maria','Morales',400,00,3,'Secretaria');

-- 3- Elimine el procedimiento llamado pa_empleados_sueldo si existe:
DROP PROCEDURE pa_empleados_sueldo IF EXISTS;
-- 4- Cree un procedimiento almacenado llamado `pa_empleados_sueldo` que seleccione los nombres, apellidos y sueldos de los empleados que tengan un sueldo superior o igual al enviado como parámetro.
 delimiter //
 create procedure pa_empleados_sueldo(
   in p_sueldo decimal(6,2))
 begin
   select nombre,apellido,sueldo
     from empleados
     where sueldo>=p_sueldo;
 end //
 delimiter ;
-- 5- Ejecute el procedimiento creado anteriormente con distintos valores:


-- 6- Intente ejecute el procedimiento almacenado `pa_empleados_sueldo` sin parámetros.Muestra mensaje de error.
CALL pa_empleados_sueldo;
-- 7- Elimine el procedimiento almacenado `pa_empleados_actualizar_sueldo` si existe.
DROP PROCEDURE pa_empleados_actualizar_sueldo IF EXISTS;
-- 8- Cree un procedimiento almacenado llamado "pa_empleados_actualizar_sueldo" que actualice los 
sueldos iguales al enviado como primer parámetro con el valor enviado como segundo parámetro.
 delimiter //
 create procedure pa_empleados_actualizar_sueldo
   (in p_sueldoanterior decimal(6,2),
    in p_sueldonuevo decimal(6,2))
 begin
   update empleados set sueldo=p_sueldonuevo
     where sueldo=p_sueldoanterior;
 end //
 delimiter ;

-- 9- Ejecute el procedimiento creado anteriormente y verifique si se ha ejecutado correctamente:
 call pa_empleados_actualizar_sueldo(300, 350);
 select * from empleados;
