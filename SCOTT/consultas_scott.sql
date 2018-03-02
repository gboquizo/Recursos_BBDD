

----- PARTE1 -----

-- 1. Muestra los empleados que ganan más de 1500 €.
SELECT EMP.ENAME, SAL FROM  EMP WHERE SAL > 1500

-- 2. Muestra los nombres de los empleados junto con codigo del departamento en el que trabajan.
SELECT EMP.ENAME, EMP.DEPTNO FROM EMP

-- 3. Muestra los empleados del departamento 10 que entraron en la empresa antes del año 1998.
SELECT EMP.ENAME FROM EMP WHERE EMP.DEPTNO = 10 AND HIREDATE < TO_DATE('01/01/98', 'dd/mm/yy')

-- 4. Muestra los empleados cuyo oficio es CLERK y ganan menos de 2000.
SELECT EMP.ENAME, EMP.JOB FROM EMP WHERE JOB = 'CLERK' AND SAL < 2000

-- 5. Muestra los empleados sin comisión del departamento 10.
SELECT EMP.ENAME, EMP.COMM FROM EMP WHERE EMP.DEPTNO = 10 AND (COMM IS NULL OR COMM = 0)

UPDATE EMP SET COMM = 0 WHERE ENAME = 'KING'

-- 6. Muestra los empleados del mismo departamento que ALLEN.
SELECT EMP.ENAME, DEPT.DEPTNO FROM DEPT, EMP WHERE DEPT.DEPTNO = EMP.DEPTNO
AND DEPT.DEPTNO IN 
(SELECT DEPT.DEPTNO FROM DEPT, EMP WHERE DEPT.DEPTNO = EMP.DEPTNO 
AND EMP.ENAME = 'ALLEN')

-- 7. Muestra los empleados cuyo nombre empiece por A;
SELECT EMP.ENAME FROM EMP WHERE EMP.ENAME LIKE 'A%'

-- 8. Muestra los empleados que trabajan en un departamento ubicado en DALLAS.
SELECT EMP.ENAME FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO AND DEPT.LOC = 'DALLAS'

-- 9. Muestra nombre y salario de los empleados del departamento 'ACCOUNTING'.
SELECT EMP.ENAME, EMP.SAL FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO AND
DEPT.DNAME = 'ACCOUNTING'

-- 10. Muestra nombre y comisión de los empleados cuyo oficio es 'SALESMAN'.
SELECT EMP.ENAME, EMP.COMM FROM EMP WHERE EMP.JOB = 'SALESMAN'

-- 11. Muestra nombre y fecha de alta de todos los empleados que no son 'CLERK' ni 'SALESMAN'.
SELECT EMP.ENAME, EMP.HIREDATE FROM EMP WHERE EMP.ENAME NOT IN
(SELECT EMP.ENAME FROM EMP WHERE EMP.JOB = 'CLERK' OR EMP.JOB = 'SALESMAN' )

-- 12. Muestra el nombre, el salario y la comisión de los empleados que trabajan en el mismo departamento que 'JONES'.
SELECT EMP.ENAME, EMP.SAL, EMP.COMM, EMP.DEPTNO FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO AND EMP.DEPTNO IN
(SELECT DEPT.DEPTNO FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO AND EMP.ENAME = 'JONES')

-- 13. Muestra los nombres de los departamentos en los que trabaja alguien que gane menos que 'ALLEN'.
 SELECT DEPT.DNAME, EMP.SAL, EMP.ENAME FROM DEPT, EMP WHERE EMP.DEPTNO = DEPT.DEPTNO AND EMP.SAL <=
 (SELECT EMP.SAL FROM EMP WHERE EMP.ENAME = 'ALLEN') ORDER BY EMP.SAL DESC

-- 14. Muestra código y nombre de los empleados que están en un departamento de 'DALLAS' y ganan más que 'SMITH' pero menos que 'ALLEN'.
SELECT EMP.EMPNO, EMP.ENAME FROM DEPT, EMP WHERE EMP.DEPTNO = DEPT.DEPTNO AND DEPT.LOC = 'DALLAS' AND EMP.SAL >

(SELECT EMP.SAL FROM EMP WHERE EMP.ENAME = 'SMITH') AND EMP.SAL <

(SELECT EMP.SAL FROM EMP WHERE EMP.ENAME = 'ALLEN')

-- 15. Muestra el nombre del jefe (campo MGR) de los empleados del departamento 10
SELECT EMP.ENAME FROM EMP WHERE EMP.EMPNO IN
(SELECT EMP.MGR FROM EMP WHERE EMP.DEPTNO = 10)

----- PARTE2 -----

-- 1.-Obtener todos los datos de todos los empleados.
SELECT * FROM EMP

-- 2. Obtener todos los datos de todos los departamentos.
SELECT * FROM DEPT

