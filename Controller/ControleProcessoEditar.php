<?php
session_start();
require_once '../Model/ClassProcesso.php';
require_once '../Model/DAO/ClassProcessoDAO.php';



$cod_processo = @$_POST['cod_processo'];
$cod_ibge = @$_POST['cod_ibge'];
$descricao = @$_POST['descricao'];


$novoProcesso = new ClassProcesso();
$novoProcesso->setCod_processo($cod_processo);
$novoProcesso->setCod_ibge($cod_ibge);
$novoProcesso->setDescricao($descricao);



$classProcessoDAO = new ClassProcessoDAO();
$processo = $classProcessoDAO->update($novoProcesso);

//var_dump($processo);
//die();

if($processo == TRUE){
    $_SESSION['msg'] = '
        <div class="alert alert-success" role="alert">
            Editado com sucesso!
        </div>
    ';
    header('Location:../View/Processo.php');
} else {
    $_SESSION['msg'] = '
        <div class="alert alert-danger" role="alert">
            Erro! Não foi possível atualizar os dados . '.$processo.'
        </div>
    ';
    header('Location:../View/Processo.php');
}

