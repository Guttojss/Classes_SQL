CREATE DATABASE biblioteca;

CREATE TABLE socio (
idsocio int auto_increment,
nomesocio varchar(50) not null ,
telefone int not null,
nif int not null,
datanasc date not null,
dataregisto timestamp not null,    
PRIMARY KEY (idsocio)
);


CREATE TABLE requisicoe (
idreq int auto_increment,    
idsocio int references socio(idsocio) on delete restrict,
idlivro int references livro(idlivro) on delete restrict,
dataa date not null,
dias int not null check(dias>0),
PRIMARY KEY (idreq)
);


CREATE TABLE seccoe (
idseccao int auto_increment,    
descricao varchar(20) not null,
PRIMARY KEY (idseccao)
);

CREATE TABLE livro (
idlivro int AUTO_INCREMENT,    
titulo varchar(30) not null,
isbn varchar(50) not null unique,
idtipolivro int references tipolivro(idtipolivro) on delete restrict,
idseccao int references seccoe(idseccao) on delete restrict,
fila varchar(50) not null default 'A',
prateleira varchar(50) not null,
PRIMARY KEY (idlivro)
);

CREATE TABLE tiposlivro (
idtipolivro int auto_increment,    
descricao varchar(30) not null,
idcor int default 0,
PRIMARY KEY (idtipolivro),
FOREIGN key (idcor) references core(idcor) on delete restrict 
);
CREATE TABLE cores (
idcor int auto_increment,
nomecor varchar(30) not null,    
PRIMARY KEY (idcor)
);

create index index_nome
on socios (nomesocio);

create index index_titulo
on livro (titulo)