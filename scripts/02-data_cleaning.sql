-- Preamble
-- Purpose: Cleans the raw data and create the analysis data
-- Author: Jin Zhang
-- Date: 14 November 2024 
-- Contact: kry.zhang@mail.utoronto.ca
-- License: MIT
-- Pre-requisites: Downloaded the raw data from  https://jacobfilipp.com/hammer/
-- Any other information needed? None

-- Merge the raw data dataset
CREATE TABLE merged_data AS
SELECT
     p.id AS product_id,
     p.vendor,
     p.product_name,
     units,
     CAST(r.current_price AS NUMERIC) AS current_price,
     CAST(r.old_price AS NUMERIC) AS old_price
FROM
     product p
JOIN
     raw r ON p.id = r.product_id;

-- Create the analysis data
CREATE TABLE analysis_data AS
SELECT
     vendor,
     current_price,
     old_price,
     units
FROM
     merged_data
WHERE
     units IS NOT NULL AND
     vendor IS NOT NULL AND
     current_price IS NOT NULL AND
     old_price IS NOT NULL;
