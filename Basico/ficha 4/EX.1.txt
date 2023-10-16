CREATE DATABASE SobreRodas

CREATE TABLE veiculo (
cod_vei INTEGER,
marca VARCHAR(50) NOT NULL,
modelo VARCHAR(30) NOT NULL,
descricao VARCHAR(500) NOT NULL,
cor VARCHAR(15) NOT NULL,
matricula UNIQUE
PRIMARY KEY(cod_vei),
)

CREATE TABLE cliente (
cod_cli INTEGER ,
nome VARCHAR(500) NOT NULL,
morada VARCHAR(100) ,
telefone VARCHAR(9) NOT NULL,
nif INTERGER UNIQUE ,
PRIMARY KEY(cod_cli),
)

CREATE TABLE contrato (
cod_con INTEGER,
datapreco-dia NUMERIC(4,2) NOT NULL,
seguro VARCHAR(50) NOT NULL,
cod_vei INTERGER REFERENCES veiculo(cod_vei),
cod_cli INTERGER REFERENCES cliente(cod_cli),
PRIMARY KEY(cod_con),
)

CREATE TABLE manutençao (
cod_man INTEGER
data NUMERIC(12) NOT NULL,
custo NUMERIC(4,2) NOT NULL,
cod_vei INTERGER REFERENCES veiculo(cod_vei),
PRIMARY KEY(cod_man),
)