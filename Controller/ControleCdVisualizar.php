<?php

require_once '../Model/ClassCd.php';
require_once '../Model/DAO/ClassCdDAO.php';

$cod_ibge = @$_GET['cod_ibge'];
$cod_lote = @$_GET['cod_lote'];


$visualizarCd = new ClassCd();
$visualizarCd->setCod_ibge($cod_ibge);
$visualizarCd->setCod_lote($cod_lote);

$ver = new ClassCdDAO();
$dados = $ver->visualizarCd($visualizarCd);

if($dados) { 
    $array_dados = $dados[0];
    
   
var_dump($dados);
die();
} else {
    $_SESSION['msg'] = '
        <div class="alert alert-danger" role="alert">
            Erro! Não foi possível visualizar os dados.
        </div>';
    header('Location:../View/Cd.php');
}