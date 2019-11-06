<?php

class ClassMunicipio {
    private $cod_categoria,$cod_ibge, $cod_ponto,$cod_pid, $nome,$endereco, $numero, $complemento, $bairro, $cep, $latitude, $longitude;
                  
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

    
    
    function setNome_municipio($nome_municipio) {
        $this->nome_municipio = $nome_municipio;
    }
    function setNome_municipio($nome_municipio) {
        $this->nome_municipio = $nome_municipio;
    }
    function setCod_ibge($cod_ibge) {
        $this->cod_ibge = $cod_ibge;
    }
    function setPopulacao($email) {
        $this->email = $email;
    }
    function setUf($uf) {
        $this->uf = $uf;
    }
    function setRegiao($regiao) {
        $this->regiao = $regiao;
    }
    function setCnpj($cnpj) {
        $this->cnpj = $cnpj;
    }
    function setDist_capital($dist_capital) {
        $this->dist_capital = $dist_capital;
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
    function setIdhm($idhm) {
        $this->idhm = str_replace(',','.',$idhm);
    }
    function setLatitude($latitude) {
        $this->latitude = str_replace(',','.',$latitude);
    }
    function setLongitude($longitude) {
        $this->longitude = str_replace(',' , '.',$longitude);
    }
    
}
