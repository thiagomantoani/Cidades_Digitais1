<?php

require_once 'Conexao.php';
class ClassMunicipioDAO {
    
    public function cadastrar(ClassMunicipio $cadastrarMunicipio) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "INSERT INTO municipio (cod_ibge, nome_municipio, populacao, uf, regiao, cnpj, dist_capital, endereco, numero, complemento, bairro, idhm, latitude, longitude) values (?,?, ?, ?,?,?,?,?,?,?,?,?,?,?)";
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(1, $cadastrarMunicipio->getCod_ibge());
            $stmt->bindValue(2, $cadastrarMunicipio->getNome_municipio());
            $stmt->bindValue(3, $cadastrarMunicipio->getPopulacao());
            $stmt->bindValue(4, $cadastrarMunicipio->getUf());
            $stmt->bindValue(5, $cadastrarMunicipio->getRegiao());
            $stmt->bindValue(6, $cadastrarMunicipio->getCnpj());
            $stmt->bindValue(7, $cadastrarMunicipio->getDist_capital());
            $stmt->bindValue(8, $cadastrarMunicipio->getEndereco());
            $stmt->bindValue(9, $cadastrarMunicipio->getNumero());
            $stmt->bindValue(10, $cadastrarMunicipio->getComplemento());
            $stmt->bindValue(11, $cadastrarMunicipio->getBairro());
            $stmt->bindValue(12, $cadastrarMunicipio->getIdhm());
            $stmt->bindValue(13, $cadastrarMunicipio->getLatitude());
            $stmt->bindValue(14, $cadastrarMunicipio->getLongitude());
           
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }
    
    public function listarMunicipios(){
        try {
            $pdo = Conexao::getInstance();
            $sql = "SELECT cod_ibge, nome_municipio, populacao, uf, regiao, cnpj, dist_capital, endereco, numero, complemento, bairro, idhm, latitude, longitude FROM municipio ORDER BY nome_municipio ASC";
            $stmt = $pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(); // fetchAll() retorna um array contendo varios dados. 
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }

    /**
     * Buscar todos os municipios para exibir em tabelas que precisa
     * do codigo ibge, ou seja tabela de relacionamento com municipio
     */
    public function todosMunicipios(){
        try {
            $pdo = Conexao::getInstance();
            $sql = "SELECT cod_ibge, nome_municipio FROM municipio ORDER BY nome_municipio ASC";
            $stmt = $pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(); // fetchAll() retorna um array contendo varios dados. 
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }

    // apagar registro pelo id
    public function apagarMunicipio(ClassMunicipio $apagarMunicipio) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "DELETE FROM municipio WHERE cod_ibge = ?";
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(1, $apagarMunicipio->getCod_ibge());
           
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }

}
