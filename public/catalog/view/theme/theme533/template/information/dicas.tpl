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

.itemdicas {
  /* background-color: #F0F0F0; */
  margin: 0px 15px 30px 15px;
  padding: 30px;
  width: 100%;
  float: left;
}
.itemdicas:hover {
  background-color: #F0F0F0;
}
.itemdicas img {
  max-width: 50px;
  margin-right: 30px;
}
.item-col1 {
  float: left;
  width: 200px;
  text-align: right;
}
.item-col2 {
  float: left;
  border-left: dashed 1px #333;
  width: 800px;
  padding: 0px 30px;
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
        Quando compramos uma roupa nova ficamos ansiosas para usá-la pela primeira vez e também para saber como ela vai se comportar à primeira lavagem. Para cuidar com mais carinho das suas roupas é importante conhecer aqueles símbolos estranhos que existem nas etiquetas de composição (isso é papo pra outro post) e lavagem/passadoria das roupas. Então antes de cortar a etiqueta fora (elas incomodam muitas vezes) dê uma lidinha nela.
      </div>


      <div class="itemdicas">
        <div class="item-col1">
          <img src="/image/catalog/dicas/1.jpg">
        </div>
        <div class="item-col2">
          <h3>Lavagem</h3>
          O símbolo bacia se refere à lavagem. Bacia com X indica que a peça não pode ser lavada na máquina de lavar. Bacia com mão indica que a lavagem deve ser feita a mão para conservar roupas mais delicadas. A bacia sem nada permite a lavagem na máquina de lavar no modo manual, ou seja, mais leve, o que é parecido com a bacia com traço embaixo que indica que a roupa deve ser lavada no ciclo delicado da máquina.<br>&nbsp;&nbsp;<br>
          Outras instruções de lavagem que podem ser encontradas nas etiquetas se referem à temperatura máxima para cada tecido. Bacia com 40, 60 ou 70 graus Celsius. Fica uma dica: se a roupa estiver muito suja, é melhor lavar a frio mesmo, pois a água quente pode grudar ainda mais a sujeira na peça.
        </div>
      </div>

      <div class="itemdicas">
        <div class="item-col1">
          <img src="/image/catalog/dicas/2.jpg">
        </div>
        <div class="item-col2">
          <h3>Centrifugação</h3>
          Algumas máquinas possuem várias opções de centrifugação, desde a mais leve até a mais intensa, outras não são tão modernas, possuindo as funções mais básicas para centrifugar as roupas. O símbolo bacia com traço embaixo indica  lavagem + ciclo de centrifugação, quando houver um desenho de bacia + 02 traços significa que a peça pode ser centrifugada, porém não pode ser torcida, pois isso pode danificar de forma permanente as fibras do tecido. Na dúvida sempre centrifugue levemente a peça para não estragar a roupa, ou retire a peça da máquina sem centrifugar e coloque para secar por gotejamento.
        </div>
      </div>

      <div class="itemdicas">
        <div class="item-col1">
          <img src="/image/catalog/dicas/6.jpg">
        </div>
        <div class="item-col2">
          <h3>Lavagem a seco</h3>
          Primeiramente vou explicar rapidamente o que é lavagem a seco. A lavagem a seco é geralmente feita por lavanderias (hoje existem algumas máquinas domésticas que possuem essa opção) através de solventes que retiram as manchas sem quase “molhar” as roupas devido a sua alta volatilidade (evaporação rápida), por isso a lavagem a seco não danifica a peça, ao contrário da água que faz a fibra do tecido inchar e quando a roupa seca ela pode encolher e se deformar. O importante é saber é se a roupa pode ser lavada a seco, e se não pode (X sobre o círculo). Se for permitido pode deixar com a lavanderia que eles sabem o que pode ou não utilizar na lavagem a seco da roupa. O símbolo da lavagem seco é o círculo que pode conter as letras A, P ou F dentro.
        </div>
      </div>

      <div class="itemdicas">
        <div class="item-col1">
          <img src="/image/catalog/dicas/5.jpg">
        </div>
        <div class="item-col2">
          <h3>Alvejamento</h3>
          O símbolo triângulo significa alvejar a peça. Caso apareça na etiqueta o triângulo sem nada, significa que a roupa pode ser alvejada com produtos para clareamento e limpeza pesada das roupas, com um X em cima do triângulo em hipótese alguma a roupa deve ser alvejada e o triângulo junto às letras CL quer dizer que a peça de roupa pode receber alvejantes com cloro na fórmula.
        </div>
      </div>

      <div class="itemdicas">
        <div class="item-col1">
          <img src="/image/catalog/dicas/4.jpg">
        </div>
        <div class="item-col2">
          <h3>Secagem</h3>
          Após a peça ser lavada e centrifugada para remover o excesso de água, chega o momento da sua secagem. Temos três tipos de secagem: no varal, na máquina e secagem ao natural. O símbolo do quadrado quer dizer que a peça pode ser seca. Aí temos dois tipos de posição para secar a roupa: na horizontal 01 risco dentro do quadrado (a roupa não pode ser pendurada no varal, deve ser seca deitada sobre aqueles varais de chão que são estruturados) e a secagem na vertical, quadrado com 03 riscas (a roupa pode ser pendurada e sua secagem se dará por gotejamento, ou seja, a secagem mais tradicional). É importante observar se a peça deve ter sua secagem feita na sombra.<br>&nbsp;&nbsp;<br>
          Depois temos a secagem por varal (quadrado com meio círculo), nesse caso procure não pendurar as roupas em “U”, ou seja, pelas pontas, pois isso pode deformar as peças. Temos também opção de secar as roupas na máquina ou secadora de roupas, o símbolo quadrado mais círculo interno e bolinha (parece o desenho de uma máquina de lavar) significa isso. Atente-se a quantidade de bolinhas, uma só bolinha dentro do círculo permite a secagem na máquina, mas em temperatura mínima para não danificar o tecido e duas bolinhas dentro do círculo permite a secagem na temperatura máxima. Caso exista o X a roupa não pode ser seca de forma mecânica. É importante respeitar esse símbolo, pois a secagem mecânica pode causar encolhimento na peça e danificar estampas presentes na roupa.
        </div>
      </div>

      <div class="itemdicas">
        <div class="item-col1">
          <img src="/image/catalog/dicas/3.jpg">
        </div>
        <div class="item-col2">
          <h3>Passadoria</h3>
          Depois de lavar e secar chega um momento crítico para muita gente, passar as roupas! Esse símbolo é meio autoexplicativo. O desenho do ferro permite a passadoria da peça, se aparecer o X a peça não pode ser passada (atenção às estampas, muitas estampas, especialmente as em relevo não podem ser passadas). Aí vemos novamente as bolinhas dentro do símbolo, quanto menos bolinhas, menor a temperatura para a passadoria da roupa. Temos de 01 a 03 bolinhas.
        </div>
      </div>

      <div class="itemdicas">
        <div class="item-col1" style="padding-right: 30px;">
          <h3>ATENÇÃO</h3>
        </div>
        <div class="item-col2">
          Leia a etiqueta que vem com a camiseta. Nela há recomendações básicas dos cuidados que você deve ter, mas provavelmente você não irá ler essas informações de imediato, já que estará muito ocupado provando sua nova camiseta DIPHERENTE.
        </div>
      </div>

      <div class="itemdicas">
        <div class="item-col1" style="padding-right: 30px;">
          <h3>IMPORTANTE</h3>
        </div>
        <div class="item-col2">
          Caso seja identificado que o defeito foi ocasionado por mau uso do produto, a troca não será realizada e o produto será devolvido ao cliente.
        </div>
      </div>

    </div>







      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
