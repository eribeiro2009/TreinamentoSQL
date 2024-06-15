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
INTO tab1
FROM dbo.EMP as chefe
RIGHT JOIN dbo.EMP as emp
ON chefe.empno = emp.mgr
order by chefe.empno