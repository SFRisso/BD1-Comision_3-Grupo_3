-- SCRIPT "Reserva de pasajes aéreos"
-- INSERCIÓN DEL LOTE DE DATOS

USE Pasajes_Avion;
GO

--Aerolineas
INSERT INTO Aerolinea (id_aerolinea, nombre) VALUES
(1, 'American Airlines'),
(2, 'Delta Air Lines'),
(3, 'United Airlines'),
(4, 'Lufthansa'),
(5, 'Air France'),
(6, 'KLM'),
(7, 'Emirates'),
(8, 'Qatar Airways'),
(9, 'Singapore Airlines'),
(10, 'LATAM'),
(11, 'Aeromexico'),
(12, 'Iberia'),
(13, 'British Airways'),
(14, 'Qantas'),
(15, 'Ethiopian Airlines'),
(16, 'Turkish Airlines'),
(17, 'Air Canada'),
(18, 'Aerolineas Argentinas'); -- Esta Aerolinea no va  a tener ningun avion asignado

--Aviones
INSERT INTO Avion (id_avion, modelo , id_aerolinea) VALUES
(1, 'Boeing 737', 1),
(2, 'Airbus A320', 1),
(3, 'Boeing 747', 2),
(4, 'Boeing 787', 3),
(5, 'Airbus A350', 3),
(6, 'Airbus A380', 4),
(7, 'Airbus A330', 5),
(8, 'Boeing 777', 6),
(9, 'Boeing 777', 7),
(10, 'Boeing 787', 8),
(11, 'Airbus A350', 9),
(12, 'Boeing 767', 10),
(13, 'Airbus A321', 10),
(14, 'Boeing 787', 11),
(15, 'Airbus A340', 12),
(16, 'Boeing 747', 13),
(17, 'Airbus A380', 14),
(18, 'Boeing 787', 15),
(19, 'Airbus A330', 16),
(20, 'Boeing 777', 17),
(21, 'Airbus A320', 4),
(22, 'Boeing 737', 5),
(23, 'Boeing 777', 16),
(24, 'Airbus A321', 17),
(25, 'Boeing 737', 2);

-- Paises
INSERT INTO Pais (id_pais, nombre) VALUES
(1, 'Argentina'),
(2, 'Brasil'),
(3, 'Chile'),
(4, 'España'),
(5, 'Francia'),
(6, 'Alemania'),
(7, 'Italia'),
(8, 'Inglaterra'),
(9, 'Japón'),
(10, 'Canadá'),
(11, 'Estados Unidos');
GO

-- Provincias
INSERT INTO Provincia (id_pais, id_provincia, nombre) VALUES
(1, 1, 'Buenos Aires'),    -- Argentina
(1, 2, 'Córdoba'),         -- Argentina
(1, 3, 'Mendoza'),         -- Argentina
(2, 1, 'São Paulo'),       -- Brasil
(2, 2, 'Rio de Janeiro'),  -- Brasil
(3, 1, 'Metropolitana'),   -- Chile
(4, 1, 'Madrid'),          -- España
(5, 1, 'Île-de-France'),   -- Francia
(6, 1, 'Baviera'),         -- Alemania
(7, 1, 'Lazio'),           -- Italia
(8, 1, 'Londres'),         -- Inglaterra
(9, 1, 'Kanto'),           -- Japón
(10, 1, 'Ontario'),        -- Canadá
(11, 2, 'Illinois'),	   -- Estados Unidos
(11, 3, 'California'),	   -- Estados Unidos
(11, 4, 'Nueva York');     -- Estados Unidos
GO

-- Ciudades
INSERT INTO Ciudad (id_pais, id_provincia, id_ciudad, nombre) VALUES
(1, 1, 1, 'Buenos Aires'),       -- Buenos Aires
(1, 2, 2, 'Córdoba'),            -- Cordoba
(1, 3, 3, 'Mendoza'),            -- Mendoza
(2, 1, 4, 'São Paulo'),          -- São Paulo
(2, 2, 5, 'Rio de Janeiro'),     -- Rio de Janeiro
(3, 1, 6, 'Santiago'),           -- Metropolitana
(4, 1, 7, 'Madrid'),             -- Madrid
(5, 1, 8, 'París'),              -- Île-de-France
(6, 1, 9, 'Múnich'),             -- Baviera
(7, 1, 10, 'Roma'),              -- Lazio
(8, 1, 11, 'Londres'),           -- Londres
(9, 1, 12, 'Tokio'),             -- Kanto
(10, 1, 13, 'Toronto'),          -- Ontario
(11, 2, 14, 'Chicago'),			 -- Illinois
(11, 3, 15, 'Los Ángeles'),		 -- California
(11, 4, 16, 'Nueva York');		 -- Nueva York
GO

