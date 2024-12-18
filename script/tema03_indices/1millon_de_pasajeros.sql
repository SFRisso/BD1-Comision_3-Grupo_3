use Pasajes_Aereos;

------------------------------ Carga masiva de datos ------------------------------

-- Comenzamos deshabilitando las restricciones temporalmente
ALTER TABLE [Pasajero] NOCHECK CONSTRAINT ALL;

-- Determinamos el proximo `id_pasajero`
DECLARE
  @StartID INT=(
	  SELECT ISNULL( MAX( id_pasajero ), 0 )+1
	  FROM [Pasajero]
  );

-- Insertamos 1 millón de filas en [Pasajero]
WITH Numbers
	 AS (
			 SELECT TOP 1000 ROW_NUMBER( ) OVER (ORDER BY (
				 SELECT NULL
			 )) AS n
			 FROM sys.objects a
			 CROSS JOIN sys.objects b
		 ),
	 PasajeroData
	 AS (
			 SELECT ROW_NUMBER( ) OVER (ORDER BY (
						SELECT NULL
					))+@StartID-1 AS id_pasajero, -- ID de inicio desde el siguiente ID disponible
					ABS( CHECKSUM( NEWID( ) )%99999999 )+1 AS dni_pasajero,          -- DNI aleatorio entre 1 y 99.999.999
					LEFT( NEWID( ), 8 ) AS nombre,                                     -- Cadena aleatoria de 8 caracteres para el nombre
					LEFT( NEWID( ), 10 ) AS apellido,                                  -- Cadena aleatoria de 10 caracteres para el apellido
					CONCAT( 'email', ROW_NUMBER( ) OVER (ORDER BY (
						SELECT NULL
					)), '@example.com' ) AS email, -- Correo electrónico único
					CONCAT( '9', RIGHT( '11'+CAST( ABS( CHECKSUM( NEWID( ) ) )%100000000 AS VARCHAR(8) ), 8 ) ) AS telefono, -- Teléfono aleatorio
					DATEADD( DAY,-1*(ABS( CHECKSUM( NEWID( ) )%18250 )), GETDATE( ) ) AS fechanac -- Fecha aleatoria en los últimos 50 años
			 FROM Numbers n1
			 CROSS JOIN Numbers n2
		 )
