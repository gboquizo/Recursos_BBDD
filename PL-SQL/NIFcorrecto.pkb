create or replace FUNCTION NIFCorrecto(NIF IN VARCHAR2)
RETURN VARCHAR2
IS
NIFSinLetra NUMBER;
lcorrecto VARCHAR2(20);
letra char;

BEGIN

     NIFSinLetra := TO_NUMBER(SUBSTR(NIF,1, 8));

     letra := SUBSTR(NIF,9,1);

     IF CALCULARLETRADNI(NIFSinLetra) = letra THEN
       lcorrecto := 'TRUE';
     ELSE
       lcorrecto := 'FALSE';
     END IF;

     return lcorrecto;
END;
