--Una empresa almacena la información de sus empleados en dos tablas llamadas 'empleados' y 'secciones'.  
--Eliminamos las tablas, si existen:
DROP TABLE IF EXISTS EMPLEADOS;
DROP TABLE IF EXISTS SECCIONES;
--1. Creamos las tablas.
CREATE TABLE EMPLEADOS(
    CODIGO INT AUTO_INCREMENT,
    NOMBRE VARCHAR(30),
    SUELDO DECIMAL(5.2),
    PRIMARY KEY (CODIGO)
);

CREATE TABLE SECCIONES(
    LEGAJO INT AUTO_INCREMENT,
    DOCUMENTO CHAR(8),
    SEXO CHAR(1),
    APELLIDO VARCHAR(40),
    NOMBRE VARCHAR(30),
    DOMICILIO VARCHAR(30),
    SECCION INT NOT NULL,
    CANTIDADHIJOS INT,
    ESTADOCIVIL CHAR(10),
    FECHAINGRESO DATE,
    PRIMARY KEY (LEGAJO)
);

--2. Ingresamos algunos registros.
INSERT INTO EMPLEADOS VALUES(1,"Administracion",300.00);
INSERT INTO EMPLEADOS VALUES(2,"Conataduria",400.00);
INSERT INTO EMPLEADOS VALUES(3,"Sistemas",500.00);

INSERT INTO SECCIONES VALUES(1,22222222,f,"Lopez","Ana","Colon 123",1,2,"casado",1990-10-10);
INSERT INTO SECCIONES VALUES(2,23333333,m,"Lopez","Luis","Sucre 235",1,0,"soltero",1990-02-10);
INSERT INTO SECCIONES VALUES(3,24444444,m,"Garcia","Marcos","Sarmiento 1234",2,3,"divorciado",1998-07-12);
INSERT INTO SECCIONES VALUES(4,25555555,m,"Gomez","Pablo","Bulnes 321",3,2,"casado",1998-10-09);
INSERT INTO SECCIONES VALUES(5,26666666,f,"Perez","Laura","Peru 1254",3,3,"casado",2000-05-09);

--3. Eliminamos la vista 'vista_empleados' si existe.
DROP VIEW IF EXISTS VISTA_EMPLEADOS;

--4. Creamos la vista 'vista_empleados', que es resultado de una combinación en la cual se muestran 4 campos.
CREATE VIEW VISTA_EMPLEADOS AS SELECT CONCAT(APELLIDO,' ',E.NOMBRE) AS NOMBRE, SEXO, S.NOMBRE AS SECCION, CANTIDADHIJOS FROM EMPLEADOS AS E JOIN SECCIONES AS S ON CODIGO=SECCION;

--5. Vemos la información de la vista.
SELECT NOMBRE, SECCION, CANTIDADHIJOS FROM VISTA_EMPLEADOS;

--6. Realizamos una consulta a la vista como si se tratara de una tabla.
SELECT SECCION, COUNT(*) AS CANTIDAD FROM VISTA_EMPLEADOS GROUP BY SECCION;

--7. Eliminamos la vista 'vista_empleados_ingreso' si existe.
DROP VIEW IF EXISTS VISTA_EMPLEADOS_INGRESO;

--8. Creamos otra vista de 'empleados' denominada 'vista_empleados_ingreso' que almacena la cantidad de empleados por año.
CREATE VIEW VISTA_EMPLEADOS_INGRESO(FECINGRESO,CANTIDAD) AS SELECT EXTRACT(YEAR FROM FECHAINGRESO) AS FECINGRESO, COUNT(*) AS CANTIDAD FROM EMPLEADOS GROUP BY  FECINGRESO;

--9. Vemos la información que suministra la vista.
SELECT FECINGRESO, CANTIDAD FROM VISTA_EMPLEADOS_INGRESO;