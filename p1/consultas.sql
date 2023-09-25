## Queries para BD gestion_pedidos

## Si estuvieramos desde el cliente de  MariaDB (mysql) ejecutar.
## show databases;
## use  <nombreBasedeDatos>;
## show tables;

## En DBeaver, establcer conexión con BD y ejecutar script


## 1) Seleccionar los sliente (nombre y saldo) con el mayor saldo 
 
SELECT nombre_cl, saldo FROM Cliente ORDER BY saldo DESC;

## 2) Seleccionar el id del pedido y la fecha del pedido más antiguo
 
SELECT id_pedido, fecha FROM Pedido ORDER BY fecha ASC LIMIT 1;

## 3) Seleccionar el id del pedido y la fecha del pedido más reciente
 
SELECT id_pedido FROM Pedido ORDER BY fecha DESC LIMIT 1;

## 4) Seleccionar el nombre de los Clientes cuyo nombre contega una 'a'
 
SELECT nombre_cl FROM Cliente WHERE nombre_cl LIKE '*a*';

## 5) Seleccionar el nm¡ombe y la ciudad de los Clientes de Madrid
 
SELECT nombre_cl FROM Cliente WHERE ciudad = 'Madrid';

## 6) Seleccionar el país, el saldo y el nombre de los Clientes de España que tengan saldo superior a 200 euros

SELECT pais, saldo, nombre_cl FROM Cliente WHERE pais = 'España' AND saldo > 200;

## 7) Clientes (nombre, pais y descuento) que sean de España o cuyo descuento sea inferior a 10% ordenados por descuento
 
SELECT nombre_cl, pais, descuento FROM Cliente WHERE ais = 'España' OR descuento < 10 ORDER BY descuento;

## 8)  Clientes (nombre y saldo) con saldo entre 300 y 500
 
SELECT saldo, nombre_cl FROM Cliente WHERE saldo BETWEEN 300 AND 500;

## 9)  Seleccionar el id  y el nombre de los Clientes cuyo identificador sea 3 o 5 ordenados de forma ASC. 

SELECT nombre_cl, id_cliente FROM Cliente WHERE id_cliente = 3 OR id_cliente = 5 ORDER BY id_cliente ASC;

## 10) Seleccionar el id, el nombre y la ciudad de los CLientes que no sean de Madrid
 
SELECT nombre_cl, ciudad, id_cliente FROM Cliente WHERE ciudad != 'MADRID';

## 11) Seleccionar el id, el nombre y la dirección de los Clientes que no tienen direccion
 
SELECT nombre_cl, dir_cl, id_cliente FROM Cliente WHERE dir_cl IS NULL;

## 12) Seleccionar el identificador y el stock de los articulos cuyo stock es mayor de 100
 
SELECT id_articulo, stock FROM Articulo WHERE stock > 100;

##13) Seleccionar el nombre de las ciudades distintas en las que residen nuestros clientes

SELECT DISTINCT ciudad FROM CLiente;

##14) Numero de ciudades distintas en las que viven los clientes
 
SELECT DISTINCT COUNT(ciudad) FROM Cliente;

## 15) Numero de clientes residentes en cada ciudad
 
SELECT COUNT(id_cliente) FROM Cliente GROUP BY ciudad;

## 16) Numero de Articulos agrupados por proveedor que tenemos en el alamacen (listarlos en orden descendente)

SELECT COUNT(id_articulo) FROM Almacen GROUP BY id_proveedor ORDER BY DESC;

## 17) Coste total de todos los articulos que suministra un proveedor (utilizar el stock y precio unitario)

SELECT SUM(precio) FROM Almacen WHERE stock IS NOT NULL OR sotck = 0;

## 18) Precio medio de todos los articulos del alamacen
 
SELECT AVG(precio) FROM Almacen;

## 19) Precio medio de todos los articulos de un proveedor
 
SELECT AVG(precio) DISTINCT id_proveedor FROM Almacen;