-- Aeropuertos
INSERT INTO Aeropuerto (cod_iata_aeropuerto, nombre, id_pais, id_provincia, id_ciudad) VALUES
('EZE', 'Aeropuerto Internacional de Ezeiza', 1, 1, 1),    -- Argentina
('AEP', 'Aeropuerto Jorge Newbery', 1, 1, 1),              -- Argentina
('COR', 'Aeropuerto Internacional de Córdoba', 1, 2, 2),   -- Argentina
('MDZ', 'Aeropuerto Internacional de Mendoza', 1, 3, 3),   -- Argentina
('GRU', 'Aeroporto Internacional de São Paulo/Guarulhos', 2, 1, 4),  -- Brasil
('GIG', 'Aeroporto Internacional do Rio de Janeiro/Galeão', 2, 2, 5), -- Brasil
('SCL', 'Aeropuerto Internacional Comodoro Arturo Merino Benítez', 3, 1, 6), -- Chile
('MAD', 'Aeropuerto Adolfo Suárez Madrid-Barajas', 4, 1, 7),  -- España
('CDG', 'Aeropuerto Charles de Gaulle', 5, 1, 8),           -- Francia
('MUC', 'Aeropuerto de Múnich', 6, 1, 9),                   -- Alemania
('FCO', 'Aeropuerto de Roma-Fiumicino', 7, 1, 10),          -- Italia
('LHR', 'Aeropuerto de Heathrow', 8, 1, 11),                -- Reino Unido
('HND', 'Aeropuerto de Haneda', 9, 1, 12),                  -- Japón
('NRT', 'Aeropuerto de Narita', 9, 1, 12),                  -- Japón
('YYZ', 'Aeropuerto Internacional de Toronto Pearson', 10, 1, 13), -- Canadá
('YVR', 'Aeropuerto Internacional de Vancouver', 10, 1, 13),       -- Canadá
('YUL', 'Aeropuerto Internacional de Montreal-Trudeau', 10, 1, 13), -- Canadá
('ORD', 'Aeropuerto Internacional OHare', 11, 2, 14),        -- Chicago, Illinois
('JFK', 'Aeropuerto Internacional John F. Kennedy', 11, 4, 16), -- Nueva York, Nueva York
('LAX', 'Aeropuerto Internacional de Los Ángeles', 11, 3, 15);   -- Los Ángeles, California
GO

--Clase
INSERT INTO Clase (id_clase, nombre, tarifa_base, tarifa_por_km) VALUES
(1, 'Económica', 100.00, 0.5),
(2, 'Ejecutiva', 300.00, 1.2),
(3, 'Primera Clase', 800.00, 3.0);
GO

