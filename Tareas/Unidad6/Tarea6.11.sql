[Ejercicio anterior](https://github.com/yessicacf21/bae_yessica/blob/master/trim3/Tareas/Unidad6/Tarea6.10.sql)


-- 1) Escribir un bloque PL/SQL que haga uso de la función anterior (último ejercicios PL1).

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
  CALL devuelve_año(fechanac,@year);
  SET year=@year;
  SELECT sueldototal,inverso,year;
END //
DELIMITER ;

CALL ejemplo('Marta','1990-06-15',1500,500,@inverso,@year,@sueldototal);

-- 2) Desarrollar una función que devuelva el número de años completos que hay entre dos fechas que se pasan como argumentos.

DROP FUNCTION IF EXISTS años_entre_fechas;

DELIMITER //
CREATE FUNCTION años_entre_fechas(
  fecha1 DATE,
  fecha2 DATE)
  RETURNS INT
  DETERMINISTIC
BEGIN
  if YEAR(fecha1)<YEAR(fecha2) then
      RETURN YEAR(fecha2)-YEAR(fecha1);
  else
      RETURN YEAR(fecha1)-YEAR(fecha2);
    end if;
END //
DELIMITER ;

SELECT años_entre_fechas('1996-07-01','2006-07-01');


-- 3) Escribir una función que, haciendo uso de la función anterior devuelva los trienios que hay entre dos fechas. (Un trienio son tres años completos).


DROP FUNCTION trienios_entre_fechas;

DELIMITER //
CREATE FUNCTION trienios_entre_fechas(
  fecha1 DATE,
  fecha2 DATE)
  RETURNS INT
  DETERMINISTIC
BEGIN
  DECLARE num INT;
  DECLARE trienios INT;
  SELECT años_entre_fechas(fecha1,fecha2) INTO num;
  SET trienios=num/3;
  RETURN trienios;
END //
DELIMITER ;
                
SELECT trienios_entre_fechas('1996-07-01','2006-07-01');
