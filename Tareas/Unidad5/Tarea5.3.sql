--Un club de dicta clases de distintos deportes a sus socios. Guarda la información de sus 
--socios en una tabla llamada "socios" y las inscripciones en "inscritos".

--1- Elimine las tablas, si existen.
    DROP TABLE IF EXISTS SOCIOS;
    DROP TABLE IF EXISTS INSCRITOS;

--2- Cree las tablas socios e inscritos:
    CREATE TABLE SOCIOS(
        NUMERO INT UNSIGNED NOT NULL AUTO_INCREMENT,
        DOCUMENTO CHAR(8),
        NOMBRE VARCHAR(30),
        DOMICILIO VARCHAR(30)
    );

    CREATE TABLE INSCRITOS(
        NUMEROSOCIO INT UNSIGNED NOT NULL,
        DEPORTE VARCHAR(20) NOT NULL,
        AO YEAR NOT NULL,
        CUOTA CHAR(1)
    );
    
    ALTER TABLE SOCIOS ADD CONSTRAINT PK_SOCIOS PRIMARY KEY (NUMERO);
    ALTER TABLE INSCRITOS ADD CONSTRAINT PK_INSCRITOS PRIMARY KEY (NUMEROSOCIO, DEPORTE, AO);

    

--3- Ingrese los siguientes registros en las tablas socios e inscritos:
insert into SOCIOS values(23, '22333444', 'Juan Perez', 'Colon 123');
insert into SOCIOS values(56, '23333444', 'Ana Garcia', 'Sarmiento 984');
insert into SOCIOS values(102, '24333444', 'Hector Fuentes', 'Sucre 293');
insert into SOCIOS values(150, '25333444', 'Agustin Perez', 'Avellaneda 1234');
insert into SOCIOS values(230, '26333444', 'Maria Perez', 'Urquiza 283');
insert into SOCIOS values(231, '29333444', 'Agustin Perez', 'Urquiza 283');
insert into INSCRITOS values(23, 'tenis', '2015', 's');
insert into INSCRITOS values(23, 'tenis', '2016', 's');
insert intO INSCRITOS values(23, 'natacion', '2015', 's');
insert into INSCRITOS values(102, 'tenis', '2015', 's');
insert into INSCRITOS values(102, 'natacion', '2016', 's');

--4- El socio con documento "23333444" quiere inscribirse en "basquet" este año, pero no recuerda su número de socio. 
--Inscriba al socio en la tabla "inscritos" buscando en la tabla "socios" el número de socio a partir del número de documento:
insert into INSCRITOS (numerosocio, deporte, ao, cuota) select numero, 'tenis', '2016', 's' from SOCIOS where documento = '23333444';
--5- Intente inscribir una persona cuyo número de documento no exista en la tabla "socios":
insert into INSCRITOS (numerosocio, deporte, ao, cuota) select numero, 'tenis', '2016', 's' from SOCIOS where documento = NULL;


--6- La madre de los socios "Perez" quiere inscribir a su hijo "Agustín" en "basquet" este año, pero 
--no recuerda su número de socio ni su documento. Si se busca el número de socio a partir del nombre 
--("Agustin Perez"), la consulta retornará 2 registros, porque hay 2 socios llamados "Agustin Perez". 
--Obtendremos como resultado, la inscripción a "basquet" este año, de ambos socios. Si localizamos el 
--número de socio a partir del domicilio ("Urquiza 283"), también obtendremos 2 inscripciones, porque 
--hay 2 socios con ese domicilio. Ingrese la inscripción del socio, localizando su número de socio 
--con el nombre y domicilio:
insert into INSCRITOS (numerosocio, deporte, ao, cuota) select numero, 'basquet', '2022','n' from SOCIOS where nombre = 'Agustin Perez' and domicilio = 'Urquiza 283';


--7- La madre de los socios "Perez" quiere inscribir a ambos hijos "natacion" este año, pero no 
--recuerda sus números de socio ni sus documentos. Inscriba a ambos localizando sus números de socio 
--con el domicilio:

insert into INSCRITOS (numerosocio, deporte, ao, cuota) select numero, 'natacion', '2016', 'n' from SOCIOS where domicilio = 'Urquiza 283';

--8- Vea si las inscripciones anteriores se cargaron:
select s.nombre, i.deporte, i.ao from SOCIOS as s join INSCRITOS as i on s.numero = i.numerosocio;
 