-- 106 Pasajeros 
INSERT INTO Pasajero (dni_pasajero, nombre, apellido, email, telefono) VALUES
(55379437, 'Camila', 'Gutiérrez', 'camila.gutierrez@email.com', NULL),
(51758145, 'Lucía', 'Díaz', 'lucia.diaz@email.com', NULL),
(56353889, 'Ezequiel', 'Rojas', 'ezequiel.rojas@email.com', '1113177925'),
(40657984, 'Nicolás', 'Páez', 'nicolas.paez@email.com', '1112880906'),
(44470871, 'Paula', 'Díaz', 'paula.diaz@email.com', '1190834797'),
(55133777, 'Martín', 'García', 'martin.garcia@email.com', '1156784123'),
(50987654, 'Sofía', 'Martínez', 'sofia.martinez@email.com', '1173659084'),
(52645123, 'Valentina', 'Lopez', 'valentina.lopez@email.com', '1135646789'),
(58345001, 'Bruno', 'Fernández', 'bruno.fernandez@email.com', '1147823650'),
(56678000, 'Agustín', 'Vázquez', 'agustin.vazquez@email.com', '1185742102'),
(55001788, 'Joaquín', 'Alvarez', 'joaquin.alvarez@email.com', '1123920543'),
(58624908, 'Micaela', 'Ponce', 'micaela.ponce@email.com', '1173548956'),
(57088925, 'Ramiro', 'Sosa', 'ramiro.sosa@email.com', '1144892637'),
(58792033, 'Cintia', 'Ruiz', 'cintia.ruiz@email.com', '1164789321'),
(59954312, 'Damián', 'Medina', 'damian.medina@email.com', '1119583412'),
(51189123, 'Luz', 'Villar', 'luz.villar@email.com', '1174682790'),
(54812345, 'Pablo', 'Acosta', 'pablo.acosta@email.com', NULL),
(50009876, 'Emiliano', 'Reyes', 'emiliano.reyes@email.com', '1186735124'),
(50908455, 'Natalia', 'Aguirre', 'natalia.aguirre@email.com', '1145879205'),
(54801322, 'Florencia', 'Cruz', 'florencia.cruz@email.com', '1164735281'),
(50789123, 'Luis', 'Cáceres', 'luis.caceres@email.com', '1192348756'),
(52941209, 'Gonzalo', 'López', 'gonzalo.lopez@email.com', '1123456789'),
(59873456, 'Marta', 'Fernández', 'marta.fernandez@email.com', '1189674523'),
(54090234, 'Diego', 'Torres', 'diego.torres@email.com', '1135678910'),
(51412367, 'Mónica', 'González', 'monica.gonzalez@email.com', '1156789345'),
(52673109, 'Leonardo', 'Zárate', 'leonardo.zarate@email.com', '1164539210'),
(50967543, 'Mariana', 'Reyes', 'mariana.reyes@email.com', '1147859436'),
(54321099, 'Juan', 'Aguirre', 'juan.aguirre@email.com', '1134567890'),
(50876543, 'Cristina', 'Bermúdez', 'cristina.bermudez@email.com', '1194857392'),
(55478923, 'Ana', 'Benítez', 'ana.benitez@email.com', '1172984513'),
(50123456, 'Fernando', 'Blanco', 'fernando.blanco@email.com', '1156784312'),
(59967890, 'Mauel', 'Ibarra', 'manuel.ibarra@email.com', '1165432109'),
(57543212, 'Giselle', 'Córdoba', 'giselle.cordoba@email.com', '1187654321'),
(55034987, 'Nadia', 'González', 'nadia.gonzalez@email.com', '1178945621'),
(56872451, 'Mauricio', 'Martínez', 'mauricio.martinez@email.com', '1167839542'),
(50567898, 'Hugo', 'Domínguez', 'hugo.dominguez@email.com', NULL),
(55002109, 'Adriana', 'Peralta', 'adriana.peralta@email.com', '1134925674'),
(51345678, 'Carla', 'Salinas', 'carla.salinas@email.com', '1193456789'),
(54123457, 'Julieta', 'Vega', 'julieta.vega@email.com', '1124689032'),
(50987945, 'Ricardo', 'Campos', 'ricardo.campos@email.com', '1169854321'),
(56983741, 'Fabián', 'Vega', 'fabián.vega@email.com', '1157894568'),
(57484954, 'Marina', 'Segovia', 'marina.segovia@email.com', '1195432109'),
(54321098, 'Lucas', 'González', 'lucas.gonzalez@email.com', '1146348521'),
(57891023, 'Facundo', 'Sosa', 'facundo.sosa@email.com', '1152341987'),
(56123445, 'Silvia', 'Cáceres', 'silvia.caceres@email.com', '1182948632'),
(56000012, 'Tamara', 'López', 'tamara.lopez@email.com', '1124567893'),
(58087654, 'Arturo', 'Mendoza', 'arturo.mendoza@email.com', '1158965432'),
(52347896, 'Diana', 'Giménez', 'diana.gimenez@email.com', '1162345798'),
(53500001, 'Irina', 'Solís', 'irina.solis@email.com', '1147896453'),
(58678123, 'Martín', 'Navarro', 'martin.navarro@email.com', '1192345678'),
(58800112, 'Ariel', 'Medina', 'ariel.medina@email.com', '1112347890'),
(50123478, 'Romina', 'Cruz', 'romina.cruz@email.com', '1173456789'),
(51456790, 'Fernando', 'Vélez', 'fernando.velez@email.com', NULL),
(53087612, 'Susana', 'Cáceres', 'susana.caceres@email.com', NULL),
(56483921, 'Fernando', 'Rivera', 'fernando.rivera@email.com', '1178621473'),
(57234321, 'Salvador', 'Salinas', 'salvador.salinas@email.com', '1134569821'),
(58000009, 'Margarita', 'Castro', 'margarita.castro@email.com', '1157532890'),
(55000123, 'Alberto', 'Sánchez', 'alberto.sanchez@email.com', '1173629845'),
(55890123, 'Daniel', 'López', 'daniel.lopez@email.com', '1169034875'),
(56290783, 'Victoria', 'Ortega', 'victoria.ortega@email.com', '1152389476'),
(57733333, 'Cristian', 'Soto', 'cristian.soto@email.com', '1183215876'),
(54123456, 'Ricardo', 'Ordoñez', 'ricardo.ordonez@email.com', '1128765432'),
(51378945, 'Mónica', 'Alba', 'monica.alba@email.com', '1198456780'),
(58001234, 'Gustavo', 'Fernández', 'gustavo.fernandez@email.com', NULL),
(57983456, 'Elena', 'Torres', 'elena.torres@email.com', NULL),
(54334567, 'Diego', 'Vidal', 'diego.vidal@email.com', '1187894563'),
(50123457, 'María', 'Vázquez', 'maria.vazquez@email.com', '1156784921'),
(50678901, 'Esteban', 'Morrison', 'esteban.morrison@email.com', '1145678901'),
(51456789, 'Julio', 'Ponce', 'julio.ponce@email.com', '1198765432'),
(52000123, 'Adriana', 'Gómez', 'adriana.gomez@email.com', '1163427865'),
(50767890, 'Juliana', 'Maldonado', 'juliana.maldonado@email.com', '1175829436'),
(58043210, 'Óscar', 'Romero', 'oscar.romero@email.com', '1149865327'),
(57589012, 'Patricia', 'Barrios', 'patricia.barrios@email.com', '1134785621'),
(51098765, 'Héctor', 'Cortés', 'hector.cortes@email.com', '1187654329'),
(56223456, 'Flor', 'Salinas', 'flor.salinas@email.com', '1176543210'),
(54012345, 'Lucas', 'Cárdenas', 'lucas.cardenas@email.com', NULL),
(57999901, 'Teresa', 'Valenzuela', 'teresa.valenzuela@email.com', NULL),
(55312345, 'Andrés', 'Pérez', 'andres.perez@email.com', '1145678901'),
(56001234, 'Estefanía', 'Aguirre', 'estefania.aguirre@email.com', '1198765430'),
(58023456, 'Matías', 'Núñez', 'matias.nunez@email.com', '1178765432'),
(51087654, 'Paola', 'Salinas', 'paola.salinas@email.com', '1132345876'),
(52012345, 'Sebastián', 'Ríos', 'sebastian.rios@email.com', '1156789456'),
(53067891, 'Inés', 'Maldonado', 'ines.maldonado@email.com', '1167567834'),
(50789012, 'Alejandro', 'Bermúdez', 'alejandro.bermudez@email.com', '1149876234'),
(57543210, 'Carlos', 'Rojas', 'carlos.rojas@email.com', '1186453279'),
(56321145, 'María', 'Sánchez', 'maria.sanchez@email.com', '1150982345'),
(51112345, 'Camilo', 'Moreno', 'camilo.moreno@email.com', '1162345879'),
(58123456, 'Julieta', 'Guerrero', 'julieta.guerrero@email.com', NULL),
(56012345, 'Ignacio', 'Pizarro', 'ignacio.pizarro@email.com', '1148756312'),
(59012345, 'Sara', 'Vásquez', 'sara.vasquez@email.com', '1198765431'),
(59998765, 'Fabiola', 'Contreras', 'fabiola.contreras@email.com', '1165432987'),
(53067890, 'César', 'Hernández', 'cesar.hernandez@email.com', '1188765431'),
(50987612, 'Yasmin', 'Ríos', 'yasmin.rios@email.com', '1143219865'),
(53000012, 'Lucio', 'Morales', 'lucio.morales@email.com', '1154326789'),
(57087654, 'Iván', 'Rojas', 'ivan.rojas@email.com', '1172348956'),
(58543210, 'Diana', 'Soto', 'diana.soto@email.com', '1134567890'),
(54012398, 'Nicolás', 'Vargas', 'nicolas.vargas@email.com', '1146789012'),
(56100098, 'Salvador', 'Quintero', 'salvador.quintero@email.com', '1169876543'),
(58012345, 'Cristina', 'Molina', 'cristina.molina@email.com', '1178326495'),
(59098765, 'Ángela', 'Salas', 'angela.salas@email.com', '1186347521'),
(56001324, 'Ariel', 'Paredes', 'ariel.paredes@email.com', '1143657890'),
(53123478, 'Bárbara', 'Gallardo', 'barbara.gallardo@email.com', '1158234567'),
(50876545, 'Lara', 'Córdoba', 'lara.cordoba@email.com', '1192348756'),
(56000001, 'Tatiana', 'Hernández', 'tatiana.hernandez@email.com', '1178675432'),
(51189012, 'Eduardo', 'Figueroa', 'eduardo.figueroa@email.com', '1165438765'),
(57000000, 'Rosana', 'Paz', 'rosana.paz@email.com', '1132345890');
GO

