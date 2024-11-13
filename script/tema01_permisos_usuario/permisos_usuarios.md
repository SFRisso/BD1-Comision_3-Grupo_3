# Script de Configuración de Usuarios y Permisos en SQL Server

Crea logins a nivel de servidor, usuarios a nivel de base de datos y asigna roles específicos en 
la base de datos `Pasajes_Aereos` para configurar permisos de acceso diferenciados.
A continuación se describen los pasos detallados del script.

## Descripción de los Pasos

### Paso 1: Crear Logins en el Servidor
Se crean logins para tres usuarios en el servidor SQL, solo si aún no existen:
- **usuarioAdmin**: Login con permisos de administrador, creado con la contraseña `PasswordAdmin123!`.
- **usuarioLectura**: Login con permisos de solo lectura, creado con la contraseña `PasswordLectura123!`.
- **usuarioSinPermisoLogin**: Login sin permisos específicos, creado con la contraseña `PasswordSinPermiso123!`.

Cada login se verifica antes de crearlo para evitar duplicados, y se imprime un mensaje que confirma su creación o existencia.

### Paso 2: Crear Usuarios en la Base de Datos `Pasajes_Aereos`
Luego, el script cambia a la base de datos `Pasajes_Aereos` y crea usuarios correspondientes a cada login:
- **usuarioAdminDB**: Usuario asociado a `usuarioAdmin`, con permisos administrativos.
- **usuarioLecturaDB**: Usuario asociado a `usuarioLectura`, con permisos de solo lectura.
- **usuarioSinPermisosDB**: Usuario asociado a `usuarioSinPermisoLogin`, sin permisos adicionales.

Como en el paso anterior, cada usuario es verificado antes de ser creado,
y se imprime un mensaje de confirmación o existencia.

### Paso 3: Asignar Roles a los Usuarios
Finalmente, se asignan roles específicos en la base de datos para cada usuario:
- **usuarioAdminDB**: Se le otorga el rol `db_owner`, que le concede permisos completos en la base de datos.
- **usuarioLecturaDB**: Se le asigna el rol `db_datareader`, que le permite acceder en modo solo lectura a los datos de la base de datos.
- **usuarioSinPermisosDB**: No recibe permisos adicionales, por lo que tiene acceso limitado en la base de datos.

Cada asignación de rol está encapsulada en bloques `TRY...CATCH` para capturar y mostrar cualquier error que ocurra durante la asignación de permisos.

### Mensaje Final de Confirmación
Al finalizar el script, se imprime un mensaje de confirmación indicando que la configuración de usuarios y permisos se ha realizado exitosamente.

## Notas de Seguridad
- **Contraseñas**: Las contraseñas utilizadas en el script son ejemplos y deben reemplazarse por contraseñas seguras en un entorno de producción.
- **Usuarios sin permisos**: La creación de usuarios sin permisos específicos es útil para limitar el acceso según las necesidades de seguridad de la aplicación.

La configuración del esquema de seguridad en la base de datos `Pasajes_Aereos`, asegura que cada usuario tenga los permisos necesarios para realizar sus tareas asignadas.

# Script SQL para la Creación y Prueba de Permisos en un Procedimiento Almacenado

Este script define un procedimiento almacenado para insertar registros en la tabla `Pasaje`, configura permisos para distintos usuarios y verifica el comportamiento de dichos permisos.

## Descripción del Script

1. **Crear el Procedimiento Almacenado**
   - El procedimiento almacenado `InsertarPasaje` se crea para insertar datos en la tabla `Pasaje`.
   - Si el procedimiento ya existe, se elimina antes de volver a crearlo.

   ```
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
   ```
  
2. **Pruebas de Inserción**
a. Inserción Directa como usuarioAdminDB
Cambia el contexto a usuarioAdminDB e intenta una inserción directa en la tabla Pasaje, que debería ser exitosa.
En caso de error, se captura y muestra un mensaje.

 ```
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
GO
```

b.Inserción Directa como usuarioLecturaDB
Cambia el contexto a usuarioLecturaDB, quien tiene permisos de solo lectura. La inserción directa debería fallar debido a la falta de permisos de escritura, mostrando un mensaje de error.

 ```
EXECUTE AS USER = 'usuarioLecturaDB';
BEGIN TRY
    INSERT INTO Pasaje (id_pasaje, peso_equipaje_extra, id_pasajero)
    VALUES (3, 8.00, 64);
END TRY
BEGIN CATCH
    PRINT 'Error: El "usuario de solo lectura" No tiene permisos para insertar directamente en la tabla Pasaje';
END CATCH;
REVERT;
```
c. Inserción a Través del Procedimiento con Permisos
Se otorga a usuarioLecturaDB el permiso de ejecutar el procedimiento InsertarPasaje.
Luego, se ejecuta el procedimiento como usuarioLecturaDB para insertar datos en Pasaje, lo cual debería ser exitoso.
```
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
```
3. **Consulta de Datos como usuarioLecturaDB**
Como usuario con permisos de solo lectura (db_datareader), usuarioLecturaDB realiza una consulta SELECT en la tabla Pasajero, lo cual debe ser exitoso.
```
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
```
4. **Intento de Inserción por un Usuario sin Permisos (usuarioSinPermisosDB)**
usuarioSinPermisosDB intenta realizar una inserción directa en la tabla Pasaje, lo cual debe fallar ya que no tiene permisos de escritura en la base de datos.
```
EXECUTE AS USER = 'usuarioSinPermisosDB';
BEGIN TRY
    INSERT INTO Pasaje (id_pasaje, peso_equipaje_extra, id_pasajero)
    VALUES (104, 6.00, 93); 
END TRY
BEGIN CATCH
    PRINT 'Error: Usuario sin permiso no puede realizar INSERT en la tabla Pasaje';
END CATCH;
REVERT;
```
Conclusión
Este script demuestra cómo configurar permisos de manera diferenciada en SQL Server y validar su efecto. El usuario usuarioAdminDB puede realizar inserciones directas, usuarioLecturaDB puede realizar inserciones solo a través del procedimiento InsertarPasaje, y usuarioSinPermisosDB no puede realizar inserciones. Esto ilustra el control de acceso granular a nivel de usuarios y roles en SQL Server.

