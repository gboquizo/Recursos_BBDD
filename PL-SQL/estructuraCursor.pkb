DECLARE

    CURSOR Cempleados IS
    SELECT FIRST_NAME FROM EMPLOYEES;


BEGIN
         /**
          Al usar un bucle for no hace falta abrir y cerrar el cursor
         **/
         FOR empleado in Cempleados
         LOOP
            DBMS_OUTPUT.PUT_LINE('Empleado:  ' || empleado.FIRST_NAME);
         END LOOP;
END;
