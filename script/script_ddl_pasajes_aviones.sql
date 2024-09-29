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
	[email] nvarchar(max) NOT NULL UNIQUE,
	[telefono] nvarchar(max) NOT NULL,
	CONSTRAINT PK_Pasajero PRIMARY KEY ([dni_pasajero])
);

CREATE TABLE [Asiento] (
	[id_asiento] int NOT NULL,
	[id_categoria] int NOT NULL,
	CONSTRAINT PK_Asiento PRIMARY KEY ([id_asiento]),
	CONSTRAINT FK_Asiento_Categoria FOREIGN KEY ([id_categoria]) REFERENCES [Categoria]([id_categoria])
);

CREATE TABLE [Pasaje] (
	[id_pasaje] int NOT NULL,
	[costo_total] float(53) NOT NULL,
	[peso_equipaje_extra] decimal(18,0),
	[dni_pasajero] int NOT NULL,
	PRIMARY KEY ([id_pasaje])
);

CREATE TABLE [Avion] (
	[id_avion] int NOT NULL,
	[modelo] nvarchar(100) NOT NULL,
	[capcidad] int NOT NULL,
	[id_aerolinea] int NOT NULL,
	PRIMARY KEY ([id_avion])
);

CREATE TABLE [Vuelo] (
	[id_vuelo] int NOT NULL,
	[fecha_salida] datetime NOT NULL,
	[fecha_llegada] datetime NOT NULL,
	[origen] int NOT NULL,
	[destino] int NOT NULL,
	[id_avion] int NOT NULL,
	PRIMARY KEY ([id_vuelo])
);

CREATE TABLE [Pasaje_Vuelo] (
	[id_vuelo] int NOT NULL,
	[id_pasaje] int NOT NULL,
	[id_asiento] int NOT NULL,
	PRIMARY KEY ([id_vuelo], [id_pasaje], [id_asiento])
);






ALTER TABLE [Pasaje] ADD CONSTRAINT [Pasaje_fk3] FOREIGN KEY ([dni_pasajero]) REFERENCES [Pasajero]([dni_pasajero]);

ALTER TABLE [Avion] ADD CONSTRAINT [Avion_fk3] FOREIGN KEY ([id_aerolinea]) REFERENCES [Aerolinea]([id_aerolinea]);
ALTER TABLE [Vuelo] ADD CONSTRAINT [Vuelo_fk3] FOREIGN KEY ([origen]) REFERENCES [Aeropuerto]([cod_iata_aeropuerto]);

ALTER TABLE [Vuelo] ADD CONSTRAINT [Vuelo_fk4] FOREIGN KEY ([destino]) REFERENCES [Aeropuerto]([cod_iata_aeropuerto]);

ALTER TABLE [Vuelo] ADD CONSTRAINT [Vuelo_fk5] FOREIGN KEY ([id_avion]) REFERENCES [Avion]([id_avion]);
ALTER TABLE [Pasaje_Vuelo] ADD CONSTRAINT [Pasaje_Vuelo_fk0] FOREIGN KEY ([id_vuelo]) REFERENCES [Vuelo]([id_vuelo]);

ALTER TABLE [Pasaje_Vuelo] ADD CONSTRAINT [Pasaje_Vuelo_fk1] FOREIGN KEY ([id_pasaje]) REFERENCES [Pasaje]([id_pasaje]);

ALTER TABLE [Pasaje_Vuelo] ADD CONSTRAINT [Pasaje_Vuelo_fk2] FOREIGN KEY ([id_asiento]) REFERENCES [Asiento]([id_asiento]);


ALTER TABLE [Asiento] ADD 