INSERT INTO [Pasajero](id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
	   SELECT id_pasajero,
			  dni_pasajero,
			  nombre,
			  apellido,
			  email,
			  telefono,
			  fechanac
	   FROM PasajeroData
	   WHERE id_pasajero<@StartID+1000000;  -- Límite a 1 millón de filas a partir del siguiente ID disponible

-- Volver a habilitar restricciones
ALTER TABLE [Pasajero] WITH CHECK CHECK CONSTRAINT ALL;

-- Verificamos que se hayan isertados los datos
select * from [pasajero];
select count(*) from [Pasajero];

------------------------------ Busqueda por periodo -----------------------------

SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT *
FROM [pasajero]
WHERE fechanac BETWEEN '2000-01-01' AND '2009-12-31'
ORDER BY fechanac ASC;

/* Plan de ejecucion y tiempos de respuesta:

(200013 rows affected)
Table 'Worktable'. Scan count 0, logical reads 0, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.
Table 'Pasajero'. Scan count 5, logical reads 16408, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.

 SQL Server Execution Times:
   CPU time = 546 ms,  elapsed time = 2229 ms.

*/

------------------------------ Creación del índice ------------------------------

-- Para definir un indice agrupado sobre la columna fechanac, debemos borrar el primary key de la tabla pasajero, ya que solo puede existir un indice agrupado por tabla.
-- Por lo tanto, también eliminamos las calves foráneas que estan asociadas.
ALTER TABLE [Pasaje]
DROP CONSTRAINT FK_pasaje_pasajero
;
ALTER TABLE [Pasajero] 
DROP CONSTRAINT PK_Pasajero;

-- Creamos un índice agrupado sobre la columna 'fechanac'
CREATE CLUSTERED INDEX IDX_FechaNacimiento_Pasajero ON [Pasajero](fechanac);

-- Creamos nuevamente las claves eliminadas.
ALTER TABLE [Pasajero] ADD CONSTRAINT PK_Pasajero PRIMARY KEY NONCLUSTERED (id_pasajero);

ALTER TABLE [Pasaje]
ADD CONSTRAINT FK_pasaje_pasajero
FOREIGN KEY (id_pasajero) REFERENCES [Pasajero](id_pasajero)

-- Repetimos la consulta
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT *
FROM [pasajero]
WHERE fechanac BETWEEN '2000-01-01' AND '2009-12-31'
ORDER BY fechanac ASC;

/*	Resultados de la revision del plan de ejecución y el tiempo de respuesta

(200013 rows affected)
Table 'Pasajero'. Scan count 1, logical reads 3402, physical reads 0, page server reads 0, read-ahead reads 4, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.

 SQL Server Execution Times:
   CPU time = 234 ms,  elapsed time = 2856 ms.

*/

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

------------------------------ Borrar el índice creado -----------------------------

DROP INDEX [IDX_FechaNacimiento_Pasajero]  ON Pasajero;

------------------------------ Definir otro índice ------------------------------
-- Incluir la columna fecha pero, además incluya las columnas seleccionadas y repetir la consulta anterior

ALTER TABLE [Pasaje]
DROP CONSTRAINT FK_pasaje_pasajero
;
ALTER TABLE [Pasajero] 
DROP CONSTRAINT PK_Pasajero;

-- Creamos un índice no agrupado que incluya todas las columnas de la tabla pasajero.
CREATE NONCLUSTERED INDEX IDX_ColumnasSeleccionadas_Pasajero 
ON [Pasajero](fechanac, nombre, apellido, dni_pasajero, email, telefono);

-- Creamos nuevamente las claves eliminadas.
ALTER TABLE [Pasajero] ADD CONSTRAINT PK_Pasajero PRIMARY KEY NONCLUSTERED (id_pasajero);

ALTER TABLE [Pasaje]
ADD CONSTRAINT FK_pasaje_pasajero
FOREIGN KEY (id_pasajero) REFERENCES [Pasajero](id_pasajero)

-- Repetimos la consulta
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT *
FROM [pasajero]
WHERE fechanac BETWEEN '2000-01-01' AND '2009-12-31'
ORDER BY fechanac ASC;
/*	Resultados de la revision del plan de ejecución y el tiempo de respuesta
(200013 rows affected)
Table 'Worktable'. Scan count 0, logical reads 0, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.
Table 'Pasajero'. Scan count 5, logical reads 16952, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.

 SQL Server Execution Times:
   CPU time = 359 ms,  elapsed time = 2215 ms.
*/

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

------------------------------ Conclusiones ------------------------------

/*	En base a los resultados obtenidos nos dimos cuenta que la creación de un índice agrupado en la columna 
`Fecha_nacimiento` redujo significativamente el número de lecturas lógicas necesarias entre la primer consulta
y la consulta realizada con el índice creado pasando de, "logical reads 16408" para la primer consulta a 
"logical reads 3402" para la consulta con el índice creado. También se pudo observar una mejora en los recuentos 
de escaneos, pasando de "Scan count 5" para la primer consulta, a "Scan count 1", para la consulta con el índice creado,
lo que sugiere que la consulta fue más eficiente y aprovechó mejor la estructura de los datos.
Por otro lado la inclusión de otras columnas en un índice agrupado adicional, si bien no redujo drásticamente pasando 
de "logical reads 16408" para la primer consulta a "logical reads 16952" para la consulta con inclusión de otras 
columnas, y obtenendo una igual en la cantidad de escaneos, lo que nos da como resultado que la consulta, optimizó 
el acceso a los datos que se estaban buscando, reduciendo un poco las lecturas lógicas adicionales.

Además se observó una mejora en el tiempo de CPU, comparando la primer consulta con un tiempo de "CPU time = 546 ms" y 
un tiempo de "elapsed time = 2229 ms", pasando a un tiempo de "CPU time = 234 ms" y "elapsed time = 2856 ms" para la 
consulta con un índice creado, y finalmente la última consulta con la inclusión de otras columnas, obteniendo un tiempo
de "CPU time = 359 ms" y "elapsed time = 2215 ms".

Asi que en base a las respuestas obtenidas, podemos concluir que el uso de índices agrupados puede reducir de manera 
significativa la cantidad de lecturas necesarias y optimizar el tiempo de respuesta de las consultas, 
especialmente en columnas que se utilizan frecuentemente  en las cláusulas `WHERE`.
Sin embargo, la elección de las columnas para un índice debe ser cuidadosa, ya que la inclusión de 
múltiples columnas puede no siempre traducirse en mejoras adicionales sustanciales.
*/
