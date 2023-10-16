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
nomeesp varchar(30),
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








CREATE INDEX inomeutente
ON utentes (nomeutente);

CREATE INDEX inomeesp
ON especialidades (nomeesp);

drop index inomeesp on especialidades;

create table locais (
idloc int,
nomeloc varchar(30),
);

alter table locais add Primary key (idloc);
alter table locais drop primary key ); 

drop table locais;

update meedicos 
set idesp = 1;

update meedicos
set nomemed = 'Andree Santos'
where idmedicos = 1;

update utentes
set nrsegsocial = 0
where idutentes = 2;

update consultas
set valor = 4.99,observacoes = '';

update consultas
set pago = 1
where dataa=2020-07-21;

update consultas
set hora=14.30
where dataa=2020-07-21 and hora=15;

update meedicos
set nomemed='Joana Alves',telemovel=912000555,email = 'joana.alves@mail.com', especialidade= 'Ortopedia'
where nomemed='Joana';

insert into especialidades (especialidade)
values ('Dermatologista');

insert into meedicos(idmedicos,nomemed,telemovel,email,especialidade)
values (3,'Josee Manuel',976543210,'jose.manuel@consultorio.pt',3);

insert into utentes(idutentes,nomeutente,telefone,email,nrcontribuint,nrsegsocial)
values (8,'Severino Pereira',987654321,'severino.preira@site.com',111222333,444555666);

insert into consultas (idconsultas,dataa,hora,idutentes,idmedicos,valor,observacoes,pago)
values (3,2020-07-31,14,8,3,0,'Primeira consulta',0);

alter table consultas change column observacoes obs varchar(250);
alter table meedicos modify telemovel int;
alter table meedicos add nif int;

update utentes
set nomeutente= 'Jose Manuel Silva',especialidade=2
where idutentes = 8;

update consultas 
set pago=1,valor=50
where idconsultas=3;

update consultas
set obs='Falta Pagar 10'
where idconsultas=3;




insert into consultas (idconsultas,idmedicos,idutentes,dataa,hora,valor,obs,pago)
values( 
(1,1,2020-07-29,9,30,'Deve 5$',1)
(1,2,2020-07-31,10,30,' ',0)
(2,3,2020-07-31,15,30,' ',0)
(2,4,2020-08-07,9,40,' ',0)
(2,1,2020-08-08,9,30,' ',0)
);

-----------------------
update consultas
set pago=1
where idconsultas=11;
-----------------------

delete from consultas where pago=0;

delete from consultas where dataa=>2020-07-29;

delete from consultas where idmedicos=2 and idutentes=1;

delete from consultas where idconsultas=11,idconsultas=12,idconsultas=13;
delete from consulta where valor<>30
delete from consultas where dataa=2020-07-31 and hora=>12;
delete from consultas where idutentes=1 , idutentes=3;

begin
insert into meedicos (nomemed)
values (('Jeresalvo'));
insert into utentes (nomeutente)
values (('Simas Turbo'));
commit;

begin
insert into meedicos (nomemed)
values (('Jeresalvo'));
insert into utentes (nomeutente)
values (('Simas Turbo'));
rollback;

begin
update meedicos
set nomemed='Manuel Josee'
where idmedicos=1;
delete from meedicos where idmedicos=2;
commit;

begin 
update meedicos
set nomemed='Manuel Josee'
where idmedicos=1;
delete from meedicos where idmedicos=2;
rollback;

begin
update meedicos
set nomemed='Manuel Josee'
where idmedicos=1;
delete from meedicos where idmedicos=2;
commit;

-------------------
create user 'master'@'localhost'
create user 'dummy'@'localhost' 
drop user 'dummy'@'localhost'
create user 'user1'@'localhost'
create user 'user2'@'localhost'
create user 'user3'@'localhost'

grant all PRIVILEGES on consultorio to 'master'@'localhost'
-----------------------

grant insert PRIVILEGES on consultorio.meedicos to 'user1'@'localhost'

grant update PRIVILEGES on consultorio.meedicos to 'user1'@'localhost'
grant insert PRIVILEGES on consultorio.consultas to 'user2'@'localhost'
revoke insert PRIVILEGES on consultorio.consultas to 'user2'@'localhost'
grant insert PRIVILEGES on consultorio.meedicos to 'user3'@'localhost'
grant update PRIVILEGES on consultorio.meedicos to 'user3'@'localhost'

