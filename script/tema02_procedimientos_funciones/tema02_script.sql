USE Pasajes_Aereos;
GO
----------------------------------
/*1)Creacion de PROCEDIMIENTOS ALAMACENADOS*/
----------------------------------

--Procedmiento  INSERT INTO en la tabla Aerolinea
-- =============================================
-- Nombre de Procedimiento: InsertIntoAerolinea
-- Descripción: Ingresa un registro a la tabla Aerolinea
-- Parametros:
--   @id INT - id de la aerolinea (clave primaria)
--   @nombre NVARCHAR(100) - nombre de la Aerolinea
-- =============================================
CREATE PROCEDURE InsertIntoAerolinea
  @Id	  INT,
  @nombre NVARCHAR(100)
AS
BEGIN
INSERT INTO Aerolinea(id_aerolinea, nombre)
VALUES(@Id, @nombre)
END
GO

--Procedmiento UPDATE en la tabla Aerolinea
-- =============================================
-- Nombre de Procedimiento: UpdateIntoAerolinea
-- Descripción: Modifica un registro en la tabla Aerolinea
-- Parametros:
--   @id INT - id de la aerolinea (clave primaria)
--   @nombre NVARCHAR(100) - nombre de la Aerolinea
-- =============================================
CREATE PROCEDURE UpdateAerolinea
  @Id	  INT,
  @nombre NVARCHAR(100)
AS
BEGIN
UPDATE Aerolinea
SET
	nombre=@nombre
WHERE id_aerolinea=@Id
END
GO

--Procedmiento DELETE en la tabla Aerolinea
-- =============================================
-- Nombre de Procedimiento: DeleteAerolinea
-- Descripción: Elimina un registro en la tabla Aerolinea
-- Parametros:
--   @id INT - id de la aerolinea (clave primaria)
-- =============================================
CREATE PROCEDURE DeleteAerolinea
  @Id INT
AS
BEGIN
DELETE FROM Aerolinea
WHERE id_aerolinea=@Id
END
GO

----------------------------------
/*2)Carga de lote de datos */
----------------------------------
--Con INSERT INTO en la tabla Aerolinea
INSERT INTO Aerolinea(id_aerolinea, nombre)
VALUES(19, 'American Airlines');
INSERT INTO Aerolinea(id_aerolinea, nombre)
VALUES(20, 'Delta Air Lines');
INSERT INTO Aerolinea(id_aerolinea, nombre)
VALUES(21, 'United Airlines');
INSERT INTO Aerolinea(id_aerolinea, nombre)
VALUES(22, 'Air Canada');
INSERT INTO Aerolinea(id_aerolinea, nombre)
VALUES(23, 'Lufthansa');
INSERT INTO Aerolinea(id_aerolinea, nombre)
VALUES(24, 'British Airways');
INSERT INTO Aerolinea(id_aerolinea, nombre)
VALUES(25, 'Air France');
INSERT INTO Aerolinea(id_aerolinea, nombre)
VALUES(26, 'Emirates');
INSERT INTO Aerolinea(id_aerolinea, nombre)
VALUES(27, 'Qantas');
INSERT INTO Aerolinea(id_aerolinea, nombre)
VALUES(28, 'KLM Royal Dutch Airlines');

SELECT id_aerolinea,
	   nombre
FROM Aerolinea

--Con EXCE InsertIntoAerolinea en la tabla Aerolinea
EXEC InsertIntoAerolinea
	 @Id=98,
	 @nombre='American Airlines';
EXEC InsertIntoAerolinea
	 @Id=30,
	 @nombre='Delta Air Lines';
EXEC InsertIntoAerolinea
	 @Id=31,
	 @nombre='United Airlines';
EXEC InsertIntoAerolinea
	 @Id=32,
	 @nombre='Air Canada';
EXEC InsertIntoAerolinea
	 @Id=33,
	 @nombre='Lufthansa';
EXEC InsertIntoAerolinea
	 @Id=34,
	 @nombre='British Airways';
EXEC InsertIntoAerolinea
	 @Id=35,
	 @nombre='Air France';
EXEC InsertIntoAerolinea
	 @Id=36,
	 @nombre='Emirates';
EXEC InsertIntoAerolinea
	 @Id=37,
	 @nombre='Qantas';
EXEC InsertIntoAerolinea
	 @Id=38,
	 @nombre='KLM Royal Dutch Airlines';
GO

SELECT *
FROM Aerolinea

----------------------------------
/*3)Update y Delete de los datos ingresados */
----------------------------------
--UPDATE 3 aerolineas ingresadas utilizando el procedmiento UpdateAerolinea
EXEC UpdateAerolinea
	 @Id=36,
	 @nombre='Azul Brazilian';
GO

EXEC UpdateAerolinea
	 @Id=37,
	 @nombre='Avianca';
GO

EXEC UpdateAerolinea
	 @Id=38,
	 @nombre='StarPeru';
GO

