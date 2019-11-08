CREATE DATABASE  IF NOT EXISTS `cidades_digitais_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cidades_digitais_db`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cidades_digitais_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.25-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assunto`
--

DROP TABLE IF EXISTS `assunto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assunto` (
  `cod_assunto` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_assunto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assunto`
--

LOCK TABLES `assunto` WRITE;
/*!40000 ALTER TABLE `assunto` DISABLE KEYS */;
INSERT INTO `assunto` VALUES (1,'No dia mais claro'),(2,'Na noite mais densa'),(3,'O mal sucumbirá ante a minha presença'),(4,'Todo aquele que venera o mal há de penar'),(5,'Quando o poder do Lanterna Verde enfrentar!');
/*!40000 ALTER TABLE `assunto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `cod_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'PEAS'),(2,'PAP'),(3,'PAG'),(4,'PCG');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cd`
--

DROP TABLE IF EXISTS `cd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd` (
  `cod_ibge` int(7) NOT NULL,
  `cod_lote` int(11) NOT NULL,
  `os_pe` varchar(10) DEFAULT NULL,
  `data_pe` date DEFAULT NULL,
  `os_imp` varchar(10) DEFAULT NULL,
  `data_imp` date DEFAULT NULL,
  PRIMARY KEY (`cod_ibge`),
  KEY `fk_cd_lote1_idx` (`cod_lote`),
  CONSTRAINT `fk_cd_lote1` FOREIGN KEY (`cod_lote`) REFERENCES `lote` (`cod_lote`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cd_municipio1` FOREIGN KEY (`cod_ibge`) REFERENCES `municipio` (`cod_ibge`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd`
--

LOCK TABLES `cd` WRITE;
/*!40000 ALTER TABLE `cd` DISABLE KEYS */;
/*!40000 ALTER TABLE `cd` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cidades_digitais_db`.`insere_cd_itens` AFTER INSERT ON `cd` FOR EACH ROW
BEGIN
insert into cd_itens (cod_ibge, cod_item, cod_tipo_item) (select cd.cod_ibge, itens.cod_item, itens.cod_tipo_item from cd, itens
where cd.cod_ibge = (select last_insert_id(new.cod_ibge)));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cd_itens`
--

DROP TABLE IF EXISTS `cd_itens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd_itens` (
  `cod_ibge` int(7) NOT NULL,
  `cod_item` int(11) NOT NULL,
  `cod_tipo_item` int(11) NOT NULL,
  `quantidade_previsto` int(11) DEFAULT NULL,
  `quantidade_projeto_executivo` int(11) DEFAULT NULL,
  `quantidade_termo_instalacao` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_ibge`,`cod_item`,`cod_tipo_item`),
  KEY `fk_itens_has_cd_cd1_idx` (`cod_ibge`),
  KEY `fk_cd_itens_itens2_idx` (`cod_item`,`cod_tipo_item`),
  CONSTRAINT `fk_cd_itens_itens2` FOREIGN KEY (`cod_item`, `cod_tipo_item`) REFERENCES `itens` (`cod_item`, `cod_tipo_item`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_itens_has_cd_cd1` FOREIGN KEY (`cod_ibge`) REFERENCES `cd` (`cod_ibge`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd_itens`
--

LOCK TABLES `cd_itens` WRITE;
/*!40000 ALTER TABLE `cd_itens` DISABLE KEYS */;
/*!40000 ALTER TABLE `cd_itens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classe_empenho`
--

DROP TABLE IF EXISTS `classe_empenho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classe_empenho` (
  `cod_classe_empenho` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cod_classe_empenho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classe_empenho`
--

LOCK TABLES `classe_empenho` WRITE;
/*!40000 ALTER TABLE `classe_empenho` DISABLE KEYS */;
INSERT INTO `classe_empenho` VALUES (6,'APARELHOS E EQUIPAMENTOS DE COMUNICAÇAO'),(16,'MANUTENÇÃO E CONSERVAÇÃO DE BENS'),(17,'MANUTENÇÃO E CONSERVAÇÃO DE MÁQUINAS'),(27,'SUPORTE DE INFRAESTRUTURA DE TI'),(30,'MAQUINAS E EQUIPAMENTOS ENERGETICOS'),(35,'EQUIPAMENTOS DE PROCESSAMENTO DE DADOS'),(48,'SERVIÇOS DE SELEÇÃO E TREINAMENTO'),(57,'SERVIÇOS TECNICOS PROFISSIONAIS'),(58,'SERVIÇOS TÉCNICOS PROFISSIONAIS'),(59,'SERVIÇOS TÉCNICOS PROFISSIONAIS'),(87,'MATERIAL DE CONSUMO DE USO DURÁVEL'),(91,'OBRAS EM ANDAMENTO'),(92,'OBRAS EM ANDAMENTO'),(93,'AQUISIÇÃO DE SOFTWARE'),(95,'MANUT. CONS. EQUIP. DE PROCESSAMENTO DE DADOS');
/*!40000 ALTER TABLE `classe_empenho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contato`
--

DROP TABLE IF EXISTS `contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contato` (
  `cod_contato` int(11) NOT NULL AUTO_INCREMENT,
  `cnpj` varchar(14) DEFAULT NULL,
  `cod_ibge` int(7) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `funcao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_contato`),
  KEY `fk_contato_entidade1_idx` (`cnpj`),
  KEY `fk_contato_cd1_idx` (`cod_ibge`),
  CONSTRAINT `fk_contato_cd1` FOREIGN KEY (`cod_ibge`) REFERENCES `cd` (`cod_ibge`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contato_entidade1` FOREIGN KEY (`cnpj`) REFERENCES `entidade` (`cnpj`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contato`
--

LOCK TABLES `contato` WRITE;
/*!40000 ALTER TABLE `contato` DISABLE KEYS */;
/*!40000 ALTER TABLE `contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empenho`
--

DROP TABLE IF EXISTS `empenho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empenho` (
  `cod_empenho` varchar(13) NOT NULL,
  `cod_previsao_empenho` int(11) NOT NULL,
  `data` datetime DEFAULT NULL,
  `contador` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_empenho`),
  KEY `fk_empenho_previsao_empenho1_idx` (`cod_previsao_empenho`),
  CONSTRAINT `fk_empenho_previsao_empenho1` FOREIGN KEY (`cod_previsao_empenho`) REFERENCES `previsao_empenho` (`cod_previsao_empenho`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empenho`
--

LOCK TABLES `empenho` WRITE;
/*!40000 ALTER TABLE `empenho` DISABLE KEYS */;
/*!40000 ALTER TABLE `empenho` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cidades_digitais_db`.`insere_itens_empenho` AFTER INSERT ON `empenho` FOR EACH ROW
BEGIN
insert into itens_empenho (cod_empenho, cod_item, cod_tipo_item, cod_previsao_empenho, valor) 
(select empenho.cod_empenho, itens_previsao_empenho.cod_item, itens_previsao_empenho.cod_tipo_item, empenho.cod_previsao_empenho, itens_previsao_empenho.valor
from empenho
inner join previsao_empenho on (empenho.cod_previsao_empenho = previsao_empenho.cod_previsao_empenho)
inner join itens_previsao_empenho on (previsao_empenho.cod_previsao_empenho = itens_previsao_empenho.cod_previsao_empenho)
where empenho.cod_empenho = (select last_insert_id(new.cod_empenho)));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `entidade`
--

DROP TABLE IF EXISTS `entidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entidade` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entidade`
--

LOCK TABLES `entidade` WRITE;
/*!40000 ALTER TABLE `entidade` DISABLE KEYS */;
INSERT INTO `entidade` VALUES ('60288493000139','Entidade 3',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('64479314000100','Entidade 1',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('74144867000157','Entidade 2',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `entidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etapa`
--

DROP TABLE IF EXISTS `etapa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etapa` (
  `cod_etapa` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  `duracao` int(11) DEFAULT NULL,
  `depende` int(11) DEFAULT NULL,
  `delay` int(11) DEFAULT NULL,
  `setor_resp` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_etapa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etapa`
--

LOCK TABLES `etapa` WRITE;
/*!40000 ALTER TABLE `etapa` DISABLE KEYS */;
/*!40000 ALTER TABLE `etapa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etapas_cd`
--

DROP TABLE IF EXISTS `etapas_cd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etapas_cd` (
  `cod_ibge` int(7) NOT NULL,
  `cod_etapa` int(11) NOT NULL,
  `dt_inicio` datetime DEFAULT NULL,
  `dt_fim` datetime DEFAULT NULL,
  `responsavel` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_ibge`,`cod_etapa`),
  KEY `fk_etapas_cd_etapa1_idx` (`cod_etapa`),
  CONSTRAINT `fk_etapas_cd1` FOREIGN KEY (`cod_ibge`) REFERENCES `cd` (`cod_ibge`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_etapas_cd_etapa1` FOREIGN KEY (`cod_etapa`) REFERENCES `etapa` (`cod_etapa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etapas_cd`
--

LOCK TABLES `etapas_cd` WRITE;
/*!40000 ALTER TABLE `etapas_cd` DISABLE KEYS */;
/*!40000 ALTER TABLE `etapas_cd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fatura`
--

DROP TABLE IF EXISTS `fatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fatura` (
  `num_nf` int(11) NOT NULL,
  `cod_ibge` int(7) NOT NULL,
  `dt_nf` date DEFAULT NULL,
  PRIMARY KEY (`num_nf`,`cod_ibge`),
  KEY `fk_Fatura_cd1_idx` (`cod_ibge`),
  CONSTRAINT `fk_Fatura_cd1` FOREIGN KEY (`cod_ibge`) REFERENCES `cd` (`cod_ibge`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fatura`
--

LOCK TABLES `fatura` WRITE;
/*!40000 ALTER TABLE `fatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `fatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fatura_otb`
--

DROP TABLE IF EXISTS `fatura_otb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fatura_otb` (
  `cod_otb` int(11) NOT NULL,
  `num_nf` int(11) NOT NULL,
  `cod_ibge` int(7) NOT NULL,
  PRIMARY KEY (`cod_otb`,`num_nf`,`cod_ibge`),
  KEY `fk_Fatura_has_otb_otb1_idx` (`cod_otb`),
  KEY `fk_fatura_otb_fatura1_idx` (`num_nf`,`cod_ibge`),
  CONSTRAINT `fk_Fatura_has_otb_otb1` FOREIGN KEY (`cod_otb`) REFERENCES `otb` (`cod_otb`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fatura_otb_fatura1` FOREIGN KEY (`num_nf`, `cod_ibge`) REFERENCES `fatura` (`num_nf`, `cod_ibge`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fatura_otb`
--

LOCK TABLES `fatura_otb` WRITE;
/*!40000 ALTER TABLE `fatura_otb` DISABLE KEYS */;
/*!40000 ALTER TABLE `fatura_otb` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cidades_digitais_db`.`insere_itens_otb` AFTER INSERT ON `fatura_otb` FOR EACH ROW
BEGIN
	insert into itens_otb (cod_otb, num_nf, cod_empenho, cod_item, cod_tipo_item,  valor, quantidade) 
    (select fatura_otb.cod_otb, fatura_otb.num_nf, itens_fatura.cod_empenho, itens_fatura.cod_item, itens_fatura.cod_tipo_item, itens_fatura.valor, itens_fatura.quantidade
    from fatura_otb
    inner join itens_fatura on (fatura_otb.num_nf = itens_fatura.num_nf)
    where itens_fatura.num_nf = (select last_insert_id(new.num_nf)) and fatura_otb.cod_otb = (select last_insert_id(new.cod_otb)));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `itens`
--

DROP TABLE IF EXISTS `itens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itens` (
  `cod_item` int(11) NOT NULL,
  `cod_tipo_item` int(11) NOT NULL,
  `cod_natureza_despesa` int(11) NOT NULL,
  `cod_classe_empenho` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `unidade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_item`,`cod_tipo_item`),
  KEY `fk_itens_classificacao_itens1_idx` (`cod_natureza_despesa`),
  KEY `fk_itens_subitem1_idx` (`cod_classe_empenho`),
  KEY `fk_itens_tipo_item1_idx` (`cod_tipo_item`),
  CONSTRAINT `fk_itens_classificacao_itens1` FOREIGN KEY (`cod_natureza_despesa`) REFERENCES `natureza_despesa` (`cod_natureza_despesa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_itens_subitem1` FOREIGN KEY (`cod_classe_empenho`) REFERENCES `classe_empenho` (`cod_classe_empenho`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_itens_tipo_item1` FOREIGN KEY (`cod_tipo_item`) REFERENCES `tipo_item` (`cod_tipo_item`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens`
--

LOCK TABLES `itens` WRITE;
/*!40000 ALTER TABLE `itens` DISABLE KEYS */;
INSERT INTO `itens` VALUES (1,1,449052,35,'Bastidor 19” com 42U de altura ','unidade '),(1,2,449052,35,'Switch Metro L 2 com SFP ','Unidade '),(1,3,449052,35,'Bastidor 19”com 12U de parede ','Unidade '),(1,4,449052,35,'ONU - Optical Network Unit ','Unidade '),(1,5,449052,6,'Wi-Fi Outdoor ','Unidade '),(1,6,449052,30,'Poste de concreto (SINAPI - 5055 ) ','Unidade '),(1,7,449052,87,'Cabo de Fibra Óptica aérea - 48 fibras ','Metro '),(1,8,449052,30,'Cabo de Fibra Óptica enterrada - 48 fibras ','Metro '),(1,9,449052,30,'Cabo de Fibra Óptica enterrada - 48 fibras ','Metro '),(1,10,449052,30,'Cabo de Fibra Óptica enterrada - 48 fibras ','Metro '),(1,11,449052,87,'Cabo de Fibra Óptica - cabo DROP ','Metro '),(1,12,339039,48,'Operação Assistida (mensal) ','Unidade '),(1,13,339039,48,'Transferência de Tecnologia ','Unidade '),(2,1,449052,35,'BEO/DIO 19” 48 fibras ','Unidade '),(2,2,449052,35,'Hardwares de Gerência - DNS ','Unidade '),(2,3,449052,35,' BEO/DIO 48 fibras ','Unidade '),(2,4,449052,35,'Switch LAN ','Unidade '),(2,5,449052,6,'ONU - Optical Network Unit - Bridge ','Unidade '),(2,6,449039,57,'Instalação ( SINAPI - 73783/009) ','Instalação '),(2,7,449039,57,'Instalação do cabo entre postes ','Instalação/metro '),(2,8,449051,91,'Perfuração de vala ','Perfuração/metro '),(2,9,449051,91,'Perfuração de vala ','Perfuração/metro '),(2,10,449051,91,'Perfuração de vala ','Perfuração/metro '),(2,11,449039,87,'Instalação do cabo drop ','Instalação/metro '),(3,1,449052,35,'Patch Panel 24 Portas ','Unidade '),(3,2,449039,93,'Software de Gerência ','Unidade '),(3,3,449052,35,'OLT - Optical Line Terminal ','Unidade '),(3,4,339039,17,'Instalação de ONU ','Instalação '),(3,5,339039,57,'Configuração de equipamentos ','Instalação '),(3,8,449052,87,'Tubulações de proteção ','Metro '),(3,9,449052,87,'Tubulações de proteção ','Metro '),(3,10,449052,87,'Tubulações de proteção ','Metro '),(4,1,449052,35,'Roteador de Borda ','Unidade '),(4,2,339039,95,'Instalação do Switch Metro L2 ','Instalação '),(4,3,449052,17,'CPE ','Unidade '),(4,4,339039,17,'Instalação de Switch LAN ','Instalação '),(4,5,339039,17,'Instalação do Wifi outdoor ','Instalação '),(4,8,449051,91,'Instalação de tubulações ','Instalação/metro '),(4,9,449051,91,'Instalação de tubulações ','Instalação/metro '),(4,10,449051,91,'Instalação de tubulações ','Instalação/metro '),(5,1,449052,35,'OLT - Optical Line Terminal ','Unidade '),(5,2,339039,95,'Instalação de Gerências - DNS (Hardware/Software) ','Instalação '),(5,3,449052,35,'Switch LAN ','Unidade '),(5,4,339039,16,'Instalação de cabeamento ','Instalação '),(5,5,339039,17,'Instalação de ONU ','Instalação '),(5,8,449039,57,'Instalação de cabos ','Instalação/metro '),(5,9,449039,57,'Instalação de cabos ','Instalação/metro '),(5,10,449039,57,'Instalação de cabos ','Instalação/metro '),(6,1,449052,17,'CPE ','Unidade '),(6,2,339039,16,'Instalação de cabeamento ','Instalação '),(6,3,449052,30,'No-Break 1,0 KVA ','Unidade '),(6,4,339039,16,'Instalação fibra externa ','Instalação '),(6,5,339039,16,' Instalação de cabeamento ','Instalação '),(7,1,449052,35,'Switch LAN ','Unidade '),(7,2,339039,16,'Instalação de energia (Homem-Hora) ','Instalação '),(7,3,339039,17,'Instalação do Bastidor - BEO/DIO ','Instalação '),(7,4,339039,16,'Instalação de energia ','Instalação '),(7,5,339039,16,' Instalação de Energia ','Instalação '),(8,1,449052,30,'No-Break 6KVA ','Unidade '),(8,3,339039,17,'Instalação de OLT - CPE ','Instalação '),(9,1,339039,17,'Instalação do Bastidor - BEO/DIO - Patch Panel ','Instalação '),(9,3,339039,17,'Instalação de Switch LAN ','Instalação '),(10,1,339039,17,'Instalação do Roteador de Borda ','Instalação '),(10,3,339039,17,'Instalação de No-Break ','Instalação '),(11,1,339039,17,'Instalação de Switch LAN ','Instalação '),(11,3,339039,16,'Instalação de cabeamento ','Instalação '),(12,1,339039,17,'Instalação de OLT - CPE ','Instalação '),(12,3,339039,16,'Instalação fibra externa ','Instalação '),(13,1,339039,17,'Instalação de No-Break ','Instalação '),(13,3,339039,16,'Instalação de energia ','Instalação '),(14,1,339039,16,'Instalação de cabeamento ','Instalação '),(15,1,339039,16,'Instalação fibra externa ao equipamento central ','Instalação '),(16,1,339039,57,'Instalação da conexão - link internet/Roteador ','Instalação '),(17,1,339039,16,'Instalação de energia ','Instalação ');
/*!40000 ALTER TABLE `itens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_empenho`
--

DROP TABLE IF EXISTS `itens_empenho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itens_empenho` (
  `cod_empenho` varchar(13) NOT NULL,
  `cod_item` int(11) NOT NULL,
  `cod_tipo_item` int(11) NOT NULL,
  `cod_previsao_empenho` int(11) NOT NULL,
  `valor` decimal(12,0) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_empenho`,`cod_item`,`cod_tipo_item`),
  KEY `fk_itens_empenho_empenho1_idx` (`cod_empenho`),
  KEY `fk_itens_empenho_itens_previsao_empenho1_idx` (`cod_previsao_empenho`,`cod_item`,`cod_tipo_item`),
  CONSTRAINT `fk_itens_empenho_empenho1` FOREIGN KEY (`cod_empenho`) REFERENCES `empenho` (`cod_empenho`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_itens_empenho_itens_previsao_empenho1` FOREIGN KEY (`cod_previsao_empenho`, `cod_item`, `cod_tipo_item`) REFERENCES `itens_previsao_empenho` (`cod_previsao_empenho`, `cod_item`, `cod_tipo_item`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_empenho`
--

LOCK TABLES `itens_empenho` WRITE;
/*!40000 ALTER TABLE `itens_empenho` DISABLE KEYS */;
/*!40000 ALTER TABLE `itens_empenho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_fatura`
--

DROP TABLE IF EXISTS `itens_fatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itens_fatura` (
  `num_nf` int(11) NOT NULL,
  `cod_ibge` int(7) NOT NULL,
  `cod_empenho` varchar(13) NOT NULL,
  `cod_item` int(11) NOT NULL,
  `cod_tipo_item` int(11) NOT NULL,
  `valor` decimal(12,0) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_nf`,`cod_ibge`,`cod_empenho`,`cod_item`,`cod_tipo_item`),
  KEY `fk_itens_fatura_itens_empenho1_idx` (`cod_empenho`,`cod_item`,`cod_tipo_item`),
  KEY `fk_itens_fatura_fatura1_idx` (`num_nf`,`cod_ibge`),
  CONSTRAINT `fk_itens_fatura_fatura1` FOREIGN KEY (`num_nf`, `cod_ibge`) REFERENCES `fatura` (`num_nf`, `cod_ibge`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_itens_fatura_itens_empenho1` FOREIGN KEY (`cod_empenho`, `cod_item`, `cod_tipo_item`) REFERENCES `itens_empenho` (`cod_empenho`, `cod_item`, `cod_tipo_item`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_fatura`
--

LOCK TABLES `itens_fatura` WRITE;
/*!40000 ALTER TABLE `itens_fatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `itens_fatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_otb`
--

DROP TABLE IF EXISTS `itens_otb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itens_otb` (
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
  KEY `fk_itens_otb_itens_fatura1_idx` (`num_nf`,`cod_ibge`,`cod_empenho`,`cod_item`,`cod_tipo_item`),
  CONSTRAINT `fk_itens_fatura_has_otb_otb1` FOREIGN KEY (`cod_otb`) REFERENCES `otb` (`cod_otb`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_itens_otb_itens_fatura1` FOREIGN KEY (`num_nf`, `cod_ibge`, `cod_empenho`, `cod_item`, `cod_tipo_item`) REFERENCES `itens_fatura` (`num_nf`, `cod_ibge`, `cod_empenho`, `cod_item`, `cod_tipo_item`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_otb`
--

LOCK TABLES `itens_otb` WRITE;
/*!40000 ALTER TABLE `itens_otb` DISABLE KEYS */;
/*!40000 ALTER TABLE `itens_otb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_previsao_empenho`
--

DROP TABLE IF EXISTS `itens_previsao_empenho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itens_previsao_empenho` (
  `cod_previsao_empenho` int(11) NOT NULL,
  `cod_item` int(11) NOT NULL,
  `cod_tipo_item` int(11) NOT NULL,
  `cod_lote` int(11) NOT NULL,
  `valor` decimal(12,0) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_previsao_empenho`,`cod_item`,`cod_tipo_item`),
  KEY `fk_itens_previsao_empenho_previsao_empenho1_idx` (`cod_previsao_empenho`),
  KEY `fk_itens_previsao_empenho_lote_itens1_idx` (`cod_lote`,`cod_item`,`cod_tipo_item`),
  CONSTRAINT `fk_itens_previsao_empenho_lote_itens1` FOREIGN KEY (`cod_lote`, `cod_item`, `cod_tipo_item`) REFERENCES `lote_itens` (`cod_lote`, `cod_item`, `cod_tipo_item`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_itens_previsao_empenho_previsao_empenho1` FOREIGN KEY (`cod_previsao_empenho`) REFERENCES `previsao_empenho` (`cod_previsao_empenho`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_previsao_empenho`
--

LOCK TABLES `itens_previsao_empenho` WRITE;
/*!40000 ALTER TABLE `itens_previsao_empenho` DISABLE KEYS */;
/*!40000 ALTER TABLE `itens_previsao_empenho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
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
  KEY `fk_log_usuario1_idx` (`cod_usuario`),
  CONSTRAINT `fk_log_usuario1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lote`
--

DROP TABLE IF EXISTS `lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lote` (
  `cod_lote` int(11) NOT NULL,
  `cnpj` varchar(14) NOT NULL,
  `contrato` varchar(10) DEFAULT NULL,
  `dt_inicio_vig` date DEFAULT NULL,
  `dt_final_vig` date DEFAULT NULL,
  `dt_reajuste` date DEFAULT NULL,
  PRIMARY KEY (`cod_lote`),
  KEY `fk_lote_entidade1_idx` (`cnpj`),
  CONSTRAINT `fk_lote_entidade1` FOREIGN KEY (`cnpj`) REFERENCES `entidade` (`cnpj`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lote`
--

LOCK TABLES `lote` WRITE;
/*!40000 ALTER TABLE `lote` DISABLE KEYS */;
INSERT INTO `lote` VALUES (1,'64479314000100','A','2017-01-01','2020-01-01',NULL),(2,'74144867000157','B','2017-02-02','2020-02-02',NULL),(3,'60288493000139','C','2017-02-02','2020-02-02',NULL);
/*!40000 ALTER TABLE `lote` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cidades_digitais_db`.`insere_lote_itens` AFTER INSERT ON `lote` FOR EACH ROW
BEGIN
insert into lote_itens(cod_lote, cod_item, cod_tipo_item) (select lote.cod_lote, itens.cod_item, itens.cod_tipo_item from lote, itens 
where lote.cod_lote = (select last_insert_id(new.cod_lote)));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `lote_itens`
--

DROP TABLE IF EXISTS `lote_itens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lote_itens` (
  `cod_lote` int(11) NOT NULL,
  `cod_item` int(11) NOT NULL,
  `cod_tipo_item` int(11) NOT NULL,
  `preco` decimal(12,0) DEFAULT NULL,
  PRIMARY KEY (`cod_lote`,`cod_item`,`cod_tipo_item`),
  KEY `fk_lote_has_itens_lote1_idx` (`cod_lote`),
  KEY `fk_lote_itens_itens1_idx` (`cod_item`,`cod_tipo_item`),
  CONSTRAINT `fk_lote_has_itens_lote1` FOREIGN KEY (`cod_lote`) REFERENCES `lote` (`cod_lote`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lote_itens_itens1` FOREIGN KEY (`cod_item`, `cod_tipo_item`) REFERENCES `itens` (`cod_item`, `cod_tipo_item`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lote_itens`
--

LOCK TABLES `lote_itens` WRITE;
/*!40000 ALTER TABLE `lote_itens` DISABLE KEYS */;
INSERT INTO `lote_itens` VALUES (1,1,1,NULL),(1,1,2,NULL),(1,1,3,NULL),(1,1,4,NULL),(1,1,5,NULL),(1,1,6,NULL),(1,1,7,NULL),(1,1,8,NULL),(1,1,9,NULL),(1,1,10,NULL),(1,1,11,NULL),(1,1,12,NULL),(1,1,13,NULL),(1,2,1,NULL),(1,2,2,NULL),(1,2,3,NULL),(1,2,4,NULL),(1,2,5,NULL),(1,2,6,NULL),(1,2,7,NULL),(1,2,8,NULL),(1,2,9,NULL),(1,2,10,NULL),(1,2,11,NULL),(1,3,1,NULL),(1,3,2,NULL),(1,3,3,NULL),(1,3,4,NULL),(1,3,5,NULL),(1,3,8,NULL),(1,3,9,NULL),(1,3,10,NULL),(1,4,1,NULL),(1,4,2,NULL),(1,4,3,NULL),(1,4,4,NULL),(1,4,5,NULL),(1,4,8,NULL),(1,4,9,NULL),(1,4,10,NULL),(1,5,1,NULL),(1,5,2,NULL),(1,5,3,NULL),(1,5,4,NULL),(1,5,5,NULL),(1,5,8,NULL),(1,5,9,NULL),(1,5,10,NULL),(1,6,1,NULL),(1,6,2,NULL),(1,6,3,NULL),(1,6,4,NULL),(1,6,5,NULL),(1,7,1,NULL),(1,7,2,NULL),(1,7,3,NULL),(1,7,4,NULL),(1,7,5,NULL),(1,8,1,NULL),(1,8,3,NULL),(1,9,1,NULL),(1,9,3,NULL),(1,10,1,NULL),(1,10,3,NULL),(1,11,1,NULL),(1,11,3,NULL),(1,12,1,NULL),(1,12,3,NULL),(1,13,1,NULL),(1,13,3,NULL),(1,14,1,NULL),(1,15,1,NULL),(1,16,1,NULL),(1,17,1,NULL),(2,1,1,NULL),(2,1,2,NULL),(2,1,3,NULL),(2,1,4,NULL),(2,1,5,NULL),(2,1,6,NULL),(2,1,7,NULL),(2,1,8,NULL),(2,1,9,NULL),(2,1,10,NULL),(2,1,11,NULL),(2,1,12,NULL),(2,1,13,NULL),(2,2,1,NULL),(2,2,2,NULL),(2,2,3,NULL),(2,2,4,NULL),(2,2,5,NULL),(2,2,6,NULL),(2,2,7,NULL),(2,2,8,NULL),(2,2,9,NULL),(2,2,10,NULL),(2,2,11,NULL),(2,3,1,NULL),(2,3,2,NULL),(2,3,3,NULL),(2,3,4,NULL),(2,3,5,NULL),(2,3,8,NULL),(2,3,9,NULL),(2,3,10,NULL),(2,4,1,NULL),(2,4,2,NULL),(2,4,3,NULL),(2,4,4,NULL),(2,4,5,NULL),(2,4,8,NULL),(2,4,9,NULL),(2,4,10,NULL),(2,5,1,NULL),(2,5,2,NULL),(2,5,3,NULL),(2,5,4,NULL),(2,5,5,NULL),(2,5,8,NULL),(2,5,9,NULL),(2,5,10,NULL),(2,6,1,NULL),(2,6,2,NULL),(2,6,3,NULL),(2,6,4,NULL),(2,6,5,NULL),(2,7,1,NULL),(2,7,2,NULL),(2,7,3,NULL),(2,7,4,NULL),(2,7,5,NULL),(2,8,1,NULL),(2,8,3,NULL),(2,9,1,NULL),(2,9,3,NULL),(2,10,1,NULL),(2,10,3,NULL),(2,11,1,NULL),(2,11,3,NULL),(2,12,1,NULL),(2,12,3,NULL),(2,13,1,NULL),(2,13,3,NULL),(2,14,1,NULL),(2,15,1,NULL),(2,16,1,NULL),(2,17,1,NULL),(3,1,1,NULL),(3,1,2,NULL),(3,1,3,NULL),(3,1,4,NULL),(3,1,5,NULL),(3,1,6,NULL),(3,1,7,NULL),(3,1,8,NULL),(3,1,9,NULL),(3,1,10,NULL),(3,1,11,NULL),(3,1,12,NULL),(3,1,13,NULL),(3,2,1,NULL),(3,2,2,NULL),(3,2,3,NULL),(3,2,4,NULL),(3,2,5,NULL),(3,2,6,NULL),(3,2,7,NULL),(3,2,8,NULL),(3,2,9,NULL),(3,2,10,NULL),(3,2,11,NULL),(3,3,1,NULL),(3,3,2,NULL),(3,3,3,NULL),(3,3,4,NULL),(3,3,5,NULL),(3,3,8,NULL),(3,3,9,NULL),(3,3,10,NULL),(3,4,1,NULL),(3,4,2,NULL),(3,4,3,NULL),(3,4,4,NULL),(3,4,5,NULL),(3,4,8,NULL),(3,4,9,NULL),(3,4,10,NULL),(3,5,1,NULL),(3,5,2,NULL),(3,5,3,NULL),(3,5,4,NULL),(3,5,5,NULL),(3,5,8,NULL),(3,5,9,NULL),(3,5,10,NULL),(3,6,1,NULL),(3,6,2,NULL),(3,6,3,NULL),(3,6,4,NULL),(3,6,5,NULL),(3,7,1,NULL),(3,7,2,NULL),(3,7,3,NULL),(3,7,4,NULL),(3,7,5,NULL),(3,8,1,NULL),(3,8,3,NULL),(3,9,1,NULL),(3,9,3,NULL),(3,10,1,NULL),(3,10,3,NULL),(3,11,1,NULL),(3,11,3,NULL),(3,12,1,NULL),(3,12,3,NULL),(3,13,1,NULL),(3,13,3,NULL),(3,14,1,NULL),(3,15,1,NULL),(3,16,1,NULL),(3,17,1,NULL);
/*!40000 ALTER TABLE `lote_itens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulo` (
  `cod_modulo` int(11) NOT NULL,
  `categoria_1` varchar(45) DEFAULT NULL,
  `categoria_2` varchar(45) DEFAULT NULL,
  `categoria_3` varchar(45) DEFAULT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cod_modulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipio` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` VALUES (1100015,'Alta Floresta dOeste',25578,'RO','NORTE','15834732000154',NULL,NULL,NULL,'',NULL,0.641,-11.92830000,-61.99530000),(1702208,'Araguatins',34392,'TO','CENTRO-OESTE','01237403000111',NULL,NULL,NULL,NULL,NULL,0.631,-5.64659000,-48.12320000),(2100600,'Amarante do Maranhão',40378,'MA','NORDESTE','06157846000116',NULL,NULL,NULL,NULL,NULL,0.555,-5.56913000,-46.74730000),(3129509,'Ibiá',24784,'MG','SUDESTE','18584961000156',NULL,NULL,NULL,NULL,NULL,0.718,-19.47490000,-46.54740000);
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `natureza_despesa`
--

DROP TABLE IF EXISTS `natureza_despesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `natureza_despesa` (
  `cod_natureza_despesa` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cod_natureza_despesa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `natureza_despesa`
--

LOCK TABLES `natureza_despesa` WRITE;
/*!40000 ALTER TABLE `natureza_despesa` DISABLE KEYS */;
INSERT INTO `natureza_despesa` VALUES (339039,'Serviços e Operação assistida e Capacitação'),(449039,'Software'),(449051,'Obras e Instalação'),(449052,'valor equip. sem instalação');
/*!40000 ALTER TABLE `natureza_despesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otb`
--

DROP TABLE IF EXISTS `otb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `otb` (
  `cod_otb` int(11) NOT NULL,
  `dt_pgto` date DEFAULT NULL,
  PRIMARY KEY (`cod_otb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otb`
--

LOCK TABLES `otb` WRITE;
/*!40000 ALTER TABLE `otb` DISABLE KEYS */;
/*!40000 ALTER TABLE `otb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pid`
--

DROP TABLE IF EXISTS `pid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pid` (
  `cod_pid` int(11) NOT NULL AUTO_INCREMENT,
  `cod_ibge` int(7) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `inep` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`cod_pid`),
  KEY `fk_pid_municipio1_idx` (`cod_ibge`),
  CONSTRAINT `fk_pid_municipio1` FOREIGN KEY (`cod_ibge`) REFERENCES `municipio` (`cod_ibge`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pid`
--

LOCK TABLES `pid` WRITE;
/*!40000 ALTER TABLE `pid` DISABLE KEYS */;
/*!40000 ALTER TABLE `pid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pid_tipologia`
--

DROP TABLE IF EXISTS `pid_tipologia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pid_tipologia` (
  `cod_pid` int(11) NOT NULL,
  `cod_tipologia` int(11) NOT NULL,
  PRIMARY KEY (`cod_pid`,`cod_tipologia`),
  KEY `fk_ponto_has_tipologia_tipologia1_idx` (`cod_tipologia`),
  KEY `fk_ponto_tipologia_pid1_idx` (`cod_pid`),
  CONSTRAINT `fk_ponto_has_tipologia_tipologia1` FOREIGN KEY (`cod_tipologia`) REFERENCES `tipologia` (`cod_tipologia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ponto_tipologia_pid1` FOREIGN KEY (`cod_pid`) REFERENCES `pid` (`cod_pid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pid_tipologia`
--

LOCK TABLES `pid_tipologia` WRITE;
/*!40000 ALTER TABLE `pid_tipologia` DISABLE KEYS */;
/*!40000 ALTER TABLE `pid_tipologia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ponto`
--

DROP TABLE IF EXISTS `ponto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ponto` (
  `cod_ponto` int(11) NOT NULL,
  `cod_categoria` int(11) NOT NULL,
  `cod_ibge` int(7) NOT NULL,
  `cod_pid` int(11) NOT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `complemento` varchar(1000) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cep` char(8) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(10,8) DEFAULT NULL,
  PRIMARY KEY (`cod_ponto`,`cod_categoria`,`cod_ibge`),
  KEY `fk_ponto_categoria1_idx` (`cod_categoria`),
  KEY `fk_ponto_cd1_idx` (`cod_ibge`),
  KEY `fk_ponto_pid1_idx` (`cod_pid`),
  CONSTRAINT `fk_ponto_categoria1` FOREIGN KEY (`cod_categoria`) REFERENCES `categoria` (`cod_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ponto_cd1` FOREIGN KEY (`cod_ibge`) REFERENCES `cd` (`cod_ibge`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ponto_pid1` FOREIGN KEY (`cod_pid`) REFERENCES `pid` (`cod_pid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ponto`
--

LOCK TABLES `ponto` WRITE;
/*!40000 ALTER TABLE `ponto` DISABLE KEYS */;
/*!40000 ALTER TABLE `ponto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ponto_has_usuario`
--

DROP TABLE IF EXISTS `ponto_has_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ponto_has_usuario` (
  `ponto_cod_ponto` int(11) NOT NULL,
  `ponto_categoria_cod_categoria` int(11) NOT NULL,
  `usuario_cod_usuario` int(11) NOT NULL,
  `usuario_perfil_cod_perfil` int(11) NOT NULL,
  PRIMARY KEY (`ponto_cod_ponto`,`ponto_categoria_cod_categoria`,`usuario_cod_usuario`,`usuario_perfil_cod_perfil`),
  KEY `fk_ponto_has_usuario_usuario1_idx` (`usuario_cod_usuario`,`usuario_perfil_cod_perfil`),
  CONSTRAINT `fk_ponto_has_usuario_usuario1` FOREIGN KEY (`usuario_cod_usuario`) REFERENCES `usuario` (`cod_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ponto_has_usuario`
--

LOCK TABLES `ponto_has_usuario` WRITE;
/*!40000 ALTER TABLE `ponto_has_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `ponto_has_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prefeitos`
--

DROP TABLE IF EXISTS `prefeitos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prefeitos` (
  `cod_prefeito` int(11) NOT NULL AUTO_INCREMENT,
  `cod_ibge` int(7) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `partido` varchar(45) DEFAULT NULL,
  `exercicio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_prefeito`),
  KEY `fk_prefeitos_municipio1_idx` (`cod_ibge`),
  CONSTRAINT `fk_prefeitos_municipio1` FOREIGN KEY (`cod_ibge`) REFERENCES `municipio` (`cod_ibge`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prefeitos`
--

LOCK TABLES `prefeitos` WRITE;
/*!40000 ALTER TABLE `prefeitos` DISABLE KEYS */;
/*!40000 ALTER TABLE `prefeitos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `previsao_empenho`
--

DROP TABLE IF EXISTS `previsao_empenho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `previsao_empenho` (
  `cod_previsao_empenho` int(11) NOT NULL AUTO_INCREMENT,
  `cod_lote` int(11) NOT NULL,
  `cod_natureza_despesa` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `tipo` char(1) DEFAULT NULL,
  `ano_referencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_previsao_empenho`),
  KEY `fk_empenho_lote1_idx` (`cod_lote`),
  KEY `fk_previsao_empenho_natureza_despesa1_idx` (`cod_natureza_despesa`),
  CONSTRAINT `fk_empenho_lote10` FOREIGN KEY (`cod_lote`) REFERENCES `lote` (`cod_lote`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_previsao_empenho_natureza_despesa1` FOREIGN KEY (`cod_natureza_despesa`) REFERENCES `natureza_despesa` (`cod_natureza_despesa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `previsao_empenho`
--

LOCK TABLES `previsao_empenho` WRITE;
/*!40000 ALTER TABLE `previsao_empenho` DISABLE KEYS */;
/*!40000 ALTER TABLE `previsao_empenho` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cidades_digitais_db`.`insere_itens_previsao_empenho` AFTER INSERT ON `previsao_empenho` FOR EACH ROW
BEGIN
	insert into itens_previsao_empenho (cod_previsao_empenho, cod_item, cod_tipo_item, cod_lote)
	(select previsao_empenho.cod_previsao_empenho, lote_itens.cod_item, lote_itens.cod_tipo_item, lote_itens.cod_lote
    from previsao_empenho, lote_itens
    inner join itens on (lote_itens.cod_item = itens.cod_item and lote_itens.cod_tipo_item = itens.cod_tipo_item) 
    where previsao_empenho.cod_previsao_empenho = (select last_insert_id(new.cod_previsao_empenho)) and lote_itens.cod_lote = previsao_empenho.cod_lote and itens.cod_natureza_despesa = previsao_empenho.cod_natureza_despesa);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `processo`
--

DROP TABLE IF EXISTS `processo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processo` (
  `cod_processo` char(17) NOT NULL,
  `cod_ibge` int(7) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_processo`,`cod_ibge`),
  KEY `fk_processo_cd1_idx` (`cod_ibge`),
  CONSTRAINT `fk_processo_cd1` FOREIGN KEY (`cod_ibge`) REFERENCES `cd` (`cod_ibge`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processo`
--

LOCK TABLES `processo` WRITE;
/*!40000 ALTER TABLE `processo` DISABLE KEYS */;
/*!40000 ALTER TABLE `processo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reajuste`
--

DROP TABLE IF EXISTS `reajuste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reajuste` (
  `ano_ref` int(11) NOT NULL,
  `cod_lote` int(11) NOT NULL,
  `percentual` float DEFAULT NULL,
  PRIMARY KEY (`ano_ref`,`cod_lote`),
  KEY `fk_reajuste_lote1_idx` (`cod_lote`),
  CONSTRAINT `fk_reajuste_lote1` FOREIGN KEY (`cod_lote`) REFERENCES `lote` (`cod_lote`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reajuste`
--

LOCK TABLES `reajuste` WRITE;
/*!40000 ALTER TABLE `reajuste` DISABLE KEYS */;
/*!40000 ALTER TABLE `reajuste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone`
--

DROP TABLE IF EXISTS `telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefone` (
  `cod_telefone` int(11) NOT NULL AUTO_INCREMENT,
  `cod_contato` int(11) NOT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cod_telefone`),
  KEY `fk_telefone_contato1_idx` (`cod_contato`),
  CONSTRAINT `fk_telefone_contato1` FOREIGN KEY (`cod_contato`) REFERENCES `contato` (`cod_contato`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone`
--

LOCK TABLES `telefone` WRITE;
/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_item`
--

DROP TABLE IF EXISTS `tipo_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_item` (
  `cod_tipo_item` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cod_tipo_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_item`
--

LOCK TABLES `tipo_item` WRITE;
/*!40000 ALTER TABLE `tipo_item` DISABLE KEYS */;
INSERT INTO `tipo_item` VALUES (1,'Ponto de Enlace e Acesso Social (PEAS)'),(2,'Solução de Gerenciamento de Infraestrutura (SGI)'),(3,'	Ponto de Acesso de Governo (PAG)'),(4,'	Ponto de Conexão de Governo (PCG)'),(5,'	Ponto de Acesso Público (PAP)'),(6,'	Postes'),(7,'	Fibra Óptica Área Instalada por km (FOA)'),(8,'	Fibra Óptica Enterrada por km – Solo não Pavimentado (FONPV)'),(9,'	Fibra Óptica Enterrada por km – Solo Pavimento (FOPV)'),(10,' Fibra Óptica Enterrada por km – Paralelepípedo (FOPR)'),(11,' Fibra Óptica de Acesso/Drop por km – Pavimento (FDROP)'),(12,' Operação Assistida - AO'),(13,' Transferência de Tecnologia - TT');
/*!40000 ALTER TABLE `tipo_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipologia`
--

DROP TABLE IF EXISTS `tipologia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipologia` (
  `cod_tipologia` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_tipologia`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipologia`
--

LOCK TABLES `tipologia` WRITE;
/*!40000 ALTER TABLE `tipologia` DISABLE KEYS */;
INSERT INTO `tipologia` VALUES (1,'ESCOLA'),(2,'TELECENTRO'),(3,'CRAS'),(4,'POSTO DE FRONTEIRA'),(5,'QUILOMBOLA'),(6,'ASSENTAMENTO'),(7,'TELECENTRO_BR'),(8,'BIBLIOTECA'),(9,'PESCADORES'),(10,'RESEX'),(11,'INDÍGENA'),(12,'PESQUISA'),(13,'UND DE SAÚDE'),(14,'PONTO DE CULTURA'),(15,'UNID DE SAÚDE');
/*!40000 ALTER TABLE `tipologia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uacom`
--

DROP TABLE IF EXISTS `uacom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uacom` (
  `cod_ibge` int(7) NOT NULL,
  `data` datetime NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `relato` text,
  PRIMARY KEY (`cod_ibge`,`data`),
  KEY `fk_uacom_cd1_idx` (`cod_ibge`),
  CONSTRAINT `fk_uacom_cd1` FOREIGN KEY (`cod_ibge`) REFERENCES `cd` (`cod_ibge`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uacom`
--

LOCK TABLES `uacom` WRITE;
/*!40000 ALTER TABLE `uacom` DISABLE KEYS */;
/*!40000 ALTER TABLE `uacom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uacom_assunto`
--

DROP TABLE IF EXISTS `uacom_assunto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uacom_assunto` (
  `cod_ibge` int(7) NOT NULL,
  `data` datetime NOT NULL,
  `cod_assunto` int(11) NOT NULL,
  PRIMARY KEY (`cod_ibge`,`data`,`cod_assunto`),
  KEY `fk_uacom_has_assunto_assunto1_idx` (`cod_assunto`),
  KEY `fk_uacom_has_assunto_uacom1_idx` (`cod_ibge`,`data`),
  CONSTRAINT `fk_uacom_has_assunto_assunto1` FOREIGN KEY (`cod_assunto`) REFERENCES `assunto` (`cod_assunto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_uacom_has_assunto_uacom1` FOREIGN KEY (`cod_ibge`, `data`) REFERENCES `uacom` (`cod_ibge`, `data`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uacom_assunto`
--

LOCK TABLES `uacom_assunto` WRITE;
/*!40000 ALTER TABLE `uacom_assunto` DISABLE KEYS */;
/*!40000 ALTER TABLE `uacom_assunto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `cod_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_modulo`
--

DROP TABLE IF EXISTS `usuario_modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_modulo` (
  `cod_usuario` int(11) NOT NULL,
  `cod_modulo` int(11) NOT NULL,
  PRIMARY KEY (`cod_usuario`,`cod_modulo`),
  KEY `fk_usuario_has_modulo_modulo1_idx` (`cod_modulo`),
  KEY `fk_usuario_has_modulo_usuario1_idx` (`cod_usuario`),
  CONSTRAINT `fk_usuario_has_modulo_modulo1` FOREIGN KEY (`cod_modulo`) REFERENCES `modulo` (`cod_modulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_modulo_usuario1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_modulo`
--

LOCK TABLES `usuario_modulo` WRITE;
/*!40000 ALTER TABLE `usuario_modulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cidades_digitais_db'
--

--
-- Dumping routines for database 'cidades_digitais_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-08 14:17:43
