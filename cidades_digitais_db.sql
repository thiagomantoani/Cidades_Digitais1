-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 09-Out-2019 às 19:46
-- Versão do servidor: 5.7.26
-- versão do PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cidades_digitais_db`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `assunto`
--

DROP TABLE IF EXISTS `assunto`;
CREATE TABLE IF NOT EXISTS `assunto` (
  `cod_assunto` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_assunto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `assunto`
--

INSERT INTO `assunto` (`cod_assunto`, `descricao`) VALUES
(2, 'TESTE TESTE TESTE'),
(3, 'descricao teste');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `cod_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cd`
--

DROP TABLE IF EXISTS `cd`;
CREATE TABLE IF NOT EXISTS `cd` (
  `cod_ibge` int(7) NOT NULL,
  `cod_lote` int(11) NOT NULL,
  `os_pe` varchar(10) DEFAULT NULL,
  `data_pe` date DEFAULT NULL,
  `os_imp` varchar(10) DEFAULT NULL,
  `data_imp` date DEFAULT NULL,
  PRIMARY KEY (`cod_ibge`),
  KEY `fk_cd_lote1_idx` (`cod_lote`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cd`
--

INSERT INTO `cd` (`cod_ibge`, `cod_lote`, `os_pe`, `data_pe`, `os_imp`, `data_imp`) VALUES
(1100023, 1, '12', '2019-10-01', '23', '2019-10-07'),
(1100031, 1, '12', '2019-10-15', 'er', '2019-10-31'),
(1507805, 1, '1472956238', '2019-10-02', '1472956238', '2019-10-03');

