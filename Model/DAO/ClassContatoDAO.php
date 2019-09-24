<?php
/**
 * Description of ClassContato
 * @author Carol
 */
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
            $stmt->bindValue(1, $apagarAssunto->getCod_contato());
           
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }

}
