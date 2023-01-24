-- Comando original para crear la tabla
CREATE TABLE customers (
    name                          VARCHAR(255),
    industry                      VARCHAR(255),
    project1_id                   INT(6),
    project1_feedback             TEXT,
    project2_id                   INT(6),
    project2_feedback             TEXT,
    contact_person_id             INT(6),
    contact_person_and_role       VARCHAR(300),
    phone_number                  VARCHAR(12),
    address                       VARCHAR(255),
    city                          VARCHAR(255),
    zip                           VARCHAR(5)
  );
-- SOLUCION 1NF
-- Agregar llave primaria
ALTER TABLE customers
    ADD COLUMN id INT(6) AUTO_INCREMENT PRIMARY KEY FIRST;
-- Separar la columna contact_person_and_role
ALTER TABLE customers
    CHANGE COLUMN contact_person_and_role contact_person VARCHAR(300);

ALTER TABLE customers
    ADD COLUMN contact_person_role VARCHAR(300) AFTER contact_person;
    
-- Mover las columnas project_ids y project_feedbacks a una nueva tabla project_feddbacks
ALTER TABLE customers
DROP COLUMN project1_id,
DROP COLUMN project1_feedback,
DROP COLUMN project2_id,
DROP COLUMN project2_feedback;

CREATE TABLE project_feedbacks (
    id                  INT(6) AUTO_INCREMENT PRIMARY KEY,
    project_id          INT(6),
    customer_id         INT(6),
    project_feedback    TEXT
);



