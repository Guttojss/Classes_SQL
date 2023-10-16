create database Escola

create table Aluno(
numero int,
nome varchar(50),
morada varchar(50),
telefone int,
idade int,
cod_turma int,
primary key (numero),
foreign key (cod_turma) REFERENCES turma(cod_turma) on delete restrict
);

create table Turma(
cod_turma int,
ano int,
designacao char,
numero_alunos int,
primary key (cod_turma)
);

create table Ensina(
disciplina varchar(20)
cod_prof int,
cod_turma int,
primary key (cod_prof,cod_turma),
foreign key (cod_prof) REFERENCES Professor(cod_prof) on delete restrict,
foreign key (cod_turma) REFERENCES Turma(cod_turma) on delete restrict
);

create table Professor(
cod_prof int,
nome varchar(50)
morada varchar(50)
tempo_servico int,
idade int,
inicio_atividade date,
cod_prof_orientador int,
primary key (cod_prof)
);

insert into Aluno(numero,nome,morada,telefone,idade,cod_turma)
values
(1,'João Baião','R Abade Priscos, 10',123456789,13,1),
(2,'Rita Pereira','R dos Perdidos, 5',456123789,15,3),
(3,'Catarina Gouveia','T do Conde, 15',789123456,14,1),
(4,'José R. dos Santos','Rua atras da igreja, 5',123456789,16,4),
(5,'Judite de Sousa','Av da Liberdade, 7',987654321,18,7),
(6,'Pedro Mourinho','R Horta Seca, 15',654321987,17,6),
(7,'Rodrigo G de Carvalho','B da Guarda, 16',456123789,13,1),
(8,'Carolina Patrocinio','R das Rosas, 2',123456789,20,7),
(9,'Carolina Loureiro','T da Oliveira,1',789123456,14,2),
(10,'Fátima Lopes','R Onze, 11',654321987,16,5),
(11,'Júlia Pinheiro','R da Sorte, 21',123456789,15,4),
(12,'Manuel L Goucha','R da Igreja, 12',456123789,19,7),
(13,'João Paulo Rodrigues','R Direita, 10',456123789,13,1),
(14,'Daniel Oliveira','R das Flores, 33',789123456,15,4),
(15,'Tânia Ribas Oliveira','R dos Descalços, 7',789123456,16,6),
(16,'César Mourão','R do Saco,. 4',456123789,18,8),
(17,'João Manzarra','R da Roda, 16',123456789,17,7),
(18,'Cláudio Ramos','A.da Europa, 21',987654321,19,8),
(19,'Ana Marques','R da Boavista, 15',123456789,20,8),
(20,'Cláudia Vieira','R do Nó, 5',987654321,15,4),
(21,'Catarina Furtado','Av. do Uruguai, 43',456123789,14,2),
(22,'Sónia Araújo','Tr. Sem Fim, 50',789123456,13,1),
(23,'Nuno Markl','B. Sem Saída, 33',123456789,16,6),
(24,'Sílvia Alberto','Av. EUA, 65',654321987,15,5),
(25,'Jorge Gabriel','R da Capela, 2',456123789,19,8),
(26,'Luciana Abreu','R. St. António, 13',123456789,14,3),
(27,'Bárbara Guimarães','Av do Papa, 10',654321987,14,3),
(28,'Rui Unas','T dos Perdidos, 7',789123456,13,2),
(29,'Pedro Teixeira','L. do Rossio, 31',987654321,15,5),
(30,'Carolina Carvalho','Pr. dos Defuntos, 15',123456789,17,7),
(31,'Sara Matos','R do Sol, 26',456123789,13,2),
(32,'Ana Guiomar','R do Ouro, 58',789123456,13,2)

insert into Professor(cod_prof,nome,morada,tempo_servico,idade,inicio_atividade,cod_prof_orientador)
values (1,'António Silva','Beco das Flores, 22',14,30,2015-09-15,1),
(2,'Ana Silva','Rua 1o de Maio, 8',13,43,2000-09-01,3),
(3,'Cristina Ferreira','Av. da Anil, 31',16,32,2013-09-01,null),
(4,'Diana Chaves','Praça do Pardal, 17',22,38,2005-09-01,null),
(5,'Vasco Palmeirim','Largo da Alegria, 9',17,44,1999-09-01,null),
(6,'Filomena Cautela','Travessa dos Aliados, 1',13,48,1996-09-01,4)

insert into Turma(cod_turma,ano,designacao,numero_alunos)
values (1,7,'A',25),
(2,7,'B',20),
(3,8,'C',22),
(4,8,'D',21),
(5,9,'E',20),
(6,9,'F',19),
(7,10,'G',15),
(8,10,'H',17)

insert into Ensina(cod_prof,cod_turma,disciplina)
values (1,1,'Matemática'),
(2,2,'Português'),
(6,7,'TIC'),
(1,4,'Matemática'),
(1,6,'Matemática'),
(2,3,'Português'),
(2,5,'Português'),
(3,1,'Português'),
(3,7,'Português'),
(6,8,'TIC'),
(5,1,'Inglês'),
(5,3,'Inglês'),
(5,6,'Inglês')

select nome,idade
from aluno
where cod_turma=1

select idade,tempo_servico
from Professor
where nome='Ana Silva'

/*3.3 Nao Fiz */
select cod_turma 
from ensina
where disciplina='TIC'
/*3.5 Nao Fiz*/
select *
from aluno
where cod_turma=3
/*3.7 Nao Fiz*/
select nome
from Professor
where cod_prof_orientador<>null

/*Nao Fiz da  3.9 até 3.15 */
select idade
from aluno
where idade=15,16,17



update Professor
set nome='António Silva'
where nome='António Santos Silva'


/* 
begin
delete from Professor 
where tempo_servico>5;
rollback end;

begin
update Professor 
set tempo_servico = tempo_servico+1;
rollback end;

begin 
update Professor
set idade=idade+1;
rollback end;

begin 
update aluno
set idade=idade+1;
rollback end;

Esta a dar erro */