# Script SQL para Configuración de Usuarios, Roles y Permisos de Lectura en la Tabla `Pasajero`

Este script configura usuarios y roles en la base de datos `Pasajes_Aereos`, define permisos de solo lectura en la tabla `Pasajero` y realiza pruebas de acceso con dos usuarios distintos.

## Descripción del Script

1. **Selección de la Base de Datos**  
   El script comienza seleccionando la base de datos `Pasajes_Aereos`.

   ```sql
   USE Pasajes_Aereos;
   GO
###Creación de Logins en el Servidor
Si no existen, se crean dos logins a nivel de servidor:

usuarioLecturaLogin: un login para el usuario con permisos de solo lectura.
usuarioSinAccesoLogin: un login para el usuario sin permisos de acceso.
```
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'usuarioLecturaLogin')
    CREATE LOGIN usuarioLecturaLogin WITH PASSWORD = 'PasswordLectura123!';

IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'usuarioSinAccesoLogin')
    CREATE LOGIN usuarioSinAccesoLogin WITH PASSWORD = 'PasswordSinAcceso123!';
```
###Creación de Usuarios en la Base de Datos
Se crean usuarios de base de datos asociados a los logins creados previamente:

usuarioLectura: usuario con permisos de lectura.
usuarioSinAcceso: usuario sin permisos específicos.
```
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'usuarioLectura')
    CREATE USER usuarioLectura FOR LOGIN usuarioLecturaLogin;

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'usuarioSinAcceso')
    CREATE USER usuarioSinAcceso FOR LOGIN usuarioSinAccesoLogin;
```
###Creación de un Rol de Solo Lectura
Si no existe, se crea un rol llamado RolSoloLectura, diseñado para otorgar permisos de lectura en la tabla Pasajero.

```
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'RolSoloLectura')
    CREATE ROLE RolSoloLectura;
```
###Otorgar Permiso de Lectura al Rol
Se concede al rol RolSoloLectura el permiso SELECT sobre la tabla Pasajero.

```
GRANT SELECT ON Pasajero TO RolSoloLectura;
```
###Asignación del Usuario al Rol de Solo Lectura
El usuario usuarioLectura se agrega como miembro del rol RolSoloLectura, lo que le permite realizar consultas en la tabla Pasajero.

```
ALTER ROLE RolSoloLectura ADD MEMBER usuarioLectura;
```
###Pruebas de Acceso

Prueba de Consulta con usuarioLectura
Se prueba el acceso a la tabla Pasajero con el usuario usuarioLectura, que tiene el rol RolSoloLectura. Si la consulta es exitosa, se imprime un mensaje indicando que el usuario pudo realizar la consulta. Si ocurre un error, se imprime un mensaje de error.

```
BEGIN TRY
    EXECUTE AS USER = 'usuarioLectura';
    SELECT * FROM Pasajero;
    PRINT 'usuarioLectura: Consulta realizada exitosamente.';
    PRINT 'usuarioLectura: Este usuario pudo realizar la consulta en la tabla Pasajero exitosamente, ya que tiene asignado el rol RolSoloLectura, que le otorga permiso de SELECT en dicha tabla.';
    REVERT;
END TRY
BEGIN CATCH
    PRINT 'usuarioLectura: Error en la consulta.';
    PRINT 'Detalles del error: ' + ERROR_MESSAGE();
    REVERT;
END CATCH;
GO
```
Prueba de Consulta con usuarioSinAcceso
Se prueba el acceso a la tabla Pasajero con el usuario usuarioSinAcceso, que no tiene permisos de lectura. Se espera un error de permisos, y si ocurre, se imprime un mensaje explicando que el usuario no tiene el rol adecuado para acceder a la tabla.

```
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
```
Este script implementa un rol de solo lectura y verifica el acceso de los usuarios usuarioLectura (que tiene el rol) y usuarioSinAcceso (que no tiene permisos). usuarioLectura puede realizar consultas en la tabla Pasajero gracias a su rol, mientras que usuarioSinAcceso no tiene acceso, lo que demuestra la configuración efectiva de permisos en la base de datos.








