-- ##########################################
-- #############EJERCICIO DIA 3##############
-- ##########################################



--  creacion de base de datos

create database IF NOT EXISTS Paises

use Paises

-- crear tabla de paises

  CREATE TABLE IF NOT EXISTS pais (
   id  INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(20) ,   
  continente VARCHAR(50) ,   
  poblacion int, 
  PRIMARY KEY (id));
 
 -- crear tabla idiomas
 
 CREATE TABLE IF NOT EXISTS idioma (
   id  INT NOT NULL AUTO_INCREMENT,
  idioma VARCHAR(50),
  PRIMARY KEY (id));
 
 -- crear tabla idioma_pais
 
 
 CREATE TABLE IF NOT EXISTS idioma_pais (
   id_idioma  INT not null,
  id_pais int not null,
  es_oficial tinyint(1),
  PRIMARY KEY (id_idioma,id_pais),
   foreign key(id_idioma) REFERENCES idioma(id),
    foreign key(id_pais) REFERENCES pais(id)
 );

 CREATE TABLE IF NOT EXISTS ciudad (
   id  INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50),
  id_pais int,
  PRIMARY KEY (id),
      foreign key(id_pais) REFERENCES pais(id)
 );
 
 --  insertar datos de idioma
  
INSERT INTO idioma(id,idioma) 
    VALUES (1,"ingles"),
   (2,"español"),
  (3,"coreano"),
 (4,"griego"),
(5,"portugues"),
(6,"catalan"),
(7,"ruso"),
(8,"japones"),
(9,"mandarin"),
(10,"aleman")
;


 --  insertar datos de pais

INSERT INTO pais(id,nombre,continente,poblacion) 
    VALUES (1,"colombia","america",100000),
   (2,"japon","asia",100000),
  (3,"usa","america",1000000),
 (4,"alemania","europa",100000),
(5,"China","asia",100000),
(6,"rusia","europa",100000),
(7,"brazil","america",100000),
(8,"grecia","europa",100000),
(9,"españa","europa",100000),
(10,"corea","asia",100000)
;



 --  insertar datos de ciudades

INSERT INTO ciudad (id,nombre,id_pais) 
    VALUES (1,"bogota",1),
   (2,"tokio",2),
  (3,"chicago",3),
 (4,"munich",4),
(5,"hong kong",5),
(6,"moscu",6),
(7,"rio de janerio",7),
(8,"atena",8),
(9,"madrid",9),
(10,"seul",10)
;


 --  insertar datos de ciudades

INSERT INTO idioma_pais(id_idioma,id_pais,es_oficial) 
 VALUES (2,1,1),
 (1,3,1),
 (1,2,0),
 (3,10,1),
 (5,7,1),
 (7,6,1),
 (1,6,0),
 (8,2,1),
 (9,5,1),
 (1,5,0)

-- Desarrollado por Joan Sebastian Nuñez Serrano