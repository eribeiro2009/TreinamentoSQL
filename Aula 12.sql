SELECT *
FROM INFORMATION_SCHEMA.TABLES


SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 


SELECT "Schema"
FROM dbo.DatabaseLog


SELECT	 s.CustomerID
		,count(*) as cnt
		,sum(s.TotalDue) as total
		,max(s.TotalDue) as maior_pedido
		,min(s.TotalDue) as menor_pedido
		,avg(s.TotalDue) as valor_medio
FROM Sales.SalesOrderHeader as s
INNER JOIN Sales.Customer as c
ON s.CustomerID = c.CustomerID
WHERE s.TotalDue > 1000
GROUP BY s.CustomerID
HAVING count(*) > 2
;


SELECT   CustomerID
		,TotalDue
FROM Sales.SalesOrderHeader
WHERE CustomerID = 29761
ORDER BY TotalDue



SELECT *
FROM Person.Person

SELECT * 
FROM Person.




