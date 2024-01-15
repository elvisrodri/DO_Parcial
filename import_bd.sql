USE kaggle
GO 

-- Verificar si existe la tabla
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = Object_id(N'dbo.starbucks') AND TYPE = 'U') 
	CREATE TABLE dbo.starbucks (
		beverage_category VARCHAR(50),
		beverage VARCHAR(255),
		beverage_prep VARCHAR(50),
		calories DECIMAL(10, 3),
		total_fat_g VARCHAR(10),
		trans_fat_g DECIMAL(6, 3),
		saturated_fat_g DECIMAL(6, 3),
		sodium_mg DECIMAL(6, 3),
		total_carbohydrates_g DECIMAL(6, 3),
		cholesterol_mg DECIMAL(6, 3),
		dietary_fibre_g DECIMAL(6, 3),
		sugars DECIMAL(6, 3),
		protein_g DECIMAL(6, 3),
		vitamin_a_pct VARCHAR(10),
		vitamin_c_pct VARCHAR(10),
		calcium_pct VARCHAR(10),
		iron_pct VARCHAR(10),
		caffeine_mg VARCHAR(10)
	)
GO 

-- Limpiar tabla
TRUNCATE TABLE dbo.starbucks;
GO 

-- Importar archivo csv
BULK INSERT dbo.starbucks
FROM 'C:\Users\sami\Desktop\devops\proyecto_parcial\dataset\starbucks.csv' 
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a' -- salto de linea
  )
GO