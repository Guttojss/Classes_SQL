create database Imobiliaria;

create table Agente (
nome varchar(50),
morada varchar(30),
telefone varchar(9),
email varchar(50),
agente_id int,
PRIMARY KEY (agente_id)
);

create table Proprietario(
nome varchar(50),
Morada varchar(30),
telefone varchar(9),
email varchar(50),
proprietario_id int,
PRIMARY KEY (proprietario_id)
);

create table cliente (
nome varchar(50),
Morada varchar(30),
telefone varchar(9),
email varchar(50),
cliente_id int,
PRIMARY KEY (cliente_id)
);

create table imovel(
descricao varchar(100),
valor int,
morada varchar(30),
situacao varchar(10),
zona varchar(15),
imovel_id int,
PRIMARY KEY(imovel_id)
);

create table contrato(
contrato_id int,
agente_id int,
proprietario_id int,
cliente_id int,
imovel_id int,
tipo varchar(15),
data_inicio date,
periodo varchar(20),
Primary key (contrato_id),
foreign key(agente_id) REFERENCES agente(agente_id) on delete restrict,
foreign key(proprietario_id) REFERENCES proprietario(proprietario_id) on delete restrict,
foreign key(cliente_id) REFERENCES cliente(cliente_id) on delete restrict,
foreign key(imovel_id) REFERENCES imovel(imovel_id) on delete restrict
);

/*Muda todos os registos de telefone para int(9)*/
alter table agente modify telefone int(9);
alter table proprietario modify telefone int(9);
alter table cliente modify telefone int(9);

/*Muda todos os nomes de Telefone para Telemovel*/
alter table agente change telefone telemovel int(9);
alter table proprietario change telefone telemovel int(9);
alter table cliente change telefone telemovel int(9);

/*Elemina de forma temporaria todos os campos "morada"*/
begin;
alter table agente drop morada;
alter table proprietario drop morada;
alter table cliente drop morada;
rollback end;

/*Adiciona á table agente o seu salario
e á table cliente o seu orçamento */
alter table agente add salario int;
alter table cliente add orcamento int;

/*Mude o nome da coluna salario para ordenado*/
alter table agente change salario ordenado int;

insert into proprietario(proprietario_id,nome,morada,telefone,email)
values
(1,'Roberto H.','Praça da tristeza',123456789,'Roberto.Helder@gmail.com'),
(2,'Irineu V.','Rua dos Doces',234567891,'Irineu-Velez@hotmail.com'),
(3,'Rodrigo A.','Rua das Festas',345678912,'Digo.Amador@gmail.com'),
(4,'Rui T.','Rua das festas',456789123,'Ruiii.Tectec@gmail.com'),
(5,'Goncalo G.','Rua da Alegria',567891234,'Grao.Gonçalo@hotmail.com'),
(6,'Maria R.','Rua da Musica',678912345,'Roberta.mariia@gmail.com'),
(7,'Ana G.','Rua da Criatividade',789123456,'Gonçales.Anna31@gmail.com'),
(8,'Leonor S.','Rua da Imaginacao',891234567,'Sofia312.Leonor@hotmail.com'),
(9,'Carolina A.','Rua dos Deuses',912345678,'Abrantes-Sofia18@gmail.com'),
(10,'Rosa M.','Rua dos ricos',136661321,'Maria.Rosa98@hotmail.com');

insert into cliente(cliente_id,nome,morada,telefone,email)
values (
(1,'Almeida','Rua dos solteiros',541987236,'Almeidinha@gmail.com'),
(2,'Gutto','Rua da riqueza',147258369,'GuttojssTFG@hotmail.com'),
(3,'Bernardo','Praça do comercio',986753421,'Bernas.rico@gmail.com'),
(4,'Maria','Rua de D. Gutto',145236789,'Mariii20@gmail.com'),
(5,'Destroyer','Rua da destruiçao',753198426,'World.Destroyer@hotmail.com'),
(6,'Rosete','Rua das Rosas',778899445,'Rosete.Rosa@gmail.com'),
(7,'Ânia','Rua da Beleza',566112233,'Miss.Ânia@gmail.com'),
(8,'Tristezete','Rua da Tristeza',145214521,'Triste34@hotmail.com'),
(9,'Karol','Rua dos Deuses',789789789,'Karol.fofoqueira@gmail.com'),
(10,'André','Praça da solidao',745745745,'André.Aventureiro@hotmail.com'));

