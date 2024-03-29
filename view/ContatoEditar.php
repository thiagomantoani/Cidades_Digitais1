<?php
    // Cabeçalho
    include_once("_cabecalho.php");

    // Buscar todos os cadastros no banco
    require_once("../Controller/ControleContatoVizualizar.php");
    // $array_dados
    ?>
    
    <!-- Conteudo -->
    <main id="main_conteudo">

        <div class="row mb-5">
          <div id="mainHeader" class="col-md-6 d-flex align-items-center">
            <span id="mainHeaderIcon">
            <i class="fas fa-globe-asia"></i>
            </span>
            <span>
              <h3 class="mb-0">Editar Contato</h3>
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
          <form action="../Controller/ControleContatoEditar.php" method="post">

            <div class="modal-body">

                  <!-- Chave primaria para saber qual registro editar do banco | input hidden para que o usuario não visualize -->
                  <input name="cod_contato" type="hidden" value="<?php echo $cod_contato ?>"/>

                <div class="form-group col-md-12">
                    <label for="recipient-cnpj" class="col-form-label">CNPJ</label>
                        <select name="cnpj" class="form-control" id="recipient-cnpj">
                            <option value="">Selecionar Entidade</option>
                            <option value="0" selected >Em branco</option>
                            <?php 
                                foreach($array_selectEntidade as $chave => $valor){
                                ?>
                                <option value="<?= $valor['cnpj'] ?>"><?= $valor['nome'] ?></option>
                                <?php 
                                }
                            ?>
                        </select>
                </div>

                <div class="form-group col-md-12">
                    <label for="recipient-cod_ibge" class="col-form-label">Código IBGE:</label>
                    <select name="cod_ibge" class="form-control" id="recipient-cod_ibge">
                      <option value="">Selecionar Município</option>
                      <option value="0" selected>Em branco</option>
                      <?php 
                        foreach($array_selectCd as $chave => $valor){
                        ?>
                        <option value="<?= $valor['cod_ibge'] ?>"><?= $valor['nome_municipio'] ?></option>
                        <?php 
                        }
                      ?>
                    </select>
                </div>

                <div class="form-group col-md-12">
                    <label for="recipient-nome" class="col-form-label">Nome:</label>
                    <input 
                      name="nome"
                      placeholder=""
                      type="text" 
                      class="form-control"
                      ]maxlength="50"
                      id="recipient-nome">
                </div>

                <div class="form-group col-md-12">
                    <label for="recipient-email" class="col-form-label">Email:</label>
                    <input 
                      name="email"
                      placeholder=""
                      type="text" 
                      class="form-control"
                      ]maxlength="100"
                      id="recipient-email">
                </div>

                <div class="form-group col-md-12">
                    <label for="recipient-funcao" class="col-form-label">Função:</label>
                    <input 
                      name="funcao"
                      placeholder=""
                      type="text" 
                      class="form-control"
                      ]maxlength="45"
                      id="recipient-funcao">
                </div>

                </div>

            </div>

            <div class="modal-footer">
              <a href="<?php echo URL ?>View/Contato.php" class="btn btn-secondary">Cancelar</a>
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
    <div class="modal fade cadastrar-contato-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myContatoModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          
          <div class="modal-header">
            <h5 class="modal-title" id="myContatoModalLabel">
              <i class="far fa-plus-square"></i>
              Cadastrar Contato
            </h5>
          </div>

          <!-- FORMULARIO -->
          <form action="../Controller/ControleContatoEditar.php" method="post">

            <div class="modal-body">
            <div class="form-group col-md-12">
                    <label for="recipient-cnpj" class="col-form-label">CNPJ</label>
                        <select name="cnpj" class="form-control" id="recipient-cnpj">
                            <option value="">Selecionar Entidade</option>
                            <option value="0" selected >Em branco</option>
                            <?php 
                                foreach($array_selectEntidade as $chave => $valor){
                                ?>
                                <option value="<?= $valor['cnpj'] ?>"><?= $valor['nome'] ?></option>
                                <?php 
                                }
                            ?>
                        </select>
                </div>

                <div class="form-group col-md-12">
                    <label for="recipient-cod_ibge" class="col-form-label">Código IBGE:</label>
                    <select name="cod_ibge" class="form-control" id="recipient-cod_ibge">
                      <option value="">Selecionar Município</option>
                      <option value="0" selected>Em branco</option>
                      <?php 
                        foreach($array_selectCd as $chave => $valor){
                        ?>
                        <option value="<?= $valor['cod_ibge'] ?>"><?= $valor['nome_municipio'] ?></option>
                        <?php 
                        }
                      ?>
                    </select>
                </div>

                <div class="form-group col-md-12">
                    <label for="recipient-nome" class="col-form-label">Nome:</label>
                    <input 
                      name="nome"
                      placeholder=""
                      type="text" 
                      class="form-control"
                      ]maxlength="50"
                      id="recipient-nome">
                </div>

                <div class="form-group col-md-12">
                    <label for="recipient-email" class="col-form-label">Email:</label>
                    <input 
                      name="email"
                      placeholder=""
                      type="text" 
                      class="form-control"
                      ]maxlength="100"
                      id="recipient-email">
                </div>

                <div class="form-group col-md-12">
                    <label for="recipient-funcao" class="col-form-label">Função:</label>
                    <input 
                      name="funcao"
                      placeholder=""
                      type="text" 
                      class="form-control"
                      ]maxlength="45"
                      id="recipient-funcao">
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