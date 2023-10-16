CREATE DATABASE biblioteca;

CREATE TABLE socio (
    idsocio INT AUTO_INCREMENT,
    nomesocio VARCHAR(50) NOT NULL,
    telefone INT NOT NULL,
    nif INT NOT NULL,
    datanasc DATE NOT NULL,
    dataregisto TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (idsocio)
);

CREATE TABLE requisicoe (
    idreq INT AUTO_INCREMENT,
    idsocio INT,
    idlivro INT,
    dataa DATE NOT NULL,
    dias INT NOT NULL CHECK (dias > 0),
    PRIMARY KEY (idreq),
    FOREIGN KEY (idsocio) REFERENCES socio(idsocio) ON DELETE RESTRICT,
    FOREIGN KEY (idlivro) REFERENCES livro(idlivro) ON DELETE RESTRICT
);

CREATE TABLE seccoe (
    idseccao INT AUTO_INCREMENT,
    descricao VARCHAR(20) NOT NULL,
    PRIMARY KEY (idseccao)
);

CREATE TABLE livro (
    idlivro INT AUTO_INCREMENT,
    titulo VARCHAR(30) NOT NULL,
    isbn VARCHAR(50) NOT NULL UNIQUE,
    idtipolivro INT,
    idseccao INT,
    fila VARCHAR(50) NOT NULL DEFAULT 'A',
    prateleira VARCHAR(50) NOT NULL,
    PRIMARY KEY (idlivro),
    FOREIGN KEY (idtipolivro) REFERENCES tiposlivro(idtipolivro) ON DELETE RESTRICT,
    FOREIGN KEY (idseccao) REFERENCES seccoe(idseccao) ON DELETE RESTRICT
);

CREATE TABLE tiposlivro (
    idtipolivro INT AUTO_INCREMENT,
    descricao VARCHAR(30) NOT NULL,
    idcor INT DEFAULT 0,
    PRIMARY KEY (idtipolivro),
    FOREIGN KEY (idcor) REFERENCES cores(idcor) ON DELETE RESTRICT
);

CREATE TABLE cores (
    idcor INT AUTO_INCREMENT,
    nomecor VARCHAR(30) NOT NULL,
    PRIMARY KEY (idcor)
);

CREATE INDEX index_nome ON socio (nomesocio);
CREATE INDEX index_titulo ON livro (titulo);
CREATE INDEX inif ON socio (nif);
CREATE INDEX idescricao ON tiposlivro (descricao);
CREATE INDEX idata ON requisicoe (dataa);

DROP INDEX idata ON requisicoe;

DROP TABLE requisicoe;

INSERT INTO seccoe (descricao) VALUES
    ('A'),
    ('B'),
    ('C'),
    ('D'),
    ('E');

INSERT INTO cores (nomecor) VALUES
    ('Branco'),
    ('Preto'),
    ('Azul'),
    ('Verde'),
    ('Vermelho'),
    ('Amarelo');

INSERT INTO tiposlivro (descricao) VALUES
    ('Romance'),
    ('Cientifico'),
    ('BD'),
    ('Escolar'),
    ('Satira');

INSERT INTO socio (nomesocio, telefone, nif, datanasc) VALUES
    ('Roberto', 275500500, 123456789, '1995-07-20'),
    ('Carla', 272005500, 234567891, '2000-03-10'),
    ('Mariana', 271444876, 345678912, '1990-10-30'),
    ('Victor', 960001110, 456789123, '2005-08-04');

INSERT INTO livro (titulo, isbn, fila, prateleira) VALUES
    ('1984', '9789726081890', 'A', '4'),
    ('Admiravel mundo novo', '978972608242