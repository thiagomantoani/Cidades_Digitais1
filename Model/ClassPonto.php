<?php

class ClassPonto {
    private $cod_ponto, $cod_categoria, $cod_ibge, $cod_pid, $nome,$endereco, $numero, $complemento, $bairro, $cep, $latitude, $longitude;
                  
    function getCod_Ponto() {
        return $this->cod_ponto;
    }
    function getCod_categoria() {
        return $this->cod_categoria;
    }
    function getCod_ibge() {
        return $this->cod_ibge;
    }
    function getCod_pid() {
        return $this->cod_pid;
    }
    function getNome() {
        return $this->nome;
    }
    function getEndereco() {
        return $this->endereco;
    }
    function getNumero() {
        return $this->numero;
    }
    function getComplemento() {
        return $this->complemento;
    }
    function getBairro() {
        return $this->bairro;
    }
    function getCep() {
        return $this->cep;
    }
    function getLatitude() {
        return $this->latitude;
    }
    function getLongitude() {
        return $this->longitude;
    }

    
    
    function setCod_ponto($cod_ponto) {
        $this->cod_ponto = $cod_ponto;
    }
    function setCod_categoria($cod_categoria) {
        $this->cod_categoria = $cod_categoria;
    }
    function setCod_ibge($cod_ibge) {
        $this->cod_ibge = $cod_ibge;
    }
    function setNome($nome) {
        $this->nome = $nome;
    }
    function setEndereco($endereco) {
        $this->endereco = $endereco;
    }
    function setNumero($numero) {
        $this->numero = $numero;
    }
    function setComplemento($complemento) {
        $this->complemento = $complemento;
    }
    function setBairro($bairro) {
        $this->bairro = $bairro;
    }
    function setCep($cep) {
        $this->cep = $cep;
    }
    function setLatitude($latitude) {
        $this->latitude = $latitude;
    }
    function setLongitude($longitude) {
        $this->longitude = $longitude;
    }
}
