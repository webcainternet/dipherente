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

      <div style="margin-bottom: 30px;">
        Texto explicativo aqui nesta area superior, ou utilizar um banner com uma imagem grande, Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a.
      </div>


      <div class="itemartista">
        <img src="/image/catalog/artistas/artista1.jpg">
        <h3>Dani Mota</h3>
        Ilustradora e designer, atualmente trabalha como freelancer desenvolvendo estampas, trabalhos para publicidade e colorização de HQs, faz bacharelado em Design e é formada em Desenho e Arte Digital pela Quanta Academia de Artes. Ama desenvolver infográficos, branding, pintar e escrever livros nas horas vagas. Desde pequena... <!-- gostava de desenhar sereias e fadas, mas hoje zumbis e pin-ups é que dominam suas artes. -->
        <button type="button" id="button1" data-loading-text="Carregando..." class="btn btn-add">Ver mais</button>
      </div>

      <div class="itemartista">
        <img src="/image/catalog/artistas/artista2.jpg">
        <h3>Rodisley Jose da Silva</h3>
        Filho de desenhista, desde muito cedo sempre esteve envolvido com arte música. Na adolescência conheceu os quadrinhos e foi paixão arrebatadora, ali ele conheceu suas maiores influências e que até hoje de alguma forma molda seus traços. Com o advento da internet, programas gráficos como photoshop, corel draw, 3D max... <!-- alguns dos programas com quais trabalha para fazer sua arte, foi possível ampliar seus métodos de criação. <!-- Trabalhou por 15 anos dentro do universo da serigráfia, hoje trabalha como freelance criando estampas e identidade visual e tendo seu trabalho reconhecido em vários meios de comunicação no brasil e no exterior. -->
        <button type="button" id="button1" data-loading-text="Carregando..." class="btn btn-add">Ver mais</button>
      </div>

      <div class="itemartista">
        <img src="/image/catalog/artistas/artista2.jpg">
        <h3>Rodisley Jose da Silva</h3>
        Filho de desenhista, desde muito cedo sempre esteve envolvido com arte música. Na adolescência conheceu os quadrinhos e foi paixão arrebatadora, ali ele conheceu suas maiores influências e que até hoje de alguma forma molda seus traços. Com o advento da internet, programas gráficos como photoshop, corel draw, 3D max... <!-- alguns dos programas com quais trabalha para fazer sua arte, foi possível ampliar seus métodos de criação. <!-- Trabalhou por 15 anos dentro do universo da serigráfia, hoje trabalha como freelance criando estampas e identidade visual e tendo seu trabalho reconhecido em vários meios de comunicação no brasil e no exterior. -->
        <button type="button" id="button1" data-loading-text="Carregando..." class="btn btn-add">Ver mais</button>
      </div>

      <div class="itemartista">
        <img src="/image/catalog/artistas/artista1.jpg">
        <h3>Dani Mota</h3>
        Ilustradora e designer, atualmente trabalha como freelancer desenvolvendo estampas, trabalhos para publicidade e colorização de HQs, faz bacharelado em Design e é formada em Desenho e Arte Digital pela Quanta Academia de Artes. Ama desenvolver infográficos, branding, pintar e escrever livros nas horas vagas. Desde pequena... <!-- gostava de desenhar sereias e fadas, mas hoje zumbis e pin-ups é que dominam suas artes. -->
        <button type="button" id="button1" data-loading-text="Carregando..." class="btn btn-add">Ver mais</button>
      </div>

    </div>







      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
