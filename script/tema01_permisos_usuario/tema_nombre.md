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

   ```sql
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

