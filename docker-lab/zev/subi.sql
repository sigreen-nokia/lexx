-- Create the database
CREATE DATABASE IF NOT EXISTS subscribers;

-- Use the database
USE subscribers;

-- Create the table
CREATE TABLE IF NOT EXISTS connections (
    subid VARCHAR(20) PRIMARY KEY,
    ADSLCircuitId VARCHAR(20),
    market VARCHAR(50),
    rate_plan VARCHAR(50)
);

-- Insert example data with explicit subids 
INSERT INTO connections (subid, ADSLCircuitId, market, rate_plan) VALUES
('SUB7', 'BSDADF123', 'Antwerp', '150d20u'),
('SUB11', 'BSDEAF123', 'Nuremberg', '150e11u'),
('SUB21', 'FGDADF123', 'Antwerp', '160e13d'),
('SUB4', 'PGDAD123', 'Antwerp', '220a21f'),
('SUB5', 'RSAUSD536', 'Frankfurt', '150d20u');

