-- SCRIPT "Reserva de pasajes aéreos"
-- INSERCIÓN DEL LOTE DE DATOS

USE Pasajes_Aereos;
GO

--Aerolineas
INSERT INTO Aerolinea(id_aerolinea, nombre)
VALUES(1, 'American Airlines'),
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
INSERT INTO Avion(id_avion, modelo, id_aerolinea)
VALUES(1, 'Boeing 737', 1),
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
INSERT INTO Pais(id_pais, nombre)
VALUES(1, 'Argentina'),
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
INSERT INTO Provincia(id_pais, id_provincia, nombre)
VALUES(1, 1, 'Buenos Aires'),    -- Argentina
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
INSERT INTO Ciudad(id_pais, id_provincia, id_ciudad, nombre)
VALUES(1, 1, 1, 'Buenos Aires'),       -- Buenos Aires
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
INSERT INTO Aeropuerto(cod_iata_aeropuerto, nombre, id_pais, id_provincia, id_ciudad)
VALUES('EZE', 'Aeropuerto Internacional de Ezeiza', 1, 1, 1),    -- Argentina
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
INSERT INTO Clase(id_clase, nombre, tarifa_base, tarifa_por_km)
VALUES(1, 'Económica', 100.00, 0.5),
	  (2, 'Ejecutiva', 300.00, 1.2),
	  (3, 'Primera Clase', 800.00, 3.0);
GO

