<?php
session_start();

$cod_pid = @$_GET["cod_pid"]; 

if (empty($cod_pid)) {
	header('Location:../View/Pid.php');
}

require_once '../Model/ClassPid.php';
require_once '../Model/DAO/ClassPidDAO.php';
$apagarPid = new ClassPidDAO();
$pid = new ClassPid();
$pid->setCod_pid($cod_pid);

$resultado = $apagarPid->apagarPid($pid); 

if($resultado) { 
    $_SESSION['msg'] = '
        <div class="alert alert-success" role="alert">
            Registro apagado com sucesso!
        </div>
    ';
    header('Location:../View/Pid.php');
} else {
  
	$_SESSION['msg'] = '
		<div class="alert alert-danger" role="alert">
			Erro! Não foi possível apagar registro.
		</div>
	';
    header('Location:../View/Pid.php');
}