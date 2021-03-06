<?php echo $header; ?>
<style type="text/css">
  #button-masculino,#button-feminino,#button-moletom {
    background: #F7B04A;
    color: #FFF;
    border-color: #FFF;
    margin: 0px 0px 50px;
  }
  #button-masculino:hover,#button-feminino:hover,#button-moletom:hover {
    background: #131622;
  }

  .caption .name {
    float: left;
    width: 50%;
    padding-left: 10px;
  }
</style>

<div style="display: none;">
<img src="/image/masculino-branco-600.png">
<img src="/image/masculino-preto-600.png">
<img src="/image/masculino-azul-600.png">
<img src="/image/masculino-amarelo-600.png">
<img src="/image/masculino-vermelho-600.png">
<img src="/image/masculino-verde-600.png">

<img src="/image/feminino-branco-600.png">
<img src="/image/feminino-preto-600.png">
<img src="/image/feminino-azul-600.png">
<img src="/image/feminino-amarelo-600.png">
<img src="/image/feminino-vermelho-600.png">
<img src="/image/feminino-verde-600.png">

<img src="/image/moletom-branco-600.png">
<img src="/image/moletom-preto-600.png">
<img src="/image/moletom-azul-600.png">
<img src="/image/moletom-amarelo-600.png">
<img src="/image/moletom-vermelho-600.png">
<img src="/image/moletom-verde-600.png">
</div>

<script type="text/javascript">
function masculinoalterabg(selecao) {
  switch(selecao) {
    case '1':
      $('#customimage1').css('background-image', "url('/image/masculino-branco-600.png')");
      break;

    case '2':
      $('#customimage1').css('background-image', "url('/image/masculino-preto-600.png')");
      break;

    case '3':
      $('#customimage1').css('background-image', "url('/image/masculino-azul-600.png')");
      break;

    case '4':
      $('#customimage1').css('background-image', "url('/image/masculino-amarelo-600.png')");
      break;

    case '5':
      $('#customimage1').css('background-image', "url('/image/masculino-vermelho-600.png')");
      break;

    case '6':
      $('#customimage1').css('background-image', "url('/image/masculino-verde-600.png')");
      break;

    default:
      alert('Seleção inválida!');
      break;
  }
}
function femininoalterabg(selecao) {
  switch(selecao) {
    case '1':
      $('#customimage2').css('background-image', "url('/image/feminino-branco-600.png')");
      break;

    case '2':
      $('#customimage2').css('background-image', "url('/image/feminino-preto-600.png')");
      break;

    case '3':
      $('#customimage2').css('background-image', "url('/image/feminino-azul-600.png')");
      break;

    case '4':
      $('#customimage2').css('background-image', "url('/image/feminino-amarelo-600.png')");
      break;

    case '5':
      $('#customimage2').css('background-image', "url('/image/feminino-vermelho-600.png')");
      break;

    case '6':
      $('#customimage2').css('background-image', "url('/image/feminino-verde-600.png')");
      break;

    default:
      alert('Seleção inválida!');
      break;
  }
}
function moletomalterabg(selecao) {
  switch(selecao) {
    case '1':
      $('#customimage3').css('background-image', "url('/image/moletom-branco-600.png')");
      break;

    case '2':
      $('#customimage3').css('background-image', "url('/image/moletom-preto-600.png')");
      break;

    case '3':
      $('#customimage3').css('background-image', "url('/image/moletom-azul-600.png')");
      break;

    case '4':
      $('#customimage3').css('background-image', "url('/image/moletom-amarelo-600.png')");
      break;

    case '5':
      $('#customimage3').css('background-image', "url('/image/moletom-vermelho-600.png')");
      break;

    case '6':
      $('#customimage3').css('background-image', "url('/image/moletom-verde-600.png')");
      break;

    default:
      alert('Seleção inválida!');
      break;
  }
}


