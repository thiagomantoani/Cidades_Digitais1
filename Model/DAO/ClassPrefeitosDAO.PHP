<?php

/**
 * Description of ClassMunicipioDAO
 *
 * @author Carol
 */
require_once 'Conexao.php';
class ClassPrefeitosDAO {

    public function cadastrar(ClassPrefeitos $cadastrarPrefeitos) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "INSERT INTO prefeitos (cod_prefeito,cod_ibge,nome,cpf,rg,partido,exercicio) values (?,?, ?, ?,?,?,?)";
			$stmt = $pdo->prepare($sql);
			$stmt->bindValue(1, $cadastrarPrefeitos->getCod_prefeito());
            $stmt->bindValue(2, $cadastrarPrefeitos->getCod_ibge());
			$stmt->bindValue(3, $cadastrarPrefeitos->getNome());
			$stmt->bindValue(4, $cadastrarPrefeitos->getCpf());
			$stmt->bindValue(5, $cadastrarPrefeitos->getRg());
			$stmt->bindValue(6, $cadastrarPrefeitos->getPartido());
			$stmt->bindValue(7, $cadastrarPrefeitos->getExercicio());
           
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }
    //
    public function listarPrefeitos(){
        try {
            $pdo = Conexao::getInstance();
            $sql = "SELECT cod_prefeito,cod_ibge,nome,cpf,rg,partido,exercicio FROM prefeitos ORDER BY nome ASC";
            $stmt = $pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(); // fetchAll() retorna um array contendo varios dados. 
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }

    // apagar registro pelo id
    public function apagarPrefeitos(ClassPrefeitos $apagarPrefeitos) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "DELETE FROM prefeitos WHERE cod_prefeito = ?";
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(1, $apagarPrefeitos->getCod_prefeito());
           
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }

}