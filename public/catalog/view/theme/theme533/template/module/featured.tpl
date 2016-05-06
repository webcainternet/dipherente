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
<div class="col-sm-3 banner-1"><a href="index.php?route=product/category&amp;path=18"><img src="image/catalog/banner-1b.jpg"><div class="s-desc">Trend update<br><span>New<br>elegance</span></div>
</a></div>
<div class="col-sm-4 banner-2"><a href="index.php?route=product/category&amp;path=32"><img src="image/catalog/banner-2b.jpg"><div class="s-desc">Ladies<br><span>Modern<br>essentials</span></div>
</a></div>
<div class="col-sm-5 banner-1"><a href="index.php?route=product/category&amp;path=20"><img src="image/catalog/banner-3b.jpg"><div class="s-desc">Lingerie<br><span>Chic<br>comfort</span></div>
</a></div>
<div class="col-sm-9 banner-3"><a href="index.php?route=product/category&amp;path=25"><img src="image/catalog/banner-4b.jpg"><div class="s-desc">Ladies<br><span>Light up<br>The night</span></div>
</a></div>
<div class="col-sm-3 banner-4"><a href="index.php?route=product/category&amp;path=30"><img src="image/catalog/banner-5b.jpg"><div class="s-desc">Office hours<br><span>Work<br>The look</span></div>
</a></div>
</div></div>

<?php /*
<iframe style="margin-top: -20px;" src="/acc.html" width="100%" height="465" frameborder="0"></iframe>
/* ?>

<div class="box featured">
	<div class="box-heading"><h3><?php echo $heading_title; ?></h3></div>
	<div class="box-content">
		<div class="product-layout">
		<div class="">
		<?php $f=0; foreach ($products as $product) { $f++ ?>
		<div>
			<div class="product-thumb transition" style="float: left; padding: 10px; width: 33%;">
				
			<?php if ($product['special']) { ?>
				<div class="sale"><?php echo $text_sale; ?></div>
			<?php } ?>
			<div class="image"><a href="<?php echo $product['href']; ?>"><img alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive lazy" data-src="<?php echo $product['thumb']; ?>" src="image/catalog/preload.gif"  /></a></div>
			<div class="caption">
				<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
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
				<?php if ($product['price']) { ?>
				<div class="price">
				<?php if (!$product['special']) { ?>
				<?php echo $product['price']; ?>
				<?php } else { ?>
				<span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
				<?php } ?>
				<?php if ($product['tax']) { ?>
				<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
				<?php } ?>
				</div>
				<?php } ?>
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
