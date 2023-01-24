-- Momento 1 (creacion de tablas)
CREATE TABLE customers(
    customerid INT primary key,
    name VARCHAR(50),
    occupation VARCHAR(50),
    email VARCHAR(50),
    company VARCHAR(50),
    phonenumber VARCHAR(20),
    age INT
);

CREATE TABLE agents(
    agentid INT primary key,
    name VARCHAR(50)
);

CREATE TABLE calls(
    callid INT primary key,
    agentid INT,
    customerid INT,
    pickedup SMALLINT,
    duration INT,
    productsold SMALLINT
);

-- Momento 2 (Insercion de registros - analogo- OLTP)
SET STATISTICS TIME ON;  
INSERT INTO dbo.calls VALUES (10000, 4,6, 1, 130, 1);
INSERT INTO dbo.calls VALUES (10001, 5,7, 1, 131, 0);
INSERT INTO dbo.calls VALUES (10002, 10,260, 0, 0, 0);
INSERT INTO dbo.calls VALUES (10003, 3,5, 1, 60, 1);
INSERT INTO dbo.calls VALUES (10004, 10,731, 1, 90, 0);
INSERT INTO dbo.calls VALUES (10005, 4,415, 0, 0, 0);
SET STATISTICS TIME OFF;  
GO 


-- Momento 3 (Generacion de consulta analoga a OLAP)
SET STATISTICS TIME ON;  
SELECT a.name AS AgentName, cu.name AS CustomerName, x.duration
FROM
(
   SELECT ca.agentid, ca.duration, max(customerid) AS cid
   FROM
   (
       SELECT agentid, min(duration) as fastestcall
       FROM calls
       WHERE productsold = 1
       GROUP BY agentid
   ) min
   JOIN calls ca ON ca.agentid = min.agentid AND ca.duration = min.fastestcall
   WHERE productsold = 1
   GROUP BY ca.agentid, ca.duration
) x
JOIN agents a ON x.agentid = a.agentid
JOIN customers cu ON cu.customerid = x.cid
SET STATISTICS TIME OFF;  
GO  