insert into agente(agente_id,nome,morada,telefone,email)
values (
(1,'Young','Rua da Velhice',159159159,'Sr.Young@gmail.com')
(2,'Huy','Rua dos Iphones',753753753,'Rui.com.H@hotmail.com')
(3,'Claudio','Praça da liberdade',126126126,'Claudioo23@gmail.com')
(4,'Mariana','Rua de D. Gutto',757485236,'Mariiiana24@gmail.com')
(5,'World','Rua do Demonio',123549417,'World.Creater@hotmail.com')
(6,'Julia','Rua das Rosas',254357567,'Juliaaa.56@gmail.com')
(7,'Catarina','Rua da Beleza',326514562,'Catarina.juliana@gmail.com')
(8,'Alegrete','Praça da Alegria',684321234,'Alegria90@hotmail.com')
(9,'Josefina','Rua de S. Bento',145325587,'josefinna39@gmail.com')
(10,'Jose','Praça da solidao',134523578,'José.explorador@hotmail.com')
);


insert into imovel(imovel_id,descricao,morada,valor,situacao,zona)
values (
(1,'Apartamento T4','Rua da Velhice',5200,'aluguel','Velha'),
(2,'T8,3 Suites , Preta','Rua Dos Deuses',70000,'aluguel','Motilogica'),
(3,'Apartamento , T3','Praça da liberdade',4500,'aluguel','Covilha'),
(4,'Vivenda 2 andares T4','Rua de D. Gutto',8000,'aluguel','Riqueza'),
(5,'T3 , com uma sala grande','Rua do Demonio',1000,'aluguel','Motilogica'),
(6,'T2 3º Andar','Rua das Rosas',3500,'aluguel','Flores'),
(7,'T1 com 2 andres','Rua da Beleza',4058,'aluguel',,'Adjetivos'),
(8,'Open Space','Praça da Alegria',5516,'aluguel','Sentimentos'),
(9,'T2 1º andar','Rua de S. Bento',1257,'aluguel','Mitologica'),
(10,'T3 , apartamento 2º andar','Rua de D. Gutto',8525,'aluguel','Sentimentos')
);

insert into contrato(contrato_id,tipo,data_inicio,periodo,imovel_id,cliente_id,agente_id,proprietario_id)
values(
(1,'aluguel','22-10-2020','mensal',1,1,1,1)
(2,'aluguel','11-10-2007','semanal',2,2,2,2)
(3,'aluguel','11-9-2001','anual',3,3,3,3)
(4,'aluguel','11-6-2006','mensal',4,4,4,4)
(5,'aluguel','27-10-2006','mensal',5,5,5,5)
(6,'aluguel','2023-21-6','mensal',6,6,6,6)
(7,'aluguel','2022-25-11','mensal',7,7,7,7)
(8,'aluguel','2000-29-2','mensal',8,8,8,8)
(9,'aluguel','2015-21-4','mensal',9,9,9,9)
(10,'aluguel','2019-16-9','mensal',10,10,10)
);

/*Mostra todos os contratos */
select * 
from contrato;
/*Mostra os dados do cliente chamado Gutto*/
select *
from cliente
where nome='Gutto'
/*Mostra todos os clientes ordenados pela ordem alfabetica*/
select nome order by asc
from cliente
/*Mostra */
/*Mostra */
/*Mostra */
/*Mostra */
/*Mostra */
/*Mostra */
/*Mostra */