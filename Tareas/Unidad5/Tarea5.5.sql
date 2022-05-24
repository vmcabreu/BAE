-- Un club de dicta clases de distintos deportes a sus socios. Guarda la información de sus socios en una tabla llamada `socios`, la de los deportes que dicta en `deportes` y las inscripciones en `inscritos`.
-- 1-Elimine las 3 tablas, si existen.
    DROP TABLE IF EXISTS SOCIOS;
    DROP TABLE IF EXISTS DEPORTES;
    DROP TABLE IF EXISTS INSCRITOS;

-- 2-Cree las tablas:
    CREATE TABLE SOCIOS(
        DOCUMENTO CHAR(8) NOT NULL,
        NOMBRE VARCHAR(30),
        DOMICILIO VARCHAR(30)
    );

    ALTER TABLE SOCIOS ADD CONSTRAINT PK_SOCIOS PRIMARY KEY (DOCUMENTO);

    CREATE TABLE DEPORTES(
        CODIGO TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
        NOMBRE VARCHAR(15),
        PROFESOR VARCHAR(30)
        PRIMARY KEY (CODIGO)
    );

    CREATE TABLE INSCRITOS(
        DOCUMENTO CHAR(8) NOT NULL,
        CODIGODEPORTE VARCHAR(20) NOT NULL,
        AO YEAR NOT NULL,
        CUOTA CHAR(1)
    );
    
    ALTER TABLE INSCRITOS ADD CONSTRAINT PK_INSCRITOS PRIMARY KEY (DOCUMENTO, CODIGODEPORTE, AO);


-- 3-Ingrese los siguientes registros para las tablas `socios`, `deportes` e `inscritos`:
    INSERT INTO SOCIOS VALUES ('22333444','Juan Perez', 'Colon 123');
    INSERT INTO SOCIOS VALUES ('23333444','Ana Garcia', 'Caseros 984');
    INSERT INTO SOCIOS VALUES ('24333444','Hector Fuentes', 'Sucre 356');
    INSERT INTO SOCIOS VALUES ('25333444','Marta Molina', 'Sarmiento 723');
    INSERT INTO DEPORTES VALUES ('1','tenis','Tadeo Jones');
    INSERT INTO DEPORTES VALUES ('2','natacion', 'Natalia Nores');
    INSERT INTO DEPORTES VALUES ('3','basquet', 'Bautista Pereyra');
    INSERT INTO DEPORTES VALUES ('4','voley', 'Bautista Pereyra');
    INSERT INTO INSCRITOS VALUES ('22333444','1','2015','s');
    INSERT INTO INSCRITOS VALUES ('22333444','1','2016','n');
    INSERT INTO INSCRITOS VALUES ('22333444','2','2015','s');
    INSERT INTO INSCRITOS VALUES ('24333444','1','2015','s');
    INSERT INTO INSCRITOS VALUES ('24333444','2','2016','s');
    INSERT INTO INSCRITOS VALUES ('25333444','1','2015','s');
    INSERT INTO INSCRITOS VALUES ('25333444','1','2016','s');
    INSERT INTO INSCRITOS VALUES ('25333444','3','2016','n');


-- 4-Se desea saber la cantidad de alumnos inscritos en cada deporte cada año, sin considerar los deportes para los cuales no hay inscritos:
    SELECT D.NOMBRE,I.AO,COUNT(I.CODIGODEPORTE) AS CANTIDAD FROM DEPORTES AS D JOIN INSCRITOS AS I ON D.CODIGO=I.CODIGODEPORTE GROUP BY D.NOMBRE,I.AO;

-- 5-El club quiere almacenar esa información en una tabla llamada `inscritospordeporteporaño`. Elimine la tabla, si existe.
    DROP TABLE IF EXISTS INSCRITOSPORDEPORTEPORANIO;

-- 6-Cree la tabla con la siguiente estructura:
    CREATE TABLE INSCRITOSPORDEPORTEPORANIO(
        DEPORTE VARCHAR(15),
        AO YEAR,
        CANTIDAD TINYINT UNSIGNED
    );