-- 120 Pasajeros 
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(1, 53632620, 'Odelle', 'Cardenas', 'ocardenas0@i2i.jp', NULL, '1998-03-22');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(2, 38727446, 'Kurtis', 'Goldsworthy', 'kgoldsworthy1@xinhuanet.com', 541577209187, '1957-12-13');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(3, 46726242, 'Ely', 'Divell', 'edivell2@angelfire.com', 541434607271, '1961-09-15');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(4, 58217065, 'Birch', 'Large', 'blarge3@state.gov', 541067525310, '1981-06-17');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(5, 27259589, 'Vania', 'Sirmon', 'vsirmon4@pbs.org', 541118335395, '1980-08-16');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(6, 49920720, 'Emelda', 'Sprankling', 'esprankling5@telegraph.co.uk', 541767662482, '1953-10-12');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(7, 51773498, 'Mylo', 'Davidi', 'mdavidi6@who.int', 541683064813, '1979-09-28');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(8, 46482045, 'Dorotea', 'Tassel', 'dtassel7@histats.com', 541519099567, '1975-03-15');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(9, 32939399, 'Fianna', 'Roskam', 'froskam8@xing.com', NULL, '2002-12-15');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(10, 57196756, 'Kimmie', 'Mineghelli', 'kmineghelli9@tripadvisor.com', 541599696378, '1956-10-24');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(11, 57520580, 'Sileas', 'Ateggart', 'sateggarta@wiley.com', 541695474839, '1952-05-01');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(12, 33791873, 'Austin', 'Mellem', 'amellemb@biglobe.ne.jp', 541820077498, '2004-03-04');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(13, 46681156, 'Audrey', 'McKirton', 'amckirtonc@yelp.com', 541673048825, '1986-10-05');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(14, 56480640, 'Gawain', 'Westby', 'gwestbyd@nydailynews.com', 541135896748, '2016-08-06');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(15, 25367310, 'Ellie', 'Arbuckel', 'earbuckele@squidoo.com', 541368526292, '2008-03-22');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(16, 38694980, 'Tisha', 'Heinz', 'theinzf@facebook.com', NULL, '1957-04-07');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(17, 24786718, 'Terrel', 'Clorley', 'tclorleyg@reference.com', 541537164498, '1952-02-07');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(18, 56630207, 'Harley', 'Tripe', 'htripeh@ustream.tv', 541176161867, '2002-07-20');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(19, 49362655, 'Bunnie', 'Sellstrom', 'bsellstromi@buzzfeed.com', 541136486422, '1941-02-26');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(20, 28882511, 'Paule', 'Cottee', 'pcotteej@exblog.jp', 541044927271, '2015-10-07');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(21, 41182739, 'Martino', 'Gaiger', 'mgaigerk@naver.com', 541685462334, '1996-02-03');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(22, 59581633, 'Faye', 'Mahody', 'fmahodyl@businesswire.com', 541182892061, '1986-08-11');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(23, 31205860, 'Gilberte', 'Spavins', 'gspavinsm@howstuffworks.com', 541586491897, '2010-08-29');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(24, 39909506, 'Shaun', 'Quogan', 'squogann@drupal.org', 541042857256, '1942-04-01');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(25, 57668483, 'Artemas', 'Perks', 'aperkso@ox.ac.uk', 541858997458, '1951-08-14');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(26, 49681094, 'Neal', 'Kop', 'nkopp@cargocollective.com', 541632842460, '2000-01-29');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(27, 51782319, 'Hermine', 'Martin', 'hmartinq@altervista.org', 541349670502, '1966-10-08');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(28, 32751637, 'Aprilette', 'Goreisr', 'agoreisrr@qq.com', 541839286447, '1986-09-08');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(29, 23260674, 'Devin', 'Ottosen', 'dottosens@imdb.com', NULL, '1946-07-23');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(30, 29477519, 'Laural', 'Queyos', 'lqueyost@abc.net.au', 541333870066, '1998-04-24');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(31, 36565035, 'Rebecka', 'Drysdall', 'rdrysdallu@hp.com', 541100197773, '1984-03-04');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(32, 36354829, 'Myriam', 'Pennyman', 'mpennymanv@aboutads.info', 541269988009, '1938-02-06');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(33, 24247476, 'Gerrard', 'Lautie', 'glautiew@moonfruit.com', NULL, '2011-08-14');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(34, 32420136, 'Mohandis', 'Riccione', 'mriccionex@theguardian.com', 541816148491, '1996-11-09');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(35, 44826719, 'Mamie', 'Juares', 'mjuaresy@wikispaces.com', 541509182001, '1998-01-15');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(36, 41690731, 'Cazzie', 'Parton', 'cpartonz@wix.com', 541443895612, '1973-11-26');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(37, 36344079, 'Vallie', 'Gollin', 'vgollin10@salon.com', 541101419626, '1977-05-07');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(38, 50724049, 'Saul', 'Revie', 'srevie11@hao123.com', 541309804944, '1985-11-24');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(39, 48994871, 'Marianne', 'Folomin', 'mfolomin12@npr.org', 541296712493, '1962-05-22');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(40, 31446240, 'Fiann', 'Tirrell', 'ftirrell13@mysql.com', 541787297883, '1935-09-10');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(41, 31696733, 'Fairleigh', 'Greenhough', 'fgreenhough14@sourceforge.net', 541611834848, '2007-10-20');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(42, 23241234, 'Lurette', 'Pettitt', 'lpettitt15@intel.com', 541749742733, '1974-12-03');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(43, 59209843, 'Carlos', 'Bremmell', 'cbremmell16@jimdo.com', 541899559486, '1937-01-10');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(44, 56292526, 'Claudette', 'Nund', 'cnund17@xrea.com', 541030698267, '1972-01-01');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(45, 26918722, 'Sylvan', 'Stapford', 'sstapford18@tuttocitta.it', 541625145217, '2005-03-06');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(46, 58010755, 'Osbourn', 'Minot', 'ominot19@4shared.com', 541043667598, '2004-08-22');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(47, 35483595, 'Yul', 'Setterington', 'ysetterington1a@newyorker.com', 541678581372, '1972-02-18');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(48, 26520294, 'Karole', 'Hollingsby', 'khollingsby1b@yale.edu', 541562160412, '1939-08-29');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(49, 34404722, 'Hayley', 'Cramphorn', 'hcramphorn1c@wikimedia.org', 541850178756, '1949-03-20');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(50, 35114573, 'Tris', 'Edgson', 'tedgson1d@cdc.gov', 541349603660, '2018-08-05');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(51, 22339327, 'Kaleb', 'Longlands', 'klonglands1e@networkadvertising.org', NULL, '1960-11-15');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(52, 37007701, 'Harlen', 'Sackur', 'hsackur1f@liveinternet.ru', 541160953573, '1949-02-03');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(53, 28771271, 'Briana', 'Pragnell', 'bpragnell1g@hexun.com', 541809906519, '1970-01-16');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(54, 44964865, 'Dierdre', 'Gley', 'dgley1h@i2i.jp', 541239375550, '1947-12-02');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(55, 52502260, 'Suzie', 'Kobieriecki', 'skobieriecki1i@fda.gov', 541868779313, '1995-10-31');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(56, 20881306, 'Georgianne', 'Hendrickx', 'ghendrickx1j@quantcast.com', 541469938086, '1990-10-09');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(57, 27142528, 'Brook', 'Watkinson', 'bwatkinson1k@spotify.com', 541138666849, '2005-02-05');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(58, 33811904, 'Minette', 'Freak', 'mfreak1l@businessinsider.com', 541607552561, '1941-09-06');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(59, 59419792, 'Hoyt', 'Colleran', 'hcolleran1m@cpanel.net', NULL, '1980-12-21');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(60, 30044146, 'Tandy', 'Westell', 'twestell1n@hugedomains.com', 541049219328, '1939-02-06');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(61, 30811678, 'Ad', 'Summerly', 'asummerly1o@slashdot.org', 541453135212, '1937-03-25');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(62, 59075019, 'Koenraad', 'Yurukhin', 'kyurukhin1p@sfgate.com', 541833586447, '1941-07-11');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(63, 48809621, 'Mervin', 'De Domenici', 'mdedomenici1q@answers.com', 541406241976, '2018-04-16');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(64, 22348794, 'Chery', 'Dooly', 'cdooly1r@cdbaby.com', 541564472648, '2008-05-17');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(65, 49242796, 'Ly', 'Lorente', 'llorente1s@discovery.com', 541899427486, '1942-02-03');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(66, 28923176, 'Caprice', 'Armin', 'carmin1t@jimdo.com', NULL, '1994-05-01');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(67, 37054978, 'Cariotta', 'Burgen', 'cburgen1u@ask.com', NULL, '1999-08-01');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(68, 33049069, 'Letty', 'Okenfold', 'lokenfold1v@51.la', 541323930796, '2010-09-29');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(69, 35198055, 'Ronnica', 'McCarlie', 'rmccarlie1w@noaa.gov', NULL, '2006-05-01');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(70, 20268122, 'Meredeth', 'Cockaday', 'mcockaday1x@meetup.com', 541694002467, '1985-08-31');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(71, 41585808, 'Bertie', 'Cardello', 'bcardello1y@topsy.com', 541988602682, '1978-12-30');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(72, 58879396, 'Aundrea', 'Elvidge', 'aelvidge1z@privacy.gov.au', 541624711056, '1954-12-06');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(73, 33437492, 'Andrey', 'Beig', 'abeig20@w3.org', 541108049873, '2012-09-01');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(74, 50673153, 'Nickie', 'Cubbino', 'ncubbino21@tinyurl.com', NULL, '1937-07-27');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(75, 53426028, 'Adella', 'Staining', 'astaining22@fotki.com', 541035750075, '2008-01-14');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(76, 43555000, 'Briano', 'Dunkerton', 'bdunkerton23@naver.com', 541546180058, '1978-04-06');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(77, 28177622, 'Samantha', 'Seedull', 'sseedull24@engadget.com', 541712576119, '1996-08-07');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(78, 37921167, 'Francesca', 'Bubear', 'fbubear25@macromedia.com', 541424945697, '1968-08-19');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(79, 55113693, 'Hinda', 'Greenway', 'hgreenway26@flickr.com', 541260387552, '1944-07-13');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(80, 45823072, 'Jacqueline', 'Faley', 'jfaley27@marketwatch.com', 541473164842, '1972-10-27');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(81, 20296455, 'Wilhelmine', 'Enterle', 'wenterle28@about.com', 541139043157, '1960-10-13');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(82, 44021512, 'Cletus', 'Barrett', 'cbarrett29@hatena.ne.jp', 541418251525, '1942-09-05');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(83, 56158962, 'Cirstoforo', 'Gittens', 'cgittens2a@ucoz.ru', 541613386015, '1975-10-17');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(84, 57346086, 'Zenia', 'McIntee', 'zmcintee2b@instagram.com', NULL, '1959-11-28');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(85, 55714453, 'Demetris', 'Red', 'dred2c@xinhuanet.com', 541701065213, '1976-04-15');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(86, 45833770, 'Matthus', 'Woollin', 'mwoollin2d@comsenz.com', 541129190195, '1971-10-06');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(87, 42807646, 'Kellby', 'Checcuzzi', 'kcheccuzzi2e@go.com', 541005540048, '2022-06-06');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(88, 48019101, 'Eustacia', 'Redshaw', 'eredshaw2f@wikipedia.org', 541050946950, '1984-11-22');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(89, 29102542, 'Shayna', 'Bonnick', 'sbonnick2g@hugedomains.com', 541153355334, '1935-10-16');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(90, 54649376, 'Kurtis', 'Endean', 'kendean2h@arizona.edu', 541255733993, '1968-03-17');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(91, 57072058, 'Stesha', 'Finlater', 'sfinlater2i@chicagotribune.com', 541087274868, '1989-01-28');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(92, 38235292, 'Nicky', 'Lepper', 'nlepper2j@jimdo.com', 541343174078, '1989-02-11');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(93, 39455522, 'Felicio', 'Kits', 'fkits2k@sogou.com', 541490584561, '1977-02-22');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(94, 29890229, 'Dieter', 'Preddy', 'dpreddy2l@discuz.net', 541425804030, '1991-07-24');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(95, 56586340, 'Minne', 'Petera', 'mpetera2m@apache.org', 541389811239, '1957-05-04');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(96, 43385674, 'Lacy', 'Merwede', 'lmerwede2n@oaic.gov.au', 541451501672, '1986-09-10');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(97, 55522702, 'Sarine', 'Laing', 'slaing2o@jimdo.com', 541797792424, '1996-10-21');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(98, 23279528, 'Dennie', 'Wigglesworth', 'dwigglesworth2p@multiply.com', 541541747005, '1964-07-10');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(99, 34189939, 'Henryetta', 'Tyreman', 'htyreman2q@mac.com', 541065237993, '1948-02-11');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(100, 36783593, 'Jay', 'Waulker', 'jwaulker2r@usnews.com', 541178460475, '2022-09-24');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(101, 43223373, 'Kevyn', 'Baltzar', 'kbaltzar2s@fc2.com', 541747783944, '2005-02-18');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(102, 47713223, 'Sally', 'Comford', 'scomford2t@shop-pro.jp', 541710680977, '2019-06-19');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(103, 23607598, 'Gorden', 'Elloway', 'gelloway2u@aboutads.info', 541310006331, '1993-11-30');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(104, 36544845, 'Reeva', 'Bristo', 'rbristo2v@ameblo.jp', 541812289134, '1939-03-12');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(105, 39674619, 'Dane', 'Breckwell', 'dbreckwell2w@fc2.com', 541616576285, '2016-02-02');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(106, 27380923, 'Muffin', 'Matthews', 'mmatthews2x@wordpress.org', 541712366611, '1977-06-01');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(107, 41430421, 'Grannie', 'Ragge', 'gragge2y@uiuc.edu', 541858754723, '1946-08-08');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(108, 38124963, 'Royall', 'Scotfurth', 'rscotfurth2z@whitehouse.gov', 541287086351, '1962-10-17');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(109, 31885389, 'Crysta', 'Conway', 'cconway30@hexun.com', NULL, '1972-05-12');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(110, 35373341, 'Andrea', 'Handrick', 'ahandrick31@nytimes.com', 541302531357, '1985-06-27');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(111, 49011540, 'Berri', 'Peplay', 'bpeplay32@blinklist.com', 541837523826, '1944-01-24');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(112, 45356060, 'Robinett', 'Dufaur', 'rdufaur33@istockphoto.com', 541196590650, '2007-05-17');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(113, 34718774, 'Lelah', 'Najara', 'lnajara34@google.pl', NULL, '1954-12-10');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(114, 52326338, 'Angelique', 'Boribal', 'aboribal35@unc.edu', 541366408378, '1946-12-30');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(115, 42298031, 'Alaine', 'Itzkovici', 'aitzkovici36@altervista.org', 541371373358, '2001-06-13');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(116, 23769842, 'Matilde', 'Doey', 'mdoey37@homestead.com', 541232646215, '1987-10-25');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(117, 58339734, 'Nanni', 'Rawlyns', 'nrawlyns38@patch.com', 541491363199, '1955-04-07');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(118, 32628074, 'Milicent', 'Benterman', 'mbenterman39@oaic.gov.au', 541804110231, '1935-02-13');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(119, 20426985, 'Dur', 'Larchiere', 'dlarchiere3a@fotki.com', NULL, '1937-12-04');
INSERT INTO Pasajero(id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
VALUES(120, 54631798, 'Pancho', 'Muttitt', 'pmuttitt3b@usnews.com', 541611447279, '1949-11-13');


GO

-------/// Asientos para 6 aviones ///--------

-- Asientos para (id_avion = 1)
-- Clase Ejecutiva (id_clase 2)
INSERT INTO Asiento(id_avion, nro_asiento, ventana, id_clase)
VALUES(1, 1, 1, 2),
	  (1, 2, 1, 2),
	  (1, 3, 1, 2),
	  (1, 4, 1, 2),
	  (1, 5, 1, 2),
	  (1, 6, 1, 2),
	  (1, 7, 1, 2),
	  (1, 8, 1, 2),
	  (1, 9, 1, 2),
	  (1, 10, 1, 2);

-- Clase Económica (id_clase 1)
INSERT INTO Asiento(id_avion, nro_asiento, ventana, id_clase)
VALUES(1, 11, 1, 1),
	  (1, 12, 0, 1),
	  (1, 13, 1, 1),
	  (1, 14, 0, 1),
	  (1, 15, 1, 1),
	  (1, 16, 0, 1),
	  (1, 17, 1, 1),
	  (1, 18, 0, 1),
	  (1, 19, 1, 1),
	  (1, 20, 0, 1),
	  (1, 21, 1, 1),
	  (1, 22, 0, 1),
	  (1, 23, 1, 1),
	  (1, 24, 0, 1),
	  (1, 25, 1, 1),
	  (1, 26, 0, 1),
	  (1, 27, 1, 1),
	  (1, 28, 0, 1),
	  (1, 29, 1, 1),
	  (1, 30, 0, 1);
GO

-- Asientos para (id_avion 2)
-- Clase Ejecutiva (id_clase 2)
INSERT INTO Asiento(id_avion, nro_asiento, ventana, id_clase)
VALUES(2, 1, 1, 2),
	  (2, 2, 1, 2),
	  (2, 3, 1, 2),
	  (2, 4, 1, 2),
	  (2, 5, 1, 2),
	  (2, 6, 0, 2),
	  (2, 7, 0, 2),
	  (2, 8, 0, 2),
	  (2, 9, 0, 2),
	  (2, 10, 0, 2);

-- Clase Económica (id_clase 1)
INSERT INTO Asiento(id_avion, nro_asiento, ventana, id_clase)
VALUES(2, 11, 1, 1),
	  (2, 12, 0, 1),
	  (2, 13, 1, 1),
	  (2, 14, 0, 1),
	  (2, 15, 1, 1),
	  (2, 16, 0, 1),
	  (2, 17, 1, 1),
	  (2, 18, 0, 1),
	  (2, 19, 1, 1),
	  (2, 20, 0, 1),
	  (2, 21, 1, 1),
	  (2, 22, 0, 1),
	  (2, 23, 1, 1),
	  (2, 24, 0, 1),
	  (2, 25, 1, 1),
	  (2, 26, 0, 1),
	  (2, 27, 1, 1),
	  (2, 28, 0, 1),
	  (2, 29, 1, 1),
	  (2, 30, 0, 1),
	  (2, 31, 1, 1),
	  (2, 32, 0, 1),
	  (2, 33, 1, 1),
	  (2, 34, 0, 1),
	  (2, 35, 1, 1),
	  (2, 36, 0, 1),
	  (2, 37, 1, 1),
	  (2, 38, 0, 1),
	  (2, 39, 1, 1),
	  (2, 40, 0, 1),
	  (2, 41, 1, 1),
	  (2, 42, 0, 1),
	  (2, 43, 1, 1),
	  (2, 44, 0, 1),
	  (2, 45, 1, 1),
	  (2, 46, 0, 1),
	  (2, 47, 1, 1),
	  (2, 48, 0, 1),
	  (2, 49, 1, 1),
	  (2, 50, 0, 1),
	  (2, 51, 1, 1),
	  (2, 52, 0, 1),
	  (2, 53, 1, 1),
	  (2, 54, 0, 1),
	  (2, 55, 1, 1),
	  (2, 56, 0, 1),
	  (2, 57, 1, 1),
	  (2, 58, 0, 1),
	  (2, 59, 1, 1),
	  (2, 60, 0, 1),
	  (2, 61, 1, 1),
	  (2, 62, 0, 1),
	  (2, 63, 1, 1),
	  (2, 64, 0, 1),
	  (2, 65, 1, 1),
	  (2, 66, 0, 1),
	  (2, 67, 1, 1),
	  (2, 68, 0, 1),
	  (2, 69, 1, 1),
	  (2, 70, 0, 1),
	  (2, 71, 1, 1),
	  (2, 72, 0, 1),
	  (2, 73, 1, 1),
	  (2, 74, 0, 1),
	  (2, 75, 1, 1),
	  (2, 76, 0, 1),
	  (2, 77, 1, 1),
	  (2, 78, 0, 1),
	  (2, 79, 1, 1),
	  (2, 80, 0, 1);

-- Asientos para (id_avion 3) --
-- Primera Clase (id_clase 3)
INSERT INTO Asiento(id_avion, nro_asiento, ventana, id_clase)
VALUES(3, 1, 1, 3),
	  (3, 2, 1, 3),
	  (3, 3, 1, 3),
	  (3, 4, 1, 3),
	  (3, 5, 1, 3),
	  (3, 6, 1, 3),
	  (3, 7, 1, 3),
	  (3, 8, 1, 3),
	  (3, 9, 1, 3),
	  (3, 10, 1, 3),
	  (3, 11, 1, 3),
	  (3, 12, 1, 3),
	  (3, 13, 1, 3),
	  (3, 14, 1, 3),
	  (3, 15, 1, 3),
	  (3, 16, 1, 3),
	  (3, 17, 1, 3),
	  (3, 18, 1, 3),
	  (3, 19, 1, 3),
	  (3, 20, 1, 3);

-- Clase Ejecutiva (id_clase 2)
INSERT INTO Asiento(id_avion, nro_asiento, ventana, id_clase)
VALUES(3, 21, 1, 2),
	  (3, 22, 1, 2),
	  (3, 23, 1, 2),
	  (3, 24, 1, 2),
	  (3, 25, 1, 2),
	  (3, 26, 1, 2),
	  (3, 27, 1, 2),
	  (3, 28, 1, 2),
	  (3, 29, 1, 2),
	  (3, 30, 1, 2),
	  (3, 31, 1, 2),
	  (3, 32, 1, 2),
	  (3, 33, 1, 2),
	  (3, 34, 1, 2),
	  (3, 35, 1, 2),
	  (3, 36, 1, 2),
	  (3, 37, 1, 2),
	  (3, 38, 1, 2),
	  (3, 39, 1, 2),
	  (3, 40, 1, 2);

-- Clase Económica (id_clase 1)
INSERT INTO Asiento(id_avion, nro_asiento, ventana, id_clase)
VALUES(3, 41, 1, 1),
	  (3, 42, 0, 1),
	  (3, 43, 1, 1),
	  (3, 44, 0, 1),
	  (3, 45, 1, 1),
	  (3, 46, 0, 1),
	  (3, 47, 1, 1),
	  (3, 48, 0, 1),
	  (3, 49, 1, 1),
	  (3, 50, 0, 1),
	  (3, 51, 1, 1),
	  (3, 52, 0, 1),
	  (3, 53, 1, 1),
	  (3, 54, 0, 1),
	  (3, 55, 1, 1),
	  (3, 56, 0, 1),
	  (3, 57, 1, 1),
	  (3, 58, 0, 1),
	  (3, 59, 1, 1),
	  (3, 60, 0, 1),
	  (3, 61, 1, 1),
	  (3, 62, 0, 1),
	  (3, 63, 1, 1),
	  (3, 64, 0, 1),
	  (3, 65, 1, 1),
	  (3, 66, 0, 1),
	  (3, 67, 1, 1),
	  (3, 68, 0, 1),
	  (3, 69, 1, 1),
	  (3, 70, 0, 1),
	  (3, 71, 1, 1),
	  (3, 72, 0, 1),
	  (3, 73, 1, 1),
	  (3, 74, 0, 1),
	  (3, 75, 1, 1),
	  (3, 76, 0, 1),
	  (3, 77, 1, 1),
	  (3, 78, 0, 1),
	  (3, 79, 1, 1),
	  (3, 80, 0, 1),
	  (3, 81, 1, 1),
	  (3, 82, 0, 1),
	  (3, 83, 1, 1),
	  (3, 84, 0, 1),
	  (3, 85, 1, 1),
	  (3, 86, 0, 1),
	  (3, 87, 1, 1),
	  (3, 88, 0, 1),
	  (3, 89, 1, 1),
	  (3, 90, 0, 1),
	  (3, 91, 1, 1),
	  (3, 92, 0, 1),
	  (3, 93, 1, 1),
	  (3, 94, 0, 1),
	  (3, 95, 1, 1),
	  (3, 96, 0, 1),
	  (3, 97, 1, 1),
	  (3, 98, 0, 1),
	  (3, 99, 1, 1),
	  (3, 100, 0, 1);
GO

-- Asientos para (id_avion = 4)
-- Clase Ejecutiva (id_clase 2)
INSERT INTO Asiento(id_avion, nro_asiento, ventana, id_clase)
VALUES(4, 1, 1, 2),
	  (4, 2, 1, 2),
	  (4, 3, 1, 2),
	  (4, 4, 1, 2),
	  (4, 5, 1, 2),
	  (4, 6, 1, 2),
	  (4, 7, 1, 2),
	  (4, 8, 1, 2),
	  (4, 9, 1, 2),
	  (4, 10, 1, 2);

-- Clase Económica (id_clase 1)
INSERT INTO Asiento(id_avion, nro_asiento, ventana, id_clase)
VALUES(4, 11, 1, 1),
	  (4, 12, 0, 1),
	  (4, 13, 1, 1),
	  (4, 14, 0, 1),
	  (4, 15, 1, 1),
	  (4, 16, 0, 1),
	  (4, 17, 1, 1),
	  (4, 18, 0, 1),
	  (4, 19, 1, 1),
	  (4, 20, 0, 1),
	  (4, 21, 1, 1),
	  (4, 22, 0, 1),
	  (4, 23, 1, 1),
	  (4, 24, 0, 1),
	  (4, 25, 1, 1),
	  (4, 26, 0, 1),
	  (4, 27, 1, 1),
	  (4, 28, 0, 1),
	  (4, 29, 1, 1),
	  (4, 30, 0, 1);
GO

-- Asientos para (id_avion = 5)
-- Clase Ejecutiva (id_clase 2)
INSERT INTO Asiento(id_avion, nro_asiento, ventana, id_clase)
VALUES(5, 1, 1, 2),
	  (5, 2, 1, 2),
	  (5, 3, 1, 2),
	  (5, 4, 1, 2),
	  (5, 5, 1, 2),
	  (5, 6, 1, 2),
	  (5, 7, 1, 2),
	  (5, 8, 1, 2),
	  (5, 9, 1, 2),
	  (5, 10, 1, 2),
	  (5, 11, 1, 2),
	  (5, 12, 1, 2),
	  (5, 13, 1, 2),
	  (5, 14, 1, 2),
	  (5, 15, 1, 2),
	  (5, 16, 1, 2),
	  (5, 17, 1, 2),
	  (5, 18, 1, 2),
	  (5, 19, 1, 2),
	  (5, 20, 1, 2);

-- Clase Económica (id_clase 1)
INSERT INTO Asiento(id_avion, nro_asiento, ventana, id_clase)
VALUES(5, 21, 1, 1),
	  (5, 22, 0, 1),
	  (5, 23, 1, 1),
	  (5, 24, 0, 1),
	  (5, 25, 1, 1),
	  (5, 26, 0, 1),
	  (5, 27, 1, 1),
	  (5, 28, 0, 1),
	  (5, 29, 1, 1),
	  (5, 30, 0, 1),
	  (5, 31, 1, 1),
	  (5, 32, 0, 1),
	  (5, 33, 1, 1),
	  (5, 34, 0, 1),
	  (5, 35, 1, 1),
	  (5, 36, 0, 1),
	  (5, 37, 1, 1),
	  (5, 38, 0, 1),
	  (5, 39, 1, 1),
	  (5, 40, 0, 1),
	  (5, 41, 1, 1),
	  (5, 42, 0, 1),
	  (5, 43, 1, 1),
	  (5, 44, 0, 1),
	  (5, 45, 1, 1),
	  (5, 46, 0, 1),
	  (5, 47, 1, 1),
	  (5, 48, 0, 1),
	  (5, 49, 1, 1),
	  (5, 50, 0, 1);
GO

-- Asientos para (id_avion = 6)
-- Clase Ejecutiva (id_clase 2)
INSERT INTO Asiento(id_avion, nro_asiento, ventana, id_clase)
VALUES(6, 1, 1, 2),
	  (6, 2, 1, 2),
	  (6, 3, 1, 2),
	  (6, 4, 1, 2),
	  (6, 5, 1, 2),
	  (6, 6, 1, 2),
	  (6, 7, 1, 2),
	  (6, 8, 1, 2),
	  (6, 9, 1, 2),
	  (6, 10, 1, 2),
	  (6, 11, 1, 2),
	  (6, 12, 1, 2),
	  (6, 13, 1, 2),
	  (6, 14, 1, 2),
	  (6, 15, 1, 2),
	  (6, 16, 1, 2),
	  (6, 17, 1, 2),
	  (6, 18, 1, 2),
	  (6, 19, 1, 2),
	  (6, 20, 1, 2),
	  (6, 21, 1, 2),
	  (6, 22, 1, 2),
	  (6, 23, 1, 2),
	  (6, 24, 1, 2),
	  (6, 25, 1, 2),
	  (6, 26, 1, 2),
	  (6, 27, 1, 2),
	  (6, 28, 1, 2),
	  (6, 29, 1, 2),
	  (6, 30, 1, 2);

-- Clase Económica (id_clase 1)
INSERT INTO Asiento(id_avion, nro_asiento, ventana, id_clase)
VALUES(6, 31, 1, 1),
	  (6, 32, 0, 1),
	  (6, 33, 1, 1),
	  (6, 34, 0, 1),
	  (6, 35, 1, 1),
	  (6, 36, 0, 1),
	  (6, 37, 1, 1),
	  (6, 38, 0, 1),
	  (6, 39, 1, 1),
	  (6, 40, 0, 1),
	  (6, 41, 1, 1),
	  (6, 42, 0, 1),
	  (6, 43, 1, 1),
	  (6, 44, 0, 1),
	  (6, 45, 1, 1),
	  (6, 46, 0, 1),
	  (6, 47, 1, 1),
	  (6, 48, 0, 1),
	  (6, 49, 1, 1),
	  (6, 50, 0, 1),
	  (6, 51, 1, 1),
	  (6, 52, 0, 1),
	  (6, 53, 1, 1),
	  (6, 54, 0, 1),
	  (6, 55, 1, 1),
	  (6, 56, 0, 1),
	  (6, 57, 1, 1),
	  (6, 58, 0, 1),
	  (6, 59, 1, 1),
	  (6, 60, 0, 1),
	  (6, 61, 1, 1),
	  (6, 62, 0, 1),
	  (6, 63, 1, 1),
	  (6, 64, 0, 1),
	  (6, 65, 1, 1),
	  (6, 66, 0, 1),
	  (6, 67, 1, 1),
	  (6, 68, 0, 1),
	  (6, 69, 1, 1),
	  (6, 70, 0, 1),
	  (6, 71, 1, 1),
	  (6, 72, 0, 1),
	  (6, 73, 1, 1),
	  (6, 74, 0, 1),
	  (6, 75, 1, 1),
	  (6, 76, 0, 1),
	  (6, 77, 1, 1),
	  (6, 78, 0, 1),
	  (6, 79, 1, 1),
	  (6, 80, 0, 1);
GO

-- Insertar 40 vuelos en la tabla Vuelo
INSERT INTO Vuelo(id_vuelo, fecha_salida, fecha_llegada, origen, destino, distancia_km, id_avion)
VALUES(1, '2024-11-01 08:00', '2024-11-01 10:00', 'ORD', 'JFK', 1300, 1),
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

-- 70 Pasajes
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(1, 1.8, 104);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(2, 9.44, 25);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(3, 21.78, 105);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(4, 14.19, 23);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(5, 9.89, 29);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(6, 17.35, 29);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(7, 15.34, 29);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(8, 8.62, 79);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(9, 20.61, 105);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(10, 9.81, 65);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(11, 24.79, 115);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(12, 29.9, 77);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(13, 9.71, 76);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(14, 28.44, 78);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(15, 26.02, 9);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(16, 12.99, 116);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(17, 28.59, 26);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(18, 9.99, 45);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(19, 1.34, 45);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(20, 3.62, 28);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(21, 19.18, 17);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(22, 2.38, 30);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(23, 18.84, 63);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(24, 8.26, 90);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(25, 6.51, 105);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(26, 14.59, 18);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(27, 11.94, 113);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(28, 21.84, 101);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(29, 9.96, 89);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(30, 5.93, 99);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(31, 7.82, 95);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(32, 8.37, 62);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(33, 7.66, 95);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(34, 9.59, 63);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(35, 8.94, 46);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(36, 9.62, 3);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(37, 3.99, 78);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(38, 12.96, 58);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(39, 16.44, 112);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(40, 29.9, 3);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(41, 6.66, 105);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(42, 14.83, 108);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(43, 7.65, 5);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(44, 6.12, 18);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(45, 19.31, 78);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(46, 22.24, 104);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(47, 20.54, 12);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(48, 25.99, 100);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(49, 28.4, 17);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(50, 1.91, 40);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(51, 11.72, 96);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(52, 10.07, 98);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(53, 3.02, 107);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(54, 17.21, 120);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(55, 21.65, 37);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(56, 13.2, 32);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(57, 3.39, 1);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(58, 26.22, 85);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(59, 27.37, 67);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(60, 18.22, 66);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(61, 11.91, 113);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(62, 8.22, 64);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(63, 21.25, 93);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(64, 29.37, 51);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(65, 6.0, 118);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(66, 17.81, 111);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(67, 3.49, 110);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(68, 23.75, 110);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(69, 15.16, 111);
INSERT INTO Pasaje(id_pasaje, peso_equipaje_extra, id_pasajero)
VALUES(70, 1.28, 29);
GO

-- Insertar 70 registros en Pasaje_Vuelo
INSERT INTO Pasaje_Vuelo(id_vuelo, id_pasaje, id_avion, nro_asiento)
VALUES(1, 1, 1, 1),
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
