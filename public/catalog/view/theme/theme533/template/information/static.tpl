<?php echo $header; ?>
<style type="text/css">
  #button-cart {
    background: #F7B04A;
    color: #FFF;
    border-color: #FFF;
    margin: 10px 0px 50px;
  }
  #button-cart:hover {
    background: #131622;
  }
</style>

<script type="text/javascript">
function masculinoalterabg(selecao) {
  switch(selecao) {
    case '1':
      $('#customimage1').css('background-image', "url('/image/masculino-branco.png')");
      break;

    case '2':
      $('#customimage1').css('background-image', "url('/image/masculino-preto.png')");
      break;

    case '3':
      $('#customimage1').css('background-image', "url('/image/masculino-azul.png')");
      break;

    case '4':
      $('#customimage1').css('background-image', "url('/image/masculino-amarelo.png')");
      break;

    case '5':
      $('#customimage1').css('background-image', "url('/image/masculino-vermelho.png')");
      break;

    case '6':
      $('#customimage1').css('background-image', "url('/image/masculino-verde.png')");
      break;

    default:
      alert('Seleção inválida!');
      break;
  }
}
function femininoalterabg(selecao) {
  switch(selecao) {
    case '1':
      $('#customimage2').css('background-image', "url('/image/feminino-branco.png')");
      break;

    case '2':
      $('#customimage2').css('background-image', "url('/image/feminino-preto.png')");
      break;

    case '3':
      $('#customimage2').css('background-image', "url('/image/feminino-azul.png')");
      break;

    case '4':
      $('#customimage2').css('background-image', "url('/image/feminino-amarelo.png')");
      break;

    case '5':
      $('#customimage2').css('background-image', "url('/image/feminino-vermelho.png')");
      break;

    case '6':
      $('#customimage2').css('background-image', "url('/image/feminino-verde.png')");
      break;

    default:
      alert('Seleção inválida!');
      break;
  }
}
function moletomalterabg(selecao) {
  switch(selecao) {
    case '1':
      $('#customimage3').css('background-image', "url('/image/moletom-branco.png')");
      break;

    case '2':
      $('#customimage3').css('background-image', "url('/image/moletom-preto.png')");
      break;

    case '3':
      $('#customimage3').css('background-image', "url('/image/moletom-azul.png')");
      break;

    case '4':
      $('#customimage3').css('background-image', "url('/image/moletom-amarelo.png')");
      break;

    case '5':
      $('#customimage3').css('background-image', "url('/image/moletom-vermelho.png')");
      break;

    case '6':
      $('#customimage3').css('background-image', "url('/image/moletom-verde.png')");
      break;

    default:
      alert('Seleção inválida!');
      break;
  }
}
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
        Texto explicativo aqui nesta area superior, ou utilizar um banner com uma imagem grande, Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a.
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
    background-image: url('/image/masculino-branco.png'); 
    background-size: 300px; 
  }
  .customimage1:hover { 
    background-size: 350px; 
  }
  .customimage2 { 
    background-image: url('/image/feminino-branco.png'); 
    background-size: 350px; 
  }
  .customimage2:hover { 
    background-size: 410px; 
  }
  .customimage3 { 
    background-image: url('/image/moletom-branco.png'); 
    background-size: 300px; 
  }
  .customimage3:hover { 
    background-size: 360px; 

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
}