-- 7-Ingrese registros en la tabla creada anteriormente, a partir de la consulta del punto 4:
    INSERT INTO INSCRITOSPORDEPORTEPORANIO SELECT D.NOMBRE,I.AO,COUNT(I.CODIGODEPORTE) AS CANTIDAD FROM DEPORTES AS D JOIN INSCRITOS AS I ON D.CODIGO=I.CODIGODEPORTE GROUP BY D.NOMBRE,I.AO;

-- 8-Muestre el nombre del socio, el nombre del deporte y el año de inscripción de todas las inscripciones con cuota impaga:
   SELECT S.NOMBRE AS SOCIO,D.NOMBRE AS DEPORTE, I.AO FROM SOCIOS AS S, INSCRITOS AS I, DEPORTES AS D WHERE S.DOCUMENTO=I.DOCUMENTO AND I.CODIGODEPORTE=D.CODIGO AND I.CUOTA= 'n';
    
-- 9-Elimine la tabla `sociosdeudores` si existe.
    DROP TABLE IF EXISTS SOCIOSDEUDORES;

-- 10-Cree la tabla:
    CREATE TABLE SOCIOSDEUDORES(
        SOCIO VARCHAR(30),
        DEPORTE VARCHAR(15),
        AO YEAR);

-- 11-Intente ingresar en la tabla anteriormente creada los registros resultado de la consulta del punto 8, colocando los campos `socio` y `deporte` en la lista de campos a cargar:
    INSERT INTO SELECT S.NOMBRE,D.NOMBRE,I.AO FROM SOCIOS AS S, INSCRITOS AS I,DEPORTE AS D WHERE S.DOCUMENTO=I.DOCUMENTO AND I.CODIGODEPORTE=D.CODIGO AND I.CUOTA;

-- 12-Ingrese en la tabla anteriormente creada los registros resultado de la consulta del punto 8, correctamente:
    INSERT INTO SOCIOSDEUDORES   SELECT S.NOMBRE AS SOCIO,D.NOMBRE AS DEPORTE, I.AO FROM SOCIOS AS S, INSCRITOS AS I, DEPORTES AS D WHERE S.DOCUMENTO=I.DOCUMENTO AND I.CODIGODEPORTE=D.CODIGO AND I.CUOTA= 'n';

-- 13-Vea los registros de `sociosdeudores`.
    SELECT * FROM SOCIOSDEUDORES;

-- 14-Agrupe por nombre del profesor y deporte y cuente la cantidad de alumnos por profesor y deporte, considerando los deportes para los que no haya inscritos:
    SELECT D.PROFESOR,D.NOMBRE,COUNT(I.CODIGODEPORTE) FROM DEPORTES AS D LEFT JOIN INSCRITOS AS I ON I.CODIGODEPORTE=D.CODIGO GROUP BY D.PROFESOR,D.NOMBRE;

-- 15-Elimine la tabla `alumnosporprofesor` si existe.
    DROP TABLE IF EXISTS ALUMNOSPORPROFESOR;


-- 16-Cree la tabla `alumnosporprofesor`:
    CREATE TABLE ALUMNOSPORPROFESOR(
        PROFESOR VARCHAR(30),
        DEPORTE VARCHAR(15),
        CANTIDAD TINYINT UNSIGNED
    );

-- 17-Ingrese en la tabla creada en el punto anterior con el resultado de la consulta del punto 14:
    INSERT INTO ALUMNOSPORPROFESOR SELECT D.PROFESOR,D.NOMBRE,COUNT(I.CODIGODEPORTE) FROM DEPORTES AS D LEFT JOIN INSCRITOS AS I ON I.CODIGODEPORTE=D.CODIGO GROUP BY D.PROFESOR,D.NOMBRE;
 
-- 18-Muestre todos los registros de la nueva tabla.
    SHOW TABLE ALUMNOSPORPROFESOR;
