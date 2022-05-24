-- Un comercio guarda la información de sus ventas en una tabla llamada "facturas".

-- 1- Elimine la tabla si existe.
    DROP TABLE IF EXISTS FACTURAS;

-- 2- Cree la tabla con la siguiente estructura:
    CREATE TABLE FACTURAS(
        NUMERO INT(10) NOT NULL AUTO_INCREMENT,
        NUMEROITEM SMALLINT UNSIGNED NOT NULL,
        DESCRIPCION VARCHAR(30),
        PRECIOPORTUNIDAD DECIMAL(5.2) UNSIGNED,
        CANTIDAD TINYINT UNSIGNED,
        PRIMARY KEY (NUMEROITEM),
        PRIMARY KEY (NUMERO));

-- 3- Ingrese algunos los siguientes registros:
    INSERT INTO FACTURAS(0000000100, 1,'ESCUADRA 20CM', 2.50, 20);
    INSERT INTO FACTURAS(0000000100, 2,'ESCUADRA 50CM', 5.00, 30);
    INSERT INTO FACTURAS(0000000100, 3,'GOMA LAPIZ-TINTA', 0.35, 100);
    INSERT INTO FACTURAS(0000000102, 1,'LAPICES COLORESX6', 4.40, 50);
    INSERT INTO FACTURAS(0000000102, 2,'LAPICES COLORESX12', 8.00, 60);
    INSERT INTO FACTURAS(0000000255, 1,'LAPICES COLORESX24', 12.35, 100);
    INSERT INTO FACTURAS(0000000567, 1,'COMPAS PLASTICO', 12.00, 50);
    INSERT INTO FACTURAS(0000000567, 2,'COMPAS METAL', 18.90, 80);

--4- Se quiere guardar la siguiente información en una tabla denominada "montofacturas":
 -- + numero: número de factura,
 -- + total: total en dinero de todos los items de cada factura (precioporunidad x cantidad).
     CREATE TABLE MONTOFACTURAS (  
        SELECT NUMERO, SUM (PRECIOPORTUNIDAD*CANTIDAD) AS TOTAL FROM FACTURAS GROUP BY NUMERO;)

-- 5- Elimine la tabla "montofacturas" si existe.
    DROP TABLE IF EXISTS MONTOFACTURAS;

-- 6- Realice una consulta de la tabla "facturas", agrupando por "numero", en la cual aparezca el 
-- número de factura y el monto total de todos sus items:
    SELECT NUMERO, SUM (PRECIOPORTUNIDAD*CANTIDAD) AS TOTAL FROM FACTURAS GROUP BY NUMERO;

-- 7- Cree la tabla "montofacturas" a partir de la consulta anterior:
    CREATE TABLE MONTOFACTURAS(
        NUMERO INT(15) UNSIGNED;
        TOTAL DECIMAL(5.2) UNSIGNED;
        PRIMARY KEY (MONTOFACTURAS);
    )
    -- Creación de tabla mediante consulta
    CREATE TABLE MONTOFACTURAS (  
        SELECT NUMERO, SUM (PRECIOPORTUNIDAD*CANTIDAD) AS TOTAL FROM FACTURAS GROUP BY NUMERO;)
    
-- 8- Muestre todos los registros de la tabla "montofacturas".
    SHOW TABLE MONTOFACTURAS;

-- 9- Visualice la estructura de la nueva tabla creada.
    DESCRIBE MONTOFACTURAS;
