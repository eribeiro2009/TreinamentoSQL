

SELECT   e.nome_emp
		,e.salario
		,CASE
			WHEN e.salario BETWEEN 800 and 1500 THEN 'Salario Baixo'
			WHEN e.salario BETWEEN 1501 and 2000 THEN 'Salario Medio'
			WHEN e.salario BETWEEN 2001 and 5500 THEN 'Salario Alto'
		 END as faixa_salarial
FROM dbo.empregados as e

--Lista todos os empregados e departamentos. Mesmo que o departamento n�o tenha empregados 

SELECT   e.id_emp
		,e.nome_emp
		,d.nome_dep
FROM dbo.empregados as e
RIGHT JOIN dbo.departamentos as d
ON e.id_departamento = d.id_dep

--Lista 

SELECT *
FROM dbo.departamentos
WHERE id_dep NOT IN( SELECT id_dep
					 FROM dbo.departamentos 

SELECT *
FROM dbo.departamentos
WHERE id_dep NOT IN( SELECT id_dep
					 FROM dbo.empregados )

ALTER TABLE dbo.empregados ALTER COLUMN id_dep int;

INSERT INTO dbo.empregados VALUES( 1999, 'Altamira', 'Souza', '1970-10-01', 1, null, 2100, 'Ajudante�Geral'�)

SELECT e.id_emp, e.nome_emp, d.nome_dep
FROM dbo.empregados as e
FULL JOIN dbo.departamentos d
ON e.id_dep�=�d.id_dep

SELECT * FROM dbo.EMP

SELECT emp.empno as cod_emp
		, emp.ename as nome_emp
		, emp.job as cargo_emp
		, CASE 
			 WHEN chefe.empno IS NULL THEN 'Sem chefe'
			 ELSE CAST( chefe.empno AS CHAR)
		  END as cod_chefe
		,  CASE 
			 WHEN chefe.ename IS NULL THEN 'Sem chefe'
			 ELSE chefe.ename
		  END as cod_chefe
		,  CASE 
			 WHEN chefe.job IS NULL THEN 'Sem chefe'
			 ELSE chefe.job 
		  END as cod_chefe
FROM dbo.EMP as chefe
RIGHT JOIN dbo.EMP as emp
ON chefe.empno = emp.mgr
order by chefe.empno

SELECT emp.empno as cod_emp
		, emp.ename as nome_emp
		, emp.job as cargo_emp
		, CASE 
			 WHEN chefe.empno IS NULL THEN 'Sem chefe'
			 ELSE CAST( chefe.empno AS CHAR)
		  END as cod_chefe
		,  CASE 
			 WHEN chefe.ename IS NULL THEN 'Sem chefe'
			 ELSE chefe.ename
		  END as nome_chefe
		,  CASE 
			 WHEN chefe.job IS NULL THEN 'Sem chefe'
			 ELSE chefe.job 
		  END as cargo_chefe
INTO emp.job
FROM dbo.EMP as chefe
RIGHT JOIN dbo.EMP as emp
ON chefe.empno = emp.mgr
order by chefe.empno

SELECT   pc.ProductID as cod_produto
		,p.Name
		,year(pc.StartDate) as ano
		,sum(pc.StandardCost) as total
		,max(pc.StandardCost) as valor_maximo
		,min(pc.StandardCost) as valor_minimo
		,avg(pc.StandardCost) as valor_medio
FROM Production.ProductCostHistory as pc
INNER JOIN Production.Product as p
ON pc.ProductID = p.ProductID
GROUP BY pc.ProductID, p.Name, year(pc.StartDate)
ORDER BY pc.ProductID, year(pc.StartDate)
;


SELECT   p.ProductID as cod_produto
		,p.Name as desc_produto
		,l.LocationID as cod_loc
		,l.Name
		,count(*) as cnt
		,sum(i.Quantity) as total_loc
FROM Production.Product as p
INNER JOIN Production.ProductInventory as i
ON p.ProductID = i.ProductID
INNER JOIN Production.Location as l
ON l.LocationID = i.LocationID
GROUP BY p.ProductID, p.Name, l.LocationID, l.Name
--HAVING count(*) >= 10
;

 
SELECT   s.ProductSubcategoryID as cod_subcategoria
		,s.Name
		,sum(s.ProductCategoryID) as cod_categoria
FROM Production.ProductSubcategory as s
GROUP BY s.ProductSubcategoryID, s.Name
;

SELECT   d.ProductID as cod_produto
		,p.Name
		,sum(d.OrderQty) as quantidade
		,sum(d.LineTotal) as total_por_produto
		,year(s.OrderDate) as ano
		,month(s.OrderDate) as mes
FROM Sales.SalesOrderHeader as s
INNER JOIN Sales.SalesOrderDetail as d
ON s.SalesOrderID = d.SalesOrderID
INNER JOIN Production.Product as p
ON p.ProductID = d.ProductID
GROUP BY  d.ProductID
		 ,year(s.OrderDate)
		 ,month(s.OrderDate)
		 ,p.Name
HAVING sum(d.OrderQty) BETWEEN 50 AND 500
ORDER BY sum(d.OrderQty)
;

SELECT OrderQty
FROM Sales.SalesOrderDetail

--funções de grupo = min, sum, count, avg
--funções de data = year, month, day, week
--função string
--função numerica = round = arredonda

SELECT *
FROM Production.ProductSubcategory

USE AdventureWorks


SELECT ProductID, ProductID, count(*)
FROM Production.ProductInventory
GROUP BY ProductID, LocationID 




SELECT   p.BusinessEntityID as cod_empregado
		,pp.FirstName as nome_empregado
		,pp.LastName as sobrenome_empregado
		,year(h.ShipDate) as ano
		,month(h.ShipDate) as mes
		,sum(h.TotalDue) as vendas_produtos
		,sum(h.TotalDue) *0.10 as comissao_vendedor
FROM Sales.SalesOrderHeader as h
INNER JOIN Sales.SalesPerson as p
ON h.SalesPersonID = p.BusinessEntityID
INNER JOIN Person.Person as pp
ON pp.BusinessEntityID = p.BusinessEntityID
WHERE year(h.ShipDate) = '2011'
GROUP BY  p.BusinessEntityID
		 ,pp.FirstName
		 ,pp.LastName
		 ,year(h.ShipDate) 
		 ,month(h.ShipDate) 
;


SELECT	 h.PurchaseOrderID as cod_pedido
		,h.EmployeeID as cod_empregado
		,p.FirstName as nome
		,p.LastName as sobrenome
		,p.BusinessEntityID as cod_vendedor
		,h.TotalDue as total_pedido
		,year(h.OrderDate) as ano
		,month(h.OrderDate) as mes
FROM Purchasing.PurchaseOrderHeader as h
INNER JOIN Person.Person as p
ON p.BusinessEntityID = h.EmployeeID
WHERE year(h.OrderDate) = '2011'
AND month(h.OrderDate) BETWEEN 4 AND 11
AND h.TotalDue BETWEEN 200 AND 5000
;

SELECT	 c.CustomerID as cod_cliente
		,p.FirstName as nome
		,year(h.OrderDate) as ano_pedido
		,month(h.OrderDate) as mes_pedido
		,sum(h.TotalDue) as total_pedido
FROM Sales.SalesOrderHeader as h
INNER JOIN Sales.Customer as c
ON h.CustomerID = c.CustomerID
INNER JOIN Person.Person as p
ON p.BusinessEntityID = c.PersonID
WHERE year(h.OrderDate) = '2011'
GROUP BY c.CustomerID 
		,p.FirstName 
		,year(h.OrderDate) 
		,month(h.OrderDate)
;


SELECT   h.Status 
		,case 
			when h.Status = 1 then 'Ativo'
			when h.Status = 3 then 'Cancelado'
			when h.Status = 4 then 'Suspenso'
		 end as descricao_status
		,year(h.OrderDate) as ano
		,sum(h.TotalDue) as total_pedidos
		,count(*) as qntd
FROM Purchasing.PurchaseOrderHeader as h
WHERE year(h.OrderDate) = '2011'
GROUP BY h.Status 
		,year(h.OrderDate) 
;

--OUTER JOIN QUANDO UM DOS LADOS É DEFICIENTE

--INNER JOIN SOMENTE RETORNA DADOS QUE EXISTEM NO 2 LADOS

--SELF JOIN = AUTO JOIN

SELECT *
FROM Person.Person

SELECT *
FROM Sales.SalesPerson

SELECT *
FROM Purchasing.PurchaseOrderDetail

SELECT *
FROM Purchasing.PurchaseOrderHeader

SELECT * 
FROM Purchasing.PurchaseOrderDetail

SELECT * 
FROM Purchasing.PurchaseOrderHeader

SELECT *
FROM Person.Person

SELECT	 e.BussinessEntityID
		,Case
		WHEN e.Gender = 'M'
FROM HumanResources

--Uma  outra query alem da tabela no FROM 

SELECT	 tab1.cod_cliente	
		,p.FirstName
		,tab1.total_pedidos
		,a.AddressLine1
		,CASE
			WHEN a.AddressLine2 IS NULL THEN ''
			ELSE a.AddressLine2
		 END as AddressLine
FROM (SELECT  h.CustomerID as cod_cliente
			 ,sum(h.TotalDue) as total_pedidos
	  FROM Sales.SalesOrderHeader as h
	  GROUP BY h.CustomerID) as tab1
INNER JOIN Sales.Customer as c
ON tab1.cod_cliente = c.CustomerID
INNER JOIN Person.Person as p
ON c.PersonID = p.BusinessEntityID
INNER JOIN Person.BusinessEntityAddress as bea
ON bea.BusinessEntityID = p.BusinessEntityID
INNER JOIN Person.Address as a
ON a.AddressID = bea.AddressID
WHERE bea.AddressTypeID IN( SELECT a.AddressTypeID
							FROM Person.AddressType as a
							WHERE a.Name in( 'Home', 'Billing' ) )
ORDER BY 1
;

DROP TABLE dbo.tab1

SELECT *
FROM dbo.#tab1

-- # = temporario
-- DROP TABLE = excluir uma tabela/com o # nas frente apaga temporariamente

