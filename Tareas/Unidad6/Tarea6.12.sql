-- Ejercicios PL 3

-- 1) Codificar un procedimiento que reciba una lista de hasta 5 números y visualice su suma.

DROP PROCEDURE suma5;

DELIMITER //
CREATE PROCEDURE suma5(
  IN n1 INT,
  IN n2 INT,
  IN n3 INT,
  IN n4 INT,
  IN n5 INT)
  BEGIN
  SELECT n1+n2+n3+n4+n5 AS suma;
END //
DELIMITER ;

-- 2) Escribir una función que devuelva solamente caracteres alfabéticos sustituyendo cualquier otro carácter por blancos a partir de una cadena que se pasará en la llamada.

DROP FUNCTION IF EXISTS alfabetico;

DELIMITER //
CREATE FUNCTION alfabetico(
  cadena VARCHAR(100))
  RETURNS VARCHAR(100)
  DETERMINISTIC
  BEGIN
  DECLARE pos INT;
  DECLARE size INT;
  DECLARE cod_Ascii INT;
  DECLARE charEnPos CHAR;
  DECLARE caracteres VARCHAR(100);
  SET caracteres='';
  SET size=CHAR_LENGTH(cadena);
  SET pos=0;
  WHILE pos <= size DO
  SET charEnPos=SUBSTR(cadena, pos, 1);  
  SET cod_Ascii=ASCII(charEnPos);
  IF cod_Ascii >= 65 AND cod_Ascii <= 90 OR cod_Ascii >= 97 AND cod_Ascii <= 122  THEN
    SET caracteres=CONCAT(caracteres,charEnPos);
    SET pos=pos+1;
  ELSE
    SET caracteres=CONCAT(caracteres,' ');
    SET pos=pos+1;
  END IF;
  END WHILE;
  RETURN caracteres;
END //
DELIMITER ;
  
SELECT alfabetico('Hola128a6c5');




-- 3) Implementar un procedimiento que reciba un importe y visualice el desglose del cambio en unidades monetarias de 1, 5, 10, 25, 50, 100, 200, 500, 1000, 2000, 5000 Ptas. en orden inverso al que aparecen aquí enumeradas.

DROP PROCEDURE cambio;

DELIMITER //
CREATE PROCEDURE cambio(
  IN importe INT)
  BEGIN
  DECLARE P5K,P1K,P500,P200,P100,P50,P25,P10,P5,P1 INT;
  IF importe >= 5000 THEN
    SET P5K=importe/5000;
    SET importe=MOD(importe,5000);
  END IF;
   IF importe >= 1000 THEN
    SET P1K=importe/1000;
    SET importe=MOD(importe,1000);
  END IF;
   IF importe >= 500 THEN
    SET P500=importe/500;
    SET importe=MOD(importe,500);
  END IF;
   IF importe >= 200 THEN
    SET P200=importe/200;
    SET importe=MOD(importe,200);
  END IF;
   IF importe >= 100 THEN
    SET P100=importe/100;
    SET importe=MOD(importe,100);
  END IF;
   IF importe >= 50 THEN
    SET P50=importe/50;
    SET importe=MOD(importe,50);
  END IF;
   IF importe >= 25 THEN
    SET P25=importe/25;
    SET importe=MOD(importe,25);
  END IF;
   IF importe >= 10 THEN
    SET P10=importe/10;
    SET importe=MOD(importe,10);
  END IF;
   IF importe >= 5 THEN
    SET P5=importe/5;
    SET importe=MOD(importe,5);
  END IF;
   IF importe >= 1 THEN
    SET P1=importe/1;
    SET importe=MOD(importe,1);
  END IF;
  SELECT P5K AS '5000 Ptas.',P1K AS '1000 Ptas.',P500 AS '500 Ptas.',P200 AS '200 Ptas.',P100 AS '100 Ptas.',P50 AS '50 Ptas.',P25 AS '25 Ptas.',P10 AS '10 Ptas.',P5 AS '5 Ptas.',P1 AS '1 Ptas.';
  
 END //
DELIMITER ;
  
CALL cambio(10250);

