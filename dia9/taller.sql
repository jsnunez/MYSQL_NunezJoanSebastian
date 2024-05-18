create database dia9;

use dia9;

-- creacion de tabla customer


CREATE TABLE `customer` (
`id` int DEFAULT NULL,
`first_name` varchar (30) DEFAULT NULL,
`surname` varchar (40) DEFAULT NULL
);

-- insertar datos customer 


INSERT INTO `customer`
VALUES (1, 'Yvonne', 'Clegg'),
(2, 'Johnny', 'Chaka-Chaka'),
(3, 'Winston', 'Powers'),
(4, 'Patricia', 'Mankuku'),
(5, 'Francois', 'Papo'),
(6, 'Winnie', 'Dlamini'),
(7, 'Neil', 'Beneke');

-- mostrar datos customer ordenado por surname

select * from customer order by surname;

-- alterar tabla para agregar primary key id

ALTER TABLE customer ADD PRIMARY KEY(id);

-- mostrar descipcion de customer

DESCRIBE customer;

-- crear data usuario con indice01 de apellido y nombre

CREATE TABLE usuario (id INT NOT NULL,
apellidos CHAR(30) NOT NULL,
nombre CHAR(30) NOT NULL,
PRIMARY KEY (id),
INDEX indice01 (apellidos, nombre));

-- mostar descricion de tabla usuario no muestra los indices

DESCRIBE usuario;

-- mostrar las llaves e indices de la tabla usuario

SHOW KEYS FROM usuario;

-- crear tabla articles

CREATE TABLE articles (
id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
title VARCHAR(200),
body TEXT,
FULLTEXT (title, body)
);

-- mostrar descipcion articles sin  indice de texto completo

DESCRIBE articles;

--  mostrar indices completos de tabla articles

SHOW INDEX FROM articles;

-- crear tabla ui_test con vlaor f1 unico no se puede repetir

CREATE TABLE ui_test(f1 INT, f2 INT, UNIQUE(f1));

-- insetar datos tabla ui_test 

insert into ui_test values(1,2);

-- insertar datos tabla ui_test con dato f1 repetido marca error 

insert into ui_test values(1,3);

-- 

ALTER TABLE customer ADD INDEX (surname(10));


describe customer;

use jardineria;

CREATE INDEX nombre_apellido ON empleado (nombre, apellido1);

SELECT * FROM empleado WHERE apellido1 = 'Paxton' AND nombre LIKE
'L%';

CREATE FULLTEXT INDEX index_nombre_puesto ON empleado (nombre,
puesto);

SELECT codigo_empleado, nombre, apellido1, email, puesto FROM
empleado WHERE (nombre like 'M%' OR puesto
='Director de oficina');

CREATE INDEX descripcion_producto ON producto (descripcion(11));

SELECT codigo_producto, nombre, proveedor, descripción FROM
producto WHERE descripción LIKE 'Limpitatubos%';

SELECT codigo_producto, nombre, proveedor,
descripcion FROM producto WHERE descripcion LIKE 'Limpitatubos%';



-- Ejercicios Propuestos
-- Se utilizará la base de datos jardinería que se proporciona con la guía para los
-- siguientes ejercicios, y se debe utilizar índices para los mismos:
-- 1- Escribe una consulta que permita agrupar los clientes de todos los empleados
-- cuyo puesto sea responsable de ventas. Se requiere que la consulta muestre:
-- Nombre del cliente, teléfono, la ciudad, nombre y primer apellido del responsable
-- de ventas y su email.

CREATE FULLTEXT INDEX index_nombre_puesto ON cliente (nombre,
puesto);

select * from cliente;
select * from empleado;
-- 2- Se necesita obtener los registros de los pedidos entre el 15 de marzo del 2009 y
-- el 15 de julio del 2009, para todos los clientes que sean de la ciudad de
-- Sotogrande. Se requiere mostrar el código del pedido, la fecha del pedido, fecha
-- de entrega, estado, los comentarios y el condigo del cliente que realizo dicho
-- pedido.
-- 3- Se desea obtener los productos cuya gama pertenezca a las frutas y que el
-- proveedor sea Frutas Talaveras S.A, se desea mostrar el código, nombre,
-- descripción, cantidad en stock, y su precio con 10% de descuento, de igual forma
-- se pide la cantidad en los distintos pedidos que se han hecho.



