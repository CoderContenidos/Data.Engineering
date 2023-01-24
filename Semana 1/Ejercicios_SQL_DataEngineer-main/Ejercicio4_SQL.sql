/*
Escriba una consulta que devuelva todas las llamadas realizadas a clientes de la 
profesión de ingeniería y muestre si son mayores o menores de 30, así como si 
terminaron comprando el producto de esa llamada.
*/
SELECT CallID, Cu.CustomerID, Name, ProductSold,
    CASE
        WHEN Age >= 30 THEN 'Yes'
        WHEN Age <  30 THEN 'No'
        ELSE 'Missing Data'
    END AS Over30
FROM customers Cu
JOIN calls Ca ON Ca.CustomerID = Cu.CustomerID
WHERE Occupation LIKE '%Engineer%'
ORDER BY Name DESC