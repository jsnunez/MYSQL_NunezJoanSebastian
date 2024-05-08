
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
WHERE pais  = "España";

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



-- Devuelve un listado con el código de pedido, código de cliente, 
-- fecha esperada y fecha de entrega de los pedidos cuya fecha de 
-- entrega ha sido al menos dos días antes de la fecha esperada.

-- Utilizando la función ADDDATE de MySQL.

SELECT codigo_pedido ,codigo_cliente ,fecha_esperada ,fecha_entrega  
FROM pedido
where fecha_esperada >= ADDDATE(fecha_entrega, INTERVAL 2 DAY)  ;


-- Utilizando la función DATEDIFF de MySQL.

SELECT codigo_pedido ,codigo_cliente ,fecha_esperada ,fecha_entrega  
FROM pedido
where DATEDIFF(fecha_esperada,fecha_entrega) >= 2 ;


-- Devuelve un listado de todos los pedidos que fueron en 2009.

SELECT codigo_pedido ,codigo_cliente ,fecha_esperada ,fecha_entrega  
FROM pedido
where year(fecha_pedido) = 2009;


-- Devuelve un listado de todos los pedidos que han sido  en el mes de enero de cualquier año.

SELECT codigo_pedido ,codigo_cliente ,fecha_pedido  
FROM pedido
where DATE_FORMAT(fecha_pedido,"%c") = 1;


-- Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal.
-- Ordene el resultado de mayor a menor.

SELECT forma_pago  ,fecha_pago   
FROM pago
where forma_pago ="paypal" and DATE_FORMAT(fecha_pago,"%Y") =2008  
order by fecha_pago desc 
;

-- Devuelve un listado con todas las formas de pago que aparecen en la tabla pago.
--  Tenga en cuenta que no deben aparecer formas de pago repetidas.

SELECT forma_pago   
FROM pago
group by forma_pago
;

-- Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales
-- y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por 
-- su precio de venta, mostrando en primer lugar los de mayor precio.


SELECT nombre ,cantidad_en_estock,precio_venta ,gama 
FROM producto p 
where gama = 'Ornamentales' and cantidad_en_estock >100 
order by precio_venta  desc


-- Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo
-- representante de ventas tenga el código de empleado 11 o 30.

SELECT nombre_cliente  ,ciudad ,codigo_empleado_rep_ventas  
FROM cliente 
where  ciudad  = 'Madrid' and codigo_empleado_rep_ventas = 11 or  codigo_empleado_rep_ventas = 30

-- Consultas multitabla (Composición interna)
-- Resuelva todas las consultas mediante INNER JOIN y NATURAL JOIN.

-- Obtén un listado con el nombre de cada cliente y el nombre y apellido
-- de su representante de ventas.


select cliente.nombre_cliente  as nombrecliente, empleado.nombre as nombrerepresentante, empleado.apellido1  as apellido1,empleado.apellido2  as apellido2
from cliente  inner join empleado   
on cliente.codigo_empleado_rep_ventas  = empleado.codigo_empleado ;

-- Muestra el nombre de los clientes que hayan realizado pagos junto 
-- con el nombre de sus representantes de ventas.


select distinct cliente.nombre_cliente  as nombrecliente, empleado.nombre as nombrerepresentante

from  cliente  inner join empleado 
on cliente.codigo_empleado_rep_ventas  = empleado.codigo_empleado
inner join pago
on cliente.codigo_cliente  = pago.codigo_cliente  


-- Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto 
-- con la ciudad de la oficina a la que pertenece el representante.



select distinct cliente.nombre_cliente  as nombrecliente, empleado.nombre as nombrerepresentante
 , oficina.ciudad 
from  cliente  inner join empleado 
on cliente.codigo_empleado_rep_ventas  = empleado.codigo_empleado
inner join pago
on cliente.codigo_cliente  = pago.codigo_cliente
inner join oficina
on empleado.codigo_oficina =oficina.codigo_oficina ;


select * from empleado e 
-- Devuelve el nombre de los clientes que  hayan hecho pagos y el nombre
--  de sus representantes junto con la ciudad de la oficina a la que pertenece
-- el representante.Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

select distinct cliente.nombre_cliente  as nombrecliente, empleado.nombre as nombrerepresentante
 , oficina.ciudad , oficina.linea_direccion1  
from  cliente  inner join empleado 
on cliente.codigo_empleado_rep_ventas  = empleado.codigo_empleado
inner join pago
on cliente.codigo_cliente  = pago.codigo_cliente
inner join oficina
on empleado.codigo_oficina =oficina.codigo_oficina 
where cliente.ciudad = "Fuenlabrada";

-- Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad
-- de la oficina a la que pertenece el representante.


select distinct cliente.nombre_cliente , empleado.nombre as nombrerepresentante
   ,o.ciudad as ciudad_oficina
from  cliente  inner join empleado 
on cliente.codigo_empleado_rep_ventas  = empleado.codigo_empleado 
inner join oficina o 
on empleado.codigo_oficina =o.codigo_oficina 

 


-- Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.

select e1.nombre as Empleado, e2.nombre  as Jefe
FROM empleado e1 INNER JOIN empleado e2 ON e1.codigo_jefe = e2.codigo_empleado


-- Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.

select e1.nombre as Empleado, e2.nombre  as Jefe, e3.nombre  as Jefe_del_jefe
FROM empleado e1 INNER JOIN empleado e2 
ON e1.codigo_jefe = e2.codigo_empleado
inner join empleado e3
on e2.codigo_jefe = e3.codigo_empleado
-- Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

SELECT *
FROM cliente c INNER JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
WHERE p.fecha_entrega > p.fecha_esperada

-- Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

SELECT DISTINCT c.nombre_cliente, pr.gama
FROM cliente c INNER JOIN pedido pe ON c.codigo_cliente = pe.codigo_cliente
               INNER JOIN detalle_pedido dp ON dp.codigo_pedido = pe.codigo_pedido
               INNER JOIN producto pr ON pr.codigo_producto = dp.codigo_producto
               
select * from empleado e 

-- ######## Desarrollado por Joan Sebastian Nuñez Serrano ###############

