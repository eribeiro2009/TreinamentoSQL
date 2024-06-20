SELECT ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE JOB IN( 'MANAGER', 'PRESIDENT' )
UNION ALL
SELECT ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE JOB NOT IN( 'MANAGER', 'PRESIDENT' )


SELECT HIREDATE
       , YEAR(HIREDATE) AS ANO
       , MONTH(HIREDATE) AS MES
	   , DAY(HIREDATE) AS DIA 
	   , DATEPART(WEEK, HIREDATE) AS SEMANA 
FROM EMP
WHERE YEAR(HIREDATE) BETWEEN 1980 AND 1987
ORDER BY YEAR(HIREDATE)

SELECT DISTINCT JOB FROM EMP 

FUN��ES DE GRUPO 
COUNT(*)
SUM()
AVG() 
MIN()
MAX() 

USE AdventureWorks
SELECT Firstname
       , LEFT(FirstName,3) as left_
	   , RIGHT(FirstName,3) as right_
	   , substring(FirstName, 3,4) as substr
FROM Person.Person
--WHERE LEFT(UPPER(FirstName),3) = 'DR'




SELECT * 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE UPPER(COLUMN_NAME) LIKE '%COMMENT%'


SELECT * 
FROM Production.ProductReview
WHERE UPPER(Comments) LIKE '%WOMAN%'

|Maria <> MARIA <> maria <> mAria


FUN��ES DE DATA
DATEPART()
YEAR()
MONTH()
DAY()

FUN��ES DE STRING
UPPER('abacaxi') = 'ABACAXI'- transforma em maisculo
LOWER('Abacaxi') 'abacaxi'- minusculo
LEFT(string,qtd) retorna da string a quantidade de caracteres a esquerda
LEFT( 'ABACAXI',3) = 'ABA'
RIGHT( 'ABACAXI',3) = 'AXI'
SUBSTRING(string, inicio, fim)
SUBSTRING('ABACAXI', 3,3) = 'ACA'
CONCAT = concatena strings
REPLACE( 'S�o Paulo/SP', '/', '-' ) =  'S�o Paulo-SP'

select concat(cidade, '/', estado)

USE INICIAL
CREATE TABLE CIDADES(
NOME_CIDADE VARCHAR(50),
ESTADO VARCHAR(2)
)
SELECT CONCAT(nome_cidade, '/', estado) as cidade FROM CIDADES
select NOME_CIDADE, replace(nome_cidade, '/','-') as cidade from CIDADES

INSERT INTO CIDADES VALUES( 'S�o Paulo', 'SP' )
INSERT INTO CIDADES VALUES( 'Carapicuiba', 'SP' )
INSERT INTO CIDADES VALUES ('Manaus', 'AM' )


DELETE FROM CIDADES WHERE NOME_CIDADE = 'S�o Paulo/SP'

SELECT * FROM CIDADES

-- COMO DESCOBRIR SE EXISTE REGISTRO DUPLICADO
SELECT NOME_CIDADE, ESTADO, COUNT(*)
FROM CIDADES 
GROUP BY NOME_CIDADE, ESTADO
HAVING COUNT(*) > 1

-- RESOLVER A DUPLICIDADE **********
DELETE CIDADES
FROM ( SELECT NOME_CIDADE, ESTADO,NUMERO_DA_LINHA
       FROM (  SELECT NOME_CIDADE, ESTADO, ROW_NUMBER() OVER(PARTITION BY NOME_CIDADE, ESTADO ORDER BY NOME_CIDADE, ESTADO) AS NUMERO_DA_LINHA
               FROM CIDADES ) AS T  ) AS T
WHERE NUMERO_DA_LINHA > 1



Cidade, Estado
S�o Paulo/SP
Carapicu�ba/SP
Manaus/AM

SELECT CONCAT(FirstName, ' ', MiddleName,' ', LastName) as FullName
FROM Person.Person 



SELECT�*�FROM�EMP


SELECT   t.CustomerID as Cliente
		,t.total_pedido as total
FROM (SELECT  CustomerID
			 ,sum(totaldue) as total_pedido
	  from Sales.SalesOrderHeader
	  GROUP BY CustomerID ) as t
INNER JOIN Sales.Customer as c
ON t.CustomerID = c.CustomerID
INNER JOIN ( SELECT *
			 FROM Sales.SalesTerritory ) as te
ON te.TerritoryID = c.TerritoryID
WHERE c.TerritoryID in ( SELECT TerritoryID
						 FROM Sales.SalesTerritory
						 WHERE CountryRegionCode IN( 'US', 'FR', 'CA' ) )
ORDER BY te.Name

SELECT  FirstName
	   ,UPPER(FirstName) as UpperFirstName
	   ,LOWER(FirstName) as LowerFirstName 
FROM Person.Person

SELECT * 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE UPPER(COLUMN_NAME) LIKE '%COMMENT%'

SELECT *
FROM Production.ProductReview
WHERE UPPER(Comments) LIKE '%WOMAN%'

SELECT * FROM Production.ProductReview

SELECT Firstname
		,LEFT (FirstName, 3) as left_
		,RIGHT (FirstName, 3) as right_



FUNÇÕES DE DATA
DATEPART()
YEAR()
MONTH()
DAY()

FUNÇÕES DE STRING
UPPER ('abacaxi') = 'ABACAXI' - trasnforma em maiusculo
LOWER('Abacaxi') 'abacaxi' - maiusculo
LEFT (string.qtd) retorna da string a quantidade de caracteres a esquerda
LEFT ('ABACAXI', 3) = 'ABA'
RIGHT ('ABACAXI', 3) = 'AXI'
SUBSTRING (string, inicio, fim)
SUBSTRING('ABACAXI', 3,3) = 'ACA'

