create database Revistas

create table tipo(
num_tipo int,
design_tipo varchar(50),
Primary Key (num_tipo));

create table revista(
num_revista int ,
nome varchar(50),
num_tipo int,
Primary Key (num_revista),
FOREIGN key (num_tipo) REFERENCES tipo(num_tipo));

create table edicao(
num_edicao int ,
num_revista int ,
num int,
dataa date,
Primary Key (num_edicao),
FOREIGN key (num_revista) REFERENCES revista(num_revista));

create table tema
(
num_tema varchar(50) ,
descricao varchar(100),
Primary Key (num_tema),
);

create table titulo
(
num_titulo int ,
designacao varchar(50),
pagina_inicio int,
num_edicao int,
num_tema varchar(50),
Primary Key (num_titulo),
FOREIGN key (num_edicao) REFERENCES edicao(num_edicao),
FOREIGN key (num_tema) REFERENCES tema(num_tema)
);

select num_revista
from revista 

select num_edicao
from titulo
where designacao='Visao'
************************************** ERRO
select num_edicao
from titulo
where num_tema='Natal' and disignacao='Activa'

select num_revista and num_edicao
from revista and titulo
where num_tema='Ecologia'

select num_revista and num_edicao
from edicao and titulo
where titulo= '%Covid-19%'
************************************* ERRO 
--------------------------------------- Incompleto
select titulo
from 
where dataa=>2020-01-01 and dataa <=2020-04-01
--------------------------------------- Incompleto
select 
from 
where
-------------------------------- Nao Fiz
select 
from 
where
---------------------- Nao Fiz
select num
from edicao
where 
--------------------- Nao Fiz
select  
from 
where
---------------------- Nao Fiz