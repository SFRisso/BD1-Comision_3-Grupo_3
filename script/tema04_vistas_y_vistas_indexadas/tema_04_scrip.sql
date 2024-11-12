/*
	Tema: Vistas y Vistas indexadas
*/

use Pasajes_Aereos;

go

/* Creamos una vista sobre alguna tabla que permita mostrar campos de la misma*/

select *  from Pasajero

go

-- Informacíon que se podría considerar sensible: email, telefono, fechanac, dni_pasajero

create view pasajero_vista -- creamos una vista llamada pasajero_vista
as
select id_pasajero, nombre, apellido --seleccionamos sola las columnas id_pasajeros
from Pasajero;

go

select * from pasajero_vista;

go

/*Esta vista nos permite acceder unicamente a los campos seleccionados, no mostrando el resto de las columnas */
/*Por ser datos sensibles de esas columnas se refieren que son unicas*/

-- Insertamos un lote de datos sobre la vista recien creada

insert into pasajero_vista (id_pasajero, nombre, apellido)
values('juan', 'perez');

/* Msg 109, Level 15, State 1, Line 33
NO es posible insertar un registro a traves de una vista si esta no incluye todas las columnas requeridas.
Entra en conflicto con los campos obligatorios y claves foraneas*/

/* Tienen que estar todos los campos de la tabla para poder insertar registros a la tabla*/

-- 3) realizar update sobre algunos de los registros creados y volder a a verificar el resultado en la tabla

select * from Pasajero --
update pasajero_vista set nombre = 'F67C3A1D'
where id_pasajero = 1;

go

/*Verfico resultado*/
select * from pasajero_vista where id_pasajero = 1;

/*
id_pasajero  nombre     apellido	
1	1	     F67C3A1D	08BAFE3D-C
*/

-- 4) Borrar los registros insertados a traves de la vista

delete from pasajero_vista where id_pasajero = Pasajero;
go

-- 5) Crear un indice sobre de las columnas sobre la vista recien creada.
-- Para crear un indice, debemos volver a crear las vista ultilizando WITH SCHEMABINDING.
	
create view pasajero_vista WITH SCHEMABINDING --esquema fijo, se trata de una opción en SQL que vincula una vista o una funcion definida
					   --por el usuario al esquema de las tablas subyacentes, evitando que las tablas incluidad en la vista o funcion sean modificadas
					   --de manera que rompa la estructura de la vista.
as
select id_pasajero, nombre, apellido, email
from dbo.Pasajero;

/* Con esto podemos crear un indice unico agrupado en la vista.
   Convitiendo la vista en una vista indexada*/

   create unique clustered index idx_pasajero_vista_id_pasajero
   on pasajero_vista(id_pasajero);






