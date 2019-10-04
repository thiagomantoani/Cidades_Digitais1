<?php

require_once '../Model/DAO/ClassContatoDAO.php';


$buscarContato = new ClassContatoDAO(); // instanciando um objeto
$selectContato = $buscarContato->todosContato(); // chamando metodo para buscar todos os usuários do banco

if($selectContato) { // se existir algum municipio no banco então passar o array de selectContato para a variavel $array_selectContato
    $array_selectContato = $selectContato;
} else {
    // se não receber nenhum dado do banco de selectContato, então defirnir um array vazio para variavel $array_selectContato
    $array_selectContato = [];
}