<?php

require_once 'Conexao.php';
class ClassPontoDAO {
    
    public function cadastrar(ClassPonto $cadastrarPonto) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "INSERT INTO ponto (cod_ponto, cod_categoria, cod_ibge, cod_pid, nome,endereco, numero, complemento, bairro, cep, latitude, longitude) values (?,?,?,?,?,?,?,?,?,?,?,?)";
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(1, $cadastrarPonto->getCod_ponto());
            $stmt->bindValue(2, $cadastrarPonto->getCod_categoria());
            $stmt->bindValue(3, $cadastrarPonto->getCod_ibge());
            $stmt->bindValue(4, $cadastrarPonto->getCod_pid());
            $stmt->bindValue(5, $cadastrarPonto->getNome());
            $stmt->bindValue(6, $cadastrarPonto->getCnpj());
            $stmt->bindValue(7, $cadastrarPonto->getDist_capital());
            $stmt->bindValue(8, $cadastrarPonto->getEndereco());
            $stmt->bindValue(9, $cadastrarPonto->getNumero());
            $stmt->bindValue(10, $cadastrarPonto->getComplemento());
            $stmt->bindValue(11, $cadastrarPonto->getBairro());
            $stmt->bindValue(12, $cadastrarPonto->getCep());
            $stmt->bindValue(13, $cadastrarPonto->getLatitude());
            $stmt->bindValue(14, $cadastrarPonto->getLongitude());
           
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }

    public function update(ClassPonto $editarPonto) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "UPDATE ponto SET cod_categoria = ?, cod_ibge = ?, cod_pid = ?, regiao = ?, cnpj = ?, dist_capital = ?, endereco =? , numero = ?, complemento = ?, bairro = ?, idhm = ?, latitude = ?, longitude = ? WHERE cod_ibge = ? ";
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(1, $editarMunicipio->getNome_municipio());
            $stmt->bindValue(2, $editarMunicipio->getPopulacao());
            $stmt->bindValue(3, $editarMunicipio->getUf());
            $stmt->bindValue(4, $editarMunicipio->getRegiao());
            $stmt->bindValue(5, $editarMunicipio->getCnpj());
            $stmt->bindValue(6, $editarMunicipio->getDist_capital());
            $stmt->bindValue(7, $editarMunicipio->getEndereco());
            $stmt->bindValue(8, $editarMunicipio->getNumero());
            $stmt->bindValue(9, $editarMunicipio->getComplemento());
            $stmt->bindValue(10, $editarMunicipio->getBairro());
            $stmt->bindValue(11, $editarMunicipio->getIdhm());
            $stmt->bindValue(12, $editarMunicipio->getLatitude());
            $stmt->bindValue(13, $editarMunicipio->getLongitude());

            $stmt->bindValue(14, $editarMunicipio->getCod_ibge());
           
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }
    
    public function listarPonto(){
        try {
            $pdo = Conexao::getInstance();
            $sql = "SELECT cod_ibge, nome_municipio, populacao, uf, regiao, cnpj, dist_capital, endereco, numero, complemento, bairro, idhm, latitude, longitude FROM municipio ORDER BY nome_municipio ASC";
            $stmt = $pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(); 
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }

    public function visualizarMunicipio(ClassMunicipio $visualizarMunicipio){
        try {
            $pdo = Conexao::getInstance();

            $sql = "SELECT cod_ibge, nome_municipio, populacao, uf, regiao, cnpj, dist_capital, endereco, numero, complemento, bairro, idhm, latitude, longitude 
            FROM municipio 
            WHERE cod_ibge = ? 
            LIMIT 1";

            $stmt = $pdo->prepare($sql);

            $stmt->bindValue(1, $visualizarMunicipio->getCod_ibge());

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
