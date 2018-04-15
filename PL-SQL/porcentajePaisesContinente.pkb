/*Con un cursor, mostrar el porcentaje de países que tiene cada continente*/

DECLARE

    CURSOR Cpaises IS SELECT count(*) NUMERO, CONTINENTE FROM PAISES group by continente;

    numeroPaises NUMBER;


BEGIN

    SELECT COUNT(*) INTO numeroPaises FROM PAISES;

    FOR pais IN Cpaises LOOP
        DBMS_OUTPUT.PUT_LINE (pais.numero/numeroPaises * 100);
      END LOOP;

END;
