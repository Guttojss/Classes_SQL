CREATE DATABASE curriculo

CREATE TABLE professor(
cod_professor INTEGER,
nome VARCHAR(50),
salario VARCHAR(4,2),
PRIMARY KEY(cod_professor))

CREATE TABLE aluno(
cod_matricula INTEGER,
nome VARCHAR(50),
nascimento VARCHAR(50),
endereco VARCHAR(50),
PRIMARY KEY(cod_matricula))

CREATE TABLE disciplina(
cod_disciplina INTEGER,
nome VARCHAR(50),
horas_semanais VARCHAR(50),
PRIMARY KEY(cod_disciplina))

CREATE TABLE leciona(
cod_professor INTEGER REFERENCES professor(cod_professor),
cod_disciplina INTEGER REFERENCES disciplina(cod_disciplina)
PRIMARY KEY(cod_disciplina,cod_professor))

CREATE TABLE matriculado_em(
cod_matricula INTEGER REFERENCES aluno(cod_matricula),
cod_disciplina INTEGER REFERENCES disciplina(cod_disciplina),
nota VARCHAR(50),
PRIMARY KEY(cod_disciplina,cod_matricula))

SELECT nome FROM disciplina
WHERE horas_semanais=<4

SELECT * FROM professor
WHERE salario>2000,00

SELECT nome,endereco FROM aluno 
WHERE nascimento="14 de abril de 1970"

SELECT cod_matricula FROM aluno,disciplina
WHERE disciplina.nome="calculo II" AND matriculado_em.nota<="4.0"

SELECT nome, salario FROM leciona
WHERE disciplina.horas_semanais>=10 AND

SELECT nome FROM professor,disciplina
WHERE aluno.endereco="itabuna" AND matriculado_em.nota<="7.0"


SELECT * FROM aluno,matriculado_em
WHERE disciplina.nome="logica" AND MAX(matriculado_em.nota)


SELECT nome FROM professor,disciplina
WHERE COUNT(disciplina)=0

i) Qual a quantidade de professores que trabalham mais de 20 horas semanais na Instituição?
SELECT 
WHERE disciplina.horas_semanais>=20 

j) Obtenha o nome dos professores que não estejam lecionando nenhuma disciplina neste
período

SELECT nome FROM professor,disciplina
WHERE COUNT(disciplina)=0 