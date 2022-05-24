--Una empresa almacena la información de sus empleados en dos tablas llamadas 'empleados' y 'secciones'.  
--Eliminamos las tablas, si existen:
drop table if exists empleados;
drop table if exists secciones;

--1. Creamos las tablas.
create table empleados(
    codigo int auto_increment primary key,
    nombre varchar(30),
    sueldo decimal(5,2),
);

create table empleados(
  legajo int primary key auto_increment,
  documento char(8),
  sexo char(1),
  apellido varchar(40),
  nombre varchar(30),
  domicilio varchar(30),
  seccion int not null,
  cantidadhijos int,
  estadocivil char(10),
  fechaingreso date
 );


--2. Ingresamos algunos registros.
    insert into secciones values(1,'Administracion', 300);
    insert into secciones values(2,'Contaduría', 400);
    insert into secciones values(3,'Sistemas', 500);

    insert into empleados values (1,'22222222','f','Lopez','Ana','Colon 123',1,2,'casado','1990-10-10');
    insert into empleados values(2,'23333333','m','Lopez','Luis','Sucre 235',1,0,'soltero','1990-02-10');
    insert into empleados values(3,'24444444','m','Garcia','Marcos','Sarmiento 1234',2,3,'divorciado','1998-07-12');
    insert into empleados values(4,'25555555','m','Gomez','Pablo','Bulnes 321',3,2,'casado','1998-10-09');
    insert into empleados values(5,'26666666','f','Perez','Laura','Peru 1254',3,3,'casado','2000-05-09');


--3. Eliminamos la vista 'vista_empleados' si existe.
    drop view if exists vista_empleados;

--4. Creamos la vista 'vista_empleados', que es resultado de una combinación en la cual se muestran 4 campos.
    create view vista_empleados as
    select concat(apellido,' ',e.nombre) as nombre, sexo, s.nombre as seccion, cantidadhijos from empleados as e join secciones as s on codigo=seccion;

// Sin alias

CREATE VIEW vista_empleados AS
   SELECT CONCAT(empleados.apellido,' ',empleados.nombre) AS nombre, 
         empleados.sexo,
         secciones.nombre as seccion,
         empleados.cantidadhijos
     from empleados
     join secciones on codigo=seccion;



--5. Vemos la información de la vista.
select nombre, seccion, cantidadhijos from vista_empleados;

--6. Crear una nueva vista basada en la vista "vista_empleados" que nos retorne todos los empleados que tienen hijos (la borramos si ya existía).
create view vista_empleados_con_hijos as
   select nombre, sexo, seccion, cantidadhijos from vista_empleados where cantidadhijos>0;

--7. Vemos la información que suministra la vista `vista_empleados_con_hijos`.
select * from vista_empleados_con_hijos;
