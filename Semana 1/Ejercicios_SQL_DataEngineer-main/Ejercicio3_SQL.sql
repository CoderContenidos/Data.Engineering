/*
Escriba una consulta que devuelva el ID del cliente, su nombre y una columna 
Mayor30 que contenga "Sí "si el cliente tiene más de 30 años y "No" en caso contrario.
*/
SELECT CustomerID, Name,
    CASE
        WHEN Age >= 30 THEN 'Yes'
        WHEN Age <  30 THEN 'No'
        ELSE 'Missing Data'
    END AS Over30
FROM customers
ORDER BY Name DESC