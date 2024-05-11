-- ##################################################
-- ################# Examen 1 consultas ##############
-- #############el universitario ##############
-- ##########################################

use ElUniversitario;


-- Devuelve un listado con los nombres de todos los profesores y los departamentos
-- que tienen vinculados. El listado también debe mostrar aquellos profesores que 
-- no tienen ningún departamento asociado. El listado debe devolver cuatro columnas,
-- nombre del departamento, primer apellido, segundo apellido y nombre del profesor.
-- El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del 
-- departamento, apellidos y el nombre.


SELECT d.nombre "Departamento",p.apellido1 "Primer Apellido",
p.apellido2 "Segundo Apellido",p.nombre "Nombre Profesor",
p.id_departamento 
FROM departamento d RIGHT JOIN profesor p ON d.id = p.id_departamento 
ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;



-- Devuelve un listado con los profesores que no están asociados a un departamento.

SELECT p.nombre,p.apellido1 ,p.apellido2 
from profesor p inner join departamento d 
where  p.id_departamento  is null


-- Devuelve un listado con los departamentos que no tienen profesores asociados.

SELECT d.nombre 
FROM profesor p RIGHT JOIN departamento d 
ON p.id_departamento = d.id
WHERE p.id IS NULL;
-- Devuelve un listado con los profesores que no imparten ninguna asignatura

SELECT profesor.nombre 
FROM profesor LEFT JOIN asignatura
ON profesor.id=asignatura.id_profesor
WHERE asignatura.id_profesor  IS NULL;


-- Devuelve un listado con las asignaturas que no tienen un profesor asignado.

SELECT asignatura.nombre
FROM asignatura LEFT JOIN profesor
ON asignatura.id_profesor=profesor.id
WHERE asignatura.id_profesor  IS NULL


-- Devuelve un listado con todos los departamentos que tienen alguna asignatura 
-- que no se haya impartido en ningún curso escolar. El resultado debe mostrar 
-- el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.


SELECT d.nombre , a.nombre 
FROM departamento d INNER JOIN profesor p 
ON d.id = p.id_departamento INNER JOIN asignatura a 
ON p.id = a.id_profesor LEFT JOIN curso_escolar c
ON a.curso = c.id WHERE c.id IS NULL;

-- Devuelve el número total de alumnas que hay.

SELECT COUNT(a.sexo) FROM alumno a
WHERE a.sexo ="M";


-- Calcula cuántos alumnos nacieron en 1999.

select count(fecha_nacimiento) FROM alumno a
WHERE year(a.fecha_nacimiento)= 1999


-- Calcula cuántos profesores hay en cada departamento. 
-- El resultado sólo debe mostrar dos columnas, una con 
-- el nombre del departamento y otra con el número de 
-- profesores que hay en ese departamento. El resultado
-- sólo debe incluir los departamentos que tienen profesores asociados 
-- y deberá estar ordenado de mayor a menor por el número de profesores.

SELECT departamento.nombre, COUNT(profesor.id_departamento) "Numero de Profesores"
FROM departamento LEFT JOIN profesor
ON departamento.id = profesor.id_departamento
WHERE profesor.id_departamento IS NOT NULL
GROUP BY profesor.id_departamento


ORDER BY 2 DESC;

-- Devuelve todos los datos del alumno más joven.

SELECT aa.nombre, aa.apellido1, aa.fecha_nacimiento 
FROM alumno aa
WHERE aa.fecha_nacimiento = (SELECT MAX(a.fecha_nacimiento) FROM alumno a);

-- 17. Devuelve un listado con los profesores que no están asociados a un departamento.

SELECT p.apellido1 "Primer Apellido",p.apellido2 "Segundo Apellido",p.nombre "Nombre Profesor",d.nombre "Departamento"
FROM profesor p LEFT JOIN departamento d ON p.id_departamento = d.id
WHERE p.id_departamento NOT IN (SELECT profesor.id_departamento FROM profesor)
ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;

-- 18. Devuelve un listado con los departamentos que no tienen profesores asociados.
SELECT departamento.nombre
FROM departamento LEFT JOIN profesor
ON profesor.id_departamento=departamento.id
WHERE profesor.id NOT IN (SELECT departamento.id FROM departamento);

-- 19. Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.

SELECT profesor.nombre
FROM profesor LEFT JOIN departamento
ON profesor.id_departamento = departamento.id
WHERE profesor.id_departamento NOT IN (SELECT asignatura.id FROM asignatura)

-- 20. Devuelve un listado con las asignaturas que no tienen un profesor asignado.

SELECT asignatura.nombre
FROM asignatura LEFT JOIN profesor
ON asignatura.id_profesor=profesor.id
WHERE asignatura.id_profesor NOT IN (SELECT profesor.id FROM profesor);