.radio-toolbar input[type="radio"]:checked + label {
    border: solid 2px #F7B04A;
}
.radio-masculino1 { background-color:#FAFAFA; } .radio-feminino1 { background-color:#FAFAFA; } .radio-moletom1 { background-color:#FAFAFA; }
.radio-masculino2 { background-color:#2d2d2d; } .radio-feminino2 { background-color:#2d2d2d; } .radio-moletom2 { background-color:#2d2d2d; }
.radio-masculino3 { background-color:#5277d1; } .radio-feminino3 { background-color:#5277d1; } .radio-moletom3 { background-color:#5277d1; }
.radio-masculino4 { background-color:#cfc66c; } .radio-feminino4 { background-color:#cfc66c; } .radio-moletom4 { background-color:#cfc66c; }
.radio-masculino5 { background-color:#d5534b; } .radio-feminino5 { background-color:#d5534b; } .radio-moletom5 { background-color:#d5534b; }
.radio-masculino6 { background-color:#8fd061; } .radio-feminino6 { background-color:#8fd061; } .radio-moletom6 { background-color:#8fd061; }

</style>

<div class="customcampos" style="height: 450px;">
  <div class="customimage customimage1" id="customimage1">
    &nbsp;
  </div>

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

      <div class="caption">
        <div class="name"><a href="http://dipherente.lojavirtual.local/index.php?route=product/product&amp;product_id=34">Camiseta Masculina</a></div>
        <!--<div class="description">Fashion has always been so temporary and uncertain. Obviously there is nothing wrong about it because fashion satisfies our willingness to be attractive. And also fashion is the detector of prosperity..</div>-->
                <div class="rating">
                        <span class="fa fa-stack"><i class="fa fa-star active fa-stack-2x"></i></span>
                                <span class="fa fa-stack"><i class="fa fa-star active fa-stack-2x"></i></span>
                                <span class="fa fa-stack"><i class="fa fa-star active fa-stack-2x"></i></span>
                                <span class="fa fa-stack"><i class="fa fa-star active fa-stack-2x"></i></span>
                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                        </div>
                
        <div class="price price-product">
                    R$ 99,00                           </div>

                    <a href="/index.php?route=product/product&product_id=28"><button type="button" id="button-cart" data-loading-text="Carregando..." class="btn btn-add">Personalizar</button></a>
      </div>
</div>

<div class="customcampos" style="height: 450px;">
  <div class="customimage customimage2" id="customimage2">
    &nbsp;
  </div>
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

      <div class="caption">
        <div class="name"><a href="http://dipherente.lojavirtual.local/index.php?route=product/product&amp;product_id=34">Camiseta Feminina</a></div>
        <!--<div class="description">Fashion has always been so temporary and uncertain. Obviously there is nothing wrong about it because fashion satisfies our willingness to be attractive. And also fashion is the detector of prosperity..</div>-->
                <div class="rating">
                        <span class="fa fa-stack"><i class="fa fa-star active fa-stack-2x"></i></span>
                                <span class="fa fa-stack"><i class="fa fa-star active fa-stack-2x"></i></span>
                                <span class="fa fa-stack"><i class="fa fa-star active fa-stack-2x"></i></span>
                                <span class="fa fa-stack"><i class="fa fa-star active fa-stack-2x"></i></span>
                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                        </div>
                
        <div class="price price-product">
                    R$ 99,00                           </div>

                    <a href="/index.php?route=product/product&product_id=28"><button type="button" id="button-cart" data-loading-text="Carregando..." class="btn btn-add">Personalizar</button></a>
      </div>
</div>

<div class="customcampos" style="height: 450px;">
  <div class="customimage customimage3" id="customimage3">
    &nbsp;
  </div>
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

      <div class="caption">
        <div class="name"><a href="http://dipherente.lojavirtual.local/index.php?route=product/product&amp;product_id=34">Moletom</a></div>
        <!--<div class="description">Fashion has always been so temporary and uncertain. Obviously there is nothing wrong about it because fashion satisfies our willingness to be attractive. And also fashion is the detector of prosperity..</div>-->
                <div class="rating">
                        <span class="fa fa-stack"><i class="fa fa-star active fa-stack-2x"></i></span>
                                <span class="fa fa-stack"><i class="fa fa-star active fa-stack-2x"></i></span>
                                <span class="fa fa-stack"><i class="fa fa-star active fa-stack-2x"></i></span>
                                <span class="fa fa-stack"><i class="fa fa-star active fa-stack-2x"></i></span>
                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                        </div>
                
        <div class="price price-product">
                    R$ 180,00                           </div>

                    <a href="/index.php?route=product/product&product_id=28"><button type="button" id="button-cart" data-loading-text="Carregando..." class="btn btn-add">Personalizar</button></a>
      </div>
</div>







      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>