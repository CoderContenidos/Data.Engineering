-- DDL
-- CREATE
CREATE TABLE dbo.sales
    (
    ID int,
    Description varchar (8000),
    CustomerID int,
    Price decimal(8,2)
    )
-- ALTER
ALTER TABLE dbo.sales ADD taxid int NULL;
-- DROP
Drop table dbo.sales
-- DML
-- SELECT
Select ID,Description
From dbo.sales
-- INSERT
Insert into dbo.sales values(1,’HP Product’,3,1233)
-- UPDATE
UPDATE dbo.sales
SET Description=’HP Product v2’
Where Description =’HP Product’
-- DELETE
DELETE FROM dbo.sales
Where ID=1
