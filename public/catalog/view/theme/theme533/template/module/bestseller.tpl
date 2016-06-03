<script>
jQuery(document).ready(function() {
	$(".bestsellers-scroll").owlCarousel({
	// Most important owl features
		items : 4,
		itemsCustom : false,
		itemsDesktop : [1199,4],
		itemsDesktopSmall : [991,3],
		itemsTablet: [767,2],
		itemsTabletSmall: false,
		itemsMobile : [480,1],
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
		$(".quickview-bestsellers").fancybox({
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
</script>
<div class="box bestsellers">
	<div class="box-heading">
			<h3><?php echo $heading_title; ?></h3>
	</div>
	<div class="box-content">
	<div class="product-layout">
	<div class="">
		<?php $z=0; foreach ($products as $product) { $z++ ?>
			<div>
				<div class="product-thumb transition" >
				<div class="image" style="position: relative;">
                        <a href="<?php echo $product['href']; ?>">
                            <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive thumb-module" style="position: absolute; left: 0%;" />
                            <img src="<?php echo $product['mmos_thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
                        </a>
                    </div>
				
				<a class="quickview quickview-bestsellers" data-rel="details" href="#quickview_bestsellers_<?php echo $z?>">
					<?php echo $text_quick; ?>
				</a>
				<div class="quick_info">
					<div id="quickview_bestsellers_<?php echo $z?>">
						<div>
							<div class="left col-sm-4">
								<div class="quickview_image image"><a href="<?php echo $product['href']; ?>"><img alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" src="<?php echo $product['thumb']; ?>" /></a>
								</div>
								</div>
								<div class="right col-sm-8">
									<h2><?php echo $product['name']; ?></h2>
									<div class="inf">
										<?php if ($product['author']) {?>
											<p class="quickview_manufacture manufacture manufacture"><?php echo $text_manufacturer; ?> <a href="<?php echo $product['manufacturers'];?>"><?php echo $product['author']; ?></a></p>
										<?php }?>
										<?php if ($product['model']) {?>
											<p class="product_model model"><?php echo $text_model; ?> <?php echo $product['model']; ?></p>
										<?php }?>

										<?php if ($product['price']) { ?>
										<div class="price">
										<?php if (!$product['special']) { ?>
										<?php echo $product['price']; ?>
										<?php } else { ?>
										<span class="price-new"><?php echo $product['special']; ?></span><span class="price-old"><?php echo $product['price']; ?></span>
										<?php } ?>
										<?php if ($product['tax']) { ?>
										<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
										<?php } ?>
										</div>
										<?php } ?>
									</div>									
									<div class="clear"></div>
									<div class="cart-button">										
										<button class="btn btn-icon" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
										<button class="btn btn-icon" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-signal"></i></button>
										<button class="btn btn-add" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_cart; ?></span></button>
									</div>
									<div class="clear"></div>
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
									
								</div>
								<div class="col-sm-12">
									<div class="quickview_description description"><?php echo $product['description1'];?></div>
								</div>
						</div>
					</div>
				</div>
				
				</div>
				<div class="caption">
				<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
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
					<button class="btn btn-add" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_cart; ?></span></button>
				</div>
					<div class="clear"></div>
				</div>
			</div>			
			<?php } ?>
			</div>
		</div>
	</div>
</div>
