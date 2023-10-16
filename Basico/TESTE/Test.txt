CREATE DATABASE triatlo

CREATE TABLE provas (
NrProva INTEGER(11),
NomeProva VARCHAR(50) NOT NULL,
Km SMALLINT(6) NOT NULL,
PRIMARY KEY(NrProva)
)
CREATE TABLE atletas (
NrAtleta INTEGER(11),
NomeAtleta VARCHAR(50) NOT NULL,
Idade SMALLINT(6) NOT NULL,
PRIMARY KEY(NrAtleta),
)
CREATE TABLE resultados (
NrProva INTEGER(11),
NrAtleta INTEGER(11) REFERENCES atletas(NrAtleta),
Posicao SMALLINT(6) NOT NULL,
PRIMARY KEY(NrProva)
)


INSERT INTO atletas(NrAtleta,NomeAtleta,Idade)
VALUES(
(1,'John Runs Away',25),
(2,'Zé Nada na Banheira',23),
(3,'Pablo Maratón',24),
(4,'François Bicyclette',27),
)
INSERT INTO provas(NrProva,NomeProva,Km)
VALUES(
(1,'Nataçao',3),
(2,'Ciclismo',30),
(3,'Atletismo',10),
(4,'Maratona',42),
(5,'Marcha',20),
)

INSERT INTO resultados(NrProva,NrAtleta,Posicao)
VALUES(
(1,3,1),
(1,1,4),
(1,2,2),
(1,4,3),
(2,4,1),
(2,3,2),
(2,2,3),
(2,1,4),
(3,4,3),
(3,1,2),
(3,3,1),
(3,2,4),
)

ORDER atletas ASC

SELECT (NomeAtleta) FROM atletas 
WHERE NomeAtleta IS 'J'% or 'P'%

SELECT (Idade) FROM atletas 
WHERE Idade = 24 or Idade = 25

SELECT (posicao) FROM provas
WHERE provas = 1 AND NrAtleta IS 4

ALTER TABLE atletas ADD QtdAtletas
COUNT QtdAtletas

SELECT (NrProva) FROM provas
WHERE Km = >15 ORDER BY Km ASC

SELECT (NomeAtleta) FROM resultados
WHERE posicao IS MAX

SELECT (posicao) FROM resultados
WHERE NomeProva = 'Atletismo' AND posicao IS MIN

SELECT (posicao,NrAtleta) FROM resultados
WHERE provas = 'atletismo' ORDER BY posicao ASC


SELECT (idades) FROM atletas
WHERE AVG 

SELECT (Km) FROM provas
WHERE SUM  

SELECT (NomeProva) FROM provas
WHERE NomeProva = '%at%'

UPDATE atletas
SET NomeAtleta = 'Zé Nada Muito'
WHERE NrAtleta = 2


DELETE FROM provas
WHERE provas = 4 AND provas = 5

ALTER TABLE Provas MODIFY NomeProva Varchar(20)

ALTER TABLE atletas  ADD Genero varchar(1) CHECK ('M','F')

UPDATE TABLE atletas
SET Genero = 'M'
WHERE *
