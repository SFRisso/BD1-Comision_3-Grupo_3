-- DEFINICIÓN DEL MODELO DE DATOS
CREATE DATABASE Pasajes_Avion;
GO

USE Pasajes_Avion;
GO

-- Tabla Pais
CREATE TABLE [Pais] (
    [id_pais] INT NOT NULL,
    [nombre] NVARCHAR(100) NOT NULL,
    CONSTRAINT PK_Pais PRIMARY KEY ([id_pais])
);
GO

-- Tabla Provincia
CREATE TABLE [Provincia] (
    [id_pais] INT NOT NULL,
    [id_provincia] INT NOT NULL,
    [nombre] NVARCHAR(100) NOT NULL,
    CONSTRAINT PK_Provincia PRIMARY KEY ([id_pais], [id_provincia]),
    CONSTRAINT FK_Provincia_Pais FOREIGN KEY ([id_pais]) REFERENCES [Pais]([id_pais])
);
GO

-- Tabla Ciudad
CREATE TABLE [Ciudad] (
    [id_pais] INT NOT NULL,
    [id_provincia] INT NOT NULL,
    [id_ciudad] INT NOT NULL,
    [nombre] NVARCHAR(100) NOT NULL,
    CONSTRAINT PK_Ciudad PRIMARY KEY ([id_pais], [id_provincia], [id_ciudad]),
    CONSTRAINT FK_Ciudad_Provincia FOREIGN KEY ([id_pais], [id_provincia]) REFERENCES [Provincia]([id_pais], [id_provincia])
);
GO

-- Tabla Aeropuerto
CREATE TABLE [Aeropuerto] (
    [cod_iata_aeropuerto] CHAR(3) NOT NULL,
    [nombre] NVARCHAR(100) NOT NULL,
    [id_pais] INT NOT NULL,
    [id_provincia] INT NOT NULL,
    [id_ciudad] INT NOT NULL,
    CONSTRAINT PK_Aeropuerto PRIMARY KEY ([cod_iata_aeropuerto]),
    CONSTRAINT FK_Aeropuerto_Ciudad FOREIGN KEY ([id_pais], [id_provincia], [id_ciudad]) REFERENCES [Ciudad]([id_pais], [id_provincia], [id_ciudad])
);
GO

--Tabla Aerolinea
CREATE TABLE [Aerolinea] (
    [id_aerolinea] INT NOT NULL,
    [nombre] NVARCHAR(100) NOT NULL,
    CONSTRAINT PK_Aerolinea PRIMARY KEY ([id_aerolinea])
);
GO

--Tabla Avion
CREATE TABLE [Avion] (
    [id_avion] INT NOT NULL,
    [modelo] NVARCHAR(100) NOT NULL,
    [id_aerolinea] INT NOT NULL,
    CONSTRAINT PK_Avion PRIMARY KEY ([id_avion]),
    CONSTRAINT FK_Avion_Aerolinea FOREIGN KEY ([id_aerolinea]) REFERENCES [Aerolinea]([id_aerolinea]),
);
GO

--Tabla Clase
CREATE TABLE [Clase] (
    [id_clase] INT NOT NULL,
    [nombre] NVARCHAR(100) NOT NULL,
    [tarifa_base] DECIMAL(18, 2) NOT NULL,
    [tarifa_por_km] DECIMAL(18, 2) NOT NULL,
    CONSTRAINT PK_Clase PRIMARY KEY ([id_clase]),
    CONSTRAINT CK_Clase_tarifa_base CHECK ([tarifa_base] >= 0),  -- Validación de tarifa positiva
    CONSTRAINT CK_Clase_tarifa_por_km CHECK ([tarifa_por_km] >= 0)  -- Validación de tarifa positiva
);
GO

--Tabla Asiento
CREATE TABLE [Asiento] (
    [id_avion] INT NOT NULL,
    [nro_asiento] INT NOT NULL,
    [ventana] BIT NOT NULL, -- 1 si tiene ventana
    [id_clase] INT NOT NULL,
    CONSTRAINT PK_Asiento PRIMARY KEY ([id_avion],[nro_asiento]),
    CONSTRAINT FK_Asiento_Avion FOREIGN KEY ([id_avion]) REFERENCES [Avion]([id_avion]),
    CONSTRAINT FK_Asiento_Clase FOREIGN KEY ([id_clase]) REFERENCES [Clase]([id_clase])
);
GO

