<?php
  // Cabeçalho
  include_once("_cabecalho.php");

  // Buscar todos os cadastros no banco
  require_once("../Controller/ControleListarLote.php");
  // $array_dados
  ?>
  
  <!-- Conteudo -->
  <main id="main">

      <div class="row mb-5">
        <div id="mainHeader" class="col-md-6 d-flex align-items-center">
          <span id="mainHeaderIcon">
          <i class="fas fa-globe-asia"></i>
          </span>
          <span>
            <h3 class="mb-0">Lote</h3>
            <small>Descrição</small>
          </span>
        </div>
        <div class="col-md-6 text-right">
          <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".cadastrar-lote-modal-lg">
            <i class="far fa-plus-square"></i>
            Cadastrar
          </button>
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

        <div class="row">
          <div class="col-12">
            <!-- Exibir lista de dados em tabela -->
            <div class="table-responsive">
              <table class="table">
                <thead>
                  <tr>
                    <th scope="col"></th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                    <th scope="col">Ações</th>
                  </tr>
                </thead>
                <tbody>
                <?php
                //var_dump($array_dados);
                //die();
                  foreach ($array_dados as $key => $value) {
                      ?>
                      <tr>
                        <td><?php echo $value['cod_lote'] ?></td>
                        <td><?php echo $value['cnpj'] ?></td>
                        <td><?php echo $value['contrato'] ?></td>
                        <td><?php echo $value['dt_inicio_vig '] ?></td>
                        <td><?php echo $value['dt_final_vig'] ?></td>
                        <td><?php echo $value['dt_reajuste '] ?></td>
                        <td> 
                          <span class="d-flex">
                            <button type="button" class="btn btn-warning mr-1">Editar</button> 
                            <button onclick="apagarDados('<?php echo URL ?>Controller/ControleApagarLote.php?cod_lote=<?php echo $value['cod_lote'] ?>')" class="btn btn-danger">Excluir</button> 
                          </span>
                        </td>

                      </tr>
                      <?php
                  }
                ?>
                </tbody>
              </table>
            </div>
          </div>
        </div>

      </div>

  </main>

  <!-- Modal de Cadastro -->
  <div class="modal fade cadastrar-lotes-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLotesModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        
        <div class="modal-header">
          <h5 class="modal-title" id="myLotesModalLabel">
            <i class="far fa-plus-square"></i>
            Cadastrar Lote
          </h5>
        </div>

        <!-- FORMULARIO -->
        <form action="../Controller/ControleLote.php" method="post">

          <div class="modal-body">

            <!-- Input cod_lote -->
            <div class="form-row">
              <div class="form-group col-md-12">
                <label for="recipient-cod_lote" class="col-form-label">Código lote:</label>
                <input name="cod_lote"placeholder=""type="number" class="form-control"maxlength="7"id="recipient-cod_lote">
              </div>
              <div class="form-group col-md-12">
                <label for="recipient-cnpj" class="col-form-label">Cnpj:</label>
                <input name="cnpj"placeholder=""type="number"class="form-control"maxlength="11" id="recipient-cnpj">
              </div>

              <div class="form-group col-md-12">
                <label for="recipient-Contratacao" class="col-form-label">Contratação:</label>
                <input name="Contratacao"placeholder=""type="text"class="form-control"maxlength=""id="recipient-Contratacao">
              </div>

              <div class="form-group col-md-12">
                <label for="recipient-dt_inicio_vig" class="col-form-label">data inicio:</label>
                <input name="dt_inicio_vig"placeholder=""type="date"class="form-control"maxlength="2"id="recipient-dt_inicio_vig">
              </div>

              <div class="form-group col-md-12">
                <label for="recipient-dt_final_vig" class="col-form-label">Data fim:</label>
                <input name="dt_final_vig"placeholder=""type="date"class="form-control"maxlength="15"id="recipient-dt_final_vig">
              </div>

              <div class="form-group col-md-12">
                <label for="recipient-dt_reajuste" class="col-form-label">Data Reajuste:</label>
                <input name="dt_reajuste"placeholder=""type="date"class="form-control"maxlength="14"id="recipient-dt_reajuste">
              </div>
            </div>

            <div class="modal-footer">
              <button class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
              <button type="submit" class="btn btn-primary">
                Cadastrar
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
<?php
    // Rodape
    include_once('_rodape.php');
?>