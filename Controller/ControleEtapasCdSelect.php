<?php

require_once '../Model/DAO/ClassEtapasDAO.php';


$buscarEtapas = new ClassEtapaDAO(); // instanciando um objeto
$selectEtapas = $buscarEtapas->todosEtapas(); // chamando metodo para buscar todos os usuários do banco

if($selectEtapas) { // se existir algum municipio no banco então passar o array de selectEtapas para a variavel $array_selectMunicipios
    $array_selectEtapas = $selectEtapas;
} else {
    // se não receber nenhum dado do banco de selectEtapas, então defirnir um array vazio para variavel $array_selectEtapas
    $array_selectEtapas = [];
}