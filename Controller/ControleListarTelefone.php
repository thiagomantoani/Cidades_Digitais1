<?php
require_once '../Model/DAO/ClasstelefoneDAO.php';
$listar = new ClassTelefoneDAO();
$dados = $listar->listarTelefone();

if($dados) {
        $array_dados = $dados;
} else {
      $array_dados = [];
}