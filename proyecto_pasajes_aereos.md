# PRESENTACIÓN - Reserva de pasajes aéreos

**Asignatura**: Bases de Datos I (FaCENA-UNNE)

**Integrantes**:
- Benitez, Gonzalo Ezequiel 
- Centurión, Esteban Agustín 
- Marquez, Marcos Abel 
- Risso, Santiago Francisco
  
**Año**: 2024

# CAPÍTULO I: INTRODUCCIÓN

## Caso de Estudio

El proyecto se centra en la creación de un base de datos para la gestión de reservas de pasajes aéreos en línea. Se mantendrá un registro de los pasajeros, los aviones y los vuelos. Se busca ofrecer una solución integral para la gestión de reservas de vuelos, abordando aspectos como la disponibilidad de asientos, la selección de clases, los precios de pasajes y la asignación de asientos. No se trata de un sistema interno para el personal de un aeropuerto, sino de un sistema de reservas de pasajes aéreos dirigido a los clientes con acceso mediante una pagina web.

### Alcance:</ins>

 **Se incluye:**
 
 - Gestión de ubicaciones: Representación de ciudades, provincias y países.
 - Gestión de infraestructura del aeropuerto: Almacena información sobre los aeropuertos y su 
 ubicación geográfica.
 - Gestión de aerolíneas y aviones: Cada aerolínea puede tener múltiples aviones asignados.
 - Gestión de vuelos: Detalla información sobre los vuelos, incluyendo origen, destino, fechas y el 
 avión utilizado.
 - Gestion de pasajes: Cada pasaje puede tener varios vuelos (vuelos con escala).
 - Gestión de pasajeros: Registra los datos de los pasajeros.
 - Asignación de asientos y clase: Permite definir asientos específicos y su clase en cada 
 vuelo.

**Fuera del alcance del proyecto quedan:**

- La gestión interna del aeropuerto, como la administración del personal y la planificación de mantenimiento de aviones.
- Registro de pago y el tipo de pago.
- Gestion de cuentas de usuarios (los pasajeros no tendran un campo que almacene contraseña).

## Definición o planteamiento del problema

En el contexto actual, donde el tráfico aéreo sigue en aumento y los usuarios demandan servicios rápidos y efectivos, muchas aerolíneas enfrentan desafíos en la gestión de sus reservas. Problemas como la sobreventa de asientos, la falta de sincronización en los registros de vuelo y las dificultades en la asignación de asientos afectan tanto a la satisfacción del cliente como a la operatividad de la aerolínea. Este Trabajo Práctico se plantea como una oportunidad para explorar y desarrollar un sistema de reservas capaz de manejar eficientemente estos aspectos, respondiendo a preguntas como:

- ¿Cómo garantizar una correcta asignación de asientos en tiempo real?
- ¿De qué manera optimizar la gestión de pasajes para evitar sobreventas?
- ¿Cómo mejorar la experiencia de los usuarios en el proceso de reserva? 

## Objetivo del Proyecto

### Objetivos Generales:

- Diseñar una base de datos para reservas de pasajes aéreos manteniendo las relaciones y restricciones de acuerdo al alcance definido anteriormente. 
- Insertar un lote de datos con representativo que mantega coherencia con la definicion de tablas.
- Aplicar los 4 temas obligatorios:
   1) Manejo de permisos a nivel de usuarios de base de datos.
   2) Procedimientos y funciones almacenadas.
   3) Optimización de consultas a través de índices.
   3) Vistas y Vistas indexadas.
- Realizar consultas especificas sobre los datos.

### Objetivos Especificos:

<ins> Restriciones:	<ins>
- El email del pasajero debe ser unico.
- El telefono del pasajero es opcional.
- El equipaje extra es opcional.
- Precio de tarifa, distancia(km), peso del equipaje deben ser numeros decimales positivos.
- Fecha de llegada debe ser mayor que fecha de salida en un vuelo.
- DNI de pasajero debe ser un numero de 8 digitos como maximo.

<ins> Manejo de permisos a nivel de usuarios de base de datos: <ins>
- Entender el manejo de permisos y roles en bases de datos.
- Aplicar permisos de lectura, escritura y ejecución para diferentes roles y usuarios.

<ins> Procedimientos y funciones almacenadas: <ins>
- Comprender la diferencia entre procedimientos y funciones almacenadas.
- Aplicar procedimientos y funciones en la implementación de operaciones CRUD.

<ins> Optimización de consultas a través de índices: <ins>
- Conocer los tipos de índices y sus aplicaciones.
- Evaluar el impacto de los índices en el rendimiento de las consultas.

<ins>Vistas y Vistas indexadas: <ins>
- Comprender el uso de vistas y vistas indexadas para mejorar la gestión y consulta de datos.
- Evaluar el impacto de las vistas indexadas en el rendimiento de las consultas.


# CAPITULO II: MARCO CONCEPTUAL O REFERENCIAL

**TEMA 1 - Manejo de permisos a nivel de usuarios de base de datos** 

**TEMA 2 - Procedimientos y funciones almacenadas** 

<ins>Procedimientos Almacenados: <ins>

Son conjuntos de instrucciones SQL que se guardan en la base de datos para ejecutar operaciones repetitivas (consultas, actualizaciones) y pueden recibir parámetros. Los procedimientos pueden ser definidos por el usuario, temporales o del sistema.

