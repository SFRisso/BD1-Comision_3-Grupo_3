# Tema: Procedimientos y funciones almacenadas

> Script del tema: [tema02_script.sql](tema02_script.sql)

### Tareas: 

    -Realizar al menos tres procedimientos almacenados que permitan: Insertar, Modificar y borrar registros de alguna de las tablas del proyecto.
    -Insertar un lote de datos en las tablas mencionadas (guardar el script) con sentencias insert y otro lote invocando a los procedimientos creados. 
    -Realizar  update y delete sobre  algunos de los registros insertados en esas tablas invocando a los procedimientos. 
    -Desarrollar al menos tres funciones almacenadas. Por ej: calcular la edad 
    -Comparar la eficiencia de las operaciones directas versus el uso de procedimientos y funciones.

### Procedimientos Almacenados:
1) Se crean 3 procedimientos almacenados para la tabla Aerolinea:
```
-- =============================================
-- Nombre de Procedimiento: InsertIntoAerolinea
-- Descripción: Ingresa un registro a la tabla Aerolinea
-- Parametros:
--   @id INT - id de la aerolinea (clave primaria)
--   @nombre NVARCHAR(100) - nombre de la Aerolinea
-- =============================================
```
```
-- =============================================
-- Nombre de Procedimiento: UpdateIntoAerolinea
-- Descripción: Modifica un registro en la tabla Aerolinea
-- Parametros:
--   @id INT - id de la aerolinea (clave primaria)
--   @nombre NVARCHAR(100) - nombre de la Aerolinea
-- =============================================
```
```
-- =============================================
-- Nombre de Procedimiento: DeleteAerolinea
-- Descripción: Elimina un registro en la tabla Aerolinea
-- Parametros:
--   @id INT - id de la aerolinea (clave primaria)
-- =============================================
```

2) Se inserta 10 registros en la tabla Aerolinea con la sentencia `INSERT INTO` y otros 10 que usan el procedimiento almacenados `InsertIntoAerolinea`
3) Se modifica 3 registros ingresados anteriormente y se eliminan 3 utilizaion los procedimientos almacenados `UpdateAerolinea` y `DeleteAerolinea`

### Funciones almacenadas:

4) Se crean 3 funciones almacenadas:
```
-- =============================================
-- Nombre de Funcion: ApellidoPasajero
-- Descripción: Busca en la tabla Pasajero el apellido pasado como parametro
-- Parametros:
--   @apellido NVARCHAR(100) - apellido del pasajero
-- Retorno:
--   Pasajeros que tengan como apellido el parametro @apellido
-- =============================================
```
```
-- =============================================
-- Nombre de Funcion: PasajesPorPesoExtra
-- Descripción: Busca los pasajes que tengan un peso de equipaje extra mayor o igual 
--    al parametro @PesoEquipajeExtra
-- Parametros:
--    @PesoEquipajeExtra DECIMAL(10, 2) NULL - peso del equipaje extra
-- Retorno:
--    Pasajes cuyo equipaje extra es mayor o igual al parametro @PesoEquipajeExtra
-- =============================================
```