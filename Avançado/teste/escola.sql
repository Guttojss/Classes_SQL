-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 20-Jun-2023 às 15:47
-- Versão do servidor: 5.6.13
-- versão do PHP: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `escola`
--
CREATE DATABASE IF NOT EXISTS `escola` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `escola`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE IF NOT EXISTS `aluno` (
  `numero` int(11) NOT NULL DEFAULT '0',
  `nome` varchar(50) DEFAULT NULL,
  `morada` varchar(50) DEFAULT NULL,
  `telefone` int(11) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `cod_turma` int(11) DEFAULT NULL,
  PRIMARY KEY (`numero`),
  KEY `cod_turma` (`cod_turma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`numero`, `nome`, `morada`, `telefone`, `idade`, `cod_turma`) VALUES
(1, 'João Baião', 'R Abade Priscos, 10', 123456789, 13, 1),
(2, 'Rita Pereira', 'R dos Perdidos, 5', 456123789, 15, 3),
(3, 'Catarina Gouveia', 'T do Conde, 15', 789123456, 14, 1),
(4, 'José R. dos Santos', 'Rua atras da igreja, 5', 123456789, 16, 4),
(5, 'Judite de Sousa', 'Av da Liberdade, 7', 987654321, 18, 7),
(6, 'Pedro Mourinho', 'R Horta Seca, 15', 654321987, 17, 6),
(7, 'Rodrigo G de Carvalho', 'B da Guarda, 16', 456123789, 13, 1),
(8, 'Carolina Patrocinio', 'R das Rosas, 2', 123456789, 20, 7),
(9, 'Carolina Loureiro', 'T da Oliveira,1', 789123456, 14, 2),
(10, 'Fátima Lopes', 'R Onze, 11', 654321987, 16, 5),
(11, 'Júlia Pinheiro', 'R da Sorte, 21', 123456789, 15, 4),
(12, 'Manuel L Goucha', 'R da Igreja, 12', 456123789, 19, 7),
(13, 'João Paulo Rodrigues', 'R Direita, 10', 456123789, 13, 1),
(14, 'Daniel Oliveira', 'R das Flores, 33', 789123456, 15, 4),
(15, 'Tânia Ribas Oliveira', 'R dos Descalços, 7', 789123456, 16, 6),
(16, 'César Mourão', 'R do Saco,. 4', 456123789, 18, 8),
(17, 'João Manzarra', 'R da Roda, 16', 123456789, 17, 7),
(18, 'Cláudio Ramos', 'A.da Europa, 21', 987654321, 19, 8),
(19, 'Ana Marques', 'R da Boavista, 15', 123456789, 20, 8),
(20, 'Cláudia Vieira', 'R do Nó, 5', 987654321, 15, 4),
(21, 'Catarina Furtado', 'Av. do Uruguai, 43', 456123789, 14, 2),
(22, 'Sónia Araújo', 'Tr. Sem Fim, 50', 789123456, 13, 1),
(23, 'Nuno Markl', 'B. Sem Saída, 33', 123456789, 16, 6),
(24, 'Sílvia Alberto', 'Av. EUA, 65', 654321987, 15, 5),
(25, 'Jorge Gabriel', 'R da Capela, 2', 456123789, 19, 8),
(26, 'Luciana Abreu', 'R. St. António, 13', 123456789, 14, 3),
(27, 'Bárbara Guimarães', 'Av do Papa, 10', 654321987, 14, 3),
(28, 'Rui Unas', 'T dos Perdidos, 7', 789123456, 13, 2),
(29, 'Pedro Teixeira', 'L. do Rossio, 31', 987654321, 15, 5),
(30, 'Carolina Carvalho', 'Pr. dos Defuntos, 15', 123456789, 17, 7),
(31, 'Sara Matos', 'R do Sol, 26', 456123789, 13, 2),
(32, 'Ana Guiomar', 'R do Ouro, 58', 789123456, 13, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ensina`
--

CREATE TABLE IF NOT EXISTS `ensina` (
  `disciplina` varchar(20) DEFAULT NULL,
  `cod_prof` int(11) NOT NULL DEFAULT '0',
  `cod_turma` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_prof`,`cod_turma`),
  KEY `cod_turma` (`cod_turma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `ensina`
--

INSERT INTO `ensina` (`disciplina`, `cod_prof`, `cod_turma`) VALUES
('Matemática', 1, 1),
('Matemática', 1, 4),
('Matemática', 1, 6),
('Português', 2, 2),
('Português', 2, 3),
('Português', 2, 5),
('Português', 3, 1),
('Português', 3, 7),
('Inglês', 5, 1),
('Inglês', 5, 3),
('Inglês', 5, 6),
('TIC', 6, 7),
('TIC', 6, 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE IF NOT EXISTS `professor` (
  `cod_prof` int(11) NOT NULL DEFAULT '0',
  `nome` varchar(50) DEFAULT NULL,
  `morada` varchar(50) DEFAULT NULL,
  `tempo_servico` int(11) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `inicio_atividade` date DEFAULT NULL,
  `cod_prof_orientador` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_prof`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `professor`
--

INSERT INTO `professor` (`cod_prof`, `nome`, `morada`, `tempo_servico`, `idade`, `inicio_atividade`, `cod_prof_orientador`) VALUES
(1, 'António Silva', 'Beco das Flores, 22', 14, 30, '0000-00-00', 1),
(2, 'Ana Silva', 'Rua 1o de Maio, 8', 13, 43, '0000-00-00', 3),
(3, 'Cristina Ferreira', 'Av. da Anil, 31', 16, 32, '0000-00-00', NULL),
(4, 'Diana Chaves', 'Praça do Pardal, 17', 22, 38, '0000-00-00', NULL),
(5, 'Vasco Palmeirim', 'Largo da Alegria, 9', 17, 44, '0000-00-00', NULL),
(6, 'Filomena Cautela', 'Travessa dos Aliados, 1', 13, 48, '0000-00-00', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE IF NOT EXISTS `turma` (
  `cod_turma` int(11) NOT NULL DEFAULT '0',
  `ano` int(11) DEFAULT NULL,
  `designacao` char(1) DEFAULT NULL,
  `numero_alunos` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_turma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `turma`
--

INSERT INTO `turma` (`cod_turma`, `ano`, `designacao`, `numero_alunos`) VALUES
(1, 7, 'A', 25),
(2, 7, 'B', 20),
(3, 8, 'C', 22),
(4, 8, 'D', 21),
(5, 9, 'E', 20),
(6, 9, 'F', 19),
(7, 10, 'G', 15),
(8, 10, 'H', 17);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `aluno_ibfk_1` FOREIGN KEY (`cod_turma`) REFERENCES `turma` (`cod_turma`);

--
-- Limitadores para a tabela `ensina`
--
ALTER TABLE `ensina`
  ADD CONSTRAINT `ensina_ibfk_2` FOREIGN KEY (`cod_turma`) REFERENCES `turma` (`cod_turma`),
  ADD CONSTRAINT `ensina_ibfk_1` FOREIGN KEY (`cod_prof`) REFERENCES `professor` (`cod_prof`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
