<?php
/** Description of ClassProcessoDAO
 * @author Carol */

require_once 'Conexao.php';
class ClassProcessoDAO {

    public function cadastrar(ClassProcesso $cadastrarProcesso) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "INSERT INTO processo (cod_processo, cod_ibge, descricao) values (?,?,?)";
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(1, $cadastrarProcesso->getCod_processo());
            $stmt->bindValue(2, $cadastrarProcesso->getCod_ibge());
            $stmt->bindValue(3, $cadastrarProcesso->getDescricao());
           
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }
    
    public function listarProcesso(){
        try {
            $pdo = Conexao::getInstance();
            $sql = "SELECT cod_processo, cod_ibge, descricao FROM processo ORDER BY cod_processo ASC";
            $stmt = $pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(); // fetchAll() retorna um array contendo varios dados. 
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }

    // apagar registro pelo id
    public function apagarProcesso(ClassProcesso $apagarProcesso) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "DELETE FROM processo WHERE cod_processo = ?";
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(1, $apagarProcesso->getCod_processo());
           
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }

}
