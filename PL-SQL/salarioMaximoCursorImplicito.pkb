DECLARE
    -- diferencia entre el mayor y menor salario sobrepasa el 30% superior al minimo,
    -- si la diferencia no supera los 2000 salida mensaje los datos son correcto, si sobrepasa los 2000 los salarios no son correctos.

    VsalarioMax EMPLOYEES.SALARY%TYPE;
    VsalarioMIN EMPLOYEES.SALARY%TYPE;

    VdiferenciaSalarial EMPLOYEES.SALARY%TYPE;


BEGIN

    SELECT MAX(SALARY)
    INTO VsalarioMax
    FROM EMPLOYEES;

    SELECT MIN(SALARY)
    INTO VsalarioMax
    FROM EMPLOYEES;

    VdiferenciaSalarial := VsalarioMax - VsalarioMIN;

    IF VsalarioMax * 0.30 > VsalarioMIN THEN

      DBMS_OUTPUT.PUT_LINE('Los datos no son correctos: ');

      -- Aumentar el salrio de los empleados que no sean jefes un 30%

      UPDATE EMPLOYEES
      SET SALARY = VsalarioMax *
      WHERE EMPLOYEES.MGR = NULL;

    ELSE THEN

      DBMS_OUTPUT.PUT_LINE('Los datos son correctos: ');

    END IF;

    DBMS_OUTPUT.PUT_LINE('Salario: ' || Vsalary  );

EXCEPTION

  WHEN NO_DATA_FOUND THEN

END;
