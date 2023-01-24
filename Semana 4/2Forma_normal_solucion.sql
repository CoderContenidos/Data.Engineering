-- Mover esas columnas a una tabla que contenga la información de contacto de las personas
ALTER TABLE customers
DROP COLUMN contact_person,
DROP COLUMN contact_person_role,
DROP COLUMN phone_number;

-- crear la tabla contact_persons con un id respectivo
CREATE TABLE contact_persons (
    id              INT(6) PRIMARY KEY,
    name            VARCHAR(300),
    role            VARCHAR(300),
    phone_number    VARCHAR(15)
);