-------/// Asientos para 6 aviones ///--------

-- Asientos para (id_avion = 1)
	-- Clase Ejecutiva (id_clase 2)
INSERT INTO Asiento (id_avion, nro_asiento, ventana, id_clase) VALUES
(1, 1, 1, 2), (1, 2, 1, 2), (1, 3, 1, 2), (1, 4, 1, 2), (1, 5, 1, 2),
(1, 6, 1, 2), (1, 7, 1, 2), (1, 8, 1, 2), (1, 9, 1, 2), (1, 10, 1, 2);

	-- Clase Económica (id_clase 1)
INSERT INTO Asiento (id_avion, nro_asiento, ventana, id_clase) VALUES
(1, 11, 1, 1), (1, 12, 0, 1), (1, 13, 1, 1), (1, 14, 0, 1), (1, 15, 1, 1),
(1, 16, 0, 1), (1, 17, 1, 1), (1, 18, 0, 1), (1, 19, 1, 1), (1, 20, 0, 1),
(1, 21, 1, 1), (1, 22, 0, 1), (1, 23, 1, 1), (1, 24, 0, 1), (1, 25, 1, 1),
(1, 26, 0, 1), (1, 27, 1, 1), (1, 28, 0, 1), (1, 29, 1, 1), (1, 30, 0, 1);
GO

-- Asientos para (id_avion 2)
	-- Clase Ejecutiva (id_clase 2)
INSERT INTO Asiento (id_avion, nro_asiento, ventana, id_clase) VALUES
(2, 1, 1, 2), (2, 2, 1, 2), (2, 3, 1, 2), (2, 4, 1, 2), (2, 5, 1, 2),
(2, 6, 0, 2), (2, 7, 0, 2), (2, 8, 0, 2), (2, 9, 0, 2), (2, 10, 0, 2);

	-- Clase Económica (id_clase 1)
