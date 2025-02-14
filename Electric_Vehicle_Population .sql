CREATE TABLE Electric_Vehicle_Population (
    VIN TEXT,
    County TEXT,
    City TEXT,
    State TEXT,
    Postal_Code text,  -- Can also be VARCHAR if it contains non-numeric values
    Model_Year TEXT,
    Make TEXT,
    Model TEXT,
    Electric_Vehicle_Type TEXT,
    Clean_Alternative_Fuel_Vehicle_Eligibility TEXT,
    Electric_Range TEXT,
    Base_MSRP TEXT,
    Legislative_District text,  -- Consider INTEGER if values are always whole numbers
    DOL_Vehicle_ID TEXT,
    Vehicle_Location TEXT,
    Electric_Unity TEXT,
    Census_Tract text  -- Consider BIGINT if it represents large numbers
);

--total records to display
select * from Electric_Vehicle_Population

--deleting the rows that are associated with specific columns
/*DELETE FROM  Electric_Vehicle_Population
WHERE  DOL_Vehicle_ID = 'na' OR Vehicle_Location = 'na' OR  Electric_Unity = 'na' OR  Base_MSRP = 'na'
 OR   Electric_Range = 'na'  OR   Model = 'na' OR    Model_Year = 'na'  OR    Postal_Code = 'na'*/

 --identifying the special characters
--SELECT * FROM Electric_Vehicle_Population WHERE vin !~ '^[0-9]+$';

--changing postal_code to numeric type
--checkong if there are any special characters
SELECT postal_code 
FROM Electric_Vehicle_Population
WHERE postal_code !~ '^[0-9]+$';

--Set Non-Numeric Values to NULL (If They Are Useless)
UPDATE Electric_Vehicle_Population
SET postal_code = NULL 
WHERE postal_code !~ '^[0-9]+$';

--Remove Special Characters (If Needed)
UPDATE Electric_Vehicle_Population 
SET Postal_Code = REGEXP_REPLACE(Postal_Code, '[^0-9]', '', 'g');

--changeing the datatype of specific columns from text to numeric
ALTER TABLE Electric_Vehicle_Population 
ALTER COLUMN Postal_Code TYPE NUMERIC
USING Postal_Code::NUMERIC;

--changing type to model_year
--checkong if there are any special characters
SELECT model_year
FROM Electric_Vehicle_Population
WHERE  model_year !~ '^[0-9]+$';

--Set Non-Numeric Values to NULL (If They Are Useless)
UPDATE Electric_Vehicle_Population
SET  model_year = NULL 
WHERE  model_year !~ '^[0-9]+$';

--Remove Special Characters (If Needed)
UPDATE Electric_Vehicle_Population
SET  model_year = REGEXP_REPLACE( model_year, '[^0-9]', '', 'g');

--changeing the datatype of specific columns from text to numeric
ALTER TABLE Electric_Vehicle_Population 
ALTER COLUMN model_year TYPE NUMERIC
USING model_year::NUMERIC;

--changing Electric_Range type to numeric
--checkong if there are any special characters
SELECT Electric_Range
FROM Electric_Vehicle_Population
WHERE  Electric_Range !~ '^[0-9]+$';

--Set Non-Numeric Values to NULL (If They Are Useless)
UPDATE Electric_Vehicle_Population
SET  Electric_Range = NULL 
WHERE  Electric_Range !~ '^[0-9]+$';

--Remove Special Characters (If Needed)
UPDATE Electric_Vehicle_Population
SET  Electric_Range = REGEXP_REPLACE( Electric_Range, '[^0-9]', '', 'g');

--changeing the datatype of specific columns from text to numeric
ALTER TABLE Electric_Vehicle_Population 
ALTER COLUMN Electric_Range TYPE NUMERIC
USING Electric_Range::NUMERIC;

--changing  Base_MSRP type to numeric
--checkong if there are any special characters
SELECT  Base_MSRP
FROM Electric_Vehicle_Population
WHERE   Base_MSRP !~ '^[0-9]+$';

--Set Non-Numeric Values to NULL (If They Are Useless)
UPDATE Electric_Vehicle_Population
SET   Base_MSRP = NULL 
WHERE  Base_MSRP !~ '^[0-9]+$';

--Remove Special Characters (If Needed)
UPDATE Electric_Vehicle_Population
SET   Base_MSRP = REGEXP_REPLACE(  Base_MSRP, '[^0-9]', '', 'g');

--changeing the datatype of specific columns from text to numeric
ALTER TABLE Electric_Vehicle_Population 
ALTER COLUMN  Base_MSRP TYPE NUMERIC
USING  Base_MSRP::NUMERIC;