//Cliques
$(document).ready(function(){
  //Masculino
  $("#button-masculino").click(function(){
    var optmasculino = $('input[name="radios-masculino"]:checked').val();
    if (optmasculino == 1) { window.location="/index.php?route=product/product&product_id=28"; }
    if (optmasculino == 2) { window.location="/index.php?route=product/product&product_id=55"; }
    if (optmasculino == 3) { window.location="/index.php?route=product/product&product_id=52"; }
    if (optmasculino == 4) { window.location="/index.php?route=product/product&product_id=56"; }
    if (optmasculino == 5) { window.location="/index.php?route=product/product&product_id=54"; }
    if (optmasculino == 6) { window.location="/index.php?route=product/product&product_id=53"; }
  });

  //Feminino
  $("#button-feminino").click(function(){
    var optfeminino = $('input[name="radios-feminino"]:checked').val();
    if (optfeminino == 1) { window.location="/index.php?route=product/product&product_id=58"; }
    if (optfeminino == 2) { window.location="/index.php?route=product/product&product_id=62"; }
    if (optfeminino == 3) { window.location="/index.php?route=product/product&product_id=59"; }
    if (optfeminino == 4) { window.location="/index.php?route=product/product&product_id=63"; }
    if (optfeminino == 5) { window.location="/index.php?route=product/product&product_id=61"; }
    if (optfeminino == 6) { window.location="/index.php?route=product/product&product_id=60"; }
  });

  //Moletom
  $("#button-moletom").click(function(){
    var optmoletom = $('input[name="radios-moletom"]:checked').val();
    if (optmoletom == 1) { window.location="/index.php?route=product/product&product_id=68"; }
    if (optmoletom == 2) { window.location="/index.php?route=product/product&product_id=66"; }
    if (optmoletom == 3) { window.location="/index.php?route=product/product&product_id=69"; }
    if (optmoletom == 4) { window.location="/index.php?route=product/product&product_id=70"; }
    if (optmoletom == 5) { window.location="/index.php?route=product/product&product_id=65"; }
    if (optmoletom == 6) { window.location="/index.php?route=product/product&product_id=67"; }
  });
});
</script>

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
        BE DIPHERENTE:  Bem vindo ao BE DIPHERENTE, aqui você poderá confeccionar sua camiseta ainda mais personalizada, mandando sua imagem com a especificações exigidas você poderá ter sua ilustração na camiseta ou, utilizar nosso banco de imagens não exclusivas mas com lindas estampas, veja as especificações e regulamento.
      </div>

<style type="text/css">
  .rating {
    display: none;
  }
  .customcampos {
    width: 357px;
    margin: 15px;
    display: inline-block;
    min-height: 488px;
  }
  .customimage {
    width: 100%;
    min-height: 400px;
    background-color: #FAFAFA;
    background-position: center;
    background-repeat: no-repeat;
  }
  .customimage1 {
    background-image: url('/image/masculino-branco-600.png');
    background-size: 300px;
  }
  .customimage1:hover {
    background-color: #EEE;
  }
  .customimage2 {
    background-image: url('/image/feminino-branco-600.png');
    background-size: 300px;
  }
  .customimage2:hover {
    background-color: #EEE;
  }
  .customimage3 {
    background-image: url('/image/moletom-branco-600.png');
    background-size: 300px;
  }
  .customimage3:hover {
    background-color: #EEE;

  }

  .selecioneacor {
    position: relative;
    top: 330px;
    left: 0px;
    background-color: rgba(255,255,255,0.8);
    padding: 0px 10px;
  }

</style>

<style type="text/css">
.radio-toolbar { margin-left: 5px; margin-bottom: 10px; }
.radio-toolbar input[type="radio"] {
    display:none;
}

.radio-toolbar label {
    display:inline-block;
    padding:4px 11px;
    font-family:Arial;
    font-size:16px;
    border: solid 2px #FFF;
    border-radius: 10px;
}

