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

<div id="bannerssuperiores" class="box_html top-banners">
<div class="banners-html row">


<?php
	//Conexão com o banco
	$mysqli = new mysqli(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);

	//Consulta
	$sql = utf8_decode("SELECT bi.link, bi.image, bid.description, bi.sort_order FROM oc_banner_image bi INNER JOIN oc_banner_image_description bid on bi.banner_image_id = bid.banner_image_id WHERE bi.banner_id = 16 ORDER BY bi.sort_order LIMIT 5");

	$arrAtivos = array();

	if ($result = $mysqli->query($sql)) { 

		$row_cnt = $result->num_rows;

		if ($row_cnt > 0) {

			$row_num = 1;

			while($obj = $result->fetch_object()){ ?>
				
				<?php if ($row_num == 1) { ?>
				<div class="col-sm-3 banner-1"><a href="<?php echo utf8_encode($obj->link); ?>"><img src="image/<?php echo utf8_encode($obj->image); ?>"><div class="s-desc"><?php echo utf8_encode($obj->description); ?></div>
				</a></div>
				<?php } ?>

				<?php if ($row_num == 2) { ?>
				<div class="col-sm-5 banner-1b"><a href="<?php echo utf8_encode($obj->link); ?>"><img src="image/<?php echo utf8_encode($obj->image); ?>"><div class="s-desc1"><span class="s-desc1"><?php echo utf8_encode($obj->description); ?></span></div>
				</a></div>
				<?php } ?>

				<?php if ($row_num == 3) { ?>
				<div class="col-sm-4 banner-2"><a href="<?php echo utf8_encode($obj->link); ?>"><img src="image/<?php echo utf8_encode($obj->image); ?>"><div class="s-desc"><span><?php echo utf8_encode($obj->description); ?></span></div>
				</a></div>
				<?php } ?>

				<?php if ($row_num == 4) { ?>
				<div class="col-sm-9 banner-3"><a href="<?php echo utf8_encode($obj->link); ?>"><img src="image/<?php echo utf8_encode($obj->image); ?>"><div class="s-desc"><span><?php echo utf8_encode($obj->description); ?></span></div>
				</a></div>
				<?php } ?>

				<?php if ($row_num == 5) { ?>
				<div class="col-sm-3 banner-4"><a href="<?php echo utf8_encode($obj->link); ?>"><img src="image/<?php echo utf8_encode($obj->image); ?>"><div class="s-desc"><?php echo utf8_encode($obj->description); ?></div>
				</a></div>
				<?php } ?>

				<?php $row_num = $row_num + 1;
			}
		}
	}
?>

</div>
</div>

<div class="box featured">
	<div class="box-heading"><h3><?php echo $heading_title; ?></h3></div>
	<div class="box-content">
		<div class="product-layout">
		<div class="">

			<?php
				srand((float)microtime()*1000000);
				shuffle($products);
			?>

		<?php $f=0; foreach ($products as $product) {
			if ($f < 6) {
				$f++;
		?>

		<div>
			<div class="product-thumb transition" style="float: left; padding: 10px 15px; width: 33%;">

			<?php if ($product['special']) { ?>
				<div class="sale">Promoção</div>
			<?php } ?>
			<div class="image" style="position: relative;">
                        <a href="<?php echo $product['href']; ?>">
                            <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive thumb-module" style="position: absolute; left: 0%;" />
                            <img src="<?php echo $product['mmos_thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
                        </a>
                    </div>
			<div class="caption">
				<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a><br><div class="textopor" style="display: inline-block; padding-left: 0px; color: #F7B04A;">
            <?php echo linkmanufacturer($product['product_id']); ?>
        </div></div>
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
		<?php } ?>
			</div>
		</div>
	</div>
</div>
