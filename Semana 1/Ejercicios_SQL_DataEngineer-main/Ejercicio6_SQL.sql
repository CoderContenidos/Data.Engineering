/*
Escriba una consulta que devuelva, para cada agente, el nombre del agente, la cantidad de llamadas, 
las llamadas más largas y más cortas, la duración promedio de las llamadas y la cantidad total de
productos vendidos. Nombra las columnas AgentName, NCalls, Shortest, Longest, AvgDuration y TotalSales
Luego ordena la tabla por AgentName en orden alfabético. 
(Asegúrese de incluir la cláusula WHERE PickedUp = 1 para calcular solo el promedio de todas las 
llamadas que fueron atendidas (de lo contrario, ¡todas las duraciones mínimas serán 0)!)
*/
SELECT Name AS AgentName, COUNT(*) AS NCalls, MIN(Duration) AS Shortest, MAX(Duration) AS Longest, ROUND(AVG(Duration),2) AS AvgDuration, SUM(ProductSold) AS TotalSales
FROM calls C
    JOIN agents A ON C.AgentID = A.AgentID
WHERE PickeDup = 1
GROUP BY Name
ORDER BY Name