create database IF NOT EXISTS clase3_final;
USE clase3_final;

CREATE TABLE IF NOT EXISTS departamento (
   id  INT(10) NOT NULL AUTO_INCREMENT,
   nombre  VARCHAR(50) NOT NULL,
  PRIMARY KEY ( id ));
  
  CREATE TABLE IF NOT EXISTS profesor (
   id_profesor  INT(10) NOT NULL AUTO_INCREMENT,
   id_departamento  int(10) NOT NULL,
  PRIMARY KEY (id_profesor),
foreign key(id_departamento) REFERENCES departamento(id) );
  
  CREATE TABLE IF NOT EXISTS grado (
   id  INT(10) NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,   
  PRIMARY KEY (id));
  
     CREATE TABLE IF NOT EXISTS curso_escolar (
   id  INT(10) NOT NULL AUTO_INCREMENT,
  anyo_inicio year(4) NOT NULL,   
  anyo_fin year(4) NOT NULL,   
  PRIMARY KEY (id));
  

  
      CREATE TABLE IF NOT EXISTS asignatura (
   id  INT(10) NOT NULL AUTO_INCREMENT,
   nombre VARCHAR(100) NOT NULL,   
   creditos float NOT NULL,
   tipo enum("1","2","3") NOT NULL,
   curso tinyint(3) NOT NULL,
   cuatrimestre tinyint(3) NOT NULL,
   id_profesor int(10) ,
	id_grado int(10) not null,
  PRIMARY KEY (id),
 foreign key(id_profesor) REFERENCES profesor(id_profesor),
 foreign key(id_grado) REFERENCES grado(id));
  
      CREATE TABLE IF NOT EXISTS persona (
   id  INT(10) NOT NULL AUTO_INCREMENT,
   nif  int(9) ,
   nombre VARCHAR(25) NOT NULL,   
   apellido1 VARCHAR(50) NOT NULL,
   apellido2 VARCHAR(50) NULL,
   ciudad VARCHAR(50) NOT NULL,
   telefono VARCHAR(9) ,
   fecha_nacimiento date NOT NULL,
   sexo enum("H","M") NOT NULL,
   tipo enum("1","2","3"),
  PRIMARY KEY (id));
  
    CREATE TABLE IF NOT EXISTS alumno_se_matriculo_asignatura (
  id_alumno int(10),
  id_asignatura int(10),
  id_curso_escolar int(10),
  foreign key(id_alumno) REFERENCES persona(id),
  foreign key(id_asignatura) REFERENCES asignatura(id),
  foreign key(id_curso_escolar) REFERENCES curso_escolar(id)
  );
  
  ALTER TABLE persona ADD CONSTRAINT persona_profesor_FK FOREIGN KEY (id) REFERENCES profesor(id_profesor);


  