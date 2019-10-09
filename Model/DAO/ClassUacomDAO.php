<?php

require_once 'Conexao.php';
class ClassUacomDAO {
        
    public function cadastrar(ClassUacom $cadastrarUacom) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "INSERT INTO uacom (cod_ibge, data, titulo, relato) values (?,?,?,?)";
            $stmt = $pdo->prepare($sql);
            
			$stmt->bindValue(1, $cadastrarUacom->getCod_ibge());
			$stmt->bindValue(2, $cadastrarUacom->getData());
            $stmt->bindValue(3, $cadastrarUacom->getTitulo());
            $stmt->bindValue(4, $cadastrarUacom->getRelato());
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }
    
    public function listarUacom(){
        try {
            $pdo = Conexao::getInstance();
            $sql = "SELECT cod_ibge, data, titulo, relato FROM uacom ORDER BY cod_ibge ASC";
            $stmt = $pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(); // fetchAll() retorna um array contendo varios dados. 
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }

    // apagar registro pelo id
    public function apagarUacom(ClassUacom $apagarUacom) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "DELETE FROM uacom WHERE cod_ibge = ?";
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(1, $apagarUacom->getCod_ibge());
           
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }
    public function todosCd(){
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

}
