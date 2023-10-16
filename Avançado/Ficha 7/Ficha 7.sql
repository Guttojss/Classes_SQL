create database empresa;

create table artigos(
codartigo varchar(5),
nomeartigo varchar(20),
modelo varchar(15),
precovenda int check (precovenda>0),
primary key (codartigo)
);

create table detalhescompras(
preco int check (preco>0),
quantidade int check (quantidade>0),
nrcompra int,
codartigo int,
primary key(nrcompra,codartigo),
foreign key (nrcompra) references compras(nrcompra), 
foreign key (codartigo) references artigos(codartigo)
);

create table detalhesvendas(
quantidade int,
codfatura int,
codartigo varchar(5),
primary key (codfatura,codartigo),
FOREIGN key (codartigo) REFERENCES artigos(codartigo), 
foreign key (codfatura) REFERENCES vendas(codfatura) 
);

create table compras(
nrcompra int AUTO_INCREMENT,
dataa date,
codfornecedore int,
primary key (nrcompra),
FOREIGN key (codfornecedore) REFERENCES fornecedores(codfornecedore)
);

create table vendas(
dataa date,
codcliente int,
codfatura int,
primary key (codfatura)
foreign key (codcliente) REFERENCES clientes(codcliente) 
);

create table clientes(
nomecliente varchar (50),
morada varchar (50),
telefone varchar(9),
codcliente int,
primary key (codcliente)
);

create table fornecedores(
codfornecedore int AUTO_INCREMENT,
nomefornecedor varchar(30),
localidade varchar(40),
telefone varchar(9),
primary key (codfornecedore)
);

create table localidades(
codlocalidade int,
nomelocalidade varchar(50),
primary key (codlocalidade)
);

insert into fornecedores(codfornecedore,nomefornecedor,localidade,telefone)
values (
(0,'artimax','Aveiro','233800000'),
(0,'ferrafino','lisboa','213300000'),
(0,'metalin','covilha','275500000'),
(0,'silva, lda','porto','215500000'),
(0,'trt, lda','totosendo','275000999')
);

insert into artigos(codartigo,nomeartigo,modelo,precovenda)
values (
('A1','Alicate','normal',3.50),
('A2','Alicate','pmtas',3.99),
('A3','Alicate','grande',5.50),
('M1','Martelo','pequeno',4.75),
('M2','Martelo','grande',7.50),
('CX','Chave','fendas',1.50)
);

insert into compras(nrcompra,dataa,codfornecedore)
values(
(1,05-01-2020,1),
(2,03-02-2020,4),
(3,13-03-2020,2),
(4,24-03-2020,3),
(5,16-04-2020,1),
(6,30-04-2020,4),
(7,02-05-2020,2),
(8,23-05-2020,3),
(9,12-11-2020,5)
);

insert into detalhescompras(nrcompra,codartigo,preco,quantidade)
values(
(1,'A1',3,20),
(1,'CZ',4.30,10),
(1,'M1',3.50,20),
(2,'CX',1.20,50),
(2,'CY',1.60,50),
(3,'A2',2.50,10),
(4,'A3',5,25,10),
(4,'CX',5,20,10),
(4,'M2',4,99,50),
(5,'CZ',4,25,10),
(5,'M1',3,50,20)
);

insert into clientes(codcliente,nomecliente,morada,telefone)
VALUES(
(1,'Aníbal R. Nova,20',275554433),
(2,'Anita R. Velha,50',914556789),
(3,'Manuel Pr. Alegre,5',272876876),
(4,'Sousa R. Clara,10',968863345),
(5,'Xavier R. Amarela,7',220346711)
);

insert into vendas(codfatura,dataa,codcliente)
values(CodFatura Data CodCliente)
(1,07-01-20,1),
(2,07-02-20,2),
(3,08-03-20,5),
(4,08-05-20,4),
(5,10-05-20,3),
(6,13-07-20,2),
(7,14-10-20,5),
(8,15-11-20,1)
);

insert into detalhesvendas(codfatura,codartigo,quantidade)
values(
(1, 'M1' ,15),
(1 ,'CZ' ,5),
(2 ,'CX' ,10),
(2 ,'T1' ,10),
(3 ,'A1' ,5),
(3 ,'M1' ,10),
(3 ,'M2' ,10),
(4 ,'CZ' ,5),
(5 ,'CX' ,10),
(5 ,'CY' ,10),
(6 ,'MU' ,10),
(6 ,'CX' ,10),
(7 ,'M2' ,5),
(8 ,'A2' ,5),
(8 ,'M1', 10)
);

insert into localidade(codlocalidade,nomelocalidade)
values (
(1,'Aveiro'),
(2,'Lisboa'),
(3,'Porto'),
(4,'Covilha'),
(5,'Boidobra'),
(6,'Ourondo'),
(7,'Ferro'),
(8,'Tortosendo'),
);

alter table fornecedores change codlocalidade varchar(30);
alter table fornecedores add foreign key(codlocalidade) references localidades(codlocalidade);

alter table clientes add codlocalidade;
alter table clientes add foreign key(codlocalidade) references localidades(codlocalidade);

insert into clientes(codcliente,nomecliente,morada,localidade,telefone)
values(
(1,'Anibal','R. Nova, 20',5,'275554433'),
(2,'Anita','R. Velha, 50',4,'914556789'),
(3,'Manuel','Pr. Alegre, 5',8,''),
(4,'Sousa','R. Clara, 10',6,'968863345'),
(5,'Xavier','R. Amarela, 7',7,'220346711')
);


































































