INSERT INTO Asiento (id_avion, nro_asiento, ventana, id_clase) VALUES
(2, 11, 1, 1), (2, 12, 0, 1), (2, 13, 1, 1), (2, 14, 0, 1), (2, 15, 1, 1),
(2, 16, 0, 1), (2, 17, 1, 1), (2, 18, 0, 1), (2, 19, 1, 1), (2, 20, 0, 1),
(2, 21, 1, 1), (2, 22, 0, 1), (2, 23, 1, 1), (2, 24, 0, 1), (2, 25, 1, 1),
(2, 26, 0, 1), (2, 27, 1, 1), (2, 28, 0, 1), (2, 29, 1, 1), (2, 30, 0, 1),
(2, 31, 1, 1), (2, 32, 0, 1), (2, 33, 1, 1), (2, 34, 0, 1), (2, 35, 1, 1),
(2, 36, 0, 1), (2, 37, 1, 1), (2, 38, 0, 1), (2, 39, 1, 1), (2, 40, 0, 1),
(2, 41, 1, 1), (2, 42, 0, 1), (2, 43, 1, 1), (2, 44, 0, 1), (2, 45, 1, 1),
(2, 46, 0, 1), (2, 47, 1, 1), (2, 48, 0, 1), (2, 49, 1, 1), (2, 50, 0, 1),
(2, 51, 1, 1), (2, 52, 0, 1), (2, 53, 1, 1), (2, 54, 0, 1), (2, 55, 1, 1),
(2, 56, 0, 1), (2, 57, 1, 1), (2, 58, 0, 1), (2, 59, 1, 1), (2, 60, 0, 1),
(2, 61, 1, 1), (2, 62, 0, 1), (2, 63, 1, 1), (2, 64, 0, 1), (2, 65, 1, 1),
(2, 66, 0, 1), (2, 67, 1, 1), (2, 68, 0, 1), (2, 69, 1, 1), (2, 70, 0, 1),
(2, 71, 1, 1), (2, 72, 0, 1), (2, 73, 1, 1), (2, 74, 0, 1), (2, 75, 1, 1),
(2, 76, 0, 1), (2, 77, 1, 1), (2, 78, 0, 1), (2, 79, 1, 1), (2, 80, 0, 1);

-- Asientos para (id_avion 3) --
	-- Primera Clase (id_clase 3)
INSERT INTO Asiento (id_avion, nro_asiento, ventana, id_clase) VALUES
(3, 1, 1, 3), (3, 2, 1, 3), (3, 3, 1, 3), (3, 4, 1, 3), (3, 5, 1, 3),
(3, 6, 1, 3), (3, 7, 1, 3), (3, 8, 1, 3), (3, 9, 1, 3), (3, 10, 1, 3),
(3, 11, 1, 3), (3, 12, 1, 3), (3, 13, 1, 3), (3, 14, 1, 3), (3, 15, 1, 3),
(3, 16, 1, 3), (3, 17, 1, 3), (3, 18, 1, 3), (3, 19, 1, 3), (3, 20, 1, 3);

	-- Clase Ejecutiva (id_clase 2)
INSERT INTO Asiento (id_avion, nro_asiento, ventana, id_clase) VALUES
(3, 21, 1, 2), (3, 22, 1, 2), (3, 23, 1, 2), (3, 24, 1, 2), (3, 25, 1, 2),
(3, 26, 1, 2), (3, 27, 1, 2), (3, 28, 1, 2), (3, 29, 1, 2), (3, 30, 1, 2),
(3, 31, 1, 2), (3, 32, 1, 2), (3, 33, 1, 2), (3, 34, 1, 2), (3, 35, 1, 2),
(3, 36, 1, 2), (3, 37, 1, 2), (3, 38, 1, 2), (3, 39, 1, 2), (3, 40, 1, 2);

	-- Clase Económica (id_clase 1)
INSERT INTO Asiento (id_avion, nro_asiento, ventana, id_clase) VALUES
(3, 41, 1, 1), (3, 42, 0, 1), (3, 43, 1, 1), (3, 44, 0, 1), (3, 45, 1, 1),
(3, 46, 0, 1), (3, 47, 1, 1), (3, 48, 0, 1), (3, 49, 1, 1), (3, 50, 0, 1),
(3, 51, 1, 1), (3, 52, 0, 1), (3, 53, 1, 1), (3, 54, 0, 1), (3, 55, 1, 1),
(3, 56, 0, 1), (3, 57, 1, 1), (3, 58, 0, 1), (3, 59, 1, 1), (3, 60, 0, 1),
(3, 61, 1, 1), (3, 62, 0, 1), (3, 63, 1, 1), (3, 64, 0, 1), (3, 65, 1, 1),
(3, 66, 0, 1), (3, 67, 1, 1), (3, 68, 0, 1), (3, 69, 1, 1), (3, 70, 0, 1),
(3, 71, 1, 1), (3, 72, 0, 1), (3, 73, 1, 1), (3, 74, 0, 1), (3, 75, 1, 1),
(3, 76, 0, 1), (3, 77, 1, 1), (3, 78, 0, 1), (3, 79, 1, 1), (3, 80, 0, 1),
(3, 81, 1, 1), (3, 82, 0, 1), (3, 83, 1, 1), (3, 84, 0, 1), (3, 85, 1, 1),
(3, 86, 0, 1), (3, 87, 1, 1), (3, 88, 0, 1), (3, 89, 1, 1), (3, 90, 0, 1),
(3, 91, 1, 1), (3, 92, 0, 1), (3, 93, 1, 1), (3, 94, 0, 1), (3, 95, 1, 1),
(3, 96, 0, 1), (3, 97, 1, 1), (3, 98, 0, 1), (3, 99, 1, 1), (3, 100, 0, 1);
GO

