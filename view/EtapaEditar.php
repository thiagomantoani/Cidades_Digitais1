<?php
    // Cabeçalho
    include_once("_cabecalho.php");

    // Buscar todos os cadastros no banco
    require_once("../Controller/ControleEtapaVisualizar.php");
    // $array_dados
    ?>
    
    <!-- Conteudo -->
    <main id="main_conteudo">

        <div class="row mb-5">
          <div id="mainHeader" class="col-md-6 d-flex align-items-center">
            <span>
              <h3 class="mb-0">Editar Etapa</h3>
            </span>
          </div>
 
        </div>

        <div class="container">

            <?php
                // Se a variavél de sessão existir, exibir a informação ela contem
                if(isset($_SESSION['msg'])) {
                    echo $_SESSION['msg']; // Exibir conteudo da variavel
                    unset($_SESSION['msg']); // após exibir a informação do alerta, destruir a variavel, para que ao recarregar a página o alerta não permanessa na pagina.
                }
            ?>

          <?php 
            if(!empty($array_dados)){

              extract($array_dados);
          ?>

          <!-- FORMULARIO -->
          <form action="../Controller/ControleEtapaEditar.php" method="post">

            <div class="modal-body">

                  <!-- Chave primaria para saber qual registro editar do banco | input hidden para que o usuario não visualize -->
                  <input name="cod_etapa" type="hidden" value="<?php echo $cod_etapa ?>"/>

                  <div class="form-group col-md-12">
                    <label for="recipient-cod_etapa" class="col-form-label">Cód. Etapa:</label>
                    <input 
                      value="<?php echo $cod_etapa ?>"
                      placeholder=""
                      type="text" 
                      class="form-control"
                      maxlength="14"
                      id="recipient-cod_etapa">
                  </div>
                  
                  <div class="form-group col-md-12">
                    <label for="recipient-descricao" class="col-form-label">Descrição:</label>
                    <input 
                      value="<?php echo $descricao ?>"
                      name="descricao"
                      placeholder=""
                      type="text" 
                      class="form-control"
                      maxlength="45"
                      id="recipient-descricao">
                  </div>
                    

                  <div class="form-group col-md-12">
                    <label for="recipient-duracao" class="col-form-label">Duração:</label>
                    <input 
                      value="<?php echo $duracao ?>"
                      name="duracao"
                      placeholder=""
                      type="number" 
                      class="form-control"
                      maxlength=""
                      id="recipient-duracao">
                  </div>

                  <div class="form-group col-md-12">
                    <label for="recipient-numero" class="col-form-label">Número:</label>
                    <input 
                      value="<?php echo $numero ?>"
                      name="text"
                      placeholder=""
                      type="text" 
                      class="form-control"
                      maxlength="10"
                      id="recipient-numero">
                  </div>

                  <div class="form-group col-md-12">
                    <label for="recipient-bairro" class="col-form-label">Bairro:</label>
                    <input 
                      value="<?php echo $bairro ?>"
                      name="bairro"
                      placeholder=""
                      type="text" 
                      class="form-control"
                      maxlength="100"
                      id="recipient-bairro">
                  </div>

                  <div class="form-group col-md-12">
                    <label for="recipient-cep" class="col-form-label">Cep:</label>
                    <input 
                      value="<?php echo $cep ?>"
                      name="cep"
                      placeholder=""
                      type="text" 
                      class="form-control"
                      maxlength="8"
                      id="recipient-cep">
                  </div>

                  <div class="form-group col-md-12">
                    <label for="recipient-nome_municipio" class="col-form-label">Nome Município:</label>
                    <input 
                      value="<?php echo $nome_municipio ?>"
                      name="nome_municipio"
                      placeholder=""
                      type="text" 
                      class="form-control"
                      maxlength="50"
                      id="recipient-nome_municipio">
                  </div>

                  <div class="form-group col-md-12">
                    <label for="recipient-uf" class="col-form-label">UF:</label>
                    <input 
                      value="<?php echo $uf ?>"
                      name="uf"
                      placeholder=""
                      type="text" 
                      class="form-control"
                      maxlength="2"
                      id="recipient-uf">
                  </div>

                  <div class="form-group col-md-12">
                    <label for="recipient-observacao" class="col-form-label">Observação:</label>
                    <input 
                      value="<?php echo $observacao ?>"
                      name="observacao"
                      placeholder=""
                      type="text" 
                      class="form-control"
                      maxlength="1000"
                      id="recipient-observacao">
                  </div>

                </div>

            </div>

            <div class="modal-footer">
              <a href="<?php echo URL ?>View/Entidade.php" class="btn btn-secondary">Cancelar</a>
              <button type="submit" class="btn btn-primary">
                Salvar
              </button>
            </div>

          </form>

          <?php 
            } // fim do if para verificar se existe dados para editar
          ?>

        </div>

    </main>





    <!-- Modal de Cadastro -->
    <div class="modal fade cadastrar-entidade-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myEntidadeModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          
          <div class="modal-header">
            <h5 class="modal-title" id="myEntidadeModalLabel">
              <i class="far fa-plus-square"></i>
              Cadastrar Entidade
            </h5>
          </div>

          <!-- FORMULARIO -->
          <form action="../Controller/ControleEntidadeEditar.php" method="post">

            <div class="modal-body">
            <div class="form-group col-md-12">
                    <label for="recipient-cnpj" class="col-form-label">CNPJ:</label>
                    <input 
                      name="cnpj"
                      placeholder=""
                      type="text" 
                      class="form-control"
                      maxlength="14" 
                      id="recipient-cnpj">
                  </div>
                  
                  <div class="form-group col-md-12">
                    <label for="recipient-nome" class="col-form-label">Nome:</label>
                    <input 
                      name="nome"
                      placeholder=""
                      type="text" 
                      class="form-control"
                      maxlength="50" 
                      id="recipient-nome">
                  </div>
                    

                  <div class="form-group col-md-12">
                    <label for="recipient-endereco" class="col-form-label">Endereço:</label>
                    <input 
                      name="endereco"
                      placeholder=""
                      type="text" 
                      class="form-control"
                      maxlength="100" 
                      id="recipient-endereco">
                  </div>

                  <div class="form-group col-md-12">
                    <label for="recipient-depende" class="col-form-label">Número:</label>
                    <input 
                      name="depende"
                      placeholder=""
                      type="number" 
                      class="form-control"
                      maxlength="" 
                      id="recipient-depende">
                  </div>

                  <div class="form-group col-md-12">
                    <label for="recipient-delay" class="col-form-label">Delay:</label>
                    <input 
                      name="delay"
                      placeholder=""
                      type="number" 
                      class="form-control"
                      maxlength="" 
                      id="recipient-delay">
                  </div>

                  <div class="form-group col-md-12">
                    <label for="recipient-setor_resp" class="col-form-label">Setor Resp.:</label>
                    <input 
                      name="setor_resp"
                      placeholder=""
                      type="text" 
                      class="form-control"
                      maxlength="45" 
                      id="recipient-setor_resp">
                  </div>
                </div>

            </div>

            <div class="modal-footer">
              <button class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
              <button type="submit" class="btn btn-primary">
                Cadastrar
              </button>
            </div>

          </form>

        
        </div>
      </div>
    </div>

    <?php
    // Rodape
    include_once('_rodape.php');
?>