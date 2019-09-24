<?php
/**
 * Description of ClassProcesso
 *
 * @author Carol
 */

class ClassProcesso {
    private $cod_processo, $cod_ibge, $descricao;
                  
    function getCod_processo() {
        return $this->cod_processo;
    }

    function getCod_ibge() {
        return $this->cod_ibge;
    }

    function getDescricao() {
        return $this->descricao;
    }    
    

    function setCod_processo($cod_processo) {
        $this->cod_processo = $cod_processo;
    }

    function setDescricao($descricao) {
        $this->descricao = $descricao;
    }
    
}
