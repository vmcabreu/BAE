--1
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS provincias;


CREATE TABLE clientes(
    codigo int unsigned auto_increment,
    nombre VARCHAR(30) NOT NULL,
    domicilio VARCHAR(30),
    ciudad VARCHAR(20),
    codigoprovincia tinyint,
    telefono VARCHAR(11),
    PRIMARY KEY(codigo)
);

CREATE TABLE provincias(
    codigo tinyint unsigned auto_increment,
    nombre VARCHAR(20),
    PRIMARY KEY(codigo)
);

--2
INSERT INTO clientes VALUES(1,'Lopez Marcos','Colon 111','Cordoba',1,null);
INSERT INTO clientes VALUES(2,'Perez Ana','San Martin 222','Cruz del Eje',1,'4578585');
INSERT INTO clientes VALUES(3,'Garcia Juan','Rivadavia 333','Villa Maria',1,'4578445');
INSERT INTO clientes VALUES(4,'Perez Luis','Sarmiento 444','Rosario',2,null);
INSERT INTO clientes VALUES(5,'Pereyra Lucas','San Martin 555','Cruz del Eje',1,'4253685');
INSERT INTO clientes VALUES(6,'Gomez Ines','San Martin 666','Santa Fe',2,'0345252525');
INSERT INTO clientes VALUES(7,'Torres Fabiola','Alem 777','Villa del Rosario',1,'4554455');
INSERT INTO clientes VALUES(8,'Lopez Carlos','Irgoyen 888','Cruz del Eje',1,null);
INSERT INTO clientes VALUES(9,'Ramos Betina','San Martin 999','Cordoba',1,'4223366');
INSERT INTO clientes VALUES(10,'Lopez Lucas','San Martin 1010','Posadas',4,'0457858745');


INSERT INTO provincias VALUES(1,'Cordoba');
INSERT INTO provincias VALUES(2,'Santa Fe');
INSERT INTO provincias VALUES(3,'Corrientes');
INSERT INTO provincias VALUES(4,'Misiones');
INSERT INTO provincias VALUES(5,'Salta');
INSERT INTO provincias VALUES(6,'Buenos Aires');
INSERT INTO provincias VALUES(7,'Neuquen');

--3

DELIMITER //
CREATE PROCEDURE pa_cantidadclientes3(
    IN p_provincia1 VARCHAR(20),
    IN p_provincia2 VARCHAR(20)
)
BEGIN
  DECLARE canti1,canti2 INT;

  SELECT COUNT(clientes.codigo) INTO canti1 
  FROM clientes 
  INNER JOIN provincias ON clientes.codigoprovincia=provincias.codigo 
  WHERE provincias.nombre=p_provincia1;

  SELECT COUNT(clientes.codigo) INTO canti2 
  FROM clientes  
  INNER JOIN provincias ON clientes.codigoprovincia=provincias.codigo 
  WHERE provincias.nombre=p_provincia2;

CASE
WHEN canti1 > canti2 THEN
SELECT p_provincia1 AS PROVINCIA,canti1 AS CLIENTES;
WHEN canti1 < canti2 THEN
SELECT p_provincia2 AS PROVINCIA,canti2 AS CLIENTES;
ELSE
SELECT p_provincia1 AS PROVINCIA1,p_provincia2 AS PROVINCIA2,canti2 AS CLIENTES;
END CASE;
END //

DELIMITER ;

--4
CALL pa_cantidadclientes3('Cordoba','Santa Fe');
