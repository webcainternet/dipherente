<?php echo $header; ?>
<style type="text/css">
#button1 {
  background: #F7B04A;
  color: #FFF;
  float: right;
  bottom: 0px;
  right: 0px;
  margin-top: 15px;
}

.itemartista {
  background-color: #F0F0F0;
  margin: 0px 15px 30px 15px;
  padding: 30px;
  width: 554px;
  float: left;
  height: 318px;
}
.itemartista:hover {
  background-color: #DDD;
}
.itemartista img {
  max-width: 200px;
  float: left;
  margin-right: 30px;
}
</style>

<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>

      <div style="margin-bottom: 30px; height: 120px;">
        Você é ilustrador e quer ver sua arte estampada nas camisetas da DIPHERENTE? Mande seu portifolio pra gente, pois aqui não trabalhamos com concurso, se seu trabalho for show com ideias criativas com certeza você poderá ser convidado a participar do projeto PONTO DE VISTA ou ainda poder vender suas estampas e ganhar porcentagens por pecas vendidas. Esta esperando o que? Vem com a gente, venha ser DIPHERENTE.
        <a href="/index.php?route=information/queroserdipherente"><button type="button" id="button1" data-loading-text="Carregando..." class="btn btn-add">QUERO SER DIPHERENTE</button></a>
      </div>


      <?php

      $artista1 = '<div class="itemartista">
        <img src="/image/catalog/artistas/artista1.jpg">
        <h3>Dani Mota</h3>
        Ilustradora e designer, atualmente trabalha como freelancer desenvolvendo estampas, trabalhos para publicidade e colorização de HQs, faz bacharelado em Design e é formada em Desenho e Arte Digital pela Quanta Academia de Artes. Ama desenvolver infográficos, branding, pintar e escrever livros nas horas vagas. Desde pequena... <!-- gostava de desenhar sereias e fadas, mas hoje zumbis e pin-ups é que dominam suas artes. -->
        <a href="dani-mota"><button type="button" id="button1" data-loading-text="Carregando..." class="btn btn-add">Ver mais</button></a>
      </div>';

      $artista2 = '<div class="itemartista">
        <img src="/image/catalog/artistas/artista2.jpg">
        <h3>Rodisley Jose da Silva</h3>
        Filho de desenhista, desde muito cedo sempre esteve envolvido com arte música. Na adolescência conheceu os quadrinhos e foi paixão arrebatadora, ali ele conheceu suas maiores influências e que até hoje de alguma forma molda seus traços. Com o advento da internet, programas gráficos como photoshop, corel draw, 3D max... <!-- alguns dos programas com quais trabalha para fazer sua arte, foi possível ampliar seus métodos de criação. <!-- Trabalhou por 15 anos dentro do universo da serigráfia, hoje trabalha como freelance criando estampas e identidade visual e tendo seu trabalho reconhecido em vários meios de comunicação no brasil e no exterior. -->
        <a href="rodisley-jose-da-silva"><button type="button" id="button1" data-loading-text="Carregando..." class="btn btn-add">Ver mais</button></a>
      </div>';

      $artista3 = '<div class="itemartista">
        <img src="/image/catalog/artistas/artista3.jpg">
        <h3>Diego Machuca</h3>
        Ilustrador e diretor de arte, desde 2009 trabalha como diretor de arte em agências de propaganda e ilustrador freelancer. Amante de estampas de camisetas e viciado em quadrinhos desde pequeno. Encontrou na ilustração o meio para expor tudo que passa pela sua ...
        <a href="diego-machuca"><button type="button" id="button1" data-loading-text="Carregando..." class="btn btn-add">Ver mais</button></a>
      </div>';

      $artista4 = '<div class="itemartista">
        <img src="/image/catalog/artistas/artista4.jpg">
        <h3>Leo Gibran</h3>
        Artista gráfico paulista, formado arquiteto pela FAU-USP. Trabalha com ilustração a mais de 20 anos. Já animou, programou, modelou em 3D, trabalhou com design, projetou sites... Mas, principalmente, já ilustrou diversas revistas, jornais e peças publicitárias.
        <a href="leo-gibran"><button type="button" id="button1" data-loading-text="Carregando..." class="btn btn-add">Ver mais</button></a>
      </div>';

      $artista5 = '<div class="itemartista">
        <img src="/image/catalog/artistas/artista5.jpg">
        <h3>Elias Martins</h3>
        É um artista que desenha Histórias em Quadrinhos para editoras americanas e europeias desde 2008. Zenescope, Grayhaven Comics e OortCloud Comics estão entre as editoras que publicaram seus trabalho. Em 2010, com a perda de seu pai em um acidente de transito... <!-- , ele resolveu escrever uma HQ que tem como pano de fundo os acidentes de transito. Em 2014 esse projeto (Pare!) Foi vencedor do PROAC (Programa de incentivo do Governo do Estado de São Paulo para produção de HQs) onde foi viabilizado o seu lançamento. Atualmente, além de desenhar HQs, ele atua como ilustrador na agência ZIATO Comunicação.-->
        <a href="elias-martins"><button type="button" id="button1" data-loading-text="Carregando..." class="btn btn-add">Ver mais</button></a>
      </div>';

      $input = array($artista1, $artista2, $artista3, $artista4, $artista5);

      srand((float)microtime()*1000000);
      shuffle($input);
      foreach ($input as $artista) {
          echo "$artista ";
      }
      ?>

    </div>







      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