--Tabla Pasajero
CREATE TABLE [Pasajero] (
    [dni_pasajero] INT NOT NULL,
    [nombre] NVARCHAR(100) NOT NULL,
    [apellido] NVARCHAR(100) NOT NULL,
    [email] NVARCHAR(100) NOT NULL,
    [telefono] NVARCHAR(100),
    CONSTRAINT PK_Pasajero PRIMARY KEY ([dni_pasajero]),
    CONSTRAINT UQ_Pasajero_email UNIQUE ([email]), -- validacion de email unico
    CONSTRAINT CK_dni_pasajero CHECK ([dni_pasajero] BETWEEN 1 AND 99999999) --dni mayor a 0 y hasta 8 digitos
);
GO

--Tabla Pasaje
CREATE TABLE [Pasaje] (
    [id_pasaje] INT NOT NULL,
    [peso_equipaje_extra] DECIMAL(10, 2),
    [dni_pasajero] INT NOT NULL,
    CONSTRAINT PK_Pasaje PRIMARY KEY ([id_pasaje]),
    CONSTRAINT FK_Pasaje_Pasajero FOREIGN KEY ([dni_pasajero]) REFERENCES [Pasajero]([dni_pasajero]),
    CONSTRAINT CK_Pasaje_peso_equipaje_extra CHECK ([peso_equipaje_extra] >= 0)  -- Validación de peso positivo
);
GO

--Tabla Vuelo
CREATE TABLE [Vuelo] (
    [id_vuelo] INT NOT NULL,
    [fecha_salida] DATETIME NOT NULL,
    [fecha_llegada] DATETIME NOT NULL,  
    [origen] CHAR(3) NOT NULL,  
    [destino] CHAR(3) NOT NULL, 
    [distancia_km] INT NOT NULL,
    [id_avion] INT NOT NULL,
    CONSTRAINT PK_Vuelo PRIMARY KEY ([id_vuelo]),
    CONSTRAINT FK_Vuelo_Aeropuerto_origen FOREIGN KEY ([origen]) REFERENCES [Aeropuerto]([cod_iata_aeropuerto]),
    CONSTRAINT FK_Vuelo_Aeropuerto_destino FOREIGN KEY ([destino]) REFERENCES [Aeropuerto]([cod_iata_aeropuerto]),
    CONSTRAINT FK_Vuelo_Avion FOREIGN KEY ([id_avion]) REFERENCES [Avion]([id_avion]),
    CONSTRAINT CK_Vuelo_fecha_llegada_salida CHECK ([fecha_llegada] >= [fecha_salida]), -- Validación de fechas
    CONSTRAINT CK_Vuelo_distancia_km CHECK ([distancia_km] >= 0)  -- Validación de distancia postiva
);
GO

--Tabla intermedia Pasaje_Vuelo
CREATE TABLE [Pasaje_Vuelo] (
    [id_vuelo] INT NOT NULL,
    [id_pasaje] INT NOT NULL,
    [id_avion] INT NOT NULL,
    [nro_asiento] INT NOT NULL,
    CONSTRAINT PK_Pasaje_Vuelo PRIMARY KEY ([id_vuelo], [id_pasaje], [id_avion],[nro_asiento]),
    CONSTRAINT FK_Pasaje_Vuelo_Vuelo FOREIGN KEY ([id_vuelo]) REFERENCES [Vuelo]([id_vuelo]),
    CONSTRAINT FK_Pasaje_Vuelo_Pasaje FOREIGN KEY ([id_pasaje]) REFERENCES [Pasaje]([id_pasaje]),
    CONSTRAINT FK_Pasaje_Vuelo_Asiento FOREIGN KEY ([id_avion], [nro_asiento]) REFERENCES [Asiento]([id_avion], [nro_asiento])
);
GO

