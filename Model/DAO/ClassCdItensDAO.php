<?php

require_once 'Conexao.php';
class ClassCdItensDAO {
    public function update(ClassCditens $editarCdItens) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "UPDATE cd_itens SET cod_item = ?, cod_tipo_item = ?, quantidade_previsto = ?, quantidade_projeto_executivo = ?, quantidade_termo_instalacao = ? WHERE cod_ibge = ? ";
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(1, $editarCdItens->getCod_item ());
            $stmt->bindValue(2, $editarCdItens->getCod_tipo_item());
            $stmt->bindValue(3, $editarCdItens->getQuantidade_previsto());
            $stmt->bindValue(4, $editarCdItens->getQuantidade_projeto_executivo());
            $stmt->bindValue(5, $editarCdItens->getQuantidade_termo_instalacao());

            $stmt->bindValue(6, $editarCdItens->getCod_ibge());
           
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }
    
    public function listarCdItens(){
        try {
            $pdo = Conexao::getInstance();
            $sql = "SELECT cod_ibge,cod_item,cod_tipo_item,quantidade_previsto,quantidade_projeto_executivo,quantidade_termo_instalacao FROM cd_itens ORDER BY cod_ibge ASC";
            $stmt = $pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(); // fetchAll() retorna um array contendo varios dados. 
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }


}