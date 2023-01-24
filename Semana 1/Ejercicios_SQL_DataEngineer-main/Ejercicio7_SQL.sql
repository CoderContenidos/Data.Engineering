/*
Dos métricas del desempeño de los agentes de ventas que le interesan a su empresa son: 
1) para cada agente, cuántos segundos en promedio les toma vender un producto cuando tienen éxito; 
y 2) para cada agente, cuántos segundos en promedio permanecen en el teléfono antes de darse por 
vencidos cuando no tienen éxito. Escribe una consulta que calcule esto
*/
SELECT a.name,
SUM(
   CASE
       WHEN productsold = 0 THEN duration
       ELSE 0
   END)/SUM(
   CASE
       WHEN productsold = 0 THEN 1
       ELSE 0
   END)
AS avgWhenNotSold ,
SUM(
   CASE
       WHEN productsold = 1 THEN duration
       ELSE 0
   END)/SUM(
       CASE WHEN productsold = 1 THEN 1
       ELSE 0
   END)
AS avgWhenSold
FROM calls c
JOIN agents a ON c.agentid = a.agentid
GROUP BY a.name
ORDER BY 1