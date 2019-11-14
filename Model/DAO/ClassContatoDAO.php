<?php

require_once 'Conexao.php';
class ClassContatoDAO {
   // var_dump($cadastrarContato);
    //die();
    public function cadastrar(ClassContato $cadastrarContato) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "INSERT INTO contato (cod_contato, cnpj, cod_ibge, nome, email, funcao) values (?,?,?,?,?,?)";
            $stmt = $pdo->prepare($sql);
            
			$stmt->bindValue(1, $cadastrarContato->getCod_contato());
            $stmt->bindValue(2, $cadastrarContato->getCnpj());
            $stmt->bindValue(3, $cadastrarContato->getCod_ibge());
            $stmt->bindValue(4, $cadastrarContato->getNome());
            $stmt->bindValue(5, $cadastrarContato->getEmail());
            $stmt->bindValue(6, $cadastrarContato->getFuncao());

            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }
    
    public function listarContato(){
        try {
            $pdo = Conexao::getInstance();
            $sql = "SELECT cod_contato, cnpj, cod_ibge, nome, email, funcao FROM contato ORDER BY cod_contato ASC";
            $stmt = $pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(); // fetchAll() retorna um array contendo varios dados. 
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }

    // apagar registro pelo id
    public function apagarContato(ClassContato $apagarContato) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "DELETE FROM contato WHERE cod_contato = ?";
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(1, $apagarContato->getCod_contato());
           
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }

    public function todosContato(){
        try {
            $pdo = Conexao::getInstance();
            $sql = "SELECT cod_contato, nome FROM contato ORDER BY nome ASC";
            $stmt = $pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(); // fetchAll() retorna um array contendo varios dados. 
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }

    public function visualizarcontato(ClassContato $visualizarContato){
        try {
            $pdo = Conexao::getInstance();

            $sql = "SELECT cod_contato, cnpj, cod_ibge, nome, email, funcao 
            FROM contato 
            WHERE cod_contato = ? 
            LIMIT 1";

            $stmt = $pdo->prepare($sql);

            $stmt->bindValue(1, $visualizarContato->getCod_contato());

            $stmt->execute();
            return $stmt->fetchAll(); // fetchAll() retorna um array contendo varios dados. 
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }

    public function update(ClassContato $editarContato) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "UPDATE contato SET cnpj = ?, cod_ibge = ?, nome = ?, email = ?, funcao = ?
            WHERE cod_contato = ? ";
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(1, $editarContato->getCnpj());
            $stmt->bindValue(2, $editarContato->getCod_ibge());
            $stmt->bindValue(3, $editarContato->getNome());
            $stmt->bindValue(4, $editarContato->getEmail());
            $stmt->bindValue(5, $editarContato->getFuncao());

            $stmt->bindValue(6, $editarContato->getCod_contato());
           
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }
}
