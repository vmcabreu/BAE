
--Una empresa tiene registrados sus clientes en una tabla llamada `clientes`, también tiene una tabla `provincias` donde registra los nombres de las provincias.

-- 1- Elimine la tabla `clientes` y `provincias`, si existen:
DROP TABLE IF EXISTS CLIENTES;
DROP TABLE IF EXISTS PROVINCIAS;
 
-- 2- Créelas con las siguientes estructuras:
CREATE TABLE CLIENTES(
    CODIGO INT UNSIGNED NOT NULL,
    NOMBRE VARCHAR(30) NOT NULL,
    DOMICILIO VARCHAR(30),
    CIUDAD VARCHAR(20),
    CODIGOPROVINCIA TINYINT UNSIGNED,
    TELEFONO VARCHAR(11)
);

ALTER TABLE CLIENTES ADD CONSTRAINT PK_CLIENTES PRIMARY KEY (CODIGO);

CREATE TABLE PROVINCIAS(
    CODIGO TINYINT UNSIGNED NOT NULL,
    NOMBRE VARCHAR(20)
);

ALTER TABLE PROVINCIAS ADD CONSTRAINT PK_PROVINCIAS PRIMARY KEY (CODIGO);


-- 3- Ingrese algunos registros para ambas tablas:
INSERT INTO CLIENTES VALUES(1,'Lopez Marcos','Colon 111','Crdoba', 1,null);
INSERT INTO CLIENTES VALUES(2,'Perez Ana','San Martin 222','Cruz del Eje',1,'4578585');
INSERT INTO CLIENTES VALUES(3,'Garcia Juan','Rivadavia 333','Villa Maria',1,'4578445');
INSERT INTO CLIENTES VALUES(4,'Perez Luis','Sarmiento 444','Rosario',2,null);
INSERT INTO CLIENTES VALUES(5,'Pereyra Lucas','San Martin 555','Cruz del Eje',1,'4253685');
INSERT INTO CLIENTES VALUES(6,'Gomez Ines','San Martin 666','Santa Fe',2,'0345252525');
INSERT INTO CLIENTES VALUES(7,'Torres Fabiola','Alem 777','Villa del Rosario',1,'4554455');
INSERT INTO CLIENTES VALUES(8,'Lopez Carlos','Irigoyen 888','Cruz del Eje',1,null);
INSERT INTO CLIENTES VALUES(9,'Ramos Betina','San Martin 999','Cordoba',1,'4223366');
INSERT INTO CLIENTES VALUES(10,'Lopez Lucas','San Martin 1010','Posadas',4,'0457858745');
INSERT INTO PROVINCIAS VALUES(1,'Cordoba');
INSERT INTO PROVINCIAS VALUES(2,'Santa Fe');
INSERT INTO PROVINCIAS VALUES(3,'Corrientes');
INSERT INTO PROVINCIAS VALUES(4,'Misiones');
INSERT INTO PROVINCIAS VALUES(5,'Salta');
INSERT INTO PROVINCIAS VALUES(6,'Buenos Aires');
INSERT INTO PROVINCIAS VALUES(7,'Neuquen');

-- 4- La empresa quiere eliminar la tabla `provincias` y almacenar el nombre de la provincia de la cual son oriundos sus clientes en la misma tabla `clientes`.
UPDATE CLIENTES JOIN PROVINCIAS ON CLIENTES.CODIGOPROVINCIA=PROVINCIAS.CODIGO
  SET CLIENTES.CODIGOPROVINCIA=PROVINCIAS.NOMBRE;


-- 5- Altere la tabla `clientes` para que se almacene en ella el nombre de la provincia:
ALTER TABLE CLIENTES ADD PROVINCIA VARCHAR(20);
-- 6- Actualice el campo `provincia` de todos los registros de `clientes`, con el valor del campo `nombre` de la tabla `provincias` mediante un `join`:
UPDATE CLIENTES JOIN PROVINCIAS ON CLIENTES.CODIGOPROVINCIA=PROVINCIAS.CODIGO SET CLIENTES.PROVINCIA=PROVINCIAS.NOMBRE;
-- 7- Elimine el campo innecesario en `clientes` y la tabla `provincias`.
ALTER TABLE CLIENTES DROP COLUMN CODIGOPROVINCIA;

DROP TABLE IF EXISTS PROVINCIAS;

