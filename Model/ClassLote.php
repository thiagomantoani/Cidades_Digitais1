<?php
/**
 * Description of ClassLote
 * @author Carol
 */

class ClassLote {
    private $cod_lote, $cnpj, $contrato, $dt_inicio_vig, $dt_fim_vig, $dt_reajuste;
                  
    function getCod_lote() {
        return $this->cod_lote;
    }

    function getCnpj() {
        return $this->cnpj;
    }

    function getContrato() {
        return $this->contrato;
    }
    function getDt_inicio_vig() {
        return $this->dt_inicio_vig;
    }
    function getDt_fim_vig() {
        return $this->dt_fim_vig;
    }
    function getDt_reajuste() {
        return $this->dt_reajuste;
    }   
    

    function setCod_lote($cod_lote) {
        $this->cod_lote = $cod_lote;
    }
    function setCnpj($cnpj) {
        $this->cnpj = $cnpj;
    }
    function setContrato($contrato) {
        $this->contrato = $contrato;
    }
    function setDt_inicio_vig($dt_inicio_vig) {
        $this->dt_inicio_vig = $dt_inicio_vig;
    }
    function setDt_inicio_vig($dt_inicio_vig) {
        $this->dt_inicio_vig = $dt_inicio_vig;
    }
	function setDt_reajuste($dt_reajuste) {
        $this->dt_reajuste = $dt_reajuste;
    }
}