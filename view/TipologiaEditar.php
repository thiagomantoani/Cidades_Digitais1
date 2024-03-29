<?php
    include_once("_cabecalho.php");
    require_once("../Controller/ControleTipologiaVisualizar.php");

    ?>
    
    <main id="main_conteudo">

        <div class="row mb-5">
          <div id="mainHeader" class="col-md-6 d-flex align-items-center">
            <span>
              <h3 class="mb-0">Editar Tipologia</h3>
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
          <form action="../Controller/ControleTipologiaEditar.php" method="post">

            <div class="modal-body">

                  <!-- Chave primaria para saber qual registro editar do banco | input hidden para que o usuario não visualize -->
                  <input name="cod_tipologia" type="hidden" value="<?php echo $cod_tipologia ?>"/>

                  <div class="form-group col-md-12">
                    <label for="recipient-cod_tipologia" class="col-form-label">Código Tipologia:</label>
                    <input disabled 
                      value="<?php echo $cod_tipologia ?>"
                      placeholder=""
                      type="text" 
                      class="form-control"
                      maxlength="255" 
                      id="recipient-cod_tipologia">
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


                </div>

            </div>

            <div class="modal-footer">
              <a href="<?php echo URL ?>View/Tipologia.php" class="btn btn-secondary">Cancelar</a>
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
    <div class="modal fade cadastrar-tipologia-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myTipologiaModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          
          <div class="modal-header">
            <h5 class="modal-title" id="myTipologiaModalLabel">
              <i class="far fa-plus-square"></i>
              Cadastrar Tipologia
            </h5>
          </div>

          <!-- FORMULARIO -->
          <form action="../Controller/ControleTipologiaEditar.php" method="post">

            <div class="modal-body">

              
                
                <div class="form-group col-md-12">
                    <label for="recipient-descricao" class="col-form-label">Descrição Tipologia:</label>
                    <input 
                      name="descricao"
                      placeholder=""
                      type="text" 
                      class="form-control"
                      ]maxlength="45"
                      id="recipient-descricao">
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