-- Asientos para (id_avion = 4)
	-- Clase Ejecutiva (id_clase 2)
INSERT INTO Asiento (id_avion, nro_asiento, ventana, id_clase) VALUES
(4, 1, 1, 2), (4, 2, 1, 2), (4, 3, 1, 2), (4, 4, 1, 2), (4, 5, 1, 2),
(4, 6, 1, 2), (4, 7, 1, 2), (4, 8, 1, 2), (4, 9, 1, 2), (4, 10, 1, 2);

	-- Clase Económica (id_clase 1)
INSERT INTO Asiento (id_avion, nro_asiento, ventana, id_clase) VALUES
(4, 11, 1, 1), (4, 12, 0, 1), (4, 13, 1, 1), (4, 14, 0, 1), (4, 15, 1, 1),
(4, 16, 0, 1), (4, 17, 1, 1), (4, 18, 0, 1), (4, 19, 1, 1), (4, 20, 0, 1),
(4, 21, 1, 1), (4, 22, 0, 1), (4, 23, 1, 1), (4, 24, 0, 1), (4, 25, 1, 1),
(4, 26, 0, 1), (4, 27, 1, 1), (4, 28, 0, 1), (4, 29, 1, 1), (4, 30, 0, 1);
GO

-- Asientos para (id_avion = 5)
-- Clase Ejecutiva (id_clase 2)
INSERT INTO Asiento (id_avion, nro_asiento, ventana, id_clase) VALUES
(5, 1, 1, 2), (5, 2, 1, 2), (5, 3, 1, 2), (5, 4, 1, 2), (5, 5, 1, 2),
(5, 6, 1, 2), (5, 7, 1, 2), (5, 8, 1, 2), (5, 9, 1, 2), (5, 10, 1, 2),
(5, 11, 1, 2), (5, 12, 1, 2), (5, 13, 1, 2), (5, 14, 1, 2), (5, 15, 1, 2),
(5, 16, 1, 2), (5, 17, 1, 2), (5, 18, 1, 2), (5, 19, 1, 2), (5, 20, 1, 2);

-- Clase Económica (id_clase 1)
INSERT INTO Asiento (id_avion, nro_asiento, ventana, id_clase) VALUES
(5, 21, 1, 1), (5, 22, 0, 1), (5, 23, 1, 1), (5, 24, 0, 1), (5, 25, 1, 1),
(5, 26, 0, 1), (5, 27, 1, 1), (5, 28, 0, 1), (5, 29, 1, 1), (5, 30, 0, 1),
(5, 31, 1, 1), (5, 32, 0, 1), (5, 33, 1, 1), (5, 34, 0, 1), (5, 35, 1, 1),
(5, 36, 0, 1), (5, 37, 1, 1), (5, 38, 0, 1), (5, 39, 1, 1), (5, 40, 0, 1),
(5, 41, 1, 1), (5, 42, 0, 1), (5, 43, 1, 1), (5, 44, 0, 1), (5, 45, 1, 1),
(5, 46, 0, 1), (5, 47, 1, 1), (5, 48, 0, 1), (5, 49, 1, 1), (5, 50, 0, 1);
GO

-- Asientos para (id_avion = 6)
	-- Clase Ejecutiva (id_clase 2)
INSERT INTO Asiento (id_avion, nro_asiento, ventana, id_clase) VALUES
(6, 1, 1, 2), (6, 2, 1, 2), (6, 3, 1, 2), (6, 4, 1, 2), (6, 5, 1, 2),
(6, 6, 1, 2), (6, 7, 1, 2), (6, 8, 1, 2), (6, 9, 1, 2), (6, 10, 1, 2),
(6, 11, 1, 2), (6, 12, 1, 2), (6, 13, 1, 2), (6, 14, 1, 2), (6, 15, 1, 2),
(6, 16, 1, 2), (6, 17, 1, 2), (6, 18, 1, 2), (6, 19, 1, 2), (6, 20, 1, 2),
(6, 21, 1, 2), (6, 22, 1, 2), (6, 23, 1, 2), (6, 24, 1, 2), (6, 25, 1, 2),
(6, 26, 1, 2), (6, 27, 1, 2), (6, 28, 1, 2), (6, 29, 1, 2), (6, 30, 1, 2);

	-- Clase Económica (id_clase 1)
