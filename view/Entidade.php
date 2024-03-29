<?php
    // Cabeçalho
    include_once("_cabecalho.php");

    // Buscar todos os cadastros no banco
    require_once("../Controller/ControleListarEntidade.php");
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
              <h3 class="mb-0">Entidades</h3>
              <small>Descrição</small>
            </span>
          </div>
          <div class="col-md-6 text-right">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".cadastrar-entidade-modal-lg">
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
                        <th scope="col">CNPJ</th>
                        <th scope="col">Nome</th>
                        <th scope="col">Endereço</th>
                        <th scope="col">Número</th>
                        <th scope="col">Bairro</th>
                        <th scope="col">CEP</th>
                        <th scope="col">Nome Município</th>
                        <th scope="col">UF</th>
                        <th scope="col">Observação</th>
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

                          <td><?php echo $value['cnpj'] ?></td>
                          <td><?php echo $value['nome'] ?></td>
                          <td><?php echo $value['endereco'] ?></td>
                          <td><?php echo $value['numero'] ?></td>
                          <td><?php echo $value['bairro'] ?></td>
                          <td><?php echo $value['cep'] ?></td>
                          <td><?php echo $value['nome_municipio'] ?></td>
                          <td><?php echo $value['uf'] ?></td>
                          <td><?php echo $value['observacao'] ?></td>
                          <td> 
                            <span class="d-flex">
                              <a href="<?php echo URL ?>View/EntidadeEditar.php?cnpj=<?php echo $value['cnpj'] ?>" class="btn btn-warning mr-1">
                              Editar
                            </a> 
                            <button onclick="apagarDados('<?php echo URL ?>Controller/ControleApagarEntidade.php?cnpj=<?php echo $value['cnpj'] ?>')" class="btn btn-danger">
                              Excluir
                            </button> 
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
          <form action="../Controller/ControleEntidade.php" method="post">

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
                    <label for="recipient-numero" class="col-form-label">Número:</label>
                    <input 
                      name="numero"
                      placeholder=""
                      type="text" 
                      class="form-control"
                      maxlength="10" 
                      id="recipient-numero">
                  </div>

                  <div class="form-group col-md-12">
                    <label for="recipient-bairro" class="col-form-label">Bairro:</label>
                    <input 
                      name="bairro"
                      placeholder=""
                      type="text" 
                      class="form-control"
                      maxlength="100" 
                      id="recipient-bairro">
                  </div>

                  <div class="form-group col-md-12">
                    <label for="recipient-cep" class="col-form-label">CEP:</label>
                    <input 
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
                      name="observacao"
                      placeholder=""
                      type="text" 
                      class="form-control"
                      maxlength="1000" 
                      id="recipient-observacao">
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