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

<ins> Procedimientos y funciones almacenadas: <ins>

<ins> Optimización de consultas a través de índices: <ins>

<ins>Vistas y Vistas indexadas: <ins>


# CAPITULO II: MARCO CONCEPTUAL O REFERENCIAL

**TEMA 1 - Manejo de permisos a nivel de usuarios de base de datos** 



**TEMA 2 - Procedimientos y funciones almacenadas** 

<ins>Procedimientos alamcenados: <ins>

Los procedimientos almacenados son conjuntos de instrucciones SQL predefinidas que se guardan en la base de datos y se pueden ejecutar de manera recurrente. Funcionan como "programas" que encapsulan una serie de operaciones, como consultas, actualizaciones y lógicas complejas, y pueden recibir parámetros para personalizar su ejecución.

Ventajas de los procedimientos almacenados:
- Mejora del rendimiento: Al estar precompilados, los procedimientos almacenados se ejecutan más rápido que consultas individuales, ya que SQL Server almacena el plan de ejecución.
- Reutilización y modularidad: Facilitan la reutilización de código, ya que pueden ser llamados desde múltiples aplicaciones o partes de un sistema sin necesidad de escribir las mismas instrucciones.
- Seguridad: Permiten controlar el acceso a los datos de manera granular. Los permisos de acceso pueden ser asignados al procedimiento en lugar de a las tablas subyacentes.
- Mantenimiento simplificado: Al centralizar la lógica de negocio en procedimientos almacenados, cualquier cambio solo necesita realizarse en un lugar, simplificando el mantenimiento y las actualizaciones.
- Reducción del tráfico en la red: Como el cliente solo envía el llamado al procedimiento en lugar de una consulta extensa, se reduce la cantidad de datos que viajan entre el cliente y el servidor.

<ins>Funciones Almacenadas:	<ins>

Las funciones almacenadas son bloques de código SQL que realizan una operación específica y devuelven un valor. A diferencia de los procedimientos almacenados, las funciones están diseñadas para ser usadas dentro de consultas, como en cláusulas SELECT, WHERE, o JOIN, ya que siempre devuelven un valor (escalar, tabla o conjunto de valores).

Ventajas de las funciones almacenadas:
- Reutilización de código: Las funciones encapsulan lógicas y cálculos comunes que pueden ser reutilizados en múltiples consultas o procedimientos, evitando duplicar el código.
- Facilidad de uso en consultas: Las funciones pueden ser invocadas dentro de consultas, permitiendo operaciones complejas en SELECT, WHERE, JOIN, y otras cláusulas de forma sencilla.
- Modularidad y mantenimiento: Facilitan el mantenimiento, ya que cualquier cambio en la lógica solo se hace en la función, y todas las consultas que la usan se actualizan automáticamente.
- Claridad y organización: Ayudan a organizar la lógica en piezas más manejables y específicas, haciendo el código SQL más legible y estructurado.
- Mejora de rendimiento: Al estar precompiladas, algunas funciones pueden ejecutar operaciones complejas de forma más rápida, especialmente las funciones escalar o de tabla en línea, que optimizan las consultas.

<ins>Diferencias:	<ins>

| Característica               | Procedimientos Almacenados                             | Funciones Almacenadas            |
|   :---:                      |     :---:                                              |       :---:                      |
| Retorno                      | Opcional, mediante `SELECT` o parámetros de salida     | Obligatorio, valor único o tabla |
| Llamado en consultas `SELECT`| No                                                     | Sí                               | 
| Modificación de datos        | Sí (`INSERT`, `UPDATE`, `DELETE`)                      | No                               |
| Transacciones                | Sí                                                     | No                               |
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
 - SQL Server Management Studio
      

# CAPÍTULO IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS 

## Diagrama conceptual (opcional)

## Diagrama relacional
![diagrama_relacional](doc/modelo_relacional_pasajes_aereos.png)
[Link a la pagina del diagrama](https://dbdesigner.page.link/zGxXPJzd4mikyFLP6)

## Diccionario de datos

Acceso al documento [PDF](doc/diccionario_datos_pasajes_aereos.pdf) del diccionario de datos.

## Script del modelo de datos
> Acceder a la siguiente carpeta  [scripts->script_ddl_pasajes_aviones.sql](script/script_ddl_pasajes_aviones.sql)

## Script de lote de datos
> Acceder a la siguiente carpeta  [scripts->script_insert_pasajes_aviones.sql](script/script_insert_pasajes_aviones.sql)

## Desarrollo TEMA 1 "----"



## Desarrollo TEMA 2 "----"




# CAPÍTULO V: CONCLUSIONES


# BIBLIOGRAFÍA DE CONSULTA

 1. List item
 2. List item
 3. List item
 4. List item
 5. List item

