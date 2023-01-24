SELECT * FROM
(SELECT ca.agentid, ca.duration, max(customerid) AS customerid
   FROM
   (
       SELECT agentid, min(duration) as fastestcall
       FROM calls
       WHERE productsold = 1
       GROUP BY agentid
   ) min
   JOIN calls ca ON ca.agentid = min.agentid AND ca.duration = min.fastestcall
   JOIN agents a ON ca.agentid = a.agentid
   WHERE productsold = 1
   GROUP BY ca.agentid, ca.duration) as x
   LEFT JOIN customers cu on x.customerid= cu.customerid