--changing   Legislative_District type to numeric
--checkong if there are any special characters
SELECT  Legislative_District
FROM Electric_Vehicle_Population
WHERE    Legislative_District !~ '^[0-9]+$';

--Set Non-Numeric Values to NULL (If They Are Useless)
UPDATE Electric_Vehicle_Population
SET    Legislative_District = NULL 
WHERE   Legislative_District !~ '^[0-9]+$';

--Remove Special Characters (If Needed)
UPDATE Electric_Vehicle_Population
SET Legislative_District = REGEXP_REPLACE( Legislative_District, '[^0-9]', '', 'g');

--changeing the datatype of specific columns from text to numeric
ALTER TABLE Electric_Vehicle_Population 
ALTER COLUMN  Legislative_District TYPE NUMERIC
USING Legislative_District::NUMERIC;

--changing  DOL_Vehicle_ID type to numeric
--checkong if there are any special characters
SELECT   DOL_Vehicle_ID
FROM Electric_Vehicle_Population
WHERE   DOL_Vehicle_ID !~ '^[0-9]+$';

--Set Non-Numeric Values to NULL (If They Are Useless)
UPDATE Electric_Vehicle_Population
SET     DOL_Vehicle_ID = NULL 
WHERE    DOL_Vehicle_ID !~ '^[0-9]+$';

--Remove Special Characters (If Needed)
UPDATE Electric_Vehicle_Population
SET  DOL_Vehicle_ID = REGEXP_REPLACE( DOL_Vehicle_ID, '[^0-9]', '', 'g');

--changeing the datatype of specific columns from text to numeric
ALTER TABLE Electric_Vehicle_Population 
ALTER COLUMN   DOL_Vehicle_ID TYPE NUMERIC
USING DOL_Vehicle_ID::NUMERIC;

--changing  Census_Tract type to numeric
--checkong if there are any special characters
SELECT  Census_Tract
FROM Electric_Vehicle_Population
WHERE  Census_Tract !~ '^[0-9]+$';

--Set Non-Numeric Values to NULL (If They Are Useless)
UPDATE Electric_Vehicle_Population
SET  Census_Tract = NULL 
WHERE  Census_Tract !~ '^[0-9]+$';

--Remove Special Characters (If Needed)
UPDATE Electric_Vehicle_Population
SET  Census_Tract = REGEXP_REPLACE(  Census_Tract, '[^0-9]', '', 'g');

--changeing the datatype of specific columns from text to numeric
ALTER TABLE Electric_Vehicle_Population 
ALTER COLUMN Census_Tract TYPE NUMERIC
USING Census_Tract::NUMERIC;

--From the dataset creating insights
--counting total rows
SELECT COUNT(*) FROM Electric_Vehicle_Population; --223968

--counting no.of vehicles by year
SELECT Model_Year, COUNT(*) 
FROM Electric_Vehicle_Population 
GROUP BY Model_Year 
ORDER BY Model_Year DESC;

--most popular ev makes
SELECT Make, COUNT(*) AS total 
FROM Electric_Vehicle_Population 
GROUP BY Make 
ORDER BY total DESC 
LIMIT 10;

--Distribution of EV Types
SELECT Electric_Vehicle_Type, COUNT(*) 
FROM Electric_Vehicle_Population 
GROUP BY Electric_Vehicle_Type

--Top 5 Cities with Most EVs
SELECT City, COUNT(*) AS total 
FROM Electric_Vehicle_Population 
GROUP BY City 
ORDER BY total DESC 
LIMIT 5;

--Average Electric Range by Make
SELECT Make, AVG(Electric_Range) AS avg_range 
FROM Electric_Vehicle_Population 
GROUP BY Make 
ORDER BY avg_range DESC 
LIMIT 10;

--Count of Vehicles by Clean Alternative Fuel Eligibility
SELECT "Clean Alternative_Fuel_Vehicle_Eligibility", COUNT(*) 
FROM Electric_Vehicle_Population 
GROUP BY "Clean Alternative_Fuel_Vehicle_Eligibility";

--Average Base MSRP of EVs
SELECT AVG(Base_MSRP) AS avg_price 
FROM Electric_Vehicle_Population 
WHERE Base_MSRP > 0;

-- Most Common Tesla Models
SELECT Model, COUNT(*) 
FROM Electric_Vehicle_Population 
WHERE Make = 'TESLA' 
GROUP BY Model 
ORDER BY COUNT(*) DESC;

--Vehicles by Legislative District
SELECT Legislative_District, COUNT(*) 
FROM Electric_Vehicle_Population 
GROUP BY Legislative_District 
ORDER BY COUNT(*) DESC;



