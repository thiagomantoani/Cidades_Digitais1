<?php
/** Description of ClassLoteDAO
 * @author Carol */

require_once 'Conexao.php';
class ClassLoteDAO {

    public function cadastrar(ClassLote $cadastrarLote) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "INSERT INTO lote (cod_lote, cnpj, contrato,dt_inicio_vig,dt_fim_vig,dt_reajuste) values (?,?,?,?,?,?)";
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(1, $cadastrarLote->getCod_Lote());
            $stmt->bindValue(2, $cadastrarLote->getCnpj());
            $stmt->bindValue(3, $cadastrarLote->getContrato());
            $stmt->bindValue(4, $cadastrarLote->getDt_inicio_vig());
            $stmt->bindValue(5, $cadastrarLote->getDt_fim_vig());
            $stmt->bindValue(6, $cadastrarLote->getDt_reajuste());
           
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }
    
    public function listarLote(){
        try {
            $pdo = Conexao::getInstance();
            $sql = "SELECT cod_lote, cnpj, contrato,dt_inicio_vig,dt_fim_vig,dt_reajuste FROM lote ORDER BY contrato ASC";
            $stmt = $pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(); // fetchAll() retorna um array contendo varios dados. 
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }

    // apagar registro pelo id
    public function apagarLote(ClassLote $apagarLote) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "DELETE FROM lote WHERE cod_lote = ?";
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(1, $apagarLote->getCod_lote());
           
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }

}