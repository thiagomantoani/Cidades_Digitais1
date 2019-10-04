<?php
/**
 * Description of ClassEtapa
 * @author LUIS
 */
require_once 'Conexao.php';
class ClassCdDAO {

    public function cadastrar(ClassCd $cadastrarCd) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "INSERT INTO cd (cod_ibge,cod_lote,os_pe,data_pe,os_imp,data_imp) values (?,?,?,?,?,?)";
            $stmt = $pdo->prepare($sql);
            
			$stmt->bindValue(1, $cadastrarCd->getCod_ibge());
			$stmt->bindValue(2, $cadastrarCd->getCod_lote());
            $stmt->bindValue(3, $cadastrarCd->getOs_pe());
            $stmt->bindValue(4, $cadastrarCd->getData_pe());
            $stmt->bindValue(5, $cadastrarCd->getOs_imp());
			$stmt->bindValue(6, $cadastrarCd->getdata_imp());

            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }
    
    public function listarCd(){
        try {
            $pdo = Conexao::getInstance();
            $sql = "SELECT cod_ibge,cod_lote,os_pe,data_pe,os_imp,data_imp FROM cd ORDER BY cod_ibge ASC";
            $stmt = $pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(); // fetchAll() retorna um array contendo varios dados. 
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }

    // apagar registro pelo id
    public function apagarCd(ClassCd $apagarCd) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "DELETE FROM cd WHERE cod_ibge = ?";
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(1, $apagarCd->getCod_ibge());
           
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }



    public function todosCd(){
        try {
            $pdo = Conexao::getInstance();
            $sql = "SELECT cd.cod_ibge, municipio.nome_municipio FROM cd 
            INNER JOIN municipio ON cd.cod_ibge = municipio.cod_ibge
            ORDER BY nome_municipio ASC;";
            $stmt = $pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(); // fetchAll() retorna um array contendo varios dados. 
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }

}