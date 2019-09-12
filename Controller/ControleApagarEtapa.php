<?php
session_start();

$cod_etapa = @$_GET["cod_etapa"]; // id unico da tabela, chave primaria

if (empty($cod_etapa)) {
	header('Location:../View/EtapaCd.php');
}

require_once '../Model/ClassEtapa.php';
require_once '../Model/DAO/ClassEtapaDAO.php';
$apagarEttapa = new ClassEtapaDAO(); // instanciando um objeto
$ettapa = new ClassEtapa();
$ettapa->setCod_etapa($cod_etapa);

$resultado = $apagarEttapa->apagarEttapa($ettapa); // chamando metodo para listar todos os usuários do banco

if($resultado) { // se existir algum municipio no banco então passar o array de dados para a variavel $array_dados
    $_SESSION['msg'] = '
        <div class="alert alert-success" role="alert">
            Registro apagado com sucesso!
        </div>
    ';
    header('Location:../View/EtapaCd.php');
} else {
    // se não receber nenhum dado do banco de dados, então definir um array vazio para variavel $array_dados
	$_SESSION['msg'] = '
		<div class="alert alert-danger" role="alert">
			Erro! Não foi possível apagar o registro.
		</div>
	';
    header('Location:../View/EtapaCd.php');
}