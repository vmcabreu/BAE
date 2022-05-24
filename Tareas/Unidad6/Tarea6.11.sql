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

DROP PROCEDURE años_entre_fechas;

DELIMITER //
CREATE PROCEDURE años_entre_fechas(
  IN fecha1 DATE,
  IN fecha2 DATE,
  OUT años INT)
BEGIN
  if YEAR(fecha1)<YEAR(fecha2) then
      SET años=YEAR(fecha2)-YEAR(fecha1);
  else
      SET años=YEAR(fecha1)-YEAR(fecha2);
    end if;
    SELECT años;
END //
DELIMITER ;

CALL años_entre_fechas('1996-07-01','2006-07-01',@años);


-- 3) Escribir una función que, haciendo uso de la función anterior devuelva los trienios que hay entre dos fechas. (Un trienio son tres años completos).


DROP PROCEDURE trienios_entre_fechas;

DELIMITER //
CREATE PROCEDURE trienios_entre_fechas(
  IN fecha1 DATE,
  IN fecha2 DATE,
  OUT trienios INT)
BEGIN
  DECLARE num INT;
  CALL años_entre_fechas('1996-07-01','2006-07-01',num);
  SET trienios=num/3;
  SELECT trienios;
END //
DELIMITER ;
                
CALL trienios_entre_fechas('1996-07-01','2006-07-01',@años);
