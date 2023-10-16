create database Consultorio;

create table medicos (
idmedicos int,
nomemed varchar(50),
telefone int,
primary key (idmedicos)
);

create table consultas (
idconsultas  int,
dataa date , 
hora time ,
idutentes int,
idmedicos int,
primary key (idconsultas),
foreign key (idutentes) REFERENCES utentes(idutentes) on delete restrict,
foreign key (idmedicos) REFERENCES medicos(idmedicos) on delete restrict
);

create table utentes (
idutentes int,
email varchar(50),
telefone int,
nomeutente varchar(100),
nrcontribuint int,
primary key (idutentes)
);

CREATE TABLE especialidades(
(idesp int,
descricao varchar(50),
)primary key (idesp));

alter table medicos rename to meedicos;

alter table meedicos add email varchar(50);

alter table meedicos add FOREIGN KEY (idesp) REFERENCES especialidades(idesp) on delete restrict
alter table meedicos add idesp int;
alter table consultas add valor DECIMAL(10.2);
alter table consultas add observacoes varchar (250);
alter table consultas add pago int;

alter table meedicos change column telefone telemovel int;
alter table utentes add nrsegsocial varchar(15);
alter table meedicos modify telemovel varchar(15);
alter table utentes modify telefone varchar(15);
alter table especialidades drop descricao;