## Queries para el bloc de notas

show databases;
use  bloc;
show tables;

## 1) seleccciona el id de la Nota y su texto con mayor número de caracteres

select  id_nota, texto from nota order by length(texto) desc limit 1;
 

## 2)  Usuarios con más blocs de notas / con más notas
## 2.1) seleccionar el nombre de los 5 Usuarios con más blocs de notas 
  
select nombre_completo, COUNT(b.id_usuario) as num_bloc  from bloc b, usuario  u where b.id_usuario = u.id_usuario group by b.id_usuario order by COUNT(b.id_usuario) desc limit 5;
   

## 2.2) seleccionar nombre de los 5 Usuarios con más notas
 
select distinct nombre_completo, COUNT(n.id_bloc_nota) as num_notas from nota n, bloc b, usuario  u where n.id_bloc_nota = b.id_bloc and b.id_usuario = u.id_usuario group by n.id_bloc_nota order by num_notas desc limit 5;


## 3) Obtener las 5 notas más recientes y las más antiguas
## 3.1) Seleccionar el identificador, titulo y fecha de creacion de las 5 notas más recientes

select id_nota, titulo, fecha_creacion from nota group by fecha_creacion order by fecha_creacion desc limit 5; 

## 3.2) Seleccionar el identificador, titulo y fecha de creacion de las 5 notas más antiguas 

select id_nota, titulo, fecha_creacion from nota group by fecha_creacion order by fecha_creacion asc limit 5;

## 4) Seleccionar titulo y texto de las Notas cuyo título o texto contenga la palabra “ becas”

select titulo, texto from nota where titulo like '%becas%' or texto like '%becas%';

## 5) Cuantos tags tiene cada nota ordenados de forma descendente 
## (selecciona el id de la nota y el numero de tags por cada una)

select id_nota_t, count(id_nota_t) as num_tags from nota_tag group by id_nota_t;

## 6)Tags más populares
## 6.1) obtener el Tag que aparece en más notas

select tag, count(id_tag_t) as num_tags from nota_tag, tag  where id_tag_t = id_tag group by id_tag_t order by num_tags desc limit 1;

## 6.2) Los 5 Tags que aparecen en más notas  

select tag, count(id_tag_t) as num_tags from nota_tag, tag  where id_tag_t = id_tag group by id_tag_t order by num_tags desc limit 5;

## 7) EL nombre del bloc con mayor número de notas

select nombre, count(id_bloc_nota) as num_notas from nota, bloc  where id_bloc_nota = id_bloc group by id_bloc_nota order by num_notas desc limit 1;

## 8) Obtener el identificador y el titulo de la nota más modificada

select id_nota_mod , titulo, count(id_nota_mod) as num_mod from nota, modificaciones where id_nota_mod = id_nota group by id_nota_mod order by num_mod desc limit 1;

## 9) Crear una vista en la que tengamos el id de la nota, su titulo, su texto, el id del bloc al que pertence y el id del usuario que creo dicho bloque

select id_nota, titulo, texto, id_bloc_nota, id_usuario from nota, bloc where id_bloc_nota = id_bloc;  

## Añadiendo además el nombre del bloc y del usuario

select id_nota, titulo, texto, id_bloc_nota, b.id_usuario, nombre, u.nombre_usuario from nota, bloc b, usuario u where id_bloc_nota = b.id_bloc and b.id_usuario = u.id_usuario;  

## 10) Obtener (utilizando la primera vista creada anteriormente) cual es el nombre del usuario que creo cada nota

select id_nota, titulo, texto, id_bloc_nota, b.id_usuario, u.nombre_usuario from nota, bloc b, usuario u where id_bloc_nota = b.id_bloc and b.id_usuario = u.id_usuario;