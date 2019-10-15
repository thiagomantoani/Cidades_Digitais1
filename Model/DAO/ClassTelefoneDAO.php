<?php
require_once 'Conexao.php';
class ClassTelefoneDAO {

    public function cadastrar(ClassTelefone $cadastrarTelefone) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "INSERT INTO telefone (cod_telefone, cod_contato, telefone, tipo) values (?,?,?,?)";
            $stmt = $pdo->prepare($sql);
            
           
			$stmt->bindValue(1, $cadastrarTelefone->getCod_telefone());
            $stmt->bindValue(2, $cadastrarTelefone->getCod_contato());
            $stmt->bindValue(3, $cadastrarTelefone->getTelefone());
			$stmt->bindValue(4, $cadastrarTelefone->getTipo());

            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }
    
    public function listarTelefone(){
        try {
            $pdo = Conexao::getInstance();
            $sql = "SELECT cod_telefone, cod_contato, telefone, tipo FROM telefone ORDER BY cod_telefone ASC";
            $stmt = $pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(); // fetchAll() retorna um array contendo varios dados. 
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }

    // apagar registro pelo id
    public function apagarTelefone(ClassTelefone $apagarTelefone) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "DELETE FROM telefone WHERE cod_telefone = ?";
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(1, $apagarTelefone->getCod_telefone());
           
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }

}
