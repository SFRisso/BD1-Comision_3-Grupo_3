USE Pasajes_Aereos;
GO

--  Crear los logins para los usuarios en el servidor, si no existen
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'usuarioAdmin')
BEGIN
    CREATE LOGIN usuarioAdmin WITH PASSWORD = 'PasswordAdmin123!';
    PRINT 'Login "usuarioAdmin" creado exitosamente.';
END
ELSE
    PRINT 'El login "usuarioAdmin" ya existe.';

IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'usuarioLectura')
BEGIN
    CREATE LOGIN usuarioLectura WITH PASSWORD = 'PasswordLectura123!';
    PRINT 'Login "usuarioLectura" creado exitosamente.';
END
ELSE
    PRINT 'El login "usuarioLectura" ya existe.';

IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'usuarioSinPermisoLogin')
BEGIN
    CREATE LOGIN usuarioSinPermisoLogin WITH PASSWORD = 'PasswordSinPermiso123!';
    PRINT 'Login "usuarioSinPermisoLogin" creado exitosamente.';
END
ELSE
    PRINT 'El login "usuarioSinPermisoLogin" ya existe.';

-- Cambiamos a la base de datos donde queremos crear los usuarios
USE Pasajes_Aereos;
GO

-- Paso 2: Crear los usuarios en la base de datos y asociarlos con los logins creados

-- Crear usuario con permisos de administrador
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'usuarioAdminDB')
BEGIN
    CREATE USER usuarioAdminDB FOR LOGIN usuarioAdmin;
    PRINT 'Usuario "usuarioAdminDB" creado exitosamente en la base de datos "Pasajes_Aereos".';
END
ELSE
    PRINT 'El usuario "usuarioAdminDB" ya existe en la base de datos "Pasajes_Aereos".';

-- Crear usuario con permisos de solo lectura
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'usuarioLecturaDB')
BEGIN
    CREATE USER usuarioLecturaDB FOR LOGIN usuarioLectura;
    PRINT 'Usuario "usuarioLecturaDB" creado exitosamente en la base de datos "Pasajes_Aereos".';
END
ELSE
    PRINT 'El usuario "usuarioLecturaDB" ya existe en la base de datos "Pasajes_Aereos".';

-- Crear usuario sin permisos específicos
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'usuarioSinPermisosDB')
BEGIN
    CREATE USER usuarioSinPermisosDB FOR LOGIN usuarioSinPermisoLogin;
    PRINT 'Usuario "usuarioSinPermisosDB" creado exitosamente en la base de datos "Pasajes_Aereos".';
END
ELSE
    PRINT 'El usuario "usuarioSinPermisosDB" ya existe en la base de datos "Pasajes_Aereos".';

-- Paso 3: Asignar permisos a los usuarios

-- Otorgar al usuarioAdminDB el rol de administrador de la base de datos (db_owner)
BEGIN TRY
    ALTER ROLE db_owner ADD MEMBER usuarioAdminDB;
    PRINT 'Rol de administrador otorgado a "usuarioAdminDB".';
END TRY
BEGIN CATCH
    PRINT 'Error al otorgar rol de administrador a "usuarioAdminDB": ' + ERROR_MESSAGE();
END CATCH;

-- Otorgar al usuarioLecturaDB el rol de solo lectura en la base de datos (db_datareader)
BEGIN TRY
    ALTER ROLE db_datareader ADD MEMBER usuarioLecturaDB;
    PRINT 'Rol de solo lectura otorgado a "usuarioLecturaDB".';
END TRY
BEGIN CATCH
    PRINT 'Error al otorgar rol de solo lectura a "usuarioLecturaDB": ' + ERROR_MESSAGE();
END CATCH;

-- Confirmación de permisos
PRINT 'Usuarios y permisos configurados exitosamente.';

--  Crear el procedimiento almacenado si no existe
--Procedimiento de Insercion
IF OBJECT_ID('InsertarPasaje', 'P') IS NOT NULL
    DROP PROCEDURE InsertarPasaje;
GO

CREATE PROCEDURE InsertarPasaje
    @id_pasaje INT,
    @peso_equipaje_extra DECIMAL(10, 2),
    @id_pasajero INT
AS
BEGIN
    INSERT INTO Pasaje (id_pasaje, peso_equipaje_extra, id_pasajero)

    VALUES (@id_pasaje, @peso_equipaje_extra, @id_pasajero);
END;
GO


--  Pruebas de inserción

-- Inicia sesión como usuarioAdmin y realiza un INSERT directamente en la tabla Pasaje
-- (esto debería ser exitoso)
EXECUTE AS USER = 'usuarioAdminDB';
BEGIN TRY
INSERT INTO Pasaje (id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES (44, 5.00, 29);
PRINT 'Inserción en Pasaje realizada exitosamente.';
 
    END TRY
   
	BEGIN CATCH
        PRINT 'Error al intentar insertar en Pasaje: ' + ERROR_MESSAGE();
    END CATCH;
REVERT;

--  Inicia sesión como usuarioLectura e intenta un INSERT directo en la tabla Pasaje
-- (esto debería dar un error de permisos)
EXECUTE AS USER = 'usuarioLecturaDB';
BEGIN TRY
    INSERT INTO Pasaje (id_pasaje, peso_equipaje_extra, id_pasajero)
    VALUES (3, 8.00, 64);
END TRY
BEGIN CATCH
    PRINT 'Error: El "usuario de solo lectura" No tiene permisos para insertar directamente en la tabla Pasaje';
END CATCH;
REVERT;

-- Otorgar permiso de ejecución sobre el procedimiento al usuario de solo lectura
GRANT EXECUTE ON InsertarPasaje TO usuarioLecturaDB;
GO
BEGIN TRY
    EXECUTE AS USER = 'usuarioLecturaDB';
    EXEC InsertarPasaje @id_pasaje = 154, @peso_equipaje_extra = 7.00, @id_pasajero = 111;
    PRINT 'UsuarioLectura inserta a travez de un Procedimiento: Inserción en Pasaje realizada exitosamente.';
    REVERT;
END TRY
BEGIN CATCH
    PRINT 'Error: No se pudo realizar la inserción en Pasaje.';
    PRINT 'Detalles del error: ' + ERROR_MESSAGE();
    REVERT;
END CATCH;
GO
-- El rol db_datareader solo otorga permisos para ejecutar consultas SELECT
SELECT id_pasaje,peso_equipaje_extra,id_pasajero FROM Pasaje;
EXECUTE AS USER = 'usuarioLecturaDB';
BEGIN TRY
    SELECT * FROM Pasajero;
    PRINT 'Usuario Lectura: Consulta "Pasajeros" ejecutada exitosamente.';
END TRY
BEGIN CATCH
    PRINT 'Error al ejecutar la consulta: ' + ERROR_MESSAGE();
END CATCH;
REVERT;
GO
--  Intenta realizar un INSERT en la tabla Pasaje con el usuario sin permisos
EXECUTE AS USER = 'usuarioSinPermisosDB';
BEGIN TRY
    INSERT INTO Pasaje (id_pasaje, peso_equipaje_extra, id_pasajero)
    VALUES (104, 6.00, 93); 
END TRY
BEGIN CATCH
    PRINT 'Error: Usuario sin permiso no puede realizar INSERT en la tabla Pasaje';
END CATCH;
REVERT;
