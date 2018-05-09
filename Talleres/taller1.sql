-- 1. Desarrolla una consulta que liste el código de departamento, nombre, apellido y salario de los empleados con máximo salario en cada departamento.

SELECT DEPARTMENT_ID, FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES E1
WHERE E1.SALARY =
(SELECT MAX(SALARY)
FROM EMPLOYEES E2
WHERE E1.DEPARTMENT_ID = E2.DEPARTMENT_ID);


--2. Elabora una consulta que muestre el código del departamento, el nombre de departamento y el gasto total en salarios.


SELECT DEPARTMENTS.DEPARTMENT_NAME, DEPARTMENTS.DEPARTMENT_ID , SUM(EMPLOYEES.SALARY)
FROM DEPARTMENTS, EMPLOYEES
WHERE DEPARTMENTS.DEPARTMENT_ID = EMPLOYEES.DEPARTMENT_ID
GROUP BY DEPARTMENTS.DEPARTMENT_NAME, DEPARTMENTS.DEPARTMENT_ID;


-- 3. Realice una consulta que liste los empleados que están en departamentos que tienen menos de 10 empleados.

SELECT FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN
(SELECT DEPARTMENT_ID,count(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) < 10);


-- 4. Desarrolla una consulta que muestre el salario mayor de los empleados que trabajan en el departamento 30 (department_id) y que empleados ganan ese salario.

SELECT FIRST_NAME, SALARY
FROM EMPLOYEES WHERE DEPARTMENT_ID = 30 AND SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID = 30);


-- 5. Elabora una consulta que muestre los departamentos en donde no exista ningún empleado.

SELECT
DEPARTMENT_ID ,
DEPARTMENT_NAME
FROM  DEPARTMENTS D
WHERE  NOT EXISTS (
SELECT * FROM EMPLOYEES E
WHERE E.DEPARTMENT_ID = DEPARTMENT_ID);


SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS D
WHERE DEPARTMENT_ID IN
(SELECT DEPARTMENT_ID
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) = 0);

-
