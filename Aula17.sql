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

ALTER TABLE dbo.test ADD endereço VARCHAR(100)

ALTER TABLE dbo.test ADD endereço VARCHAR(100) NOT NULL

UPDATE dbo.test
SET endereço = 'Endereco 2'
WHERE id = 33

--DROP TABLE para elminar tabela

--DCL (SELECT)
--DDL (CREATE, ALTER, DROP)
--DML (INSERT, UPDATE, DELETE)

DELETE FROM dbo.test 
WHERE id = 33

TRUNCATE TABLE dbo.test

DROP TABLE dbo.test






