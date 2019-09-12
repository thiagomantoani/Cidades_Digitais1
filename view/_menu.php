<?php
  $arrayMenu = [
    "Home" => '<i class="fas fa-columns"></i>',
    "Municipios" => '<i class="fas fa-globe-asia"></i>',
    "EtapasCd" => '<i class="fas fa-list-ol"></i>',
    "Prefeitos" => '<i class="fas fa-user-tie"></i>',
    "Etapa" => '<i class="fas fa-align-justify"></i>',
    "Uacom" => '<i class="fas fa-phone-volume"></i>',
    "Usuario" =>'<i class="fas fa-user-tie"></i>',
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