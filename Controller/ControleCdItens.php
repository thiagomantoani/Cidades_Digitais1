<?php
session_start();
require_once '../Model/ClassCdItens.php';
require_once '../Model/DAO/ClassCdItensDAO.php';




$novoCdItens = new ClassCdItens();
$novoCdItens->setCod_ibge($cod_ibge);
$novoCdItens->setCod_item($cod_item);
$novoCdItens->setCod_tipo_item($cod_tipo_item);
$novoCdItens->setQuantidade_previsto($quantidade_previsto);
$novoCdItens->setQuantidade_projeto_executivo($quantidade_projeto_executivo);
$novoCdItens->setQuantidade_termo_instalacao($quantidade_termo_instalacao);



$classCdItensDAO = new ClassCdItensDAO();
$cditens = $classCdItensDAO->cadastrar($novoCdItens);

var_dump($cditens);
die();

if($cditens == TRUE){
    $_SESSION['msg'] = '
        <div class="alert alert-success" role="alert">
            Cadastro realizado com sucesso!
        </div>
    ';
    header('Location:../View/CdItens.php');
} else {
    $_SESSION['msg'] = '
        <div class="alert alert-danger" role="alert">
            Erro! Cadastro não realizado . '.$cditens.'
        </div>
    ';
    header('Location:../View/CdItens.php');
}

