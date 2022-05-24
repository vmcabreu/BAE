-- Una empresa tiene registrados sus clientes en una tabla llamada `clientes`, también tiene una tabla `provincias` donde registra los nombres de las provincias de las cuales son oriundos los clientes.
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
    TELEFONO VARCHAR(11));


ALTER TABLE CLIENTES ADD CONSTRAINT PK_CLIENTES PRIMARY KEY (CODIGO);

CREATE TABLE PROVINCIAS(
    CODIGO TINYINT UNSIGNED NOT NULL,
    NOMBRE VARCHAR(20));

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

-- 4- Se quiere cambiar el código correspondiente a la provincia `Cordoba` por `10` y modificar todos  los códigos de provincia de los clientes de `Cordoba` en una sola sentencia:
UPDATE CLIENTES JOIN PROVINCIAS ON CLIENTES.CODIGOPROVINCIA=PROVINCIAS.CODIGO SET CLIENTES.CODIGOPROVINCIA=10, PROVINCIAS.CODIGO=10 WHERE PROVINCIAS.NOMBRE="Cordoba";

-- 5- Verifique el cambio en ambas tablas:
SHOW TABLE CLIENTES;
SHOW TABLE PROVINCIAS;
