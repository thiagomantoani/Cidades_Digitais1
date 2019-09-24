<?php
    // cabeçalho
    include_once("_cabecalho.php");
    ?>
    
    <!-- Conteudo -->
    <main id="main">

        <div class="row mb-5">
          <div id="mainHeader" class="col-md-6 d-flex align-items-center">
            <span id="mainHeaderIcon">
              <i class="fas fa-columns"></i>
            </span>
            <span>
              <h3 class="mb-0">Painel de Controle</h3>
              <small>Descrição</small>
            </span>
          </div>
        </div>

        <div class="row">
          <div id="conteudoExterno" class="col-12">
            Conteúdo
          </div>
          <p onclick="carregar('')"></p>
        </div>
    </main>

    <?php
    // Rodape
    include_once('_rodape.php');
    
?>
<script>
  function carregar(pagina){
    $('#conteudoExterno').load(pagina)
  }
</script>