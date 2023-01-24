-- 1.crear base de datos
CREATE DATABASE BDE;
GO
--
USE BDE  
GO
-- 2. Crear un esquema
CREATE SCHEMA articulos AUTHORIZATION dbo;
GO

-- 3. crear tabla titulso
CREATE TABLE articulos.titulos
(titulo_id char(6) NOT NULL,
titulo varchar(80) NOT NULL,
tipo char(20) NOT NULL);
GO

-- Insertar valores manualmente(OJO esto se puede hacer con COPY o con un asistente)
INSERT INTO articulos.titulos VALUES ('1', 'Consultas SQL','bbdd');
INSERT INTO articulos.titulos VALUES ('3', 'Grupo recursos Azure','administracion');
INSERT INTO articulos.titulos VALUES ('4', '.NET Framework 4.5','programacion');
INSERT INTO articulos.titulos VALUES ('5', 'Programacion C#','dev');
INSERT INTO articulos.titulos VALUES ('7', 'Power BI','BI');
INSERT INTO articulos.titulos VALUES ('8', 'Administracion Sql server','administracion');


-- 4. crear tabla autores
CREATE TABLE articulos.autores
(TituloId char(6) NOT NULL,
NombreAutor nVarchar(100) NOT NULL,
ApellidosAutor nVarchar(100) NOT NULL,
TelefonoAutor nVarChar(25)
);

-- Insertar en la tabla autores en essquema articulos
INSERT INTO articulos.autores VALUES ('3', 'David', 'Saenz', '99897867');
INSERT INTO articulos.autores VALUES ('8', 'Ana', 'Ruiz', '99897466');
INSERT INTO articulos.autores VALUES ('2', 'Julian', 'Perez', '99897174');
INSERT INTO articulos.autores VALUES ('1', 'Andres', 'Calamaro', '99876869');
INSERT INTO articulos.autores VALUES ('4', 'Cidys', 'Castillo', '998987453');
INSERT INTO articulos.autores VALUES ('5', 'Pedro', 'Molina', '99891768');

--5.  crear database BDE_DW (DataWarehouse)
CREATE DATABASE BDE_DW;
GO

--6. crear la tabla DimTitulo para informes
USE BDE_DW 
GO
CREATE TABLE dbo.DimTitulos
(TituloId char(6) NOT NULL,
TituloNombre nVarChar(100) NOT NULL,
TituloTipo nVarChar(100) NOT NULL,
NombreCompleto nVarChar(200),
TelefonoAutor nVarchar(25));
GO

--7. Crear un procedimiento almacenado para el ETL
USE BDE
GO
--- es la tecnica mas sencilla (aclarado y rellenado) pero no es la unica tecnica (e.g actualizacion)
CREATE PROCEDURE pETL_Insertar_DimTitulo
AS
DELETE FROM BDE_DW.dbo.DimTitulos;
INSERT INTO BDE_DW.dbo.DimTitulos
SELECT 
TituloId =t.titulo_id,
TituloNombre =CAST(t.titulo as nVarChar(100)),
TituloTipo =CASE CAST(t.tipo as nVarchar(100))
WHEN 'bbdd' THEN 'Base de datos, Transact-SQL'
WHEN 'BI' THEN 'Base de datos, BI'
WHEN 'administracion' THEN 'Base de datos, Administraci�n'
WHEN 'dev' THEN 'Desarrollo'
WHEN 'programacion' THEN 'Desarrollo'
END,
NombreCompleto =a.NombreAutor + ' ' +a.ApellidosAutor,
a.TelefonoAutor
FROM BDE.articulos.titulos as t
JOIN BDE.articulos.autores as a ON t.titulo_id =a.TituloId
GO

-- ir a Programatically>> Stores Procedures y verificar que se creo el procedimeinto

--8. Executar procedimeinto
EXECUTE pETL_Insertar_DimTitulo;
GO

-- 9. Verificar que se tiene el resultado
USE BDE_DW

SELECT * FROM dbo.DimTitulos
GO