-- 3. Obtener todos los datos de los administrativos (su trabajo es, en ingles, 'CLERK').
SELECT * FROM EMP WHERE JOB = 'CLERK'

-- 4. Idem, pero ordenado por el nombre.
SELECT * FROM EMP WHERE JOB = 'CLERK' ORDER BY EMP.ENAME DESC

--5. Obten el mismo resultado de la pregunta anterior, pero modificando la sentencia SQL.
SELECT * FROM EMP WHERE JOB LIKE '%CLERK%' ORDER BY EMP.ENAME DESC

-- 6. Obten el numero (codigo), nombre y salario de los empleados.
SELECT EMP.ENAME, EMP.EMPNO, EMP.SAL FROM EMP ORDER BY EMP.ENAME DESC

-- 7. Lista los nombres de todos los departamentos.
SELECT DEPT.DNAME FROM DEPT

-- 8. Idem, pero ordenandolos por nombre.
SELECT DEPT.DNAME FROM DEPT ORDER BY DEPT.DNAME

-- 9. Idem, pero ordenandolo por la ciudad (no se debe seleccionar la ciudad en el resultado).
SELECT DEPT.DNAME FROM DEPT ORDER BY DEPT.LOC


-- 10. Idem, pero el resultado debe mostrarse ordenado por la ciudad en orden inverso.
SELECT DEPT.DNAME FROM DEPT ORDER BY DEPT.LOC ASC

-- 11. Obtener el nombre y empleo de todos los empleados, ordenado por salario.
SELECT EMP.ENAME, EMP.JOB FROM EMP ORDER BY EMP.SAL

-- 12. Obtener el nombre y empleo de todos los empleados, ordenado primero por su trabajo y luego por su salario.
SELECT EMP.ENAME, EMP.JOB, EMP.SAL FROM EMP ORDER BY EMP.JOB , EMP.SAL

-- 13. Idem, pero ordenando inversamente por empleo y normalmente por salario.
SELECT EMP.ENAME, EMP.JOB FROM EMP ORDER BY EMP.JOB ASC , EMP.SAL

-- 14. Obten los salarios y las comisiones de los empleados del departamento 30.
SELECT EMP.SAL, EMP.COMM FROM EMP WHERE EMP.DEPTNO = 30

-- 15. Idem, pero ordenado por comision.
SELECT EMP.SAL, EMP.COMM FROM EMP WHERE EMP.DEPTNO = 30 ORDER BY EMP.COMM

-- 16. (a) Obten las comisiones de todos los empleados. (b) Obten las comisiones de los empleados de forma que no se repitan.
SELECT EMP.COMM FROM EMP

SELECT DISTINCT EMP.COMM FROM EMP

-- 17. Obten las comisiones de los empleados y sus numeros de departamento, de forma que no se repitan filas.
SELECT DISTINCT NVL(EMP.COMM,0), EMP.EMPNO FROM EMP

-- 18. Obten los nuevos salarios de los empleados del departamento 30, que resultaran de sumar a su salario una gratiFIcacion de 1000. Muestra tambien los nombres de los empleados.
SELECT EMP.ENAME, (EMP.SAL + 1000) FROM EMP WHERE EMP.DEPTNO = 30

-- 19. Lo mismo que la anterior, pero mostrando tambien su salario original, y haz que la columna que almacena el nuevo salario se denomine NUEVO SALARIO.
SELECT EMP.ENAME as Nombre, EMP.SAL AS Salario_antiguo, (EMP.SAL + 1000) AS Nuevo_salario FROM EMP WHERE EMP.DEPTNO = 30

-- 20. Halla los empleados que tienen una comision superior a la mitad de su salario.
SELECT EMP.ENAME FROM EMP WHERE EMP.COMM > (EMP.SAL/2)

-- 21. Halla los empleados que no tienen comision, o que la tengan menor o igual que el 25% de su salario.
SELECT EMP.ENAME, EMP.COMM FROM EMP WHERE EMP.COMM IS NULL OR EMP.COMM <= (EMP.SAL * 0.25)

-- 22. Obten una lista de nombres de empleados y sus salarios, de forma que en la salida aparezca en todas las filas Nombre:" y Salario:" antes del respectivo campo.
SELECT 'Nombre: ' || EMP.ENAME AS Nombre, 'Salario: ' || EMP.SAL AS Salario FROM EMP

-- 23. Hallar el codigo, salario y comision de los empleados cuyo codigo sea mayor que 7500.
SELECT EMP.EMPNO, EMP.SAL, EMP.COMM FROM EMP WHERE EMP.EMPNO > 7500

-- 24. Lista los nombres y fecha de contratación y nombre del departamento en el que trabaja, de aquellos empleados que no son vendedores ('SALESMAN').
SELECT EMP.ENAME, EMP.HIREDATE, DEPT.DNAME FROM EMP, DEPT WHERE DEPT.DEPTNO = EMP.DEPTNO AND EMP.JOB <> 'SALESMAN'