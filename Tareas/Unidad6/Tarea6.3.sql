--1. Borramos las tablas `alumnos`y `profesores` si existen:.
drop if exists alumnos;
drop if exists profesores;

--2. Creamos las tablas:
create table alumnos(
    documento char(8) primary key,
    nombre varchar(30),
    nota decimal(4.2),
    codigoprofesor int,
);

create table profesores(
    codigo int primary key auto_increment,
    nombre varchar(30),
)

--3. Insertamos algunas filas en las dos tablas:
insert into alumnos values('30111111','Ana Algarbe',5.10,1);
insert into alumnos values('30222222','Bernardo Bustamante',3.20,1);
insert into alumnos values('30333333','Carolina Conte',4.50,1);
insert into alumnos values('30444444','Diana Dominguez',9.70,1);
insert into alumnos values('30555555','Fabian Fuentes',8.50,2);
insert into alumnos values('30666666','Gaston Gonzalez',9.70,2);

insert into profesores values(1,'Maria Luque');
insert into profesores values(2,'Jorge Dante');

--4. Borramos la vista si ya existe y luego la creamos:
drop if exists view vista_aprobados;
     
--5. Creamos una vista con los datos de todos los alumnos que tienen una nota mayor o igual a 7, junto con el nombre del profesor que lo calificó 
create view vista_aprobados as select documento, a.nombre as nombrealumno, p.nombre as nombreprofesor, nota, codigoprofesor from alumnos as a join profesores as p on a.codigoprofesor=p.codigo where nota>=7;

--6. Mostramos el resultado de la vista:
select * from vista_aprobados;

--7. Mediante la vista insertamos un nuevo alumno calificado por el profesor con código 1:
insert into vista_aprobados values('99999999','Rodriguez Pablo', 10, 1);
  
--8. Mostramos la vista:
select * from vista_aprobados;

--9. Consultamos la tabla base: alumnos, tenemos una nueva fila con el alumno insertado:
select * from alumnos;

--10. Modificamos la nota de un alumno aprobado mediante la vista:
update vista_aprobados set nota=10 where documento='30444444';

--11. Mostramos la tabla `alumnos`:
select * from alumnos;