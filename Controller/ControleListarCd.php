<?php

require_once '../Model/DAO/ClassCdDAO.php';


$listar = new ClassCdDAO(); // instanciando um objeto
$dados = $listar->listarCd(); // chamando metodo para listar todos os usuários do banco

if($dados) { // se existir algum Cd no banco então passar o array de dados para a variavel $array_dados
    $array_dados = $dados;
} else {
    // se não receber nenhum dado do banco de dados, então definir um array vazio para variavel $array_dados
    $array_dados = [];
}