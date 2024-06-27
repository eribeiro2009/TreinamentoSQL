-- criar table

CREATE TABLE test(
id numeric(10),
nome varchar(50),
id_dep INT,
CONSTRAINT pk_test PRIMARY KEY(id),
CONSTRAINT fk_dep FOREIGN KEY(id_dep) REFERENCES dbo.departamentos(id_dep) )


INSERT INTO dbo.test(id, nome, id_dep) VALUES(35, 'test 3', 1090) 

SELECT * FROM dbo.test

UPDATE dbo.test
SET	 id_dep = 1060
	,nome = 'outra coisa'
WHERE id = 34

ALTER TABLE dbo.test ALTER COLUMN nome varchar(100)

ALTER TABLE dbo.test ADD endere�o VARCHAR(100)

ALTER TABLE dbo.test ADD endere�o VARCHAR(100) NOT NULL

UPDATE dbo.test
SET endere�o = 'Endereco 2'
WHERE id = 33

--DROP TABLE para elminar tabela

--DCL (SELECT)
--DDL (CREATE, ALTER, DROP)
--DML (INSERT, UPDATE, DELETE)

DELETE FROM dbo.test 
WHERE id = 33

TRUNCATE TABLE dbo.test

DROP TABLE dbo.test

SELECT * FROM EMP

SELECT *
INTO EMP_CLONE 
FROM EMP

--pega o resultado da query e cria uma nova tabela com os mesmos registros da query

SELECT * FROM EMP_CLONE

--VIEW é baseada no resultado de uma query

CREATE VIEW vw_EMP as
SELECT * FROM EMP

SELECT *
FROM dbo.vw_EMP
WHERE DEPTNO = 30

INSERT INTO EMP VALUES(7980, 'GUILHERME', 'SALESMAN', 7698, '2024-06-22', 1600.50, 500.00, 30)


CREATE VIEW vw_EMPDEP as
SELECT   d.DEPTNO as cod_dep
		,d.DNAME as nome_dep
		,sum(e.SAL) as soma_sal
FROM EMP as e
INNER JOIN DEPT as d
ON e.DEPTNO = d.DEPTNO 
GROUP BY d.DEPTNO, d.DNAME

SELECT *
FROM dbo.vw_EMPDEP
WHERE cod_dep = 30

CREATE VIEW vw_BLAKE as
SELECT *
FROM EMP 
WHERE DEPTNO = 30

CREATE VIEW vw_BLAKEDEP as
SELECT   b.*
		,d.DNAME
FROM vw_BLAKE as b
INNER JOIN DEPT as d
ON b.DEPTNO = d.DEPTNO

SELECT *
FROM vw_BLAKEDEP







