CREATE DATABASE veterinario

CREATE TABLE animal(
cod_animal INTEGER,
nome VARCHAR(50),
especie VARCHAR(50),
raca VARCHAR(50),
PRIMARY KEY(cod_animal))

CREATE TABLE vacina(
cod_tipovacina INTEGER,
nome VARCHAR(50),
preco VARCHAR(50),
fornecedor VARCHAR(50),
PRIMARY KEY(cod_tipovacina))

CREATE TABLE vacinacao(
cod_tipovacina INTEGER REFERENCES vacina(cod_tipovacina),
cod_animal INTEGER REFERENCES animal(cod_animal))

SELECT cod_animal FROM animal
WHEN nome="gato" or tipo=2 AND animal.cod_animal=vacinacao.cod_tipovacina

SELECT cod_tipovacina FROM vacina 
WHEN cod_animal=20 

SELECT nome FROM vacina
WHEN cod_animal=30

d) Mostre todos os tipos de vacinas com preço maior que 20 e o código (tipo) seja menor que
10.

SELECT cod_tipovacina FROM vacina
WHEN preco >20 AND cod_tipovacina <10

e) Mostre o nome das vacinas tomadas por todos os animais.

SELECT animal.cod_animal,animal.nome,vacina.nome FROM animal,vacina
WHERE animal.cod_animal=vacinacao.cod_animal AND vacina.tipo=vacinacao.tipo
GROUP BY animal.nome

f) Mostre os dados dos animais cujo nome seja iniciado com a letra R.

SELECT * FROM animal
WHEN nome="R%"

g) Mostre quantas vacinas foram aplicadas em animais cuja raça seja labrador.

SELECT  FROM vacina
WHEN raca="labrador"

h) Mostre o nome e o preço da vacina mais barata cadastrada no banco de dados.

SELECT MIN(preco),nome FROM vacina
