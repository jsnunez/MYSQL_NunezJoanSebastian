

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


