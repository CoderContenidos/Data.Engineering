/*
Escriba dos consultas: una que calcule las ventas totales y las llamadas totales 
realizadas a los clientes de la profesión de ingeniería y otra que calcule las mismas
métricas para toda la base de clientes
*/
SELECT SUM(ProductSold) AS TotalSales, COUNT(*) AS NCalls
FROM customers Cu
JOIN calls Ca ON Ca.CustomerID = Cu.CustomerID
WHERE Occupation LIKE '%Engineer%'