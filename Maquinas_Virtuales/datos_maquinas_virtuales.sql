INSERT INTO maquinas_virtuales (id, dir_ip, descripcion, usuario,password) VALUES (1,'192.168.12.130','CENTOS', 'root', 'bd130');
INSERT INTO maquinas_virtuales (id, dir_ip, descripcion, usuario,password) VALUES (2,'192.168.12.131','CENTOS', 'root', 'bd131');
INSERT INTO maquinas_virtuales (id, dir_ip, descripcion, usuario,password) VALUES (3,'192.168.12.132','CENTOS', 'root', 'bd132');
INSERT INTO maquinas_virtuales (id, dir_ip, descripcion, usuario,password) VALUES (4,'192.168.12.133','CENTOS', 'root', 'bd133');
INSERT INTO maquinas_virtuales (id, dir_ip, descripcion, usuario,password) VALUES (5,'192.168.12.134','CENTOS', 'root', 'bd134');
INSERT INTO maquinas_virtuales (id, dir_ip, descripcion, usuario,password) VALUES (6,'192.168.12.135','CENTOS', 'root', 'bd135');
INSERT INTO maquinas_virtuales (id, dir_ip, descripcion, usuario,password) VALUES (7,'192.168.12.136','CENTOS', 'root', 'bd136');
INSERT INTO maquinas_virtuales (id, dir_ip, descripcion, usuario,password) VALUES (8,'192.168.12.137','CENTOS', 'root', 'bd137');
INSERT INTO maquinas_virtuales (id, dir_ip, descripcion, usuario,password) VALUES (9,'192.168.12.138','CENTOS', 'root', 'bd138');
INSERT INTO maquinas_virtuales (id, dir_ip, descripcion, usuario,password) VALUES (10,'192.168.12.139','CENTOS', 'root', 'bd139');


-- Usuarios MAQUINA 192.168.12.130-- 
INSERT INTO usuarios (id,nombre,maquinas_virtuales_id) VALUES (1,'Manuel Ariza',1);
INSERT INTO usuarios (id,nombre,maquinas_virtuales_id) VALUES (2,'Eugenio',1);

-- Usuarios MAQUINA 192.168.12.131-- 
INSERT INTO usuarios (id,nombre,maquinas_virtuales_id) VALUES (3,'Rafa Gavilán Gomez',2);
INSERT INTO usuarios (id,nombre,maquinas_virtuales_id) VALUES (4,'Desconocido',2);

-- Usuarios MAQUINA 192.168.12.132-- 
INSERT INTO usuarios (id,nombre,maquinas_virtuales_id) VALUES (5,'Francisco Ramirez Ruiz',3);
INSERT INTO usuarios (id,nombre,maquinas_virtuales_id) VALUES (6,'Santiago Valentín Serrano',3);

-- Usuarios MAQUINA 192.168.12.133-- 
INSERT INTO usuarios (id,nombre,maquinas_virtuales_id) VALUES (7,'Jose Maria Romero Ruiz',4);
INSERT INTO usuarios (id,nombre,maquinas_virtuales_id) VALUES (8,'Desconocido',4);

-- Usuarios MAQUINA 192.168.12.134-- 
INSERT INTO usuarios (id,nombre,maquinas_virtuales_id) VALUES (9,'Canucho',5);
INSERT INTO usuarios (id,nombre,maquinas_virtuales_id) VALUES (10,'Sex n Metal',5);

-- Usuarios MAQUINA 192.168.12.135-- 
INSERT INTO usuarios (id,nombre,maquinas_virtuales_id) VALUES (11,'Marcos Gallardo Perez',6);
INSERT INTO usuarios (id,nombre,maquinas_virtuales_id) VALUES (12,'Desconocido',6);

-- Usuarios MAQUINA 192.168.12.136-- 
INSERT INTO usuarios (id,nombre,maquinas_virtuales_id) VALUES (13,'Alvaro Leiva Toledano',7);
INSERT INTO usuarios (id,nombre,maquinas_virtuales_id) VALUES (14,'Jose Rafael Álvarez Espino',7);

-- Usuarios MAQUINA 192.168.12.137-- 
INSERT INTO usuarios (id,nombre,maquinas_virtuales_id) VALUES (15,'Juan Antonio Bujalance García',8);
INSERT INTO usuarios (id,nombre,maquinas_virtuales_id) VALUES (16,'Angelo Barbara',8);

-- Usuarios MAQUINA 192.168.12.138-- 
INSERT INTO usuarios (id,nombre,maquinas_virtuales_id) VALUES (17,'Javier Lopera',9);
INSERT INTO usuarios (id,nombre,maquinas_virtuales_id) VALUES (18,'Zuri',9);

-- Usuarios MAQUINA 192.168.12.139-- 
INSERT INTO usuarios (id,nombre,maquinas_virtuales_id) VALUES (19,'Rafael Angel Sojo Ruiz',10);
INSERT INTO usuarios (id,nombre,maquinas_virtuales_id) VALUES (20,'Adrián Moya Moruno',10);