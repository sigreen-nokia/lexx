-- Create the database
CREATE DATABASE IF NOT EXISTS subi;

-- Use the database
USE subi;

-- Create the table
CREATE TABLE IF NOT EXISTS connections (
    id INT PRIMARY KEY,
    post_code VARCHAR(20),
    modem_type VARCHAR(50)
);

-- Insert example data with explicit IDs
INSERT INTO connections (id, post_code, modem_type) VALUES
(1, '90210', 'DSL'),
(2, '10001', 'Cable'),
(3, '30303', 'Fiber'),
(4, 'SW1A1AA', '5G'),
(5, '75001', 'Satellite');

