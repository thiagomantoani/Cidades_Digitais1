<?php

require_once '../Model/ClassCdItens.php';
require_once '../Model/DAO/ClassCdItensDAO.php';

$cod_ibge = @$_GET['cod_ibge'];

$visualizarCdItens = new ClassCdItens();
$visualizarCdItens->setCod_ibge($cod_ibge);

$ver = new ClassCdItensDAO(); 
$dados = $ver->visualizarCdItens($visualizarCdItens); 

if($dados) { 
    $array_dados = $dados[0];
    
    //var_dump($array_dados);
    //die;
} else {
    $_SESSION['msg'] = '
        <div class="alert alert-danger" role="alert">
            Erro! Não foi possível visualizar o municipio.
        </div>
    ';
    header('Location:../View/CdItens.php');
}