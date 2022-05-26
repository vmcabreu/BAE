--1) Escribir un procedimiento que reciba dos números y visualice su suma.

DELIMITER //
CREATE PROCEDURE suma(
  IN numero1 INT,
  IN numero2 INT,
  OUT resultado INT)
BEGIN
SET resultado=numero1+numero2;
SELECT resultado;
END //
DELIMITER ;

CALL suma(5,6,@resultado);

--2) Codificar un procedimiento que reciba una cadena y la visualice al revés.

DELIMITER //
CREATE PROCEDURE cadena_inversa(
  IN cadena VARCHAR(20),
  OUT inversa VARCHAR(20))
BEGIN
  SET inversa=REVERSE(cadena);
  SELECT inversa;
END //
DELIMITER ;

CALL cadena_inversa('Hola',@inversa);


--3) Escribir una función que reciba una fecha y devuelva el año, en número, correspondiente a esa fecha.

DROP FUNCTION IF EXISTS devuelve_año;

DELIMITER //
CREATE FUNCTION devuelve_año(
  fecha DATE)
  RETURNS INT
  DETERMINISTIC
BEGIN
  RETURN YEAR(fecha);
END //
DELIMITER ;

SELECT devuelve_año("2017-06-15");

--4) Escribir un bloque PL/SQL que haga uso de la función anterior.


DROP PROCEDURE ejemplo;

DELIMITER //
CREATE PROCEDURE ejemplo(
  IN nombre VARCHAR(20),
  IN fechanac DATE,
  IN sueldo INT,
  IN propina INT,
  OUT inverso VARCHAR(20),
  OUT year INT,
  OUT sueldototal INT)
BEGIN
  CALL suma(sueldo,propina,@resultado);
  SET sueldototal=@resultado;
  CALL cadena_inversa(nombre,@inversa);
  SET inverso=@inversa;
  SELECT devuelve_año(fechanac) INTO year;
  SELECT sueldototal,inverso,year;
END //
DELIMITER ;

CALL ejemplo('Marta','1990-06-15',1500,500,@inverso,@year,@sueldototal);
