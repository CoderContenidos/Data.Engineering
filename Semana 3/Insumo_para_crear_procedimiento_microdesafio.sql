SELECT 
TituloId =t.titulo_id,
TituloNombre =CAST(t.titulo as nVarChar(100)),
TituloTipo =CASE CAST(t.tipo as nVarchar(100))
WHEN 'bbdd' THEN 'Base de datos, Transact-SQL'
WHEN 'BI' THEN 'Base de datos, BI'
WHEN 'administracion' THEN 'Base de datos, Administración'
WHEN 'dev' THEN 'Desarrollo'
WHEN 'programacion' THEN 'Desarrollo'
END,
NombreCompleto =a.NombreAutor + ' ' +a.ApellidosAutor,
a.TelefonoAutor
FROM BDE.articulos.titulos as t
JOIN BDE.articulos.autores as a ON t.titulo_id =a.TituloId