.radio-toolbar input[type="radio"]:checked + label {
    border: solid 2px #F7B04A;
}
.radio-masculino1 { background-color:#FAFAFA; } .radio-feminino1 { background-color:#FAFAFA; } .radio-moletom1 { background-color:#FAFAFA; }
.radio-masculino2 { background-color:#2d2d2d; } .radio-feminino2 { background-color:#2d2d2d; } .radio-moletom2 { background-color:#2d2d2d; }
.radio-masculino3 { background-color:#2e374d; } .radio-feminino3 { background-color:#2e374d; } .radio-moletom3 { background-color:#2e374d; }
.radio-masculino4 { background-color:#dba834; } .radio-feminino4 { background-color:#dba834; } .radio-moletom4 { background-color:#dba834; }
.radio-masculino5 { background-color:#9e1f24; } .radio-feminino5 { background-color:#9e1f24; } .radio-moletom5 { background-color:#9e1f24; }
.radio-masculino6 { background-color:#497a56; } .radio-feminino6 { background-color:#497a56; } .radio-moletom6 { background-color:#497a56; }

</style>

<!-- Masculino -->
<div class="customcampos" style="height: 450px;">
  <div class="customimage customimage1" id="customimage1">
    <div class="selecioneacor">
      Selecione a cor:
      <div class="radio-toolbar">
          <input onclick="masculinoalterabg('1');" type="radio" id="radio-masculino1" name="radios-masculino" value="1" checked>
          <label class="radio-masculino1" for="radio-masculino1">&nbsp;</label>

          <input onclick="masculinoalterabg('2');" type="radio" id="radio-masculino2" name="radios-masculino" value="2">
          <label class="radio-masculino2" for="radio-masculino2">&nbsp;</label>

          <input onclick="masculinoalterabg('3');" type="radio" id="radio-masculino3" name="radios-masculino" value="3">
          <label class="radio-masculino3" for="radio-masculino3">&nbsp;</label>

          <input onclick="masculinoalterabg('4');" type="radio" id="radio-masculino4" name="radios-masculino" value="4">
          <label class="radio-masculino4" for="radio-masculino4">&nbsp;</label>

          <input onclick="masculinoalterabg('5');" type="radio" id="radio-masculino5" name="radios-masculino" value="5">
          <label class="radio-masculino5" for="radio-masculino5">&nbsp;</label>

          <input onclick="masculinoalterabg('6');" type="radio" id="radio-masculino6" name="radios-masculino" value="6">
          <label class="radio-masculino6" for="radio-masculino6">&nbsp;</label>
      </div>
    </div>
  </div>

  <div class="caption">
    <div class="name">
      <a href="#">Camiseta Masculina</a>
      <div class="price price-product">R$ 99,00</div>
    </div>
    <button type="button" id="button-masculino" data-loading-text="Carregando..." class="btn btn-add">Personalizar</button>
  </div>
</div>




<!-- Feminino -->
<div class="customcampos" style="height: 450px;">
  <div class="customimage customimage2" id="customimage2">
    <div class="selecioneacor">
      Selecione a cor:
      <div class="radio-toolbar">
          <input onclick="femininoalterabg('1');" type="radio" id="radio-feminino1" name="radios-feminino" value="1" checked>
          <label class="radio-feminino1" for="radio-feminino1">&nbsp;</label>

          <input onclick="femininoalterabg('2');" type="radio" id="radio-feminino2" name="radios-feminino" value="2">
          <label class="radio-feminino2" for="radio-feminino2">&nbsp;</label>

          <input onclick="femininoalterabg('3');" type="radio" id="radio-feminino3" name="radios-feminino" value="3">
          <label class="radio-feminino3" for="radio-feminino3">&nbsp;</label>

          <input onclick="femininoalterabg('4');" type="radio" id="radio-feminino4" name="radios-feminino" value="4">
          <label class="radio-feminino4" for="radio-feminino4">&nbsp;</label>

          <input onclick="femininoalterabg('5');" type="radio" id="radio-feminino5" name="radios-feminino" value="5">
          <label class="radio-feminino5" for="radio-feminino5">&nbsp;</label>

          <input onclick="femininoalterabg('6');" type="radio" id="radio-feminino6" name="radios-feminino" value="6">
          <label class="radio-feminino6" for="radio-feminino6">&nbsp;</label>
      </div>
    </div>
  </div>

  <div class="caption">
    <div class="name">
      <a href="#">Camiseta Feminino</a>
      <div class="price price-product">R$ 99,00</div>
    </div>
    <button type="button" id="button-feminino" data-loading-text="Carregando..." class="btn btn-add">Personalizar</button>
  </div>
</div>



<!-- Moletom -->
<div class="customcampos" style="height: 450px;">
  <div class="customimage customimage3" id="customimage3">
    <div class="selecioneacor">
      Selecione a cor:
      <div class="radio-toolbar">
          <input onclick="moletomalterabg('1');" type="radio" id="radio-moletom1" name="radios-moletom" value="1" checked>
          <label class="radio-moletom1" for="radio-moletom1">&nbsp;</label>

          <input onclick="moletomalterabg('2');" type="radio" id="radio-moletom2" name="radios-moletom" value="2">
          <label class="radio-moletom2" for="radio-moletom2">&nbsp;</label>

          <input onclick="moletomalterabg('3');" type="radio" id="radio-moletom3" name="radios-moletom" value="3">
          <label class="radio-moletom3" for="radio-moletom3">&nbsp;</label>

          <input onclick="moletomalterabg('4');" type="radio" id="radio-moletom4" name="radios-moletom" value="4">
          <label class="radio-moletom4" for="radio-moletom4">&nbsp;</label>

          <input onclick="moletomalterabg('5');" type="radio" id="radio-moletom5" name="radios-moletom" value="5">
          <label class="radio-moletom5" for="radio-moletom5">&nbsp;</label>

          <input onclick="moletomalterabg('6');" type="radio" id="radio-moletom6" name="radios-moletom" value="6">
          <label class="radio-moletom6" for="radio-moletom6">&nbsp;</label>
      </div>
    </div>
  </div>

  <div class="caption">
    <div class="name">
      <a href="#">Camiseta Moletom</a>
      <div class="price price-product">R$ 180,00</div>
    </div>
    <button type="button" id="button-moletom" data-loading-text="Carregando..." class="btn btn-add">Personalizar</button>
  </div>
</div>







      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
