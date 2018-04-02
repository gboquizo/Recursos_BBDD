-- 1. Desarrolla una consulta que liste el nombre del empleado, el código del departamento y la fecha alta en la empresa, ordenando el resultado por departamento y por fecha de inicio.

SELECT FIRST_NAME, DEPARTMENT_ID , HIRE_DATE
FROM EMPLOYEES
ORDER BY HIRE_DATE;

-- 2 Desarrolla una consulta que liste el código, nombre y apellido de los empleados y sus respectivos jefes.

SELECT a1.EMPLOYEE_ID, a1.FIRST_NAME as Nombre_empleado, a1.LAST_NAME as Apellidos_empleado, a2.MANAGER_ID AS Codigo_jefe, a2.FIRST_NAME AS Nombre_jefe, a2.LAST_NAME AS Apellidos_jefe
FROM EMPLOYEES a1, EMPLOYEES a2
WHERE a1.EMPLOYEE_ID = a2.MANAGER_ID;

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 101;



-- 3 Desarrolla una consulta que liste los países por región. Los datos que debe mostrar son: Código, nombre de región y país al que pertenece.

SELECT COUNTRIES.COUNTRY_ID, REGIONS.REGION_NAME, COUNTRIES.COUNTRY_NAME
FROM REGIONS, COUNTRIES
WHERE REGIONS.REGION_ID = COUNTRIES.REGION_ID;

-- 4 Realiza una consulta que muestre el código, nombre, apellido, inicio y fin del historial de trabajo de los empleados.
SELECT EMPLOYEES.EMPLOYEE_ID, EMPLOYEES.FIRST_NAME, EMPLOYEES.LAST_NAME, JOB_HISTORY.START_DATE, JOB_HISTORY.END_DATE, JOBS.JOB_TITLE
FROM EMPLOYEES, JOB_HISTORY, JOBS
WHERE EMPLOYEES.EMPLOYEE_ID = JOB_HISTORY.EMPLOYEE_ID AND 
JOB_HISTORY.JOB_ID = JOBS.JOB_ID;


-- 5 Elabora una consulta que muestre el nombre y apellido del empleado con titulo Empleado, el salario, porcentaje de comisión, lcomisión y salario total.

-- 6 Elabora una consulta que liste nombre del trabajo y el salario de los empleados que son manager, cuyo código es 100 o 125 y cuyo salario sea mayor de 6000.

-- 7 Desarrolla una consulta que liste el código de la localidad, la ciudad y el nombre del departamento, de los departamentos que se encuentran fuera de estados Unidos (US)

SELECT LOCATIONS.LOCATION_ID, LOCATIONS.CITY, COUNTRIES.COUNTRY_NAME
FROM DEPARTMENTS, LOCATIONS, COUNTRIES
WHERE DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID AND
COUNTRIES.COUNTRY_ID = LOCATIONS.COUNTRY_ID AND COUNTRIES.COUNTRY_NAME <> 'United States of America';

-- 8 Elabora una consulta que liste el código de la región y nombre de la región, código de la localidad, la ciudad, código del país y nombre del país, de las localidades mayores a 2400.


-- 9 Elabora una consulta que liste el código de la región y nombre de la región, código de la localidad, la ciudad, código del país y nombre del país, de las localidades mayores a 2400.


SELECT REGIONS.REGION_ID, REGIONS.REGION_NAME, LOCATIONS.LOCATION_ID, LOCATIONS.CITY, COUNTRIES.COUNTRY_ID, COUNTRIES.COUNTRY_NAME
FROM REGIONS , LOCATIONS, COUNTRIES
WHERE REGIONS.REGION_ID = COUNTRIES.REGION_ID AND
COUNTRIES.COUNTRY_ID = LOCATIONS.COUNTRY_ID AND LOCATIONS.LOCATION_ID > 2400;

--  Desarrolla una consulta que muestre el código de región con un alias de Región, el nombre de la región con una etiqueta Nombre Región; 
-- una cadena string (concatenación) con: "Código País: CA Nombre: Canadá ", donde CA es el código de país y Canadá es el nombre del país 
--con etiqueta País; el código de localización con etiqueta Localización; la dirección de calle con etiqueta Dirección y el código postal 
--con etiqueta "Código Postal”. No no deben aparecer códigos postales que sean nulos.

SELECT REGIONS.REGION_ID AS Region, REGIONS.REGION_NAME AS Nombre_region, 'Codigo pais ' || COUNTRIES.COUNTRY_ID || 'Nombre ' || COUNTRIES.COUNTRY_NAME,
LOCATIONS.LOCATION_ID AS Localizacion, LOCATIONS.STREET_ADDRESS AS Direccion, LOCATIONS.POSTAL_CODE AS Codigo_postal
FROM REGIONS,COUNTRIES,LOCATIONS
WHERE REGIONS.REGION_ID = COUNTRIES.REGION_ID AND
LOCATIONS.COUNTRY_ID = COUNTRIES.COUNTRY_ID AND LOCATIONS.POSTAL_CODE IS NOT NULL;

-- 15 Escribe una sola consulta que liste los empleados de los departamentos 10, 20 y 80 que fueron contratados hace mas de 180 días, 
-- que ganan una comisión superior al 20% y cuyo nombre o apellido comienza con la letra 'J'.

SELECT FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 10 OR
DEPARTMENT_ID = 20 OR
DEPARTMENT_ID = 80 AND
COMMISSION_PCT > 0.2 AND
UPPER(FIRST_NAME) LIKE 'J%';

-- 27 Realice una consulta que muestre el número de departamentos por región.

SELECT REGIONS.REGION_NAME,COUNT(DEPARTMENTS.DEPARTMENT_ID)
FROM REGIONS, LOCATIONS, COUNTRIES, DEPARTMENTS
WHERE REGIONS.REGION_ID = COUNTRIES.REGION_ID AND
LOCATIONS.COUNTRY_ID = COUNTRIES.COUNTRY_ID AND
DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID
GROUP BY REGIONS.REGION_NAME;

-- 28 Realice una consulta que muestre el salario que paga cada departamento (sin incluir comisión), ordenado descendentemente por salario pagado. 
--Se mostrara el código y nombre del departamento y el salario que paga.

SELECT DEPARTMENTS.DEPARTMENT_NAME,SUM(EMPLOYEES.SALARY)
FROM DEPARTMENTS, EMPLOYEES
WHERE DEPARTMENTS.DEPARTMENT_ID = EMPLOYEES.DEPARTMENT_ID
GROUP BY DEPARTMENTS.DEPARTMENT_NAME;

-- 29 Realiza una consulta que liste el número de empleados por ciudad, que ganan como mínimo 5000 en concepto de salario.
--Omite las ciudades que tengan menos de 3 empleados con ese salario.

SELECT LOCATIONS.CITY, COUNT(EMPLOYEES.EMPLOYEE_ID)
FROM EMPLOYEES, LOCATIONS, DEPARTMENTS
WHERE EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID AND
DEPARTMENTS.LOCATION_ID =  LOCATIONS.LOCATION_ID AND
EMPLOYEES.SALARY >= 5000
GROUP BY LOCATIONS.CITY HAVING COUNT (*) >=3;
