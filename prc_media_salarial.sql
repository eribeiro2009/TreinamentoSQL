CREATE PROCEDURE prc_media_salarial @id_dep int
as 

SELECT avg(salario) 
FROM dbo.empregados 
WHERE id_departamento = @id_dep
GO
