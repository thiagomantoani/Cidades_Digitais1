<?php
    // Cabeçalho
    include_once("_cabecalho.php");

    // Buscar todos os cadastros no banco
    require_once("../Controller/ControleListarCdItens.php");
    // $array_dados
    require_once("../Controller/ControleMunicipioSelect.php");
    require_once("../Controller/ControleLoteSelect.php");
    ?>
    
    <!-- Conteudo -->
    <main id="main">
        <div class="row mb-5">
          <div id="mainHeader" class="col-md-6 d-flex align-items-center">
            <span id="mainHeaderIcon">
                <i class="fas fa-globe-asia"></i>
            </span>
            <span>
            <h3 class="mb-0">Cd Itens</h3>
            </span>
            </div>
            <div class="col-md-6 text-right">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".cadastrar-CdItens-modal-lg">
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
                      <th scope="col">Código IBGE</th>
                      <th scope="col">Código Item</th>
                      <th scope="col">Código Tipo Item </th>
                      <th scope="col">Quantidade Previsto</th>
                      <th scope="col">Quantidade Projeto Executivo</th>
                      <th scope="col">Quantidade Termo Instalação</th>
                      <th scope="col">Ação</th>
                    </tr>
                  </thead>
                  <tbody>
                  <?php
                  //svar_dump($array_dados);
                  //die();
                    foreach($array_dados as $key => $value) {
                        ?>
                        <tr>
                          <td><?php echo $value['cod_ibge'] ?></td>
                          <td><?php echo $value['cod_item'] ?></td>
                          <td><?php echo $value['cod_tipo_item'] ?></td>
                          <td><?php echo $value['quantidade_previsto'] ?></td>
                          <td><?php echo $value['quantidade_projeto_executivo'] ?></td>
                          <td><?php echo $value['quantidade_termo_instalacao'] ?></td>
                          <td> 
                            <span class="d-flex">
                              <button type="button" class="btn btn-warning mr-1">Editar</button> 
                              <button onclick="apagarDados('<?php echo URL ?>Controller/ControleApagarCdItens.php?cod_ibge=<?php echo $value['cod_ibge'] ?>')" class="btn btn-danger">Excluir</button> 
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
    <div class="modal fade cadastrar-CdItens-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myCdItensModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="myCdItensModalLabel">
              <i class="far fa-plus-square"></i>
              Cadastrar CD itens
            </h5>
          </div>

          <!-- FORMULARIO -->
          <form action="../Controller/ControleCdItens.php" method="post">

            <div class="modal-body">

                <!-- Input cod_Cd -->
                <div class="form-row">
                  <div class="form-group col-md-12">
                    <label for="recipient-cod_ibge" class="col-form-label">Código IBGE:</label>
                    <select name="cod_ibge" class="form-control" id="recipient-cod_ibge">
                      <option value="">Municipio</option>
                      <?php 
                        foreach($array_selectMunicipios as $chave => $valor){
                        ?>
                        <option value="<?= $valor['cod_ibge'] ?>"><?= $valor['nome_municipio'] ?></option>
                        <?php 
                        }
                      ?>
                    </select>
                    
                  </div>
                  <div class="form-group col-md-12">
                    <label for="recipient-cod_lote" class="col-form-label">Código Item:</label>
                    <select name="cod_lote" class="form-control" id="recipient-cod_ibge">
                      <option value="">Código Item</option>
                      <?php 
                        foreach($array_selectLote as $chave => $valor){
                        ?>
                        <option value="<?= $valor['cod_lote'] ?>"><?= $valor['cod_lote'] ?></option>
                        <?php 
                        }
                      ?>
                    </select>
                  </div>

                  <div class="form-group col-md-12">
                    <label for="recipient-cod_tipo_item" class="col-form-label">Código Tipo Item:</label>
                    <input
                    name="cod_tipo_item"
                    placeholder=""
                    type="number"
                    class="form-control"
                    maxlength=""
                    id="recipient-cod_tipo_item">
                  </div>

                  <div class="form-group col-md-12">
                    <label for="recipient-quantidade_previsto" class="col-form-label">Quantidade Previsto:</label>
                    <input
                    name="quantidade_previsto"
                    placeholder=""
                    type="number"
                    class="form-control"
                    maxlength=""
                    id="recipient-quantidade_previsto">
                  </div>

                  <div class="form-group col-md-12">
                    <label for="recipient-quantidade_projeto_executivo" class="col-form-label">Quantidade Projeto Executivo:</label>
                    <input
                    name="quantidade_projeto_executivo"
                    placeholder=""
                    type="number"
                    class="form-control"
                    maxlength=""
                    id="recipient-quantidade_projeto_executivo">
                  </div>

                  <div class="form-group col-md-12">
                    <label for="recipient-quantidade_termo_instalacao" class="col-form-label">Quantidade Termo Instalação:</label>
                    <input 
                      name="quantidade_termo_instalacao"
                      placeholder=""
                      type="number" 
                      class="form-control"
                      ]maxlength=""
                      id="recipient-quantidade_termo_instalacao">
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