<?php

require_once 'Conexao.php';
class ClassLoteItensDAO {

    public function update(ClassLoteItens $editarLoteItens) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "UPDATE lote_itens SET cod_item = ?, cod_tipo_item = ?, preco = ? WHERE cod_lote = ? ";
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(1, $editarLoteItens->getCod_item ());
            $stmt->bindValue(2, $editarLoteItens->getCod_tipo_item());
            $stmt->bindValue(3, $editarLoteItens->getPreco());
            

            $stmt->bindValue(4, $editarLoteItens->getCod_lote());
           
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }
    
    public function listarLoteItens(){
        try {
            $pdo = Conexao::getInstance();
            $sql = "SELECT 
            lote.cod_lote, 
            CONCAT (itens.cod_tipo_item, '.', itens.cod_item, ' - ', itens.descricao) AS descricao, 
            lote_itens.*
            FROM lote_itens 
            INNER JOIN lote ON lote_itens.cod_lote = lote.cod_lote
            INNER JOIN itens ON lote_itens.cod_item = itens.cod_item AND lote_itens.cod_tipo_item = itens.cod_tipo_item
            ORDER BY lote.cod_lote ASC";
            $stmt = $pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll();
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }

    public function visualizarLoteItens(ClassLoteItens $visualizarLoteItens){
        try {
            $pdo = Conexao::getInstance();
            $sql = "SELECT cod_lote,cod_item,cod_tipo_item,preco 
            FROM lote_itens 
            WHERE cod_lote = ? 
            LIMIT 1";
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(1, $visualizarLoteItens->getCod_lote());
            $stmt->execute();
            return $stmt->fetchAll();
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }


}