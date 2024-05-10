-- ##########################################
-- ################# Examen 1  ##############
-- #############el universitario ##############
-- ##########################################


-- crear base de datos

create  database ElUniversitario1;


-- seleccionar base de datos

use ElUniversitario1;


CREATE  table departamento(
id int(10),
nombre varchar(50) not null,
primary key(id)

);

-- crear tabla  de profesor

      CREATE TABLE  profesor (
   id  INT(10) NOT NULL AUTO_INCREMENT,
   nif  varchar(9) ,
   nombre VARCHAR(25) NOT NULL,   
   apellido1 VARCHAR(50) NOT NULL,
   apellido2 VARCHAR(50) ,
   ciudad VARCHAR(25) NOT NULL,
   direccion varchar(50) not null,
   telefono VARCHAR(9) ,
   fecha_nacimiento date NOT NULL,
   sexo enum("H","M") NOT NULL,
   id_departamento int(10) not null,
  PRIMARY KEY (id),
    foreign key(id_departamento) REFERENCES departamento(id) 
  );
 
-- crear tabla  de alumno

 
 CREATE TABLE  alumno (
   id  INT(10) NOT NULL AUTO_INCREMENT,
   nif  varchar(9) ,
   nombre VARCHAR(25) NOT NULL,   
   apellido1 VARCHAR(50) NOT NULL,
   apellido2 VARCHAR(50) ,
   ciudad VARCHAR(50) NOT NULL,
   direccion varchar(50) not null,
   telefono VARCHAR(9) ,
   fecha_nacimiento date NOT NULL,
   sexo enum("H","M") NOT NULL,
  PRIMARY KEY (id)
  );
  
 -- crear tabla  de grado

 CREATE  table grado(
id int(10),
nombre varchar(100) not null,
primary key(id)

);

 -- crear tabla  de cusro_escolar

 CREATE  table curso_escolar(
id int(10),
anyo_inicio year(4) not null,
anyo_fin year(4)not null,
primary key(id)

);

 -- crear tabla  de asignatura

 CREATE  table asignatura(
	id int(10),
   nombre VARCHAR(100) NOT NULL,
   creditos float not null,
   tipo enum("básica","obligatoria","optativa") not null,
   curso tinyint(3)not null,
   cuatrimestre tinyint(3) not null,
   id_profesor int(10) ,
   id_grado int(10)not null,
	primary key(id),
    foreign key(id_profesor) REFERENCES profesor(id) ,    
    foreign key(id_grado) REFERENCES grado(id)
    
);
 -- crear tabla  de alumno_se_matricula_asignatura

CREATE  table alumno_se_matricula_asignatura(
id_alumno int(10),
id_asignatura int(10),
id_curso_escolar int(10),
	primary key(id_alumno,id_asignatura,id_curso_escolar),
    foreign key(id_alumno) REFERENCES alumno(id) ,    
    foreign key(id_asignatura) REFERENCES asignatura(id),    
    foreign key(id_curso_escolar) REFERENCES curso_escolar(id)
    
);