INSERT INTO Asiento (id_avion, nro_asiento, ventana, id_clase) VALUES
(6, 31, 1, 1), (6, 32, 0, 1), (6, 33, 1, 1), (6, 34, 0, 1), (6, 35, 1, 1),
(6, 36, 0, 1), (6, 37, 1, 1), (6, 38, 0, 1), (6, 39, 1, 1), (6, 40, 0, 1),
(6, 41, 1, 1), (6, 42, 0, 1), (6, 43, 1, 1), (6, 44, 0, 1), (6, 45, 1, 1),
(6, 46, 0, 1), (6, 47, 1, 1), (6, 48, 0, 1), (6, 49, 1, 1), (6, 50, 0, 1),
(6, 51, 1, 1), (6, 52, 0, 1), (6, 53, 1, 1), (6, 54, 0, 1), (6, 55, 1, 1),
(6, 56, 0, 1), (6, 57, 1, 1), (6, 58, 0, 1), (6, 59, 1, 1), (6, 60, 0, 1),
(6, 61, 1, 1), (6, 62, 0, 1), (6, 63, 1, 1), (6, 64, 0, 1), (6, 65, 1, 1),
(6, 66, 0, 1), (6, 67, 1, 1), (6, 68, 0, 1), (6, 69, 1, 1), (6, 70, 0, 1),
(6, 71, 1, 1), (6, 72, 0, 1), (6, 73, 1, 1), (6, 74, 0, 1), (6, 75, 1, 1),
(6, 76, 0, 1), (6, 77, 1, 1), (6, 78, 0, 1), (6, 79, 1, 1), (6, 80, 0, 1);
GO

-- Insertar 40 vuelos en la tabla Vuelo
INSERT INTO Vuelo (id_vuelo, fecha_salida, fecha_llegada, origen, destino, distancia_km, id_avion) VALUES
(1, '2024-11-01 08:00', '2024-11-01 10:00', 'ORD', 'JFK', 1300, 1),
(2, '2024-11-01 09:00', '2024-11-01 12:00', 'ORD', 'LAX', 2900, 2),
(3, '2024-11-01 10:00', '2024-11-01 12:00', 'JFK', 'ORD', 1300, 3),
(4, '2024-11-01 11:00', '2024-11-01 14:00', 'LAX', 'SCL', 7500, 4),
(5, '2024-11-01 12:00', '2024-11-01 16:00', 'SCL', 'ORD', 7500, 5),
(6, '2024-11-01 13:00', '2024-11-01 15:00', 'ORD', 'SCL', 7500, 6),
(7, '2024-11-01 14:00', '2024-11-01 16:00', 'JFK', 'LAX', 4000, 1),
(8, '2024-11-01 15:00', '2024-11-01 18:00', 'LAX', 'JFK', 4000, 2),
(9, '2024-11-02 08:00', '2024-11-02 10:00', 'ORD', 'JFK', 1300, 3),
(10, '2024-11-02 09:00', '2024-11-02 12:00', 'JFK', 'LAX', 4000, 4),
(11, '2024-11-02 10:00', '2024-11-02 12:00', 'LAX', 'SCL', 7500, 5),
(12, '2024-11-02 11:00', '2024-11-02 15:00', 'SCL', 'ORD', 7500, 6),
(13, '2024-11-02 12:00', '2024-11-02 14:00', 'ORD', 'JFK', 1300, 1),
(14, '2024-11-02 13:00', '2024-11-02 16:00', 'JFK', 'LAX', 4000, 2),
(15, '2024-11-02 14:00', '2024-11-02 16:00', 'LAX', 'ORD', 2900, 3),
(16, '2024-11-02 15:00', '2024-11-02 18:00', 'ORD', 'SCL', 7500, 4),
(17, '2024-11-03 08:00', '2024-11-03 10:00', 'SCL', 'JFK', 7500, 5),
(18, '2024-11-03 09:00', '2024-11-03 11:00', 'JFK', 'ORD', 1300, 6),
(19, '2024-11-03 10:00', '2024-11-03 12:00', 'ORD', 'LAX', 2900, 1),
(20, '2024-11-03 11:00', '2024-11-03 13:00', 'LAX', 'SCL', 7500, 2),
(21, '2024-11-03 12:00', '2024-11-03 15:00', 'SCL', 'ORD', 7500, 3),
(22, '2024-11-03 13:00', '2024-11-03 15:00', 'ORD', 'JFK', 1300, 4),
(23, '2024-11-03 14:00', '2024-11-03 16:00', 'JFK', 'LAX', 4000, 5),
(24, '2024-11-04 08:00', '2024-11-04 10:00', 'LAX', 'SCL', 7500, 6),
(25, '2024-11-04 09:00', '2024-11-04 11:00', 'SCL', 'ORD', 7500, 1),
(26, '2024-11-04 10:00', '2024-11-04 12:00', 'ORD', 'JFK', 1300, 2),
(27, '2024-11-04 11:00', '2024-11-04 13:00', 'JFK', 'LAX', 4000, 3),
(28, '2024-11-04 12:00', '2024-11-04 15:00', 'LAX', 'SCL', 7500, 4),
(29, '2024-11-04 13:00', '2024-11-04 15:00', 'SCL', 'ORD', 7500, 5),
(30, '2024-11-04 14:00', '2024-11-04 16:00', 'ORD', 'JFK', 1300, 6),
(31, '2024-11-05 08:00', '2024-11-05 10:00', 'JFK', 'LAX', 4000, 1),
(32, '2024-11-05 09:00', '2024-11-05 11:00', 'LAX', 'SCL', 7500, 2),
(33, '2024-11-05 10:00', '2024-11-05 12:00', 'SCL', 'ORD', 7500, 3),
(34, '2024-11-05 11:00', '2024-11-05 13:00', 'ORD', 'JFK', 1300, 4),
(35, '2024-11-05 12:00', '2024-11-05 14:00', 'JFK', 'LAX', 4000, 5),
(36, '2024-11-05 13:00', '2024-11-05 15:00', 'LAX', 'SCL', 7500, 6),
(37, '2024-11-06 08:00', '2024-11-06 10:00', 'SCL', 'ORD', 7500, 1),
(38, '2024-11-06 09:00', '2024-11-06 11:00', 'ORD', 'JFK', 1300, 2),
(39, '2024-11-06 10:00', '2024-11-06 12:00', 'JFK', 'LAX', 4000, 3),
(40, '2024-11-06 11:00', '2024-11-06 13:00', 'LAX', 'SCL', 7500, 4);
GO

