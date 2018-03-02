-- Nombre de los usuarios cuya ip es la 130
SELECT USUARIOS.NOMBRE
FROM MAQUINAS_VIRTUALES, USUARIOS
WHERE USUARIOS.MAQUINAS_VIRTUALES_ID = MAQUINAS_VIRTUALES.ID
AND MAQUINAS_VIRTUALES.DIR_IP = '192.168.12.130';

-- Muestra tu maquina virtual (la de angelo en mi caso)
SELECT MAQUINAS_VIRTUALES.DIR_IP
FROM MAQUINAS_VIRTUALES, USUARIOS
WHERE MAQUINAS_VIRTUALES.ID = USUARIOS.MAQUINAS_VIRTUALES_ID AND
lower (USUARIOS.NOMBRE) LIKE '%angelo%';


-- Añadir usuario a una maquina
INSERT INTO USUARIOS (id,nombre,MAQUINAS_VIRTUALES_ID) VALUES (100,'Jose Aguilera',2) ;

-- Maquinas que no tienen alumnos asignados
UPDATE EMPLOYEE
	SET JOB = 'MANAGER'
	WHERE JOB IS NULL;