Ventajas de los procedimientos almacenados:
- Rendimiento: Precompilados, se ejecutan más rápido, ya que SQL Server almacena el plan de ejecución.
- Reutilización y Mantenimiento: Código reutilizable en diferentes aplicaciones, cualquier cambio solo necesita realizarse en un lugar.
- Seguridad: Los permisos de acceso pueden ser asignados al procedimiento en lugar de a las tablas subyacentes.
- Reducción de tráfico de red: Se envía solo la llamada al procedimiento en lugar de una consulta extensa, se reduce la cantidad de datos que viajan entre el cliente y el servidor.

<ins>Funciones Almacenadas: <ins>

Bloques de código SQL que realizan una operación específica y devuelven un valor, diseñados para usarse en consultas (SELECT, WHERE, JOIN). Las funciones pueden ser definidas por el usuario o del sistema. Segun su retorno pueden ser funciones escalares (devuelve un valor unico) o funciones con valores de tabla (devuelve una tabla).

Ventajas de las funciones almacenadas:
- Rendimiento: Precompilados, se ejecutan más rápido, ya que SQL Server almacena el plan de ejecución.
- Reutilización y Mantenimiento: Código reutilizable en diferentes aplicaciones, cualquier cambio solo necesita realizarse en un lugar.
- Reducción de tráfico de red: Operaciones complejas en SELECT, WHERE, JOIN.

<ins>Diferencias:	<ins>

| Característica               | Procedimientos Almacenados                             | Funciones Almacenadas            |
|   :---:                      |     :---:                                              |       :---:                      |
| Retorno                      | Opcional, uno o mós                                    | Obligatorio, valor único o tabla |                     
| Puede usarse en `SELECT`     | No                                                     | Sí                               | 
| Modificación de datos        | Sí (`INSERT`, `UPDATE`, `DELETE`)                      | No                               |
| Transacciones                | Sí                                                     | No                               |
| Puede llamar al otro         | Puede llamar a una función                             | No puede llamar a un procedimiento|
| Propósito	                   | Lógica compleja y modificaciones de datos              | Cálculos y transformaciones      |

**TEMA 3 - Optimización de consultas a través de índices**

<ins>Optimización de consultas: <ins>

La optimización de consultas a través de indices, es una herremienta muy conveniente usarlo a la hora de buscar una mejora notable en el tiempo de respuesta y, la recuperación de información de una base de datos. 
Pero para ello, los administradores de base de datos debemos tener un buen conocimiento de la estructura de ejecución de las consultas y cuándo es eficiente usar índices, ya que, pueden mejorar el rendimiento de las 
cláusulas SELECT, como también hacer más lentas las sentencias DML como INSERT,UPDATE,y DELETE.

Tipos de índices:
En la optimización de consultas, contamos con dos principales tipos de índices, los cuales son los índices agrupados y no agrupados.
- Índices Agrupados: Son usados para almacenar las filas de información clasificadas basado en los valores clave. SQL Server nos permite crear un único índice por cada tabla.
- -Índices No Agrupados:

**TEMA 4 - Vistas y vistas indexadas** 

# CAPÍTULO III: METODOLOGÍA SEGUIDA 

 **a) Cómo se realizó el Trabajo Práctico**


 **b) Herramientas (Instrumentos y procedimientos)**
 - [DB designer](https://www.dbdesigner.net/)
 - [SQL SERVER EXPRESS 22](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)
 - [SQL Server Management Studio (SSMS) 20.2](https://learn.microsoft.com/es-es/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16)


# CAPÍTULO IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS 

## Diagrama relacional
![diagrama_relacional](doc/modelo_relacional_pasajes_aereos.png)
[Link a la pagina del diagrama](https://dbdesigner.page.link/zGxXPJzd4mikyFLP6)

## Diccionario de datos

Acceso al documento [PDF](doc/diccionario_datos_pasajes_aereos.pdf) del diccionario de datos.

## Script del modelo de datos
> Acceder a la siguiente carpeta  [scripts->script_ddl_pasajes_aviones.sql](script/script_ddl_pasajes_aviones.sql)

## Script de lote de datos
> Acceder a la siguiente carpeta  [scripts->script_insert_pasajes_aviones.sql](script/script_insert_pasajes_aviones.sql)

## Desarrollo TEMA 1 - Manejo de permisos a nivel de usuarios de base de datos

## Desarrollo TEMA 2 - Procedimientos y funciones almacenadas
> Documentación del script: [procedimientos_funciones_almacenadas.md](script/tema02_procedimientos_funciones_almacenadas/procedimientos_funciones_almacenadas.md)

> Script: [tema02_script.sql](script/tema02_procedimientos_funciones_almacenadas/tema02_script.sql)

## Desarrollo TEMA 3 - Optimización de consultas a través de índices

## Desarrollo TEMA 4 - Vistas y vistas indexadas

# CAPÍTULO V: CONCLUSIONES


# BIBLIOGRAFÍA DE CONSULTA

 1. [Documentación técnica oficial de SQL Server](https://learn.microsoft.com/es-es/sql/sql-server/?view=sql-server-ver16)
 2. List item
 3. List item
 4. List item
 5. List item