--
-- Acionadores `cd`
--
DROP TRIGGER IF EXISTS `insere_cd_itens`;
DELIMITER $$
CREATE TRIGGER `insere_cd_itens` AFTER INSERT ON `cd` FOR EACH ROW BEGIN 
insert into cd_itens (cod_ibge, cod_item, cod_tipo_item) (select cd.cod_ibge, itens.cod_item, itens.cod_tipo_item from cd, itens
where cd.cod_ibge = (select last_insert_id(new.cod_ibge)));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cd_itens`
--

DROP TABLE IF EXISTS `cd_itens`;
CREATE TABLE IF NOT EXISTS `cd_itens` (
  `cod_ibge` int(7) NOT NULL,
  `cod_item` int(11) NOT NULL,
  `cod_tipo_item` int(11) NOT NULL,
  `quantidade_previsto` int(11) DEFAULT NULL,
  `quantidade_projeto_executivo` int(11) DEFAULT NULL,
  `quantidade_termo_instalacao` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_ibge`,`cod_item`,`cod_tipo_item`),
  KEY `fk_itens_has_cd_cd1_idx` (`cod_ibge`),
  KEY `fk_cd_itens_itens2_idx` (`cod_item`,`cod_tipo_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cd_itens`
--

INSERT INTO `cd_itens` (`cod_ibge`, `cod_item`, `cod_tipo_item`, `quantidade_previsto`, `quantidade_projeto_executivo`, `quantidade_termo_instalacao`) VALUES
(1100023, 1, 1, NULL, NULL, NULL),
(1100023, 1, 2, NULL, NULL, NULL),
(1100023, 1, 3, NULL, NULL, NULL),
(1100023, 1, 4, NULL, NULL, NULL),
(1100023, 1, 5, NULL, NULL, NULL),
(1100023, 1, 6, NULL, NULL, NULL),
(1100023, 1, 7, NULL, NULL, NULL),
(1100023, 1, 8, NULL, NULL, NULL),
(1100023, 1, 9, NULL, NULL, NULL),
(1100023, 1, 10, NULL, NULL, NULL),
(1100023, 1, 11, NULL, NULL, NULL),
(1100023, 1, 12, NULL, NULL, NULL),
(1100023, 1, 13, NULL, NULL, NULL),
(1100023, 2, 1, NULL, NULL, NULL),
(1100023, 2, 2, NULL, NULL, NULL),
(1100023, 2, 3, NULL, NULL, NULL),
(1100023, 2, 4, NULL, NULL, NULL),
(1100023, 2, 5, NULL, NULL, NULL),
(1100023, 2, 6, NULL, NULL, NULL),
(1100023, 2, 7, NULL, NULL, NULL),
(1100023, 2, 8, NULL, NULL, NULL),
(1100023, 2, 9, NULL, NULL, NULL),
(1100023, 2, 10, NULL, NULL, NULL),
(1100023, 2, 11, NULL, NULL, NULL),
(1100023, 3, 1, NULL, NULL, NULL),
(1100023, 3, 2, NULL, NULL, NULL),
(1100023, 3, 3, NULL, NULL, NULL),
(1100023, 3, 4, NULL, NULL, NULL),
(1100023, 3, 5, NULL, NULL, NULL),
(1100023, 3, 8, NULL, NULL, NULL),
(1100023, 3, 9, NULL, NULL, NULL),
(1100023, 3, 10, NULL, NULL, NULL),
(1100023, 4, 1, NULL, NULL, NULL),
(1100023, 4, 2, NULL, NULL, NULL),
(1100023, 4, 3, NULL, NULL, NULL),
(1100023, 4, 4, NULL, NULL, NULL),
(1100023, 4, 5, NULL, NULL, NULL),
(1100023, 4, 8, NULL, NULL, NULL),
(1100023, 4, 9, NULL, NULL, NULL),
(1100023, 4, 10, NULL, NULL, NULL),
(1100023, 5, 1, NULL, NULL, NULL),
(1100023, 5, 2, NULL, NULL, NULL),
(1100023, 5, 3, NULL, NULL, NULL),
(1100023, 5, 4, NULL, NULL, NULL),
(1100023, 5, 5, NULL, NULL, NULL),
(1100023, 5, 8, NULL, NULL, NULL),
(1100023, 5, 9, NULL, NULL, NULL),
(1100023, 5, 10, NULL, NULL, NULL),
(1100023, 6, 1, NULL, NULL, NULL),
(1100023, 6, 2, NULL, NULL, NULL),
(1100023, 6, 3, NULL, NULL, NULL),
(1100023, 6, 4, NULL, NULL, NULL),
(1100023, 6, 5, NULL, NULL, NULL),
(1100023, 7, 1, NULL, NULL, NULL),
(1100023, 7, 2, NULL, NULL, NULL),
(1100023, 7, 3, NULL, NULL, NULL),
(1100023, 7, 4, NULL, NULL, NULL),
(1100023, 7, 5, NULL, NULL, NULL),
(1100023, 8, 1, NULL, NULL, NULL),
(1100023, 8, 3, NULL, NULL, NULL),
(1100023, 9, 1, NULL, NULL, NULL),
(1100023, 9, 3, NULL, NULL, NULL),
(1100023, 10, 1, NULL, NULL, NULL),
(1100023, 10, 3, NULL, NULL, NULL),
(1100023, 11, 1, NULL, NULL, NULL),
(1100023, 11, 3, NULL, NULL, NULL),
(1100023, 12, 1, NULL, NULL, NULL),
(1100023, 12, 3, NULL, NULL, NULL),
(1100023, 13, 1, NULL, NULL, NULL),
(1100023, 13, 3, NULL, NULL, NULL),
(1100023, 14, 1, NULL, NULL, NULL),
(1100023, 15, 1, NULL, NULL, NULL),
(1100023, 16, 1, NULL, NULL, NULL),
(1100023, 17, 1, NULL, NULL, NULL),
(1100031, 1, 1, NULL, NULL, NULL),
(1100031, 1, 2, NULL, NULL, NULL),
(1100031, 1, 3, NULL, NULL, NULL),
(1100031, 1, 4, NULL, NULL, NULL),
(1100031, 1, 5, NULL, NULL, NULL),
(1100031, 1, 6, NULL, NULL, NULL),
(1100031, 1, 7, NULL, NULL, NULL),
(1100031, 1, 8, NULL, NULL, NULL),
(1100031, 1, 9, NULL, NULL, NULL),
(1100031, 1, 10, NULL, NULL, NULL),
(1100031, 1, 11, NULL, NULL, NULL),
(1100031, 1, 12, NULL, NULL, NULL),
(1100031, 1, 13, NULL, NULL, NULL),
(1100031, 2, 1, NULL, NULL, NULL),
(1100031, 2, 2, NULL, NULL, NULL),
(1100031, 2, 3, NULL, NULL, NULL),
(1100031, 2, 4, NULL, NULL, NULL),
(1100031, 2, 5, NULL, NULL, NULL),
(1100031, 2, 6, NULL, NULL, NULL),
(1100031, 2, 7, NULL, NULL, NULL),
(1100031, 2, 8, NULL, NULL, NULL),
(1100031, 2, 9, NULL, NULL, NULL),
(1100031, 2, 10, NULL, NULL, NULL),
(1100031, 2, 11, NULL, NULL, NULL),
(1100031, 3, 1, NULL, NULL, NULL),
(1100031, 3, 2, NULL, NULL, NULL),
(1100031, 3, 3, NULL, NULL, NULL),
(1100031, 3, 4, NULL, NULL, NULL),
(1100031, 3, 5, NULL, NULL, NULL),
(1100031, 3, 8, NULL, NULL, NULL),
(1100031, 3, 9, NULL, NULL, NULL),
(1100031, 3, 10, NULL, NULL, NULL),
(1100031, 4, 1, NULL, NULL, NULL),
(1100031, 4, 2, NULL, NULL, NULL),
(1100031, 4, 3, NULL, NULL, NULL),
(1100031, 4, 4, NULL, NULL, NULL),
(1100031, 4, 5, NULL, NULL, NULL),
(1100031, 4, 8, NULL, NULL, NULL),
(1100031, 4, 9, NULL, NULL, NULL),
(1100031, 4, 10, NULL, NULL, NULL),
(1100031, 5, 1, NULL, NULL, NULL),
(1100031, 5, 2, NULL, NULL, NULL),
(1100031, 5, 3, NULL, NULL, NULL),
(1100031, 5, 4, NULL, NULL, NULL),
(1100031, 5, 5, NULL, NULL, NULL),
(1100031, 5, 8, NULL, NULL, NULL),
(1100031, 5, 9, NULL, NULL, NULL),
(1100031, 5, 10, NULL, NULL, NULL),
(1100031, 6, 1, NULL, NULL, NULL),
(1100031, 6, 2, NULL, NULL, NULL),
(1100031, 6, 3, NULL, NULL, NULL),
(1100031, 6, 4, NULL, NULL, NULL),
(1100031, 6, 5, NULL, NULL, NULL),
(1100031, 7, 1, NULL, NULL, NULL),
(1100031, 7, 2, NULL, NULL, NULL),
(1100031, 7, 3, NULL, NULL, NULL),
(1100031, 7, 4, NULL, NULL, NULL),
(1100031, 7, 5, NULL, NULL, NULL),
(1100031, 8, 1, NULL, NULL, NULL),
(1100031, 8, 3, NULL, NULL, NULL),
(1100031, 9, 1, NULL, NULL, NULL),
(1100031, 9, 3, NULL, NULL, NULL),
(1100031, 10, 1, NULL, NULL, NULL),
(1100031, 10, 3, NULL, NULL, NULL),
(1100031, 11, 1, NULL, NULL, NULL),
(1100031, 11, 3, NULL, NULL, NULL),
(1100031, 12, 1, NULL, NULL, NULL),
(1100031, 12, 3, NULL, NULL, NULL),
(1100031, 13, 1, NULL, NULL, NULL),
(1100031, 13, 3, NULL, NULL, NULL),
(1100031, 14, 1, NULL, NULL, NULL),
(1100031, 15, 1, NULL, NULL, NULL),
(1100031, 16, 1, NULL, NULL, NULL),
(1100031, 17, 1, NULL, NULL, NULL),
(1507805, 1, 1, NULL, NULL, NULL),
(1507805, 1, 2, NULL, NULL, NULL),
(1507805, 1, 3, NULL, NULL, NULL),
(1507805, 1, 4, NULL, NULL, NULL),
(1507805, 1, 5, NULL, NULL, NULL),
(1507805, 1, 6, NULL, NULL, NULL),
(1507805, 1, 7, NULL, NULL, NULL),
(1507805, 1, 8, NULL, NULL, NULL),
(1507805, 1, 9, NULL, NULL, NULL),
(1507805, 1, 10, NULL, NULL, NULL),
(1507805, 1, 11, NULL, NULL, NULL),
(1507805, 1, 12, NULL, NULL, NULL),
(1507805, 1, 13, NULL, NULL, NULL),
(1507805, 2, 1, NULL, NULL, NULL),
(1507805, 2, 2, NULL, NULL, NULL),
(1507805, 2, 3, NULL, NULL, NULL),
(1507805, 2, 4, NULL, NULL, NULL),
(1507805, 2, 5, NULL, NULL, NULL),
(1507805, 2, 6, NULL, NULL, NULL),
(1507805, 2, 7, NULL, NULL, NULL),
(1507805, 2, 8, NULL, NULL, NULL),
(1507805, 2, 9, NULL, NULL, NULL),
(1507805, 2, 10, NULL, NULL, NULL),
(1507805, 2, 11, NULL, NULL, NULL),
(1507805, 3, 1, NULL, NULL, NULL),
(1507805, 3, 2, NULL, NULL, NULL),
(1507805, 3, 3, NULL, NULL, NULL),
(1507805, 3, 4, NULL, NULL, NULL),
(1507805, 3, 5, NULL, NULL, NULL),
(1507805, 3, 8, NULL, NULL, NULL),
(1507805, 3, 9, NULL, NULL, NULL),
(1507805, 3, 10, NULL, NULL, NULL),
(1507805, 4, 1, NULL, NULL, NULL),
(1507805, 4, 2, NULL, NULL, NULL),
(1507805, 4, 3, NULL, NULL, NULL),
(1507805, 4, 4, NULL, NULL, NULL),
(1507805, 4, 5, NULL, NULL, NULL),
(1507805, 4, 8, NULL, NULL, NULL),
(1507805, 4, 9, NULL, NULL, NULL),
(1507805, 4, 10, NULL, NULL, NULL),
(1507805, 5, 1, NULL, NULL, NULL),
(1507805, 5, 2, NULL, NULL, NULL),
(1507805, 5, 3, NULL, NULL, NULL),
(1507805, 5, 4, NULL, NULL, NULL),
(1507805, 5, 5, NULL, NULL, NULL),
(1507805, 5, 8, NULL, NULL, NULL),
(1507805, 5, 9, NULL, NULL, NULL),
(1507805, 5, 10, NULL, NULL, NULL),
(1507805, 6, 1, NULL, NULL, NULL),
(1507805, 6, 2, NULL, NULL, NULL),
(1507805, 6, 3, NULL, NULL, NULL),
(1507805, 6, 4, NULL, NULL, NULL),
(1507805, 6, 5, NULL, NULL, NULL),
(1507805, 7, 1, NULL, NULL, NULL),
(1507805, 7, 2, NULL, NULL, NULL),
(1507805, 7, 3, NULL, NULL, NULL),
(1507805, 7, 4, NULL, NULL, NULL),
(1507805, 7, 5, NULL, NULL, NULL),
(1507805, 8, 1, NULL, NULL, NULL),
(1507805, 8, 3, NULL, NULL, NULL),
(1507805, 9, 1, NULL, NULL, NULL),
(1507805, 9, 3, NULL, NULL, NULL),
(1507805, 10, 1, NULL, NULL, NULL),
(1507805, 10, 3, NULL, NULL, NULL),
(1507805, 11, 1, NULL, NULL, NULL),
(1507805, 11, 3, NULL, NULL, NULL),
(1507805, 12, 1, NULL, NULL, NULL),
(1507805, 12, 3, NULL, NULL, NULL),
(1507805, 13, 1, NULL, NULL, NULL),
(1507805, 13, 3, NULL, NULL, NULL),
(1507805, 14, 1, NULL, NULL, NULL),
(1507805, 15, 1, NULL, NULL, NULL),
(1507805, 16, 1, NULL, NULL, NULL),
(1507805, 17, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `classe_empenho`
--

DROP TABLE IF EXISTS `classe_empenho`;
CREATE TABLE IF NOT EXISTS `classe_empenho` (
  `cod_classe_empenho` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cod_classe_empenho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `classe_empenho`
--

INSERT INTO `classe_empenho` (`cod_classe_empenho`, `descricao`) VALUES
(6, 'APARELHOS E EQUIPAMENTOS DE COMUNICAÇAO'),
(16, 'MANUTENÇÃO E CONSERVAÇÃO DE BENS'),
(17, 'MANUTENÇÃO E CONSERVAÇÃO DE MÁQUINAS'),
(27, 'SUPORTE DE INFRAESTRUTURA DE TI'),
(30, 'MAQUINAS E EQUIPAMENTOS ENERGETICOS'),
(35, 'EQUIPAMENTOS DE PROCESSAMENTO DE DADOS'),
(48, 'SERVIÇOS DE SELEÇÃO E TREINAMENTO'),
(57, 'SERVIÇOS TECNICOS PROFISSIONAIS'),
(58, 'SERVIÇOS TÉCNICOS PROFISSIONAIS'),
(59, 'SERVIÇOS TÉCNICOS PROFISSIONAIS'),
(87, 'MATERIAL DE CONSUMO DE USO DURÁVEL'),
(91, 'OBRAS EM ANDAMENTO'),
(92, 'OBRAS EM ANDAMENTO'),
(93, 'AQUISIÇÃO DE SOFTWARE'),
(95, 'MANUT. CONS. EQUIP. DE PROCESSAMENTO DE DADOS');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contato`
--

DROP TABLE IF EXISTS `contato`;
CREATE TABLE IF NOT EXISTS `contato` (
  `cod_contato` int(11) NOT NULL AUTO_INCREMENT,
  `cnpj` varchar(14) DEFAULT NULL,
  `cod_ibge` int(7) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `funcao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_contato`),
  KEY `fk_contato_entidade1_idx` (`cnpj`),
  KEY `fk_contato_cd1_idx` (`cod_ibge`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `contato`
--

INSERT INTO `contato` (`cod_contato`, `cnpj`, `cod_ibge`, `nome`, `email`, `funcao`) VALUES
(1, '3432525', 1100023, 'joaozinho', 'joaozinho@gmail.com', 'estagiario'),
(2, '3432525', 1507805, 'teste', 'teste@gmail.com', 'testar'),
(5, '3432525', NULL, 'carol', 'carol@gmail.com', 'estagio'),
(8, NULL, 1507805, 'joazinho', 'joaozinho@gmail.com', 'Servidor');

-- --------------------------------------------------------

--
-- Estrutura da tabela `empenho`
--

DROP TABLE IF EXISTS `empenho`;
CREATE TABLE IF NOT EXISTS `empenho` (
  `cod_empenho` varchar(13) NOT NULL,
  `cod_previsao_empenho` int(11) NOT NULL,
  `data` datetime DEFAULT NULL,
  `contador` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_empenho`),
  KEY `fk_empenho_previsao_empenho1_idx` (`cod_previsao_empenho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `entidade`
--

DROP TABLE IF EXISTS `entidade`;
CREATE TABLE IF NOT EXISTS `entidade` (
  `cnpj` char(14) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `nome_municipio` varchar(50) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `observacao` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `entidade`
--

INSERT INTO `entidade` (`cnpj`, `nome`, `endereco`, `numero`, `bairro`, `cep`, `nome_municipio`, `uf`, `observacao`) VALUES
('3432525', 'Carol', 'QNN 21', '12', 'Explanada', '47212524', 'Brasilia', 'Df', 'Nenhuma'),
('41475453', 'Thiago Mantoani', 'Quadra QNE 12', '6', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `etapa`
--

DROP TABLE IF EXISTS `etapa`;
CREATE TABLE IF NOT EXISTS `etapa` (
  `cod_etapa` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  `duracao` int(11) DEFAULT NULL,
  `depende` int(11) DEFAULT NULL,
  `delay` int(11) DEFAULT NULL,
  `setor_resp` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_etapa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `etapa`
--

INSERT INTO `etapa` (`cod_etapa`, `descricao`, `duracao`, `depende`, `delay`, `setor_resp`) VALUES
(1, 'descricao teste', 2, 2, 2, 'Carol');

-- --------------------------------------------------------

--
-- Estrutura da tabela `etapas_cd`
--

DROP TABLE IF EXISTS `etapas_cd`;
CREATE TABLE IF NOT EXISTS `etapas_cd` (
  `cod_ibge` int(7) NOT NULL,
  `cod_etapa` int(11) NOT NULL,
  `dt_inicio` datetime DEFAULT NULL,
  `dt_fim` datetime DEFAULT NULL,
  `responsavel` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_ibge`,`cod_etapa`),
  KEY `fk_etapas_cd_etapa1_idx` (`cod_etapa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fatura`
--

DROP TABLE IF EXISTS `fatura`;
CREATE TABLE IF NOT EXISTS `fatura` (
  `num_nf` int(11) NOT NULL,
  `cod_ibge` int(7) NOT NULL,
  `dt_nf` date DEFAULT NULL,
  PRIMARY KEY (`num_nf`,`cod_ibge`),
  KEY `fk_Fatura_cd1_idx` (`cod_ibge`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fatura_otb`
--

DROP TABLE IF EXISTS `fatura_otb`;
CREATE TABLE IF NOT EXISTS `fatura_otb` (
  `cod_otb` int(11) NOT NULL,
  `num_nf` int(11) NOT NULL,
  `cod_ibge` int(7) NOT NULL,
  PRIMARY KEY (`cod_otb`,`num_nf`,`cod_ibge`),
  KEY `fk_Fatura_has_otb_otb1_idx` (`cod_otb`),
  KEY `fk_fatura_otb_fatura1_idx` (`num_nf`,`cod_ibge`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens`
--

DROP TABLE IF EXISTS `itens`;
CREATE TABLE IF NOT EXISTS `itens` (
  `cod_item` int(11) NOT NULL,
  `cod_tipo_item` int(11) NOT NULL,
  `cod_natureza_despesa` int(11) NOT NULL,
  `cod_classe_empenho` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `unidade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_item`,`cod_tipo_item`),
  KEY `fk_itens_classificacao_itens1_idx` (`cod_natureza_despesa`),
  KEY `fk_itens_subitem1_idx` (`cod_classe_empenho`),
  KEY `fk_itens_tipo_item1_idx` (`cod_tipo_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `itens`
--

INSERT INTO `itens` (`cod_item`, `cod_tipo_item`, `cod_natureza_despesa`, `cod_classe_empenho`, `descricao`, `unidade`) VALUES
(1, 1, 449052, 35, '	Bastidor 19” com 42U de altura 	 ', '	unidade	 '),
(1, 2, 449052, 35, '	Switch Metro L 2 com SFP	 ', '	Unidade	 '),
(1, 3, 449052, 35, '	Bastidor 19”com 12U de parede 	 ', '	Unidade	 '),
(1, 4, 449052, 35, '	ONU - Optical Network Unit	 ', '	Unidade	 '),
(1, 5, 449052, 6, '	Wi-Fi Outdoor	 ', '	Unidade	 '),
(1, 6, 449052, 30, '	Poste de concreto (SINAPI - 5055 )	 ', '	Unidade	 '),
(1, 7, 449052, 87, '	Cabo de Fibra Óptica aérea - 48 fibras 	 ', '	Metro	 '),
(1, 8, 449052, 30, '	Cabo de Fibra Óptica enterrada - 48 fibras 	 ', '	Metro	 '),
(1, 9, 449052, 30, '	Cabo de Fibra Óptica enterrada - 48 fibras 	 ', '	Metro	 '),
(1, 10, 449052, 30, '	Cabo de Fibra Óptica enterrada - 48 fibras 	 ', '	Metro	 '),
(1, 11, 449052, 87, '	Cabo de Fibra Óptica - cabo DROP	 ', '	Metro	 '),
(1, 12, 339039, 48, '	Operação Assistida (mensal)	 ', '	Unidade	 '),
(1, 13, 339039, 48, '	Transferência de Tecnologia	 ', '	Unidade	 '),
(2, 1, 449052, 35, '	BEO/DIO 19” 48 fibras 	 ', '	Unidade	 '),
(2, 2, 449052, 35, '	Hardwares de Gerência - DNS	 ', '	Unidade	 '),
(2, 3, 449052, 35, '	 BEO/DIO 48 fibras	 ', '	Unidade	 '),
(2, 4, 449052, 35, '	Switch LAN	 ', '	Unidade	 '),
(2, 5, 449052, 6, '	ONU - Optical Network Unit - Bridge	 ', '	Unidade	 '),
(2, 6, 449039, 57, '	Instalação  ( SINAPI - 73783/009)	 ', '	Instalação	 '),
(2, 7, 449039, 57, '	Instalação do cabo entre postes 	 ', '	Instalação/metro	 '),
(2, 8, 449051, 91, '	Perfuração de vala 	 ', '	Perfuração/metro	 '),
(2, 9, 449051, 91, '	Perfuração de vala 	 ', '	Perfuração/metro	 '),
(2, 10, 449051, 91, '	Perfuração de vala 	 ', '	Perfuração/metro	 '),
(2, 11, 449039, 87, '	Instalação do cabo drop	 ', '	Instalação/metro	 '),
(3, 1, 449052, 35, '	Patch Panel 24 Portas	 ', '	Unidade	 '),
(3, 2, 449039, 93, '	Software de Gerência	 ', '	Unidade	 '),
(3, 3, 449052, 35, '	OLT - Optical Line Terminal	 ', '	Unidade	 '),
(3, 4, 339039, 17, '	Instalação de ONU	 ', '	Instalação	 '),
(3, 5, 339039, 57, '	Configuração de equipamentos 	 ', '	Instalação	 '),
(3, 8, 449052, 87, '	Tubulações de proteção	 ', '	Metro	 '),
(3, 9, 449052, 87, '	Tubulações de proteção	 ', '	Metro	 '),
(3, 10, 449052, 87, '	Tubulações de proteção	 ', '	Metro	 '),
(4, 1, 449052, 35, '	Roteador de Borda	 ', '	Unidade	 '),
(4, 2, 339039, 95, '	Instalação do Switch Metro L2 	 ', '	Instalação	 '),
(4, 3, 449052, 17, '	CPE	 ', '	Unidade	 '),
(4, 4, 339039, 17, '	Instalação de Switch LAN	 ', '	Instalação	 '),
(4, 5, 339039, 17, '	Instalação do Wifi outdoor 	 ', '	Instalação	 '),
(4, 8, 449051, 91, '	Instalação de tubulações	 ', '	Instalação/metro	 '),
(4, 9, 449051, 91, '	Instalação de tubulações	 ', '	Instalação/metro	 '),
(4, 10, 449051, 91, '	Instalação de tubulações	 ', '	Instalação/metro	 '),
(5, 1, 449052, 35, '	OLT - Optical Line Terminal	 ', '	Unidade	 '),
(5, 2, 339039, 95, '	Instalação de Gerências - DNS (Hardware/Software)	 ', '	Instalação	 '),
(5, 3, 449052, 35, '	Switch LAN	 ', '	Unidade	 '),
(5, 4, 339039, 16, '	Instalação de cabeamento 	 ', '	Instalação	 '),
(5, 5, 339039, 17, '	Instalação de ONU	 ', '	Instalação	 '),
(5, 8, 449039, 57, '	Instalação de cabos 	 ', '	Instalação/metro	 '),
(5, 9, 449039, 57, '	Instalação de cabos 	 ', '	Instalação/metro	 '),
(5, 10, 449039, 57, '	Instalação de cabos 	 ', '	Instalação/metro	 '),
(6, 1, 449052, 17, '	CPE	 ', '	Unidade	 '),
(6, 2, 339039, 16, '	Instalação de cabeamento 	 ', '	Instalação	 '),
(6, 3, 449052, 30, '	No-Break 1,0 KVA 	 ', '	Unidade	 '),
(6, 4, 339039, 16, '	Instalação fibra externa	 ', '	Instalação	 '),
(6, 5, 339039, 16, '	 Instalação de cabeamento 	 ', '	Instalação	 '),
(7, 1, 449052, 35, '	Switch LAN	 ', '	Unidade	 '),
(7, 2, 339039, 16, '	Instalação de energia (Homem-Hora) 	 ', '	Instalação	 '),
(7, 3, 339039, 17, '	Instalação do Bastidor - BEO/DIO	 ', '	Instalação	 '),
(7, 4, 339039, 16, '	Instalação de energia 	 ', '	Instalação	 '),
(7, 5, 339039, 16, '	 Instalação de Energia 	 ', '	Instalação	 '),
(8, 1, 449052, 30, '	No-Break 6KVA 	 ', '	Unidade	 '),
(8, 3, 339039, 17, '	Instalação de OLT - CPE	 ', '	Instalação	 '),
(9, 1, 339039, 17, '	Instalação do Bastidor - BEO/DIO - Patch Panel	 ', '	Instalação	 '),
(9, 3, 339039, 17, '	Instalação de Switch LAN	 ', '	Instalação	 '),
(10, 1, 339039, 17, '	Instalação do Roteador de Borda	 ', '	Instalação	 '),
(10, 3, 339039, 17, '	Instalação de No-Break 	 ', '	Instalação	 '),
(11, 1, 339039, 17, '	Instalação de Switch LAN	 ', '	Instalação	 '),
(11, 3, 339039, 16, '	Instalação de cabeamento 	 ', '	Instalação	 '),
(12, 1, 339039, 17, '	Instalação de OLT - CPE	 ', '	Instalação	 '),
(12, 3, 339039, 16, '	Instalação fibra externa	 ', '	Instalação	 '),
(13, 1, 339039, 17, '	Instalação de No-Break 	 ', '	Instalação	 '),
(13, 3, 339039, 16, '	Instalação de energia 	 ', '	Instalação	 '),
(14, 1, 339039, 16, '	Instalação de cabeamento	 ', '	Instalação	 '),
(15, 1, 339039, 16, '	Instalação fibra externa ao equipamento central	 ', '	Instalação	 '),
(16, 1, 339039, 57, '	Instalação da conexão - link internet/Roteador	 ', '	Instalação	 '),
(17, 1, 339039, 16, '	Instalação de energia 	 ', '	Instalação	 ');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens_empenho`
--

DROP TABLE IF EXISTS `itens_empenho`;
CREATE TABLE IF NOT EXISTS `itens_empenho` (
  `cod_empenho` varchar(13) NOT NULL,
  `cod_item` int(11) NOT NULL,
  `cod_tipo_item` int(11) NOT NULL,
  `cod_previsao_empenho` int(11) NOT NULL,
  `valor` decimal(12,0) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_empenho`,`cod_item`,`cod_tipo_item`),
  KEY `fk_itens_empenho_empenho1_idx` (`cod_empenho`),
  KEY `fk_itens_empenho_itens_previsao_empenho1_idx` (`cod_previsao_empenho`,`cod_item`,`cod_tipo_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens_fatura`
--

DROP TABLE IF EXISTS `itens_fatura`;
CREATE TABLE IF NOT EXISTS `itens_fatura` (
  `num_nf` int(11) NOT NULL,
  `cod_ibge` int(7) NOT NULL,
  `cod_empenho` varchar(13) NOT NULL,
  `cod_item` int(11) NOT NULL,
  `cod_tipo_item` int(11) NOT NULL,
  `valor` decimal(12,0) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_nf`,`cod_ibge`,`cod_empenho`,`cod_item`,`cod_tipo_item`),
  KEY `fk_itens_fatura_itens_empenho1_idx` (`cod_empenho`,`cod_item`,`cod_tipo_item`),
  KEY `fk_itens_fatura_fatura1_idx` (`num_nf`,`cod_ibge`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens_otb`
--

DROP TABLE IF EXISTS `itens_otb`;
CREATE TABLE IF NOT EXISTS `itens_otb` (
  `cod_otb` int(11) NOT NULL,
  `num_nf` int(11) NOT NULL,
  `cod_ibge` int(7) NOT NULL,
  `cod_empenho` varchar(13) NOT NULL,
  `cod_item` int(11) NOT NULL,
  `cod_tipo_item` int(11) NOT NULL,
  `valor` decimal(12,0) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_otb`,`num_nf`,`cod_ibge`,`cod_empenho`,`cod_item`,`cod_tipo_item`),
  KEY `fk_itens_fatura_has_otb_otb1_idx` (`cod_otb`),
  KEY `fk_itens_otb_itens_fatura1_idx` (`num_nf`,`cod_ibge`,`cod_empenho`,`cod_item`,`cod_tipo_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens_previsao_empenho`
--

DROP TABLE IF EXISTS `itens_previsao_empenho`;
CREATE TABLE IF NOT EXISTS `itens_previsao_empenho` (
  `cod_previsao_empenho` int(11) NOT NULL,
  `cod_item` int(11) NOT NULL,
  `cod_tipo_item` int(11) NOT NULL,
  `cod_lote` int(11) NOT NULL,
  `valor` decimal(12,0) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_previsao_empenho`,`cod_item`,`cod_tipo_item`),
  KEY `fk_itens_previsao_empenho_previsao_empenho1_idx` (`cod_previsao_empenho`),
  KEY `fk_itens_previsao_empenho_lote_itens1_idx` (`cod_lote`,`cod_item`,`cod_tipo_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `cod_log` int(11) NOT NULL AUTO_INCREMENT,
  `cod_usuario` int(11) NOT NULL,
  `data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nome_tabela` varchar(45) NOT NULL,
  `operacao` char(1) NOT NULL,
  `espelho` longtext,
  `cod_int_1` int(11) DEFAULT NULL,
  `cod_int_2` int(11) DEFAULT NULL,
  `cod_int_3` int(11) DEFAULT NULL,
  `cod_int_4` int(11) DEFAULT NULL,
  `cod_int_5` int(11) DEFAULT NULL,
  `cod_data` datetime DEFAULT NULL,
  `cod_processo` char(17) DEFAULT NULL,
  `cod_cnpj` char(14) DEFAULT NULL,
  `cod_empenho` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`cod_log`,`cod_usuario`),
  KEY `fk_log_usuario1_idx` (`cod_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `lote`
--

DROP TABLE IF EXISTS `lote`;
CREATE TABLE IF NOT EXISTS `lote` (
  `cod_lote` int(11) NOT NULL,
  `cnpj` varchar(14) NOT NULL,
  `contrato` varchar(10) DEFAULT NULL,
  `dt_inicio_vig` date DEFAULT NULL,
  `dt_final_vig` date DEFAULT NULL,
  `dt_reajuste` date DEFAULT NULL,
  PRIMARY KEY (`cod_lote`),
  KEY `fk_lote_entidade1_idx` (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `lote`
--

INSERT INTO `lote` (`cod_lote`, `cnpj`, `contrato`, `dt_inicio_vig`, `dt_final_vig`, `dt_reajuste`) VALUES
(1, '3432525', '123456', '2019-10-02', '2019-10-03', '2019-10-02'),
(2, '41475453', '21564564', '2019-10-01', '2019-10-03', '2019-10-02'),
(3, '3432525', 'teste', '2019-10-09', '2019-10-09', '2019-10-09');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lote_itens`
--

DROP TABLE IF EXISTS `lote_itens`;
CREATE TABLE IF NOT EXISTS `lote_itens` (
  `cod_lote` int(11) NOT NULL,
  `cod_item` int(11) NOT NULL,
  `cod_tipo_item` int(11) NOT NULL,
  `preco` decimal(12,0) DEFAULT NULL,
  PRIMARY KEY (`cod_lote`,`cod_item`,`cod_tipo_item`),
  KEY `fk_lote_has_itens_lote1_idx` (`cod_lote`),
  KEY `fk_lote_itens_itens1_idx` (`cod_item`,`cod_tipo_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `modulo`
--

DROP TABLE IF EXISTS `modulo`;
CREATE TABLE IF NOT EXISTS `modulo` (
  `cod_modulo` int(11) NOT NULL,
  `categoria_1` varchar(45) DEFAULT NULL,
  `categoria_2` varchar(45) DEFAULT NULL,
  `categoria_3` varchar(45) DEFAULT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cod_modulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `municipio`
--

DROP TABLE IF EXISTS `municipio`;
CREATE TABLE IF NOT EXISTS `municipio` (
  `cod_ibge` int(7) NOT NULL,
  `nome_municipio` varchar(50) DEFAULT NULL,
  `populacao` int(11) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `regiao` varchar(15) DEFAULT NULL,
  `cnpj` varchar(14) DEFAULT NULL,
  `dist_capital` int(11) DEFAULT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(250) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `idhm` float DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(10,8) DEFAULT NULL,
  PRIMARY KEY (`cod_ibge`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `municipio`
--

INSERT INTO `municipio` (`cod_ibge`, `nome_municipio`, `populacao`, `uf`, `regiao`, `cnpj`, `dist_capital`, `endereco`, `numero`, `complemento`, `bairro`, `idhm`, `latitude`, `longitude`) VALUES
(1100023, 'Ariquemes', NULL, 'RO', '', '04104816000116', 9, '', '', '', '', 0.702, '-9.90571000', '-63.03250000'),
(1100031, 'Cabixi', 6355, 'RO', NULL, '22855159000120', NULL, NULL, NULL, NULL, NULL, 0.65, '-13.49451110', '-60.55200000'),
(1300607, 'Benjamin Constant', 39484, 'AM', NULL, '04243978000135', NULL, NULL, NULL, NULL, NULL, 0.574, '-4.37768111', '-70.03420000'),
(1507805, 'Senador JosÃ© PorfÃ­rio', NULL, 'TO', '', '05421110000140', 6, '', '', '', '', 514, '-4.31241750', '-51.57640800');

-- --------------------------------------------------------

--
-- Estrutura da tabela `natureza_despesa`
--

DROP TABLE IF EXISTS `natureza_despesa`;
CREATE TABLE IF NOT EXISTS `natureza_despesa` (
  `cod_natureza_despesa` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cod_natureza_despesa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `natureza_despesa`
--

INSERT INTO `natureza_despesa` (`cod_natureza_despesa`, `descricao`) VALUES
(339039, 'Serviços e Operação assistida e Capacitação'),
(449039, 'Software'),
(449051, 'Obras e Instalação'),
(449052, 'valor equip. sem instalação');

-- --------------------------------------------------------

--
-- Estrutura da tabela `otb`
--

DROP TABLE IF EXISTS `otb`;
CREATE TABLE IF NOT EXISTS `otb` (
  `cod_otb` int(11) NOT NULL,
  `dt_pgto` date DEFAULT NULL,
  PRIMARY KEY (`cod_otb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pid`
--

DROP TABLE IF EXISTS `pid`;
CREATE TABLE IF NOT EXISTS `pid` (
  `cod_pid` int(11) NOT NULL AUTO_INCREMENT,
  `cod_ibge` int(7) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `inep` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`cod_pid`),
  KEY `fk_pid_municipio1_idx` (`cod_ibge`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pid_tipologia`
--

DROP TABLE IF EXISTS `pid_tipologia`;
CREATE TABLE IF NOT EXISTS `pid_tipologia` (
  `cod_pid` int(11) NOT NULL,
  `cod_tipologia` int(11) NOT NULL,
  PRIMARY KEY (`cod_pid`,`cod_tipologia`),
  KEY `fk_ponto_has_tipologia_tipologia1_idx` (`cod_tipologia`),
  KEY `fk_ponto_tipologia_pid1_idx` (`cod_pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ponto`
--

DROP TABLE IF EXISTS `ponto`;
CREATE TABLE IF NOT EXISTS `ponto` (
  `cod_ponto` int(11) NOT NULL,
  `cod_categoria` int(11) NOT NULL,
  `cod_ibge` int(7) NOT NULL,
  `cod_pid` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(250) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `longitude` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_ponto`,`cod_categoria`,`cod_ibge`),
  KEY `fk_ponto_categoria1_idx` (`cod_categoria`),
  KEY `fk_ponto_cd1_idx` (`cod_ibge`),
  KEY `fk_ponto_pid1_idx` (`cod_pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ponto_has_usuario`
--

DROP TABLE IF EXISTS `ponto_has_usuario`;
CREATE TABLE IF NOT EXISTS `ponto_has_usuario` (
  `ponto_cod_ponto` int(11) NOT NULL,
  `ponto_categoria_cod_categoria` int(11) NOT NULL,
  `usuario_cod_usuario` int(11) NOT NULL,
  `usuario_perfil_cod_perfil` int(11) NOT NULL,
  PRIMARY KEY (`ponto_cod_ponto`,`ponto_categoria_cod_categoria`,`usuario_cod_usuario`,`usuario_perfil_cod_perfil`),
  KEY `fk_ponto_has_usuario_usuario1_idx` (`usuario_cod_usuario`,`usuario_perfil_cod_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `prefeitos`
--

DROP TABLE IF EXISTS `prefeitos`;
CREATE TABLE IF NOT EXISTS `prefeitos` (
  `cod_prefeito` int(11) NOT NULL AUTO_INCREMENT,
  `cod_ibge` int(7) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `partido` varchar(45) DEFAULT NULL,
  `exercicio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_prefeito`),
  KEY `fk_prefeitos_municipio1_idx` (`cod_ibge`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `prefeitos`
--

INSERT INTO `prefeitos` (`cod_prefeito`, `cod_ibge`, `nome`, `cpf`, `rg`, `partido`, `exercicio`) VALUES
(1, 1100023, 'Joao', '0236528741', '142536', 'PSOL', 'Prefeito'),
(3, 1300607, 'Francisco', '51515646', '544654656', 'PSDB', 'Prefeito');

-- --------------------------------------------------------

--
-- Estrutura da tabela `previsao_empenho`
--

DROP TABLE IF EXISTS `previsao_empenho`;
CREATE TABLE IF NOT EXISTS `previsao_empenho` (
  `cod_previsao_empenho` int(11) NOT NULL AUTO_INCREMENT,
  `cod_lote` int(11) NOT NULL,
  `cod_natureza_despesa` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `tipo` char(1) DEFAULT NULL,
  `ano_referencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_previsao_empenho`),
  KEY `fk_empenho_lote1_idx` (`cod_lote`),
  KEY `fk_previsao_empenho_natureza_despesa1_idx` (`cod_natureza_despesa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `processo`
--

DROP TABLE IF EXISTS `processo`;
CREATE TABLE IF NOT EXISTS `processo` (
  `cod_processo` char(17) NOT NULL,
  `cod_ibge` int(7) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_processo`,`cod_ibge`),
  KEY `fk_processo_cd1_idx` (`cod_ibge`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `processo`
--

INSERT INTO `processo` (`cod_processo`, `cod_ibge`, `descricao`) VALUES
('142536', 1100023, 'sem descricao'),
('4596387', 1100023, 'testes varios');

-- --------------------------------------------------------

--
-- Estrutura da tabela `reajuste`
--

DROP TABLE IF EXISTS `reajuste`;
CREATE TABLE IF NOT EXISTS `reajuste` (
  `ano_ref` int(11) NOT NULL,
  `cod_lote` int(11) NOT NULL,
  `percentual` float DEFAULT NULL,
  PRIMARY KEY (`ano_ref`,`cod_lote`),
  KEY `fk_reajuste_lote1_idx` (`cod_lote`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `reajuste`
--

INSERT INTO `reajuste` (`ano_ref`, `cod_lote`, `percentual`) VALUES
(2014, 1, 4),
(2018, 1, 14),
(2019, 2, 145),
(2020, 1, 45),
(2025, 2, 88);

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone`
--

DROP TABLE IF EXISTS `telefone`;
CREATE TABLE IF NOT EXISTS `telefone` (
  `cod_telefone` int(11) NOT NULL AUTO_INCREMENT,
  `cod_contato` int(11) NOT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cod_telefone`),
  KEY `fk_telefone_contato1_idx` (`cod_contato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipologia`
--

DROP TABLE IF EXISTS `tipologia`;
CREATE TABLE IF NOT EXISTS `tipologia` (
  `cod_tipologia` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_tipologia`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tipologia`
--

INSERT INTO `tipologia` (`cod_tipologia`, `descricao`) VALUES
(2, 'tergf');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_item`
--

DROP TABLE IF EXISTS `tipo_item`;
CREATE TABLE IF NOT EXISTS `tipo_item` (
  `cod_tipo_item` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cod_tipo_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tipo_item`
--

INSERT INTO `tipo_item` (`cod_tipo_item`, `descricao`) VALUES
(1, 'Ponto de Enlace e Acesso Social (PEAS)'),
(2, 'Solução de Gerenciamento de Infraestrutura (SGI)'),
(3, '	Ponto de Acesso de Governo (PAG)'),
(4, '	Ponto de Conexão de Governo (PCG)'),
(5, '	Ponto de Acesso Público (PAP)'),
(6, '	Postes'),
(7, '	Fibra Óptica Área Instalada por km (FOA)'),
(8, '	Fibra Óptica Enterrada por km – Solo não Pavimentado (FONPV)'),
(9, '	Fibra Óptica Enterrada por km – Solo Pavimento (FOPV)'),
(10, ' Fibra Óptica Enterrada por km – Paralelepípedo (FOPR)'),
(11, ' Fibra Óptica de Acesso/Drop por km – Pavimento (FDROP)'),
(12, ' Operação Assistida - AO'),
(13, ' Transferência de Tecnologia - TT');

-- --------------------------------------------------------

--
-- Estrutura da tabela `uacom`
--

DROP TABLE IF EXISTS `uacom`;
CREATE TABLE IF NOT EXISTS `uacom` (
  `cod_ibge` int(7) NOT NULL,
  `data` datetime NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `relato` text,
  PRIMARY KEY (`cod_ibge`,`data`),
  KEY `fk_uacom_cd1_idx` (`cod_ibge`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `uacom`
--

INSERT INTO `uacom` (`cod_ibge`, `data`, `titulo`, `relato`) VALUES
(1100023, '2019-10-07 00:00:00', 'tituloteste', 'teste'),
(1507805, '2019-10-07 18:45:46', 'teste', 'relato teste');

-- --------------------------------------------------------

--
-- Estrutura da tabela `uacom_assunto`
--

DROP TABLE IF EXISTS `uacom_assunto`;
CREATE TABLE IF NOT EXISTS `uacom_assunto` (
  `cod_ibge` int(7) NOT NULL,
  `data` datetime NOT NULL,
  `cod_assunto` int(11) NOT NULL,
  PRIMARY KEY (`cod_ibge`,`data`,`cod_assunto`),
  KEY `fk_uacom_has_assunto_assunto1_idx` (`cod_assunto`),
  KEY `fk_uacom_has_assunto_uacom1_idx` (`cod_ibge`,`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `cod_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`cod_usuario`, `nome`, `email`, `status`, `login`, `senha`) VALUES
(2, 'Joazinho', 'Joazinho@gmail.com', 'A', 'Joazinho123', '1234456');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_modulo`
--

DROP TABLE IF EXISTS `usuario_modulo`;
CREATE TABLE IF NOT EXISTS `usuario_modulo` (
  `cod_usuario` int(11) NOT NULL,
  `cod_modulo` int(11) NOT NULL,
  PRIMARY KEY (`cod_usuario`,`cod_modulo`),
  KEY `fk_usuario_has_modulo_modulo1_idx` (`cod_modulo`),
  KEY `fk_usuario_has_modulo_usuario1_idx` (`cod_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `cd`
--
ALTER TABLE `cd`
  ADD CONSTRAINT `fk_cd_lote1` FOREIGN KEY (`cod_lote`) REFERENCES `lote` (`cod_lote`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cd_municipio1` FOREIGN KEY (`cod_ibge`) REFERENCES `municipio` (`cod_ibge`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cd_itens`
--
ALTER TABLE `cd_itens`
  ADD CONSTRAINT `fk_cd_itens_itens2` FOREIGN KEY (`cod_item`,`cod_tipo_item`) REFERENCES `itens` (`cod_item`, `cod_tipo_item`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_itens_has_cd_cd1` FOREIGN KEY (`cod_ibge`) REFERENCES `cd` (`cod_ibge`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `contato`
--
ALTER TABLE `contato`
  ADD CONSTRAINT `fk_contato_cd1` FOREIGN KEY (`cod_ibge`) REFERENCES `cd` (`cod_ibge`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_contato_entidade1` FOREIGN KEY (`cnpj`) REFERENCES `entidade` (`cnpj`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `empenho`
--
ALTER TABLE `empenho`
  ADD CONSTRAINT `fk_empenho_previsao_empenho1` FOREIGN KEY (`cod_previsao_empenho`) REFERENCES `previsao_empenho` (`cod_previsao_empenho`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `etapas_cd`
--
ALTER TABLE `etapas_cd`
  ADD CONSTRAINT `fk_etapas_cd1` FOREIGN KEY (`cod_ibge`) REFERENCES `cd` (`cod_ibge`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_etapas_cd_etapa1` FOREIGN KEY (`cod_etapa`) REFERENCES `etapa` (`cod_etapa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `fatura`
--
ALTER TABLE `fatura`
  ADD CONSTRAINT `fk_Fatura_cd1` FOREIGN KEY (`cod_ibge`) REFERENCES `cd` (`cod_ibge`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `fatura_otb`
--
ALTER TABLE `fatura_otb`
  ADD CONSTRAINT `fk_Fatura_has_otb_otb1` FOREIGN KEY (`cod_otb`) REFERENCES `otb` (`cod_otb`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_fatura_otb_fatura1` FOREIGN KEY (`num_nf`,`cod_ibge`) REFERENCES `fatura` (`num_nf`, `cod_ibge`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `itens`
--
ALTER TABLE `itens`
  ADD CONSTRAINT `fk_itens_classificacao_itens1` FOREIGN KEY (`cod_natureza_despesa`) REFERENCES `natureza_despesa` (`cod_natureza_despesa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_itens_subitem1` FOREIGN KEY (`cod_classe_empenho`) REFERENCES `classe_empenho` (`cod_classe_empenho`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_itens_tipo_item1` FOREIGN KEY (`cod_tipo_item`) REFERENCES `tipo_item` (`cod_tipo_item`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `itens_empenho`
--
ALTER TABLE `itens_empenho`
  ADD CONSTRAINT `fk_itens_empenho_empenho1` FOREIGN KEY (`cod_empenho`) REFERENCES `empenho` (`cod_empenho`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_itens_empenho_itens_previsao_empenho1` FOREIGN KEY (`cod_previsao_empenho`,`cod_item`,`cod_tipo_item`) REFERENCES `itens_previsao_empenho` (`cod_previsao_empenho`, `cod_item`, `cod_tipo_item`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `itens_fatura`
--
ALTER TABLE `itens_fatura`
  ADD CONSTRAINT `fk_itens_fatura_fatura1` FOREIGN KEY (`num_nf`,`cod_ibge`) REFERENCES `fatura` (`num_nf`, `cod_ibge`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_itens_fatura_itens_empenho1` FOREIGN KEY (`cod_empenho`,`cod_item`,`cod_tipo_item`) REFERENCES `itens_empenho` (`cod_empenho`, `cod_item`, `cod_tipo_item`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `itens_otb`
--
ALTER TABLE `itens_otb`
  ADD CONSTRAINT `fk_itens_fatura_has_otb_otb1` FOREIGN KEY (`cod_otb`) REFERENCES `otb` (`cod_otb`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_itens_otb_itens_fatura1` FOREIGN KEY (`num_nf`,`cod_ibge`,`cod_empenho`,`cod_item`,`cod_tipo_item`) REFERENCES `itens_fatura` (`num_nf`, `cod_ibge`, `cod_empenho`, `cod_item`, `cod_tipo_item`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `itens_previsao_empenho`
--
ALTER TABLE `itens_previsao_empenho`
  ADD CONSTRAINT `fk_itens_previsao_empenho_lote_itens1` FOREIGN KEY (`cod_lote`,`cod_item`,`cod_tipo_item`) REFERENCES `lote_itens` (`cod_lote`, `cod_item`, `cod_tipo_item`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_itens_previsao_empenho_previsao_empenho1` FOREIGN KEY (`cod_previsao_empenho`) REFERENCES `previsao_empenho` (`cod_previsao_empenho`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `fk_log_usuario1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `lote`
--
ALTER TABLE `lote`
  ADD CONSTRAINT `fk_lote_entidade1` FOREIGN KEY (`cnpj`) REFERENCES `entidade` (`cnpj`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `lote_itens`
--
ALTER TABLE `lote_itens`
  ADD CONSTRAINT `fk_lote_has_itens_lote1` FOREIGN KEY (`cod_lote`) REFERENCES `lote` (`cod_lote`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_lote_itens_itens1` FOREIGN KEY (`cod_item`,`cod_tipo_item`) REFERENCES `itens` (`cod_item`, `cod_tipo_item`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pid`
--
ALTER TABLE `pid`
  ADD CONSTRAINT `fk_pid_municipio1` FOREIGN KEY (`cod_ibge`) REFERENCES `municipio` (`cod_ibge`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pid_tipologia`
--
ALTER TABLE `pid_tipologia`
  ADD CONSTRAINT `fk_ponto_has_tipologia_tipologia1` FOREIGN KEY (`cod_tipologia`) REFERENCES `tipologia` (`cod_tipologia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ponto_tipologia_pid1` FOREIGN KEY (`cod_pid`) REFERENCES `pid` (`cod_pid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `ponto`
--
ALTER TABLE `ponto`
  ADD CONSTRAINT `fk_ponto_categoria1` FOREIGN KEY (`cod_categoria`) REFERENCES `categoria` (`cod_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ponto_cd1` FOREIGN KEY (`cod_ibge`) REFERENCES `cd` (`cod_ibge`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ponto_pid1` FOREIGN KEY (`cod_pid`) REFERENCES `pid` (`cod_pid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `ponto_has_usuario`
--
ALTER TABLE `ponto_has_usuario`
  ADD CONSTRAINT `fk_ponto_has_usuario_usuario1` FOREIGN KEY (`usuario_cod_usuario`) REFERENCES `usuario` (`cod_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `prefeitos`
--
ALTER TABLE `prefeitos`
  ADD CONSTRAINT `fk_prefeitos_municipio1` FOREIGN KEY (`cod_ibge`) REFERENCES `municipio` (`cod_ibge`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `previsao_empenho`
--
ALTER TABLE `previsao_empenho`
  ADD CONSTRAINT `fk_empenho_lote10` FOREIGN KEY (`cod_lote`) REFERENCES `lote` (`cod_lote`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_previsao_empenho_natureza_despesa1` FOREIGN KEY (`cod_natureza_despesa`) REFERENCES `natureza_despesa` (`cod_natureza_despesa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `processo`
--
ALTER TABLE `processo`
  ADD CONSTRAINT `fk_processo_cd1` FOREIGN KEY (`cod_ibge`) REFERENCES `cd` (`cod_ibge`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `reajuste`
--
ALTER TABLE `reajuste`
  ADD CONSTRAINT `fk_reajuste_lote1` FOREIGN KEY (`cod_lote`) REFERENCES `lote` (`cod_lote`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `telefone`
--
ALTER TABLE `telefone`
  ADD CONSTRAINT `fk_telefone_contato1` FOREIGN KEY (`cod_contato`) REFERENCES `contato` (`cod_contato`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `uacom`
--
ALTER TABLE `uacom`
  ADD CONSTRAINT `fk_uacom_cd1` FOREIGN KEY (`cod_ibge`) REFERENCES `cd` (`cod_ibge`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `uacom_assunto`
--
ALTER TABLE `uacom_assunto`
  ADD CONSTRAINT `fk_uacom_has_assunto_assunto1` FOREIGN KEY (`cod_assunto`) REFERENCES `assunto` (`cod_assunto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_uacom_has_assunto_uacom1` FOREIGN KEY (`cod_ibge`,`data`) REFERENCES `uacom` (`cod_ibge`, `data`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `usuario_modulo`
--
ALTER TABLE `usuario_modulo`
  ADD CONSTRAINT `fk_usuario_has_modulo_modulo1` FOREIGN KEY (`cod_modulo`) REFERENCES `modulo` (`cod_modulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_has_modulo_usuario1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
