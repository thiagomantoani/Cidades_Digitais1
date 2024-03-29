<?php
  $arrayMenu = [
    "Home" => '<i class="fas fa-columns"></i>',
    "Municipios" => '<i class="fas fa-globe-asia"></i>',
    "EtapasCd" => '<i class="fas fa-list-ol"></i>',
    "Prefeitos" => '<i class="fas fa-user-tie"></i>',
    "Etapa" => '<i class="fas fa-align-justify"></i>',
    "Uacom" => '<i class="fas fa-phone-volume"></i>',
    "Usuario" =>'<i class="fas fa-user"></i>',
    "Assunto" =>'<i class="fas fa-book-open"></i>',
    "Cd" =>'<i class="fas fa-wifi"></i>',
    "Modulo" =>'<i class="fas fa-window-maximize"></i>',
    "Processo" =>'<i class="fas fa-chalkboard-teacher"></i>',
    "Lote" =>'<i class="fas fa-clone"></i>',
    "Tipologia" => '<i class="fab fa-elementor"></i>',
    "Contato" => '<i class="far fa-address-book"></i>',
    "Telefone" => '<i class="fas fa-phone-square-alt"></i>',
    "Entidade" => '<i class="fas fa-boxes"></i>',
    "Reajuste" => '<i class="fas fa-sliders-h"></i>',
    "CdItens"=> '<i class="fas fa-sliders-h"></i>',
    "LoteItens"=> '<i class="fas fa-sliders-h"></i>'

  ];

  //echo $_SERVER['REQUEST_URI'];
  $url = explode('/', $_SERVER['REQUEST_URI']);
  //var_dump($url);
  $paginaAtual = $url[count($url)-1];
  $paginaAtual = str_replace('.php', '', $paginaAtual);
  //echo $paginaAtual;
?>

<nav>

  <?php
    // Laço de repetição para exibir menu
    foreach($arrayMenu as $menu => $icone) {
      // verificar qual a página atual e selecinor menu como ativo
      if (strtoupper($menu) == strtoupper($paginaAtual)){
        $active = "active";
      } else {
        $active = "";
      }
      ?>

      <a href="<?php echo URL . "View/{$menu}.php" ?>" class="<?php echo $active ?>">
        <span>
          <?php echo $icone ?>
        </span>
        <strong>
          <?php echo $menu ?>
        </strong>
      </a>

      <?php
    }
  ?>

</nav>