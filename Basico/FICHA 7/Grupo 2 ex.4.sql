CREATE DATABASE escola;

CREATE TABLE curso(
cod_curso INTEGER,
nome VARCHAR(50),
numeros_vagas VARCHAR(50),
Primary KEY(cod_curso));

CREATE TABLE instrutor(
cod_instrutor INTEGER,
nome VARCHAR(50),
apelido VARCHAR(50),
num_telemovel VARCHAR(13),
telemovel VARCHAR(13),
PRIMARY Key(cod_instrutor));

CREATE TABLE horario(
cod_hor INTEGER,
sala VARCHAR(2),
hora VARCHAR(12),
PRIMARY KEY(cod_horario));

CREATE TABLE ministrado(
dataministrado date,
cod_hor INTEGER REFERENCES horario(cod_hor),
cod_curso INTEGER REFERENCES curso(cod_curso),
cod_instrutor INTEGER REFERENCES instrutor(cod_instrutor),
PRIMARY KEY(cod_dataministrado,cod_horario));

INSERT INTO curso(cod_curso,nome,numeros_vagas)
VALUES (1,'alberto',5),
(2,'beatriz',4),
(3,'carlos',3),
(4,'diana ',2),
(5,'eduardo',1);

INSERT INTO instrutor(cod_instrutor,nome,apelido,num_telemovel,telemovel)
VALUES (1,'fernando','augusto','999999999','989898989'),
(2,'georgete','benardo','999999999','989898989'),
(3,'helio','castro','999999999','989898989'),
(4,'ivo','dias','999999999','989898989'),
(5,'jorge','elena','999999999','989898989');

INSERT INTO horario(cod_hor,sala,hora)
VALUES (1,'30','14:15'),
(2,'1','15:20'),
(3,'50','16:40'),
(4,'12','08:25'),
(5,'15','11:35');

INSERT INTO ministrado(datah,cod_hor,cod_curso,cod_instrutor)
VALUES (1,1,1,1),
(2,2,2,2),
(3,3,3,3),
(4,4,4,4),
(5,5,5,5);

UPDATE horario
SET sala=14
WHERE sala=1

SELECT nome  FROM instrutor 

SELECT * FROM horario

SELECT nome FROM curso 
ORDER BY nome DESC

SELECT * FROM instrutor

SELECT AVG('curso') AS numeros_vagas

SELECT MAX('curso') AS numeros_vagas, MIN('curso') AS numeros_vagas