CREATE DATABASE empresa

CREATE TABLE gerente(
cod_gerente INTEGER,
nome VARCHAR(50),
num_Depto VARCHAR(50),
PRIMARY KEY(cod_gerente))

CREATE TABLE empregado(
cod_empregado INTEGER,
nome VARCHAR(50),
endereco VARCHAR(50),
telefone VARCHAR(50),
data_admissao VARCHAR(50),
num_Depto VARCHAR(50),
salario VARCHAR(50),
PRIMARY KEY(cod_empregado))

CREATE TABLE projeto(
cod_projeto INTEGER,
nome VARCHAR(50),
decricao VARCHAR(50),
num_Depto VARCHAR(50),
PRIMARY KEY(cod_projeto))

CREATE TABLE departamento(
cod_departamento INTEGER,
nome VARCHAR(50),
localizacao VARCHAR(50),
PRIMARY KEY(cod_departamento))

CREATE TABLE trabalho_em(
cod_empregado INTEGER REFERENCES empregado(cod_empregado),
cod_projeto INTEGER REFERENCES projeto(cod_projeto),
total_horas_semanais VARCHAR(50),
PRIMARY KEY(cod_empregado,cod_projeto))

SELECT nome, localizacao FROM departamento

SELECT * FROM empregado
WHERE salario=>1000

SELECT total_horas_semanais FROM trabalho_em
WHERE cod_empregado=E323 AND cod_projeto=P55

SELECT nome, descricao FROM projeto,departamento
WHERE departamento.localizacao="markting"

SELECT nome FROM gerente
WHERE projeto=P07 

SELECT cod_empregado FROM trabalho_em, departamento
WHERE departamento.localizacao="processamento_de_dados"

SELECT nome, salario FROM empregado, trabalho_em
WHERE total_horas_semanais>13 and departamento.localizacao="centro"

SELECT total_horas_semanais FROM projeto, departamento
WHERE departamento=D01 AND projeto=P07