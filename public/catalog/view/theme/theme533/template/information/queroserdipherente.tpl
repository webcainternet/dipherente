<?php echo $header; ?>
<?php $heading_title = "Quero ser Dipherente"; ?>



<script>
$(document).ready(function(){
  $("#button1").click(function(){
    /* if ($("#orcnome").val() != '' && $("#orcemail").val() != '' && $("#orctelefone").val() != '') {
      $.get("/orcamento/envia.php",
      {
          orcnome: $("#orcnome").val(),
          orcemail: $("#orcemail").val(),
          orctelefone: $("#orctelefone").val()
      },
      function(data, status){
          //alert("Data: " + data + "\nStatus: " + status);
          if (status == 'success' && data == 'ok') {
            $("#orcpop").fadeIn(1000);
            $("#orcpop").delay(4000).fadeOut(1000);
            $("#orcnome").css("background-color", "#FFFFFF");
            $("#orcemail").css("background-color", "#FFFFFF");
            $("#orctelefone").css("background-color", "#FFFFFF");
            $("#orcnome").val('');
            $("#orcemail").val('');
            $("#orctelefone").val('');
          }
      });
    } else {
      if ($("#orcnome").val() == "") {
        $("#orcnome").css("background-color", "#FFDDDD");
        orcerro = 1;
      } else {
        $("#orcnome").css("background-color", "#FFFFFF");
      }
      if ($("#orcemail").val() == "") {
        $("#orcemail").css("background-color", "#FFDDDD");
        orcerro = 1;
      } else {
        $("#orcemail").css("background-color", "#FFFFFF");
      }
      if ($("#orctelefone").val() == "") {
        $("#orctelefone").css("background-color", "#FFDDDD");
        orcerro = 1;
      } else {
        $("#orctelefone").css("background-color", "#FFFFFF");
      }

      if (orcerro == 1) {
        $("#orcpoperro").fadeIn(1000);
        $("#orcpoperro").delay(4000).fadeOut(1000);
      }
    }  */

    $("#dipherenteform").fadeOut(1000);
    $("#dipherenteobrigado").delay(1100).fadeIn(1000);

    $("#dipherentenome").val('');
    $("#dipherenteemail").val('');
    $("#dipherentetelefone").val('');
    $("#dipherentemensagem").val('');

  });
});
</script>
<style type="text/css">
#dipherenteobrigado {
  display: none;
}
.dipherente-left {
  float: left;
  width: 30%;
  text-align: right;
  padding: 10px;
}
.dipherente-right {
  float: right;
  width: 70%;
  text-align: left;
}
.dipherente-input-text {
  height: 40px;
  width: 400px;
  padding: 10px;
}
.dipherente-input-textarea {
  height: 200px;
  width: 400px;
  padding: 10px;
  border: solid 1px #DDD;
}

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
        Você é ilustrador e quer ver sua arte estampada nas camisetas da DIPHERENTE? Mande seu portifolio pra gente, pois aqui não trabalhamos com concurso, se seu trabalho for show com ideias criativas com certeza você poderá ser convidado a participar do projeto PONTO DE VISTA ou ainda poder vender suas estampas e ganhar porcentagens por pecas vendidas. Esta esperando o que? Vem com a gente, venha ser DIPHERENTE.
      </div>

      <div style="margin-bottom: 30px;" id="dipherenteform">
        <div style="float: left; width: 100%; margin-bottom: 10px;">
          <div class="dipherente-left">Nome completo</div>
          <div class="dipherente-right"><input name="dipherentenome" id="dipherentenome" type="text" class="dipherente-input-text"></div>
        </div>

        <div style="float: left; width: 100%; margin-bottom: 10px;">
          <div class="dipherente-left">E-mail</div>
          <div class="dipherente-right"><input name="dipherenteemail" id="dipherenteemail" type="text" class="dipherente-input-text"></div>
        </div>

        <div style="float: left; width: 100%; margin-bottom: 10px;">
          <div class="dipherente-left">Telefone</div>
          <div class="dipherente-right"><input name="dipherentetelefone" id="dipherentetelefone" type="text" class="dipherente-input-text"></div>
        </div>

        <div style="float: left; width: 100%; margin-bottom: 10px;">
          <div class="dipherente-left">Mensagem</div>
          <div class="dipherente-right"><textarea name="dipherentemensagem" id="dipherentemensagem" class="dipherente-input-textarea"></textarea></div>
        </div>

        <button type="button" id="button1" data-loading-text="Carregando..." class="btn btn-add">QUERO SER DIPHERENTE</button>
      </div>

      <div style="margin-bottom: 30px;" id="dipherenteobrigado">
        <h3><center>Seus dados foram enviados com sucesso. Obrigado!</center></h3>
      </div>


    </div>







      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
