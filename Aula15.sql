

SELECT   e.nome_emp
		,e.salario
		,CASE
			WHEN e.salario BETWEEN 800 and 1500 THEN 'Salario Baixo'
			WHEN e.salario BETWEEN 1501 and 2000 THEN 'Salario Medio'
			WHEN e.salario BETWEEN 2001 and 5500 THEN 'Salario Alto'
		 END as faixa_salarial
FROM dbo.empregados as e

--Lista todos os empregados e departamentos. Mesmo que o departamento não tenha empregados 

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

INSERT INTO dbo.empregados VALUES( 1999, 'Altamira', 'Souza', '1970-10-01', 1, null, 2100, 'Ajudante Geral' )

SELECT e.id_emp, e.nome_emp, d.nome_dep
FROM dbo.empregados as e
FULL JOIN dbo.departamentos d
ON e.id_dep = d.id_dep


