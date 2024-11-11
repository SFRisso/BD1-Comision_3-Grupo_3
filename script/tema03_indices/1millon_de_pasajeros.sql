-- Start by disabling constraints temporarily if allowed
ALTER TABLE [Pasajero] NOCHECK CONSTRAINT ALL;

-- Determine the next available `id_pasajero`
DECLARE
  @StartID INT=(
	  SELECT ISNULL( MAX( id_pasajero ), 0 )+1
	  FROM [Pasajero]
  );

-- Insert 1 million rows into [Pasajero]
WITH Numbers
	 AS (
			 SELECT TOP 1000 ROW_NUMBER( ) OVER (ORDER BY (
				 SELECT NULL
			 )) AS n
			 FROM sys.objects a
			 CROSS JOIN sys.objects b
		 ),
	 PasajeroData
	 AS (
			 SELECT ROW_NUMBER( ) OVER (ORDER BY (
						SELECT NULL
					))+@StartID-1 AS id_pasajero, -- Start IDs from the next available ID
					ABS( CHECKSUM( NEWID( ) )%99999999 )+1 AS dni_pasajero,          -- Random DNI between 1 and 99,999,999
					LEFT( NEWID( ), 8 ) AS nombre,                                     -- Random 8-character string for name
					LEFT( NEWID( ), 10 ) AS apellido,                                  -- Random 10-character string for surname
					CONCAT( 'email', ROW_NUMBER( ) OVER (ORDER BY (
						SELECT NULL
					)), '@example.com' ) AS email, -- Unique email
					CONCAT( '9', RIGHT( '11'+CAST( ABS( CHECKSUM( NEWID( ) ) )%100000000 AS VARCHAR(8) ), 8 ) ) AS telefono, -- Random phone
					DATEADD( DAY,-1*(ABS( CHECKSUM( NEWID( ) )%18250 )), GETDATE( ) ) AS fechanac -- Random date in the last 50 years
			 FROM Numbers n1
			 CROSS JOIN Numbers n2
		 )
INSERT INTO [Pasajero](id_pasajero, dni_pasajero, nombre, apellido, email, telefono, fechanac)
	   SELECT id_pasajero,
			  dni_pasajero,
			  nombre,
			  apellido,
			  email,
			  telefono,
			  fechanac
	   FROM PasajeroData
	   WHERE id_pasajero<@StartID+1000000;  -- Limit to 1 million rows starting from the next available ID

-- Re-enable constraints
ALTER TABLE [Pasajero] WITH CHECK CHECK CONSTRAINT ALL;
