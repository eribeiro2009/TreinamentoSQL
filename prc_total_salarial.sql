CREATE PROCEDURE prc_total_salarial @id_dep int
as 

SELECT sum(salario) 
FROM dbo.empregados 
WHERE id_departamento = @id_dep
GO