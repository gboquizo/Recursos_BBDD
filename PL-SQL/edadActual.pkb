DECLARE

    fNacimiento DATE;
    fActual DATE;

    diaNacimiento NUMBER;
    mesNacimiento NUMBER;
    annoNacimiento NUMBER;

    diaActual NUMBER;
    mesActual NUMBER;
    annoActual NUMBER;

    edad NUMBER;

BEGIN

  /**
      Añadimos una fecha de nacimiento.
  **/
  fNacimiento := '28/05/1997';

  /**
      Insertamos la fecha actual en la variable fActual.
  **/
  SELECT SYSDATE
  INTO fActual
  FROM DUAL;

  /**
      Descomponemos la fecha actual, para manejarla mejor.
  **/
  diaActual := TO_NUMBER(TO_CHAR(fActual,'DD'));
  mesActual := TO_NUMBER(TO_CHAR(fActual,'MM'));
  annoActual := TO_NUMBER(TO_CHAR(fActual,'YYYY'));

  /**
      Descomponemos la fecha de nacimiento, para manejarla mejor.
  **/
  diaNacimiento := TO_NUMBER(TO_CHAR(fNacimiento,'DD'));
  mesNacimiento := TO_NUMBER(TO_CHAR(fNacimiento,'MM'));
  annoNacimiento := TO_NUMBER(TO_CHAR(fNacimiento,'YYYY'));

  /**
      Calculamos la edad.
  **/
  edad := annoActual - annoNacimiento;

  /**
      Comprobamos los rangos de meses y dias para sacar la edad exacta.
  **/
  IF mesActual < mesNacimiento THEN

    edad := edad - 1;

    ELSIF mesActual = mesNacimiento AND diaActual < diaNacimiento THEN

      edad := edad - 1;

  END IF;


  DBMS_OUTPUT.PUT_LINE('Hoy a fecha de ' || fActual || ' tienes ' || edad || ' años.' );

END;
