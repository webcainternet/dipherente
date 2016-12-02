<footer>
	<?php if ($maintenance == 0){ ?>
		<?php echo $footer_top; ?>
	<?php } ?>
  <div class="container">
	<div class="row">
		<div class="col-sm-2">
			<?php if ($informations) { ?>
			<div class="footer_box">
				<h5><?php echo $text_information; ?></h5>
				<ul class="list-unstyled">
					<li><a href="/index.php?route=information/dicas">Dicas Importantes</a></li>
				<?php foreach ($informations as $information) { ?>
				<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
				<?php } ?>
				</ul>
			</div>
			<?php } ?>
		</div>
		<div class="col-sm-2">
			<div class="footer_box">
				<h5><?php echo $text_service; ?></h5>
				<ul class="list-unstyled">
				<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
				<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
				<li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
				</ul>
			</div>
		</div>
		<div class="col-sm-2">
			<div class="footer_box">
				<h5><?php echo $text_extra; ?></h5>
				<ul class="list-unstyled">
				<li><a href="/produtos-em-promocao">Produtos em promoção</a></li>


				<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
				<li><a href="/mais-vendidos">Mais vendidos</a></li>
				</ul>
			</div>
		</div>
		<div class="col-sm-2">
			<div class="footer_box">
				<h5><?php echo $text_account; ?></h5>
				<ul class="list-unstyled">
				<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
				<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
				<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
				</ul>
			</div>
		</div>


		<div class="col-sm-4">
			<h5>Siga-nos</h5>

			<div class="fb-page" data-href="https://www.facebook.com/Dipherente-209630636153059/" data-small-header="true" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/Dipherente-209630636153059/"><a href="https://www.facebook.com/Dipherente-209630636153059/">Dipherente</a></blockquote></div></div>

<?php /*
		<div class="col-sm-4">

			<h5>Formas de Pagamento</h5>
			<ul class="list-unstyled">
			<li><a>Cartões de Crédito</a></li>
			<li><img src="/image/credito.png"></li>
			<li><a>Cartões de Débito</a></li>
			<li><img src="/image/debito.png"></li>
			<li><a>Outros</a></li>
			<li><img src="/image/boleto.png"></li>
			</ul>


			<h5><?php echo $text_contact1; ?></h5>
			<ul class="list-unstyled contact-block">
				<li><?php echo $address; ?></li>
				<li class="foot_phone"><?php echo $telephone . ';'; ?></li>
				<li class="fax"><?php echo $fax; ?></li>
			</ul>
			<ul class="list-unstyled social">
				<li><a data-toggle="tooltip" title="<?php echo $text_fb; ?>" href="https://www.facebook.com/Dipherente-209630636153059"><i class="fa fa-facebook"></i></a></li>
				<!-- <li><a data-toggle="tooltip" title="<?php echo $text_twi; ?>" href="https://twitter.com/"><i class="fa fa-twitter"></i></a></li>
				<li><a data-toggle="tooltip" title="<?php echo $text_rss; ?>" href=""><i class="fa fa-rss"></i></a></li> -->
			</ul>

		</div>
*/ ?>

		</div>

		<div style="float: left; width: 800px; margin-left: 15px;">
			<h5 style="font-size: 16px;">Formas de pagamento</h5>
			<img src="/image/pagseguro-line.png" style="width: 700px;" width="700">
		</div>

		<style type="text/css">
			
		socialicon a, a:visited {
		    color: #FFF;
		    outline: none;
		}

		</style>

		<div class="socialicon" style="float: left;
    text-align: center;
    margin: auto;
    margin-left: 10px;
    padding: 10px 25px;
    background: #3b5998;
    margin-top: 10px;" class="social1">
			<a style="color: #FFF;" href="https://www.facebook.com/Dipherente-209630636153059" target="_blank"><i class="fa fa-facebook-square" aria-hidden="true"></i> Facebook</a>
		</div>

		<div class="socialicon" style="float: left;
    text-align: center;
    margin: auto;
    margin-left: 10px;
    padding: 10px 25px;
    background: #84572e;
    margin-top: 10px;" class="social1">
			<a style="color: #FFF;" href="https://www.instagram.com/dipherente999/" target="_blank"><i class="fa fa-instagram" aria-hidden="true"></i> Instagram</a>
			<!--
			
			<i class="fa fa-linkedin-square" aria-hidden="true"></i>
			<i class="fa fa-pinterest-square" aria-hidden="true"></i>
			<i class="fa fa-twitter-square" aria-hidden="true"></i>
			<i class="fa fa-google-plus-square" aria-hidden="true"></i> -->

		</div>

	</div>

  </div>
	<div class="copyright" style="margin-top: 35px;">
		<div class="container">
			<div style="width: 60%; float: left; padding-top: 5px; min-width: 370px; margin-bottom: 5px;">
				<div>USE K Comércio de Roupas e Acessórios - ME / CNPJ: 25.013.537/0001-17 © 2016 Todos os direitos reservados</div>
				<div>Alameda Chopin, 159 - Jardim Aquarius I - São José dos Campos - SP - CEP: 12242-030</div>
			</div>

			<div style="width: 40%; float: left; text-align: right; min-width: 370px; margin-bottom: 5px;">
				<a href="https://lojavirtual.digital/" target="_blank">
						<img style="background-color: #FFF; border: 0px; margin-right: 20px; padding: 5px; border: solid 1px #EFD6B3;" src="/image/LOGO-LOJAVIRTUAL-300px.png" alt="Loja Virtual .digital" height="40">
				</a>

				<a href="http://pagseguro.uol.com.br" target="_blank">
					<img src="/image/pagseguro.png" alt="PagSeguro" height="26" style="border: 0px; margin-right: 20px;">
				</a>

				<a href="https://ssl.comodo.com" target="_blank">
					<img src="https://ssl.comodo.com/images/comodo_secure_seal_76x26_transp.png" alt="SSL" width="76" height="26" style="border: 0px;">
				<span style="font-weight:bold; font-size:7pt">SSL</span></a>

			</div>
		</div>

	</div>
</footer>
<script src="catalog/view/theme/theme533/js/livesearch.js" type="text/javascript"></script>
<script type="text/javascript" src="https://stc.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.lightbox.js"></script>
</div>

</body></html>
