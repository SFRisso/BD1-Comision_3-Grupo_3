USE Pasajes_Aereos;
GO

-- Crear los logins en el servidor si no existen
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'usuarioLecturaLogin')
    CREATE LOGIN usuarioLecturaLogin WITH PASSWORD = 'grupo3Lectura123!';

IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'usuarioSinAccesoLogin')
    CREATE LOGIN usuarioSinAccesoLogin WITH PASSWORD = 'grupo3SinAcceso123!';

-- Crear los usuarios en la base de datos y asociarlos con los logins
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'usuarioLectura')
    CREATE USER usuarioLectura FOR LOGIN usuarioLecturaLogin;

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'usuarioSinAcceso')
    CREATE USER usuarioSinAcceso FOR LOGIN usuarioSinAccesoLogin;

	-- Crear el rol de solo lectura
	--Creamos un rol llamado RolSoloLectura que solo permite lectura en la tabla Pasajero.
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'RolSoloLectura')
    CREATE ROLE RolSoloLectura;

-- Otorgar permiso de lectura mediante Grant sobre la tabla Pasajero al rol
GRANT SELECT ON Pasajero TO RolSoloLectura;

-- Agregar usuarioLectura al rol de solo lectura
ALTER ROLE RolSoloLectura ADD MEMBER usuarioLectura;

BEGIN TRY
    EXECUTE AS USER = 'usuarioLectura';
    SELECT 
	'Consulta del usuario de solo lectura' AS Titulo, 
	* FROM Pasajero;
    PRINT 'usuarioLectura: Consulta realizada exitosamente.';
	PRINT 'usuarioLectura: Este usuario pudo realizar la consulta en la tabla Pasajero exitosamente, ya que tiene asignado el rol RolSoloLectura, que le otorga permiso de SELECT en dicha tabla..';
    REVERT;
END TRY
BEGIN CATCH
    PRINT 'usuarioLectura: Error en la consulta.';
    PRINT 'Detalles del error: ' + ERROR_MESSAGE();
    REVERT;
END CATCH;
GO

BEGIN TRY
    EXECUTE AS USER = 'usuarioSinAcceso';
    SELECT * FROM Pasajero;
    PRINT 'usuarioSinAcceso: Consulta realizada exitosamente.';
    REVERT;
END TRY
BEGIN CATCH
    PRINT ' usuarioSinAcceso: Este usuario no tiene asignado el rol RolSoloLectura ni permisos directos en la tabla Pasajero, por lo que no pudo realizar la consulta y se generó un error de permisos.';
    PRINT 'Detalles del error: ' + ERROR_MESSAGE();
    REVERT;
END CATCH;
GO
