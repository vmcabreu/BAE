-- Acutalizacion en cascada
 update libros join editoriales on libros.codigoeditorial=editoriales.codigo
  set libros.codigoeditorial=9, editoriales.codigo=9
  where editoriales.nombre='Emece';

-- Borrar registros buscando coincidencias en otras tablas (delete - join)
delete libros
  FROM libros
  left join editoriales
  on libros.codigoeditorial=editoriales.codigo
  where editoriales.codigo is null;

-- Vistas
 create view vista_empleados as
   select concat(apellido,' ',e.nombre) as nombre, 
         sexo,
         s.nombre as seccion,
         cantidadhijos
     from empleados as e
     join secciones as s on codigo=seccion;
     
     
-- Procedimientos almacenados
 create procedure pa_incrementar(
   in contador2 int,
   out contador int)
 begin
   set contador = contador + 1;
 end //
 
 call pa_incrementar (125,@contadorout);
 
 -- Funciones
 create function f_mayor(
  valor1 int,
  valor2 int) 
  returns int
  deterministic
begin 
  if valor1>valor2 then
    return valor1;
  else
    return valor2;
  end if;
end //

select f_mayor(50, 120);

-- Triggers
create trigger nombre-del-trigger
  [before / after] [insert / delete / update] 
  on nombre-de-la-tabla
  for each row
begin
 instrucciones-sql;
end

--Errores
-- Por codigo SQL ERROR 1051(32000)
DECLARE [CONTINUE|EXIT|UNDO] HANDLER FOR 1051
BEGIN
-- body of handler
END;

--Por referencia
DECLARE [CONTINUE|EXIT|UNDO] HANDLER FOR SQLSTATE '42S02'
BEGIN
-- body of handler
END;
