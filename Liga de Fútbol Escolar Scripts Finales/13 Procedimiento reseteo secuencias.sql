CREATE OR REPLACE PROCEDURE resetear_secuencia (nombre_secuencia IN VARCHAR2,valor_inicial IN PLS_INTEGER) AS
cval INTEGER;
inc_by VARCHAR2(25);
BEGIN
	EXECUTE IMMEDIATE 'ALTER SEQUENCE ' ||nombre_secuencia||' MINVALUE 0';
	EXECUTE IMMEDIATE 'SELECT ' ||nombre_secuencia ||'.NEXTVAL FROM dual' INTO cval;
cval := cval - valor_inicial + 1;
IF cval < 0 THEN
inc_by := ' INCREMENT BY ';
cval:= ABS(cval);
ELSE
inc_by := ' INCREMENT BY -';
END IF;
EXECUTE IMMEDIATE 'ALTER SEQUENCE ' || nombre_secuencia || inc_by || cval;
EXECUTE IMMEDIATE 'SELECT ' ||nombre_secuencia ||'.NEXTVAL FROM dual' INTO cval;
EXECUTE IMMEDIATE 'ALTER SEQUENCE ' || nombre_secuencia || ' INCREMENT BY 1';
END resetear_secuencia;