-- 41 Pasajes
INSERT INTO Pasaje (id_pasaje, peso_equipaje_extra, dni_pasajero) VALUES
(1, NULL, 40657984),
(2, 5.00, 44470871),
(3, 10.00, 50009876),
(4, NULL, 50123456),
(5, 15.00, 50123457),
(6, NULL, 50123478),
(7, 20.00, 50567898),
(8, NULL, 50678901),
(9, NULL, 50767890),
(10, 5.00, 50789012),
(11, NULL, 50789123),
(12, 10.00, 50876543),
(13, 15.00, 50876545),
(14, NULL, 50908455),
(15, NULL, 50967543),
(16, NULL, 50987612),
(17, NULL, 50987654),
(18, 5.00, 51087654),
(19, 10.00, 51189012),
(20, 15.00, 51378945),
(21, NULL, 51412367),
(22, NULL, 52000123),
(23, NULL, 52645123),
(24, 10.00, 52673109),
(25, 15.00, 53123478),
(26, NULL, 54123456),
(27, NULL, 54123457),
(28, 5.00, 54321099),
(29, 10.00, 55133777),
(30, NULL, 55312345),
(31, 5.00, 55379437),
(32, NULL, 55890123),
(33, 10.00, 55890123),
(34, 15.00, 56000012),
(35, NULL, 56001234),
(36, NULL, 56001324),
(37, 5.00, 56012345),
(38, 10.00, 56100098),
(39, NULL, 56123445),
(40, 5.00, 56223456),
(41, NULL, 56290783);
GO

-- Insertar 70 registros en Pasaje_Vuelo
INSERT INTO Pasaje_Vuelo (id_vuelo, id_pasaje, id_avion, nro_asiento) VALUES
(1, 1, 1, 1),
(1, 2, 1, 2),
(1, 3, 1, 3),
(1, 4, 1, 4),
(1, 5, 1, 5),
(1, 6, 1, 6),
(1, 7, 1, 7),
(1, 8, 1, 8),
(1, 9, 1, 9),
(1, 10, 1, 10),
(2, 11, 2, 1),
(2, 12, 2, 2),
(2, 13, 2, 3),
(2, 14, 2, 4),
(2, 15, 2, 5),
(2, 16, 2, 6),
(2, 17, 2, 7),
(2, 18, 2, 8),
(2, 19, 2, 9),
(2, 20, 2, 10),
(3, 21, 3, 1),
(3, 22, 3, 2),
(3, 23, 3, 3),
(3, 24, 3, 4),
(3, 25, 3, 5),
(3, 26, 3, 6),
(3, 27, 3, 7),
(3, 28, 3, 8),
(3, 29, 3, 9),
(3, 30, 3, 10),
(4, 31, 4, 1),
(4, 32, 4, 2),
(4, 33, 4, 3),
(4, 34, 4, 4),
(4, 35, 4, 5),
(4, 36, 4, 6),
(4, 37, 4, 7),
(4, 38, 4, 8),
(4, 39, 4, 9),
(4, 40, 4, 10),
(5, 41, 5, 1),
(5, 1, 5, 2),
(5, 2, 5, 3),
(5, 3, 5, 4),
(5, 4, 5, 5),
(5, 5, 5, 6),
(5, 6, 5, 7),
(5, 7, 5, 8),
(5, 8, 5, 9),
(5, 9, 5, 10),
(6, 10, 6, 1),
(6, 11, 6, 2),
(6, 12, 6, 3),
(6, 13, 6, 4),
(6, 14, 6, 5),
(6, 15, 6, 6),
(6, 16, 6, 7),
(6, 17, 6, 8),
(6, 18, 6, 9),
(6, 19, 6, 10),
(7, 10, 6, 1),
(7, 11, 6, 2),
(7, 12, 6, 3),
(7, 13, 6, 4),
(7, 14, 6, 5),
(7, 15, 6, 6),
(7, 16, 6, 7),
(7, 17, 6, 8),
(7, 18, 6, 9),
(7, 19, 6, 10);
GO
