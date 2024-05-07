
-- ##########################################
-- ############# EJERCICIO DIA 4##############
-- #############   CONSULTAS    ##############
-- ##########################################

use jardineria;

-- mostra codigo de oficina y la ciudad

SELECT codigo_oficina , ciudad
FROM oficina;
-- Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

SELECT pais,ciudad,telefono 
FROM oficina
WHERE pais  = "españa";

-- Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.


SELECT nombre ,apellido1 , apellido2 ,email  
FROM empleado 
WHERE codigo_jefe  = 7 ;

-- Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

SELECT nombre ,apellido1 , apellido2 ,email,puesto 
FROM empleado 
WHERE codigo_jefe is NULL  ;

-- Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.

SELECT nombre ,apellido1 , apellido2 ,puesto 
FROM empleado 
WHERE puesto  != "representantes de ventas"  ;

-- Devuelve un listado con el nombre de los todos los clientes españoles.

SELECT nombre_cliente, pais 
FROM cliente 
WHERE pais  = "spain"  ;

-- Devuelve un listado con los distintos estados por los que puede pasar un pedido.

SELECT estado
FROM pedido
GROUP by estado ;

-- Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:


-- Utilizando la función YEAR de MySQL. 
SELECT codigo_cliente  
FROM pedido
where year(fecha_pedido)=2008
group by codigo_cliente ;



-- Utilizando la función DATE_FORMAT de MySQL
SELECT codigo_cliente  
FROM pedido
where DATE_FORMAT(fecha_pedido,  "%Y")=2008
group by codigo_cliente ;


-- Sin utilizar ninguna de las funciones anteriores.

SELECT codigo_cliente  
FROM pedido
where fecha_pedido < "2009-01-01"
group by codigo_cliente ;
 

-- Devuelve un listado con el código de pedido, código de cliente, 
-- fecha esperada y fecha de entrega de los pedidos que no han sido 
-- entregados a tiempo.
SELECT codigo_pedido ,codigo_cliente ,fecha_esperada ,fecha_entrega  
FROM pedido
where fecha_pedido > fecha_entrega;




select * from pedido 






-- ######## Desarrollado por Joan Sebastian Nuñez Serrano ###############

