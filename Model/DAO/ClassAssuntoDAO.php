<?php
/**
 * Description of ClassAssunto
 * @author Carol
 */
require_once 'Conexao.php';
class ClassAssuntoDAO {
  //  var_dump($cadastrarAssunto);
    //die();
    public function cadastrar(ClassAssunto $cadastrarAssunto) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "INSERT INTO assunto (cod_assunto, descricao) values (?,?)";
            $stmt = $pdo->prepare($sql);
            
			$stmt->bindValue(1, $cadastrarAssunto->getCod_assunto());
			$stmt->bindValue(2, $cadastrarAssunto->getDescricao());

            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }
    
    public function listarAssunto(){
        try {
            $pdo = Conexao::getInstance();
            $sql = "SELECT cod_assunto, descricao FROM assunto ORDER BY cod_assunto ASC";
            $stmt = $pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(); // fetchAll() retorna um array contendo varios dados. 
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }

    // apagar registro pelo id
    public function apagarAssunto(ClassAssunto $apagarAssunto) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "DELETE FROM assunto WHERE cod_assunto = ?";
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(1, $apagarAssunto->getCod_assunto());
           
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }

}
