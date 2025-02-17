USE inicial
GO

INSERT INTO dbo.status VALUES
(
	1,
	'Ativo'
);

INSERT INTO dbo.status VALUES
(
	2,
	'Desligado'
);

INSERT INTO dbo.status VALUES
(
	3,
	'Afastado'
);

INSERT INTO dbo.departamentos VALUES
(
	1010,
	'Finaceiro'
);

INSERT INTO dbo.departamentos VALUES
(
	1020,
	'Serviços Gerais'
);

INSERT INTO dbo.departamentos VALUES
(
	1030,
	'Limpeza'
);

INSERT INTO dbo.departamentos VALUES
(
	1040,
	'Logistica'
);

INSERT INTO dbo.departamentos VALUES
(
	1050,
	'Marketing e Vendas'
);

INSERT INTO dbo.departamentos VALUES
(
	1060,
	'Producao'
);

INSERT INTO dbo.departamentos VALUES
(
	1070,
	'Compras'
);

INSERT INTO dbo.departamentos VALUES
(
	1080,
	'Atendimento ao Cliente'
);



SELECT *FROM dbo.status;

SELECT * FROM dbo.departamentos;

SELECT * FROM dbo.empregados;


INSERT INTO dbo.empregados VALUES
(
	10,
	'João',
	'da Silva Nogueira',
	CONVERT(date, '2019-08-10', 102),
	1,
	1010



INSERT INTO dbo.empregados VALUES
(
	11,
	'Matheus',
	'Silva Nogueira',
	CONVERT(date, '2019-05-11', 102),
	2,
	1020
);



INSERT INTO dbo.empregados VALUES
(
	12,
	'Guilherme',
	'dos Santos Gomes',
	CONVERT(date, '2018-05-12', 102),
	1,
	1030
);



INSERT INTO dbo.empregados VALUES
(
	13,
	'Dario',
	'Schidmit Fonseca',
	CONVERT(date, '2018-08-18', 102),
	3,
	1050
);



INSERT INTO dbo.empregados VALUES
(
	14,
	'Renato',
	'de Oliveira Neto',
	CONVERT(date, '2009-06-14', 102),
	1,
	1060
);



INSERT INTO dbo.empregados VALUES
(
	15,
	'Julio',
	'Vinnicius Junior',
	CONVERT(date, '2006-03-21', 102),
	1,
	1070
);



INSERT INTO dbo.empregados VALUES
(
	16,
	'Victoria',
	'Maria Franco',
	CONVERT(date, '2017-09-12', 102),
	4,
	1080
);



INSERT INTO dbo.empregados VALUES
(
	17,
	'Renata',
	'Francisca Biancardi',
	CONVERT(date, '2016-04-08', 102),
	1,
	1040
);



INSERT INTO dbo.empregados VALUES
(
	18,
	'Italo',
	'Borges Francisco',
	CONVERT(date, '2013-01-02', 102),
	2,
	1030
);



INSERT INTO dbo.empregados VALUES
(
	19,
	'Leandro',
	'Pereria Junior',
	CONVERT(date, '2004-11-27', 102),
	3,
	1070
);
	
--criar mais 5 departamentos OK
--criar mais 10 empregados OK

SELECT * FROM dbo.empregados;
SELECT * FROM dbo.departamentos


ALTER TABLE dbo.empregado ADD salario decimal(10,2)

UPDATE dbo.empregados
SET salario = 900.90
WHERE id_emp = 12
  

UPDATE dbo.empregados
SET salario = 2397.00
WHERE id_emp = 13


UPDATE dbo.empregados
SET salario = 1813.00
WHERE id_emp = 14


UPDATE dbo.empregados
SET salario = 3600.00
WHERE id_emp = 15


UPDATE dbo.empregados
SET salario = 1650.00
WHERE id_emp = 16


UPDATE dbo.empregados
SET salario = 2369.00
WHERE id_emp = 17


UPDATE dbo.empregados
SET salario = 900.90
WHERE id_emp = 18

 
UPDATE dbo.empregados
SET salario = 3600.00
WHERE id_emp = 19


ALTER TABLE dbo.empregados DROP COLUMN dt_admissao

ALTER TABLE dbo.empregados ADD sexo CHAR (1)

ALTER TABLE dbo.empregados ADD dt_admissao DATE


UPDATE dbo.empregados 
SET sexo = 'M'
WHERE id_emp = 19


SELECT * FROM dbo.empregados;

select sysdatetime()

UPDATE dbo.empregados
SET dt_admissao = '2009-09-16'
WHERE id_emp = 19;

SELECT * FROM dbo.empregados;

--select apenas uma coluna ou mais
select id_emp, nome_emp
from dbo.empregados;

--select todas colunas 
select *
from dbo.empregados

SELECT * FROM dbo.empregados
WHERE salario < 2000

SELECT * FROM dbo.empregados
WHERE salario > 2000

SELECT * FROM dbo.empregados
WHERE salario >- 2000 AND salario <= 3000;

SELECT * FROM dbo.empregados
WHERE salario between 1000 and 3000;

SELECT * FROM dbo.empregados
WHERE dt_admissao between '2009-05-16' and '2016-05-18'
AND salario BETWEEN 1000 and 3000


SELECT * FROM dbo.empregados 
WHERE salario > 1000
AND id_status in (1, 3)
AND sexo = 'M'
order by id_status,  nome_emp ASC



--agrupamento
SELECT sexo, SUM(salario) as total_por_sexo, count(*) as contagem, avg(salario) as media_salarial
FROM dbo.empregados
GROUP by sexo



SELECT id_status, SUM(salario) as total_por_status, avg(salario) as media_por_status, count(*) as contagem_de_emp
FROM dbo.empregados
GROUP by id_status
order by avg(salario)

--trabalhando com joins 9 (junções)
SELECT e.id_emp as cod_emp
		, e.id_departamento as cod_dep
		, e.id_emp as nome_emp
		, d.nome_emp
		, e.id_status
		, s.desc_status
FROM dbo.empregados as e
INNER JOIN dbo.empregados d
ON e.id_departamento - d.id_departamento
INNER JOIN dbo.status as s
ON e.id_status = s.id_status
;

SELECT * FROM dbo.status

SELECT * FROM dbo.departamentos





