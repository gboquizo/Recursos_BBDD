-- Generado por Oracle SQL Developer Data Modeler 17.4.0.355.2121
--   en:        2018-02-13 09:28:50 CET
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE maquinas_virtuales (
    id            INTEGER NOT NULL,
    dir_ip        VARCHAR2(255) NOT NULL,
    descripcion   VARCHAR2(255),
    usuario       VARCHAR2(255) DEFAULT 'root' NOT NULL,
    password      VARCHAR2(255) NOT NULL
);

ALTER TABLE maquinas_virtuales ADD CHECK ( dir_ip BETWEEN '192.168.12.130' AND '192.168.12.139' );

ALTER TABLE maquinas_virtuales ADD CONSTRAINT maquinas_virtuales_pk PRIMARY KEY ( id );

ALTER TABLE maquinas_virtuales ADD CONSTRAINT maquinas_virtuales_dir_ip_un UNIQUE ( dir_ip );

CREATE TABLE usuarios (
    id                      INTEGER NOT NULL,
    nombre                  VARCHAR2(255) NOT NULL,
    maquinas_virtuales_id   INTEGER NOT NULL
);

ALTER TABLE usuarios ADD CONSTRAINT usuarios_pk PRIMARY KEY ( id );

ALTER TABLE usuarios
    ADD CONSTRAINT usuarios_maquinas_virtuales_fk FOREIGN KEY ( maquinas_virtuales_id )
        REFERENCES maquinas_virtuales ( id );

CREATE INDEX i_usuaerio_nombre ON usuarios(nombre);

-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             2
-- CREATE INDEX                             0
-- ALTER TABLE                              5
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
