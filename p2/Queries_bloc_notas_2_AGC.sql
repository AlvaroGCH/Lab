## Queries para el bloc de notas

## Usamos nuestra BD
show databases;
use  bloc_notas;
show tables;

## 1) Eliminar todos los adjuntos de la nota cuyo titulo contiene la palabra 'Talentum' 
delete from adjunto where exists (select * from nota where titulo like '%Talentum%' and id_nota_adj = id_nota);
## 2) Insertar tres nuevos blocs de notas (los que se quieran) 

insert into `bloc` values (13,'lab1','2022-03-22 18:20:00',4),(14,'lab_2','2022-03-22 19:00:00',4),(15,'lab_3','2022-03-26 22:10:00',4);
## 3)  Actualizar la nota cuyo titulo contiene la palabra 'Carnaval' con el siguiente texto:
## 'Por motivos ajenos a la universidad se suspenden las Fiestas de Carnaval'
## Indicar como fecha de modificacion la actual

update nota set texto = 'Por motivos ajenos a la universidad se suspenden las Fiestas de Carnaval', fecha_modificacion = CURDATE() where titulo like '%Carnaval%';  
## 4) Cuales son los países distintos de los que tenemos usuarios

select Pais from usuario group by Pais;
## 5) Número de países distintos de los que tenemos usuarios
select count(distinct Pais) as num_paises_distintos from usuario;

## 6) Cuantos usuarios hay de cada pais

select Pais, count(id_usuario) as usuarios from usuario group by Pais;

## 7) Actualizar la BD para cambiar de bloc la nota cuyo titulo contiene la palabra 'Bocadillos' , 
## debe cambiarse al bloc de notas cuyo nombre es 'ocio'

update nota set id_bloc_nota = (select id_bloc from bloc where nombre like '%ocio%') where titulo like '%Bocadillos%';

## 8) Cuales son los blocs de notas que están vacios (ninguna nota). Muestra su identificador y el nombre. 

select id_bloc, nombre from bloc where not exists(select id_bloc_nota from nota where id_bloc = id_bloc_nota);


## 9) Cuales son las notas que no tienen adjuntos

select id_nota from nota where not exists(select id_nota_adj from adjunto where id_nota = id_nota_adj);
## 10) Cual es la nota (ide_nota) con mayor número de modificaciones

select id_nota_mod, count(id_nota_mod) as num_modificaciones from modificaciones group by id_nota_mod order by num_modificaciones desc limit 1; 