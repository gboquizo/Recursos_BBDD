CREATE TABLE S (
    sn varchar2(100),
    snombre varchar2(255),
    estado integer,
    ciudad varchar2(255),

    CONSTRAINT PK_S PRIMARY KEY (sn)
);

CREATE TABLE P (
    pn varchar2(100),
    pnombre varchar2(255),
    color varchar2(255),
    peso integer,
    ciudad varchar2(255),

    CONSTRAINT PK_P PRIMARY KEY (pn)
);

CREATE TABLE SP (
    sn varchar2(100),
    pn varchar2(100),
    cant integer,

    CONSTRAINT PK_SP PRIMARY KEY (sn,pn),
    CONSTRAINT FK_SN FOREIGN KEY (sn) REFERENCES S (sn),
    CONSTRAINT FK_PN FOREIGN KEY (pn) REFERENCES P (pn)
);

-- Datos

INSERT INTO S (sn, snombre, estado, ciudad) VALUES ('S1','Salazar',20,'Londres');
INSERT INTO S (sn, snombre, estado, ciudad) VALUES ('S2','Jaimes',10,'Paris');
INSERT INTO S (sn, snombre, estado, ciudad) VALUES ('S3','Bernal',30,'Paris');
INSERT INTO S (sn, snombre, estado, ciudad) VALUES ('S4','Corona',20,'Londres');
INSERT INTO S (sn, snombre, estado, ciudad) VALUES ('S5','Aldana',30,'Atenas');

INSERT INTO P (pn, pnombre, color, peso, ciudad) VALUES ('P1','tuerca','verde',12,'Paris');
INSERT INTO P (pn, pnombre, color, peso, ciudad) VALUES ('P2','perno','rojo',12,'Londres');
INSERT INTO P (pn, pnombre, color, peso, ciudad) VALUES ('P3','birlo','azul',12,'Roma');
INSERT INTO P (pn, pnombre, color, peso, ciudad) VALUES ('P4','birlo','rojo',12,'Londres');
INSERT INTO P (pn, pnombre, color, peso, ciudad) VALUES ('P5','leva','azul',12,'Paris');
INSERT INTO P (pn, pnombre, color, peso, ciudad) VALUES ('P6','engrane','rojo',12,'Paris');

INSERT INTO SP (sn, pn , cant) VALUES ('S1','P1', 300);
INSERT INTO SP (sn, pn , cant) VALUES ('S1','P2', 200);
INSERT INTO SP (sn, pn , cant) VALUES ('S1','P3', 400);
INSERT INTO SP (sn, pn , cant) VALUES ('S1','P4', 200);
INSERT INTO SP (sn, pn , cant) VALUES ('S1','P5', 100);
INSERT INTO SP (sn, pn , cant) VALUES ('S1','P6', 100);
INSERT INTO SP (sn, pn , cant) VALUES ('S2','P1', 300);
INSERT INTO SP (sn, pn , cant) VALUES ('S2','P2', 400);
INSERT INTO SP (sn, pn , cant) VALUES ('S3','P2', 200);
INSERT INTO SP (sn, pn , cant) VALUES ('S4','P2', 200);
INSERT INTO SP (sn, pn , cant) VALUES ('S4','P3', 100);
INSERT INTO SP (sn, pn , cant) VALUES ('S4','P4', 300);
INSERT INTO SP (sn, pn , cant) VALUES ('S4','P5', 400);
