<?php

require_once 'Conexao.php';
class ClassCdItensDAO {


    
    public function cadastrar(ClassCdItens $cadastrarCdItens) {
        try {
            $pdo = Conexao::getInstance();
            $sql = "INSERT INTO cd_itens (cod_ibge,cod_item,cod_tipo_item,quantidade_previsto,quantidade_projeto_executivo,quantidade_termo_instalacao) values (?,?,?,?,?,?)";
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(1, $cadastrarCdItens->getCod_ibge());
            $stmt->bindValue(2, $cadastrarCdItens->getCod_item ());
            $stmt->bindValue(3, $cadastrarCdItens->getCod_tipo_item());
            $stmt->bindValue(4, $cadastrarCdItens->getQuantidade_previsto());
            $stmt->bindValue(5, $cadastrarCdItens->getQuantidade_projeto_executivo());
            $stmt->bindValue(6, $cadastrarCdItens->getQuantidade_termo_instalacao());
           
            $stmt->execute();
            return TRUE;
        } catch (PDOException $exc) {
            echo $exc->getMessage();
        }
    }


    public function update(ClassCdItens $editarCdItens) {
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
            $sql = "SELECT 
            municipio.nome_municipio, 
            CONCAT (itens.cod_tipo_item, '.', itens.cod_item, ' - ', itens.descricao) AS descricao, 
            cd_itens.*
            FROM cd_itens 
            INNER JOIN municipio ON cd_itens.cod_ibge = municipio.cod_ibge
            INNER JOIN itens ON cd_itens.cod_item = itens.cod_item AND cd_itens.cod_tipo_item = itens.cod_tipo_item
            ORDER BY municipio.nome_municipio ASC";
            $stmt = $pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll();
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }

    public function visualizarCdItens(ClassCdItens $visualizarCdItens){
        try {
            $pdo = Conexao::getInstance();
            $sql = "SELECT cod_ibge,cod_item,cod_tipo_item,quantidade_previsto,quantidade_projeto_executivo,quantidade_termo_instalacao 
            FROM cd_itens 
            WHERE cod_ibge = ? 
            LIMIT 1";
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(1, $visualizarCdItens->getCod_ibge());
            $stmt->execute();
            return $stmt->fetchAll();
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }


}