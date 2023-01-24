-- Momento 1
CREATE SCHEMA my_secure_schema;

CREATE TABLE my_secure_schema.my_secure_table (
name VARCHAR(30),
dob TIMESTAMP SORTKEY,
zip INTEGER,
ssn VARCHAR(9)
)
diststyle all;

-- Momento 2
CREATE USER data_scientist PASSWORD 'Test1234';

CREATE GROUP ds_prod WITH USER data_scientist;

-- Momento 3
SELECT * FROM my_secure_schema.my_secure_table;

