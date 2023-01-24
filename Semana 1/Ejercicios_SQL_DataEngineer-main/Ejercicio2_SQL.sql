/*
Escriba una consulta que produzca una lista, en orden alfabético, 
de todas las distintas ocupaciones en la tabla Customer que contengan la palabra
"Engineer".
*/
SELECT DISTINCT Occupation
FROM customers
WHERE Occupation LIKE '%Engineer%'
ORDER BY Occupation