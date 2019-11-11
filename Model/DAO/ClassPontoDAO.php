<?php

require_once 'Conexao.php';
class ClassPontoDAO {
    
    public function cadastrar(ClassPonto $cadastrarPonto) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "INSERT INTO ponto (cod_ponto, cod_categoria, cod_ibge, cod_pid,endereco, numero, complemento, bairro, cep, latitude, longitude) values (?,?,?,?,?,?,?,?,?,?,?)";
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(1, $cadastrarPonto->getCod_ponto());
            $stmt->bindValue(2, $cadastrarPonto->getCod_categoria());
            $stmt->bindValue(3, $cadastrarPonto->getCod_ibge());
            $stmt->bindValue(4, $cadastrarPonto->getCod_pid());
            $stmt->bindValue(5, $cadastrarPonto->getEndereco());
            $stmt->bindValue(6, $cadastrarPonto->getNumero());
            $stmt->bindValue(7, $cadastrarPonto->getComplemento());
            $stmt->bindValue(8, $cadastrarPonto->getBairro());
            $stmt->bindValue(9, $cadastrarPonto->getCep());
            $stmt->bindValue(10, $cadastrarPonto->getLatitude());
            $stmt->bindValue(11, $cadastrarPonto->getLongitude());
           
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }

    public function update(ClassPonto $editarPonto) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "UPDATE ponto SET cod_categoria = ?, cod_ibge = ?, cod_pid = ?, endereco =? , numero = ?, complemento = ?, bairro = ?, cep = ?, latitude = ?, longitude = ? WHERE cod_ponto = ? ";
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(1, $editarPonto->getCod_categoria());
            $stmt->bindValue(2, $editarPonto->getCod_ibge());
            $stmt->bindValue(3, $editarPonto->getCod_pid());
            $stmt->bindValue(4, $editarPonto->getEndereco());
            $stmt->bindValue(5, $editarPonto->getNumero());
            $stmt->bindValue(6, $editarPonto->getComplemento());
            $stmt->bindValue(7, $editarPonto->getBairro());
            $stmt->bindValue(8, $editarPonto->getCep());
            $stmt->bindValue(9, $editarPonto->getLatitude());
            $stmt->bindValue(10, $editarPonto->getLongitude());

            $stmt->bindValue(11, $editarPonto->getCod_ponto());
           
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }
    
    public function listarPonto(){
        try {
            $pdo = Conexao::getInstance();
            $sql = "SELECT cod_ponto, cod_categoria, cod_ibge, cod_pid, endereco, numero, complemento, bairro, cep, latitude, longitude
            FROM ponto ORDER BY cod_ponto ASC";
            $stmt = $pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(); 
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }

    public function visualizarPonto(ClassPonto $visualizarPonto){
        try {
            $pdo = Conexao::getInstance();

            $sql = "SELECT cod_ponto, cod_categoria, cod_ibge, cod_pid, endereco, numero, complemento, bairro, cep, latitude, longitude 
            FROM ponto 
            WHERE cod_ponto = ? 
            LIMIT 1";

            $stmt = $pdo->prepare($sql);

            $stmt->bindValue(1, $visualizarPonto->getCod_ponto());

            $stmt->execute();
            return $stmt->fetchAll(); // fetchAll() retorna um array contendo varios dados. 
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }


    // apagar registro pelo id
    public function apagarPonto(ClassPonto $apagarPonto) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "DELETE FROM ponto WHERE cod_ponto = ?";
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(1, $apagarPonto->getCod_ponto());
           
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }

}
