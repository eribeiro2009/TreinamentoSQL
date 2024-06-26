CREATE PROCEDURE prc_totais_por_departamento @id_dep decimal
AS

SELECT   sum(salario) as total_salario
        ,avg(salario) as media_salarial
        ,max(salario) as maior_salario
        ,min(salario) as menor_salario
        ,count(*) as total_de_empregados
FROM dbo.empregados
WHERE id_departamento = @id_dep
GO