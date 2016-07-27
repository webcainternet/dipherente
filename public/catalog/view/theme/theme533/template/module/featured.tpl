<script>
/*
$(document).ready(function() {
	$(".featured-scroll").owlCarousel({
	// Most important owl features
		items : 3,
		itemsCustom : false,
		itemsDesktop : [1199,4],
		itemsDesktopSmall : [991,3],
		itemsTablet: [518,2],
		itemsTabletSmall: false,
		itemsMobile : [370,1],
		singleItem : false,
		itemsScaleUp : false,

		// Navigation
		navigation : true,
		navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
		rewindNav : false,
		scrollPerPage : false,

		//Pagination
		pagination : false,
		paginationNumbers: false,

		// CSS Styles
		baseClass : "owl-carousel",
		theme : "owl-theme",

	});
		$(".quickview").fancybox({
			maxWidth	: 800,
			maxHeight	: 600,
			fitToView	: false,
			width		: '70%',
			height		: '70%',
			autoSize	: false,
			closeClick	: false,
			openEffect	: 'elastic',
			closeEffect	: 'elastic',

		});
	});
*/
</script>


<div class="box_html top-banners">
<div class="banners-html row">
<div class="col-sm-3 banner-1"><a href="index.php?route=product/category&amp;path=20"><img src="image/catalog/banner-1b.jpg"><div class="s-desc"><span>BonÃ©s</span></div>
</a></div>
<div class="col-sm-4 banner-2"><a href="index.php?route=product/category&amp;path=33"><img src="image/catalog/banner-2b.jpg"><div class="s-desc"><span>Masculino</span></div>
</a></div>
<div class="col-sm-5 banner-1"><a href="index.php?route=product/category&amp;path=25"><img src="image/catalog/banner-3b.jpg"><div class="s-desc"><span>Feminino</span></div>
</a></div>
<div class="col-sm-9 banner-3"><a href="index.php?route=product/category&amp;path=37"><img src="image/catalog/banner-4b.jpg"><div class="s-desc"><span>Novidades</span></div>
</a></div>
<div class="col-sm-3 banner-4"><a href="index.php?route=product/category&amp;path=18"><img src="image/catalog/banner-5b.jpg"><div class="s-desc">AcessÃ³rios</div>
</a></div>
</div></div>


<div class="box featured">
	<div class="box-heading"><h3><?php echo $heading_title; ?></h3></div>
	<div class="box-content">
		<div class="product-layout">
		<div class="">
		<?php $f=0; foreach ($products as $product) { $f++ ?>
		<div>
			<div class="product-thumb transition" style="float: left; padding: 10px 15px; width: 33%;">

			<?php if ($product['special']) { ?>
				<div class="sale">PromoÃ§Ã£o</div>
			<?php } ?>
			<div class="image" style="position: relative;">
                        <a href="<?php echo $product['href']; ?>">
                            <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive thumb-module" style="position: absolute; left: 0%;" />
                            <img src="<?php echo $product['mmos_thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
                        </a>
                    </div>
			<div class="caption">
				<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a><br><div class="textopor" style="display: inline-block; padding-left: 0px; color: #F7B04A;"><a href="http://dipherente.com/index.php?route=product/manufacturer/info&amp;manufacturer_id=5">By Elias Martins</a></div></div>
				<!--<div class="description"><?php echo $product['description']; ?></div>-->
				<?php if ($product['rating']) { ?>
				<div class="rating">
				<?php for ($i = 1; $i <= 5; $i++) { ?>
				<?php if ($product['rating'] < $i) { ?>
				<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
				<?php } else { ?>
				<span class="fa fa-stack"><i class="fa fa-star active fa-stack-2x"></i></span>
				<?php } ?>
				<?php } ?>
				</div>
				<?php } ?>
				<?php /*
				<?php if ($product['price']) { ?>
					<div class="price">
						<?php if (!$product['special']) { ?>
							<?php echo $product['price']; ?>
						<?php } else { ?>
							<span style="color: #777; font-size: 12px;">De:</span> <span class="price-old"><?php echo $product['price']; ?></span> <span style="color: #777; font-size: 12px;">Por:</span> <span class="price-new"><?php echo $product['special']; ?></span>
						<?php } ?>

						<?php if ($product['tax']) { ?>
							<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
						<?php } ?>
					</div>
				<?php } ?>
				<?php include $_SERVER['DOCUMENT_ROOT'] . '/catalog/view/theme/theme533/parcelamento.php'; ?>
				*/ ?>

				<div class="price price-product">
				  <?php if (!$product['special']) { ?>
				  <?php echo $product['price']; ?>
				  <?php } else { ?>
				  <span class="price-old">De: <?php echo $product['price']; ?></span> Por: <span class="price-new"><?php echo $product['special']; ?></span>
				  <?php } ?>
				  <?php if ($product['tax']) { ?>
				  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
				  <?php } ?>
				</div>
			</div>
			<?php /*
			<div class="cart-button">
				<button class="btn btn-add" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');">
					<span><?php echo $button_cart; ?></span>
				</button>
			</div>
			*/ ?>
				<div class="clear"></div>
			</div>
			</div>
		<?php } ?>
			</div>
		</div>
	</div>
</div>
