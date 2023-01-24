-- Version mongo
mongo
-- Ver databases disponibles
show dbs
-- seleccionar una BD
use datos
-- verificar BD seleccionada
db
-- Crear usuarios
db.createUser({"user":"brad", pwd:"david123",roles:["readWrite","dbAdmin"]})
-- Crear colecciones
db.createCollection('clientes');
show collections;
-- Insert
db.clientes.insert({nombres:"David", apellido:"Bustos Usta"});
-- Insertar datos
db.clientes.insert({nombres:"David", apellido:"Bustos Usta"});
-- ver registros de coleccion
db.clientes.find();
-- ver de mejor manera
db.clientes.find().pretty();
