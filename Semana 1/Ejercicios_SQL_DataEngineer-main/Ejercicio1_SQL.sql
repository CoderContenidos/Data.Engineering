/*
Extraer agentes cuyo nombre empiezen por M o terminen en O
*/
select * from agents
where name like 'M%' or name like '%o'