DROP DATABASE IF EXISTS tutoriales;
CREATE DATABASE tutoriales CHARACTER SET utf8mb4;
USE tutoriales;

CREATE TABLE categoria (
  idCategoria INT (10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nombreCat VARCHAR (50)
);

insert into categoria(nombrecat)
VALUES
		('Logica de programacion'),
	   ('Flutter'),
      ('Node.js');           
      
CREATE TABLE tutorial (
  idTutorial INT (10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nombre VARCHAR (200) NOT NULL,
  prioridad VARCHAR(50) NOT NULL,
  url TEXT NOT NULL,
  estado VARCHAR(50),
  categori VARCHAR (50)
);

/* se insertan datos en la tabla tutorial */
INSERT INTO tutorial (nombre, prioridad, url, estado, categori) 
VALUES 
	('curso desde cero', 5, 'https://programar', 'revisado', 'logica de programing'),
   ('primera calculadora', 5, 'https://calculadora', 'revisado', 'logii');


DELIMITER //
/*se crea un nuevo procedimiento llamado tutorial con los parametros mencionados*/
CREATE PROCEDURE agregarTutorial (
IN tut_idTutorial INT (10),
 IN tut_nombre VARCHAR(200),
  IN tut_prioridad VARCHAR(50), 
  IN tut_url TEXT,
  IN tut_estado VARCHAR(50),
   IN tut_categori VARCHAR(50))
/*inicia el procedimiento hasta el end*/

BEGIN
    INSERT INTO tutorial (idTutorial, nombre, prioridad, url, estado, categori)
    VALUES (tut_idTutorial, tut_nombre, tut_prioridad, tut_url, tut_estado, tut_categori);
END //
/*restaura al ";"   */
DELIMITER ;

DELIMITER //
/*se crea un nuevo procedimiento llamado categoria con los parametros mencionados*/
CREATE PROCEDURE agregarCategoria (
IN tut_idCategoria INT (10),
 IN tut_nombreCat VARCHAR (50))
/*inicia el procedimiento hasta el end*/

BEGIN
    INSERT INTO categoria (idCategoria, nombreCat)
    VALUES (tut_idCategoria, tut_nombreCat);
END //
/*restaura al ";"   */
DELIMITER ;
