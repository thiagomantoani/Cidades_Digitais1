<?php

require_once 'Conexao.php';
class ClassPidDAO {
        
    public function cadastrar(ClassPid $cadastrarPid) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "INSERT INTO pid (cod_pid, cod_ibge, nome, inep) values (?,?,?,?)";
            $stmt = $pdo->prepare($sql);
			$stmt->bindValue(1, $cadastrarPid->getCod_pid());
			$stmt->bindValue(2, $cadastrarPid->getCod_ibge());
            $stmt->bindValue(3, $cadastrarPid->getNome());
            $stmt->bindValue(4, $cadastrarPid->getInep());
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }

    
    public function listarPid(){
        try {
            $pdo = Conexao::getInstance();
            $sql = "SELECT cod_pid, cod_ibge, nome, inep FROM pid ORDER BY cod_pid ASC";
            $stmt = $pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(); 
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }


    public function update(ClassPid $editarPid) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "UPDATE pid SET cod_ibge = ?, nome = ?, inep = ? WHERE cod_pid = ? ";
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(1, $editarPid->getCod_ibge());
            $stmt->bindValue(2, $editarPid->getnome());
            $stmt->bindValue(3, $editarPid->getInep());

            $stmt->bindValue(4, $editarPid->getCod_pid());
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }



    public function visualizarPid(ClassPid $visualizarPid){
        try {
            $pdo = Conexao::getInstance();

            $sql = "SELECT cod_pid, cod_ibge, nome, inep
            FROM pid 
            WHERE cod_pid = ? 
            LIMIT 1";
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(1, $visualizarPid->getCod_pid());
            $stmt->execute();
            return $stmt->fetchAll();
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }
    

    public function apagarPid(ClassPid $apagarPid) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "DELETE FROM pid WHERE cod_pid = ?";
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(1, $apagarPid->getCod_pid());
           
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }
    public function todosPid(){
        try {
            $pdo = Conexao::getInstance();
            $sql = "SELECT cod_pid, nome FROM pid ORDER BY cod_pid ASC";
            $stmt = $pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(); // fetchAll() retorna um array contendo varios dados. 
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }

}