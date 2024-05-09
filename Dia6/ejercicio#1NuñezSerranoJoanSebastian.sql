

-- ##########################################
-- ############# EJERCICIO DIA 6##############
-- #############   ejercicio    ##############
-- ##########################################

--creacion de base de datos

 -- create database dia6;
 
-- usar database dia6 
use dia6;

-- creacion tabla estudiante

CREATE table estudiante(
ID_Estudiante varchar(3) primary key,
Nombre_Estudiante varchar(25));

-- creacion tabla cursos

CREATE table curso(
ID_Curso varchar(4) primary key,
Nombre_Curso varchar(25),
Nombre_profesor varchar(25));

-- creacion tabla estudiante_curso

CREATE table estudiante_curso(
ID_Estudiante varchar(3),
ID_curso varchar(4)
);

INSERT INTO estudiante values
    ('E01','Ana'),
    ('E02','Juan'),
    ('E03','Maria'),
    ('E04','Pedro');
   
   
INSERT INTO curso values
    ('C101','Matematicas', 'Sr. Garcia' ),
    ('C102','Historia', 'Sra. Lopez' ),
    ('C103','Fisica', 'Sr. Hernandez' );
  
   
INSERT INTO estudiante_curso values
    ('E01','C101'),
    ('E02','C102'),
    ('E03','C101'),
    ('E04','C103');
