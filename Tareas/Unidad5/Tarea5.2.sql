--Un club dicta clases de distintos deportes a sus socios. Guarda la información de sus socios en una tabla llamada "socios", los datos de los deportes en "deportes" y las inscipciones en "inscritos".

--1- Elimine las 3 tablas, si existen.
    DROP TABLE IF EXISTS SOCIOS;
    DROP TABLE IF EXISTS DEPORTES;
    DROP TABLE IF EXISTS INSCRITOS;

--2- Cree las tablas:
    CREATE TABLE SOCIOS(
        DOCUMENTO CHAR(8) NOT NULL,
        NOMBRE VARCHAR(30) NOT NULL,
        PRIMARY KEY (DOCUMENTO));

    CREATE TABLE DEPORTES(
        CODIGO TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
        NOMBRE VARCHAR(30),
        PRIMARY KEY (CODIGO));

    CREATE TABLE INSCRITOS(
        DOCUMENTO CHAR(8) NOT NULL,
        CODIGODEPORTE TINYINT UNSIGNED NOT NULL,
        AO YEAR NOT NULL,
        CUOTA CHAR(1),
        PRIMARY KEY (DOCUMENTO),
        PRIMARY KEY (CODIGODEPORTE),
        PRIMARY KEY (AO));
        
    ALTER TABLE INSCRITOS ADD CONSTRAINT PK_INSCRITOS PRIMARY KEY (NUMEROSOCIO, DEPORTE, AO);

--3- Ingrese los siguientes registros:
    INSERT INTO SOCIOS CHAR(22333444), VARCHAR('Juan Perez');
    INSERT INTO SOCIOS CHAR(23333444), VARCHAR('Ana Garcia');
    INSERT INTO SOCIOS CHAR(24333444), VARCHAR('Hector Fuentes');
    INSERT INTO SOCIOS CHAR(25333444), VARCHAR('Marta Molina');
        ------------------------------------------------------------------------
    -- Para copiar y pegar en MySQL
    INSERT INTO SOCIOS VALUES ('22333444','Juan Perez');
    INSERT INTO SOCIOS VALUES ('23333444','Ana Garcia');
    INSERT INTO SOCIOS VALUES ('24333444','Hector Fuentes');
    INSERT INTO SOCIOS VALUES ('25333444','Marta Molina');
    ------------------------------------------------------------------------

    INSERT INTO DEPORTES TINYINT(1), VARCHAR('tenis');
    INSERT INTO DEPORTES TINYINT(2), VARCHAR('natacion');
    INSERT INTO DEPORTES TINYINT(3), VARCHAR('basquet');
    INSERT INTO DEPORTES TINYINT(4), VARCHAR('voley');
    ------------------------------------------------------------------------
    -- Para copiar y pegar en MySQL
    INSERT INTO DEPORTES VALUES ('1','tenis');
    INSERT INTO DEPORTES VALUES ('2','natacion');
    INSERT INTO DEPORTES VALUES ('3','basquet');
    INSERT INTO DEPORTES VALUES ('4','voley');
    ------------------------------------------------------------------------
    INSERT INTO INSCRITOS CHAR(22333444), TINYINT(1), YEAR(2015), CHAR(s);
    INSERT INTO INSCRITOS CHAR(22333444), TINYINT(1), YEAR(2016), CHAR(s);
    INSERT INTO INSCRITOS CHAR(22333444), TINYINT(2), YEAR(2015), CHAR(s);
    INSERT INTO INSCRITOS CHAR(24333444), TINYINT(1), YEAR(2015), CHAR(s);
    INSERT INTO INSCRITOS CHAR(24333444), TINYINT(2), YEAR(2016), CHAR(s);
    INSERT INTO INSCRITOS CHAR(25333444), TINYINT(1), YEAR(2015), CHAR(s);
    INSERT INTO INSCRITOS CHAR(25333444), TINYINT(1), YEAR(2016), CHAR(s);
    INSERT INTO INSCRITOS CHAR(25333444), TINYINT(3), YEAR(2016), CHAR(s);
    ------------------------------------------------------------------------
     -- Para copiar y pegar en MySQL
    INSERT INTO INSCRITOS VALUES ('22333444','1','2015','s');
    INSERT INTO INSCRITOS VALUES ('22333444','1','2016','s');
    INSERT INTO INSCRITOS VALUES ('22333444','2','2015','s');
    INSERT INTO INSCRITOS VALUES ('24333444','1','2015','s');
    INSERT INTO INSCRITOS VALUES ('24333444','2','2016','s');
    INSERT INTO INSCRITOS VALUES ('25333444','1','2015','s');
    INSERT INTO INSCRITOS VALUES ('25333444','1','2016','s');
    INSERT INTO INSCRITOS VALUES ('25333444','3','2016','s');

--4- El club desea saber cuántos socios se han inscrito en cada deporte cada año, considerando sólo los deportes que tienen inscripciones:
    SELECT DEPORTES.NOMBRE,INSCRITOS.AO,COUNT(*) FROM DEPORTES,INSCRITOS,SOCIOS WHERE DEPORTES.CODIGO=INSCRITOS.CODIGODEPORTE AND INSCRITOS.DOCUMENTO=SOCIOS.DOCUMENTO  GROUP BY DEPORTES.NOMBRE,INSCRITOS.AO;

--5- El club quiere almacenar esa información en una tabla. Elimine la tabla "inscritospordeporteporaño" si existe.
    DROP TABLE IF EXISTS INSCRITOSPORDEPORTEPORANIO;

--6- Cree la tabla utilizando la sentencia del punto 4:
    CREATE TABLE INSCRITOSPORDEPORTEPORANIO (
        SELECT DEPORTES.NOMBRE,INSCRITOS.AO,COUNT(*) FROM DEPORTES,INSCRITOS,SOCIOS WHERE DEPORTES.CODIGO=INSCRITOS.CODIGODEPORTE AND INSCRITOS.DOCUMENTO=SOCIOS.DOCUMENTO  GROUP BY DEPORTES.NOMBRE,INSCRITOS.AO);
        --7- Muestre todos los registros de la nueva tabla.
    SELECT * FROM INSCRITOSPORDEPORTEPORANIO;

--8- El club desea saber cuántas veces se ha inscrito un socio en algún deporte:
    SELECT S.NOMBRE,COUNT(I.DOCUMENTO) FROM SOCIOS AS S LEFT JOIN INSCRITOS AS I ON S.DOCUMENTO=I.DOCUMENTO LEFT JOIN DEPORTES AS D ON I.CODIGODEPORTE=D.CODIGO GROUP BY S.NOMBRE;

--9- Elimine la tabla "sociosdeporte" si existe.
    DROP TABLE IF EXISTS SOCIOSDEPORTE; 

--10- Guarde la información del punto 8 en una tabla, creándola a partir de esa consulta:
    CREATE TABLE SOCIOSDEPORTE(
    SELECT S.NOMBRE,COUNT(I.DOCUMENTO) FROM SOCIOS AS S LEFT JOIN INSCRITOS AS I ON S.DOCUMENTO=I.DOCUMENTO LEFT JOIN DEPORTES AS D ON I.CODIGODEPORTE=D.CODIGO GROUP BY S.NOMBRE);

