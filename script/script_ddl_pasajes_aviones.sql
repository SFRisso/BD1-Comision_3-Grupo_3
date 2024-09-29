CREATE DATABASE Pasajes_Avion;

USE Pasajes_Avion;

CREATE TABLE [Pais] (
	[id_pais] int NOT NULL,
	[nombre] nvarchar(100) NOT NULL,
	PRIMARY KEY ([id_pais])
);

CREATE TABLE [Provincia] (
	[id_provincia] int NOT NULL,
	[nombre] nvarchar(100) NOT NULL,
	[id_pais] int NOT NULL,
	CONSTRAINT PK_Provincia PRIMARY KEY ([id_provincia]),
	CONSTRAINT FK_Provincia_Pais FOREIGN KEY ([id_pais]) REFERENCES [Pais]([id_pais])
);

CREATE TABLE [Ciudad] (
	[id_ciudad] int NOT NULL,
	[nombre] nvarchar(80) NOT NULL,
	[id_provincia] int NOT NULL,
	CONSTRAINT PK_Ciudad PRIMARY KEY ([id_ciudad]),
	CONSTRAINT FK_Ciudad_Provincia FOREIGN KEY ([id_provincia]) REFERENCES [Provincia]([id_provincia])
);

CREATE TABLE [Aeropuerto] (
	[cod_iata_aeropuerto] int NOT NULL,
	[nombre] nvarchar(100) NOT NULL,
	[id_ciudad] int NOT NULL,
	CONSTRAINT PK_Aeropuerto PRIMARY KEY ([cod_iata_aeropuerto]),
	CONSTRAINT FK_Aeropuerto_Ciudad FOREIGN KEY ([id_ciudad]) REFERENCES [Ciudad]([id_ciudad])
);

CREATE TABLE [Aerolinea] (
	[id_aerolinea] int NOT NULL,
	[nombre] nvarchar(100) NOT NULL,
	CONSTRAINT PK_Aerolinea PRIMARY KEY ([id_aerolinea])
);

CREATE TABLE [Categoria] (
	[id_categoria] int NOT NULL,
	[nombre] nvarchar(100) NOT NULL,
	[tarifa] float(53) NOT NULL,
	CONSTRAINT PK_Categoria PRIMARY KEY ([id_categoria])
);

CREATE TABLE [Pasajero] (
	[dni_pasajero] int NOT NULL,
	[nombre] nvarchar(100) NOT NULL,
	[apellido] nvarchar(100) NOT NULL,
	[email] nvarchar(100) NOT NULL ,
	[telefono] nvarchar(100) NOT NULL,
	CONSTRAINT PK_Pasajero PRIMARY KEY ([dni_pasajero]),
	CONSTRAINT UQ_Pasajero_Email UNIQUE ([email])
);

CREATE TABLE [Asiento] (
	[id_asiento] int NOT NULL,
	[id_categoria] int NOT NULL,
	CONSTRAINT PK_Asiento PRIMARY KEY ([id_asiento]),
	CONSTRAINT FK_Asiento_Categoria FOREIGN KEY ([id_categoria]) REFERENCES [Categoria]([id_categoria])
);

CREATE TABLE [Avion] (
	[id_avion] int NOT NULL,
	[modelo] nvarchar(100) NOT NULL,
	[capcidad] int NOT NULL,
	[id_aerolinea] int NOT NULL,
	CONSTRAINT PK_Avion PRIMARY KEY ([id_avion]),
	CONSTRAINT FK_Avion_Aerolinea FOREIGN KEY ([id_aerolinea]) REFERENCES [Aerolinea]([id_aerolinea])
);

CREATE TABLE [Pasaje] (
	[id_pasaje] int NOT NULL,
	[costo_total] float(53) NOT NULL,
	[peso_equipaje_extra] decimal(18,0),
	[dni_pasajero] int NOT NULL,
	CONSTRAINT PK_Pasaje PRIMARY KEY ([id_pasaje]),
	CONSTRAINT FK_Pasaje_Pasajero FOREIGN KEY ([dni_pasajero]) REFERENCES [Pasajero]([dni_pasajero])
);



CREATE TABLE [Vuelo] (
	[id_vuelo] int NOT NULL,
	[fecha_salida] datetime NOT NULL,
	[fecha_llegada] datetime NOT NULL,
	[origen] int NOT NULL,
	[destino] int NOT NULL,
	[id_avion] int NOT NULL,
	CONSTRAINT PK_Vuelo PRIMARY KEY ([id_vuelo]),
	CONSTRAINT FK_Vuelo_Aeropuerto_origen FOREIGN KEY ([origen]) REFERENCES [Aeropuerto]([cod_iata_aeropuerto]),
	CONSTRAINT FK_Vuelo_Aeropuerto_destino FOREIGN KEY ([destino]) REFERENCES [Aeropuerto]([cod_iata_aeropuerto]),
	CONSTRAINT FK_Vuelo_Avion FOREIGN KEY ([id_avion]) REFERENCES [Avion]([id_avion])
);

CREATE TABLE [Pasaje_Vuelo] (
	[id_vuelo] int NOT NULL,
	[id_pasaje] int NOT NULL,
	[id_asiento] int NOT NULL,
	CONSTRAINT PK_Pasaje_Vuelo PRIMARY KEY ([id_vuelo], [id_pasaje], [id_asiento]),
	CONSTRAINT FK_Pasaje_Vuelo_Vuelo FOREIGN KEY ([id_vuelo]) REFERENCES [Vuelo]([id_vuelo]),
	CONSTRAINT FK_Pasaje_Vuelo_Pasaje FOREIGN KEY ([id_pasaje]) REFERENCES [Pasaje]([id_pasaje]),
	CONSTRAINT FK_Pasaje_Vuelo_Asiento FOREIGN KEY ([id_asiento]) REFERENCES [Asiento]([id_asiento]),
);
