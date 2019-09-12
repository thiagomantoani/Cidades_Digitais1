-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 06-Set-2019 às 13:53
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `cod_categoria` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Estrutura da tabela `etapa`
--

DROP TABLE IF EXISTS `etapa`;
CREATE TABLE IF NOT EXISTS `etapa` (
  `cod_etapa` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `duracao` int(11) DEFAULT NULL,
  `depende` int(11) DEFAULT NULL,
  `delay` int(11) DEFAULT NULL,
  `setor_resp` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_etapa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `cod_log` int(11) NOT NULL,
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
(24, 'tste', NULL, 'to', 'hdyh', '4542', 45, '2424', '22', '124', '1', 2, '2.00000000', '2.00000000'),
(256432, 'Palmas', 2563211, 'TO', 'Norte', '76622577000105', 18, 'QNE 12', '11', 'Caixa Econ', 'Aureny III', 0.788, '-15.79410000', '-47.88250000');

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
  `cod_pid` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `senha` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`cod_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`cod_usuario`, `nome`, `email`, `status`, `login`, `senha`) VALUES
(1, 'Carol', 'carol@gmail.com', 'A', 'carol', '$2y$10$pbrrDSQjYYCC0HGcRWmnKeNmk3pJ9b2dtUBR7181R.RaQLknkUF3K'),
(2, 'Dhemes', 'dhemes@gmail.com', 'A', 'dhemes', '$2y$10$HqKQACYvIFsmjjL4mqeWcuXUNrE9dtigX4nIXxa2s5P6tdvmfAvNi'),
(4, 'Benta', 'Jrm', 'A', 'benta', '$2y$10$A17dgEyK7InTg//v6.II7OApZhUympb8i74rI6TIlgR8htOre8AB.');

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
