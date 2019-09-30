<?php
/**
 * Description of ClassMunicipioDAO
 * @author Carol
 */
require_once 'Conexao.php';
class ClassEtapasDAO {

    public function cadastrar(ClassEtapas $cadastrarEtapas) {
        try {
            $pdo = Conexao::getInstance(); // so cria  a conexao
            $sql = "INSERT INTO etapas_cd (cod_ibge, cod_etapa, dt_inicio, dt_fim, responsavel) values (?,?,?,?,?)";
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(1, $cadastrarEtapas->getCod_ibge()); // leva e tráz, pega os dados da aplicação e leva para ao banco de dados
            $stmt->bindValue(2, $cadastrarEtapas->getCod_etapa());
            $stmt->bindValue(3, $cadastrarEtapas->getDt_inicio());
            $stmt->bindValue(4, $cadastrarEtapas->getDt_fim());
            $stmt->bindValue(5, $cadastrarEtapas->getResponsavel());
           
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }
    
    public function listarEtapas(){
        try {
            $pdo = Conexao::getInstance();
            $sql = "SELECT cod_ibge, cod_etapa, dt_inicio, dt_fim, responsavel FROM etapas_cd ORDER BY cod_etapa ASC";
            $stmt = $pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(); // fetchAll() retorna um array contendo varios dados. 
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }

    public function todosMunicipios(){
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


    // apagar registro pelo id
    public function apagarEtapa(ClassEtapas $apagarEtapa) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "DELETE FROM etapas_cd WHERE cod_ibge = ?";
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(1, $apagarEtapa->getCod_ibge());
           
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }

}