--DELETE 3 aerolineas ingresadas utilizando el procedmiento DeleteAerolinea¡
EXEC DeleteAerolinea
	 @id=30;
GO

EXEC DeleteAerolinea
	 @id=31;
GO

EXEC DeleteAerolinea
	 @id=32
GO

----------------------------------
/*4)Creacion de FUNCIONES ALAMACENADAS*/
----------------------------------
-- =============================================
-- Nombre de Funcion: ApellidoPasajero
-- Descripción: Busca en la tabla Pasajero el apellido pasado como parametro.
-- Parametros:
--   @apellido NVARCHAR(100) - apellido del pasajero
-- Retorno:
--   Pasajeros que tengan como apellido el parametro @apellido
-- =============================================
CREATE FUNCTION ApellidoPasajero
(
  @apellido NVARCHAR(100)
)
RETURNS TABLE
AS
RETURN
(
SELECT *
FROM pasajero p
WHERE p.apellido LIKE @apellido
);
GO

--Apellidos que comienzan con L
SELECT *
FROM dbo.ApellidoPasajero( 'L%' )
GO

--Apellidos que comienzan con C
SELECT *
FROM dbo.ApellidoPasajero( 'R%' )
GO


-- =============================================
-- Nombre de Funcion: PasajesPorPesoExtra
-- Descripción: 
--    Busca los pasajes que tengan un peso de equipaje mayor o igual
--    al parametro @PesoEquipajeExtra. Acepta valores null.
-- Parametros:
--    @PesoEquipajeExtra DECIMAL(10, 2) NULL - peso del equipaje extra
-- Retorno:
--    Pasajes cuyo equipaje extra es mayor o igual al parametro @PesoEquipajeExtra y nombre completo del pasajero.
-- =============================================
CREATE FUNCTION PasajesPorPesoExtra
(
  @PesoEquipajeExtra DECIMAL(10, 2) NULL
)
RETURNS TABLE
AS
RETURN
(
SELECT psj.id_pasaje,
	   CONCAT( p.apellido, ', ', p.nombre ) AS 'Pasajero',
	   psj.peso_equipaje_extra
FROM pasaje psj
INNER JOIN Pasajero p
	ON psj.id_pasajero=p.id_pasajero
WHERE CASE
			   WHEN @PesoEquipajeExtra=0
			   THEN 1
			   WHEN @PesoEquipajeExtra IS NULL
			   THEN 1
			   WHEN @PesoEquipajeExtra<0
			   THEN 0
			   WHEN peso_equipaje_extra>=@PesoEquipajeExtra
			   THEN 1
			   ELSE 0
	  END=1
);
GO

SELECT *
FROM dbo.PasajesPorPesoExtra( NULL ) AS psj
ORDER BY psj.peso_equipaje_extra
GO

SELECT *
FROM dbo.PasajesPorPesoExtra( -1 ) AS pasajeros
ORDER BY pasajeros.peso_equipaje_extra
GO

SELECT *
FROM dbo.PasajesPorPesoExtra( 20 ) AS pasajeros
ORDER BY pasajeros.peso_equipaje_extra
GO

-- =============================================
-- Nombre de Funcion: CostoPasaje
-- Descripción: 
--	 Calcula el costo total de los pasajes.
-- Parametros:
-- Retorno:
--   Pasajes, su costo total y nombre completo del pasajero
-- =============================================
CREATE FUNCTION CostoPasaje
(
)
RETURNS TABLE
AS
RETURN
(
SELECT pv.id_pasaje,
	   SUM( c.tarifa_por_km*v.distancia_km+c.tarifa_base ) AS [Costo Total],
	   CONCAT( p.apellido, ', ', p.nombre ) AS [Nombre completo de pasajero]
FROM pasaje_vuelo pv
INNER JOIN Asiento a
	ON pv.id_avion=a.id_avion
	   AND pv.nro_asiento=a.nro_asiento
INNER JOIN Clase c
	ON a.id_clase=c.id_clase
INNER JOIN Vuelo v
	ON pv.id_vuelo=v.id_vuelo
INNER JOIN Pasaje p1
	ON pv.id_pasaje=p1.id_pasaje
INNER JOIN Pasajero p
	ON p1.id_pasajero=p.id_pasajero
GROUP BY pv.id_pasaje,
		 CONCAT( p.apellido, ', ', p.nombre )
)
GO


SELECT *
FROM dbo.CostoPasaje( ) AS Pasajes_costo
ORDER BY [Costo Total]
GO

/*5)Compararcion de eficiencia*/
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

--Operacion sin funcion
SELECT *
FROM pasajero p
WHERE p.apellido LIKE 'C%'

--Usando funcon
SELECT *
FROM dbo.ApellidoPasajero( 'C%' )
GO

--Operacion sin procedimiento
INSERT INTO Aerolinea(id_aerolinea, nombre)
VALUES(75, 'KLM Royal Dutch Airlines');

--Usando procedimiento
EXEC InsertIntoAerolinea
	 @Id=76,
	 @nombre='Azul Brazilian';
GO

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;