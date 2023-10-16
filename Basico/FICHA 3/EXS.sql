CREATE DATABASE clinica


CREATE TABLE medico 
(
nome VARCHAR(50) NOT NULL,
idade INTEGER NOT NULL CHECK(idade >= 24 AND idade <= 90 ),
cod_med INTEGER UNIQUE NOT NULL,
)

CREATE TABLE paciente 
(
nome VARCHAR(100) NOT NULL,
idade INTEGER NOT NULL CHECK(idade >= 0 AND idade <= 120 ),
telefone NUMERIC(9) NOT NULL
cod_pac INTEGER UNIQUE NOT NULL,
cc NUMERIC(9) NOT NULL UNIQUE,
morada VARCHAR(100) ,
)

ALTER TABLE paciente ADD peso NUMERIC(3,2) NOT NULL
ALTER TABLE paciente ADD sexo CHAR NOT NULL CHECK(SEXO IN('M','F'))
ALTER TABLE paciente MODIFY nome VARCHAR(50) NOT NULL

ALTER TABLE medico ADD sexo CHAR NOT NULL CHECK(SEXO IN('M','F'))
ALTER TABLE medico ADD telefone NUMERIC(9) NOT NULL

ALTER TABLE paciente DROP COLUMN morada 


DROP TABLE medico
DROP TABLE paciente
DROP DATABASE