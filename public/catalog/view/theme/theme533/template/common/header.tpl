<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

<link href='//fonts.googleapis.com/css?family=Lora:400,700,400italic&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Handlee' rel='stylesheet' type='text/css'>

<link rel="stylesheet"  href="catalog/view/theme/theme533/js/fancybox/jquery.fancybox.css" media="screen" />
<link href="catalog/view/javascript/jquery/owl-carousel/owl.carousel.css" rel="stylesheet">
<link href="catalog/view/theme/theme533/stylesheet/livesearch.css" rel="stylesheet">
<link href="catalog/view/theme/theme533/stylesheet/photoswipe.css" rel="stylesheet">
<link href="catalog/view/theme/theme533/js/jquery.bxslider/jquery.bxslider.css" rel="stylesheet">
<link href="catalog/view/theme/theme533/stylesheet/stylesheet.css" rel="stylesheet">
<link href="catalog/view/theme/theme533/stylesheet/responsive.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/theme/theme533/js/common.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme533/js/tm-stick-up.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme533/js/jquery.unveil.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme533/js/jquery.bxslider/jquery.bxslider.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme533/js/fancybox/jquery.fancybox.js"></script>
<script src="catalog/view/theme/theme533/js/elavatezoom/jquery.elevatezoom.js" type="text/javascript"></script>
<!--video script-->
<script src="catalog/view/theme/theme533/js/jquery.vide.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme533/js/jquery.touchSwipe.min.js" type="text/javascript"></script>
<!--Green Sock-->
<script src="catalog/view/theme/theme533/js/greensock/jquery.gsap.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme533/js/greensock/TimelineMax.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme533/js/greensock/TweenMax.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme533/js/greensock/jquery.scrollmagic.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme533/js/jquery.mousewheel.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme533/js/jquery.simplr.smoothscroll.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme533/js/device.min.js" type="text/javascript"></script>



<!--photo swipe-->
<script src="catalog/view/theme/theme533/js/photo-swipe/klass.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme533/js/photo-swipe/code.photoswipe.jquery-3.0.5.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme533/js/photo-swipe/code.photoswipe-3.0.5.min.js" type="text/javascript"></script>

<script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>
<script src="catalog/view/theme/theme533/js/script.js" type="text/javascript"></script>

<!--custom script-->
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<!--[if lt IE 9]><div style='clear:both;height:59px;padding:0 15px 0 15px;position:relative;z-index:10000;text-align:center;'><a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." /></a></div><![endif]--> 
<?php echo $google_analytics; ?>
</head>
<body class="<?php echo $class; ?>">
<!-- swipe menu -->
<div class="swipe">
	<div class="swipe-menu">
		<ul>
			
			<li><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>"><i class="fa fa-user"></i> <span><?php echo $text_account; ?></span></a></li>
			<?php if ($logged) { ?>
			<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
			<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
			<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
			<li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
			<?php } else { ?>
			<li><a href="<?php echo $register; ?>"><i class="fa fa-user"></i> <?php echo $text_register; ?></a></li>
			<li><a href="<?php echo $login; ?>"><i class="fa fa-lock"></i><?php echo $text_login; ?></a></li>
			<?php } ?>
			<li><a href="<?php echo $wishlist; ?>" id="wishlist-total2" title="<?php echo $text_wishl; ?>"><i class="fa fa-heart"></i> <span><?php echo $text_wishlist; ?></span></a></li>
			<li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span><?php echo $text_shopping_cart; ?>111</span></a></li>
			<li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span><?php echo $text_checkout; ?></span></a></li>
		</ul>
		<?php if ($maintenance == 0){ ?>
		<ul class="foot">
			<?php if ($informations) { ?>
			<?php foreach ($informations as $information) { ?>
			<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
			<?php } ?>
			<?php } ?>
		</ul>
		<?php } ?>
		<ul class="foot foot-1">
			<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
			<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
			<li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
		</ul>
		
		<ul class="foot foot-2">
			<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
			<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
			<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
			<li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
		</ul>
		<ul class="foot foot-3">
			<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
			<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
		</ul>
	</div>
</div>
<div id="page">
<div class="shadow"></div>
<div class="toprow-1">
	<a class="swipe-control" href="#"><i class="fa fa-align-justify"></i></a>
</div>
<nav id="top" class="clearfix">
	<div class="container">
		<div class="top-button">
			<?php echo $currency; ?>
			<?php echo $language; ?>
		</div>
		<div class="log-button">
			<?php if ($logged) { ?>
			<a href="<?php echo $logout; ?>"><i class="fa fa-sign-out"></i><span><?php echo $text_logout; ?></span></a>
			<?php } else { ?>
			<a href="<?php echo $login; ?>"><i class="fa fa-unlock-alt"></i><span><?php echo $text_login; ?></span></a>
			<?php } ?>
			<a href="<?php echo $register; ?>" title="<?php echo $text_register; ?>"><i class="fa fa-user"></i><span><?php echo $text_register; ?></span></a>
		</div>
		<div id="top-links" class="nav pull-left">
		<ul class="list-inline">
			<?php /* <li class="first"><a href="<?php echo $home; ?>"><i class="fa fa-home"></i><span><?php echo $text_home; ?></span></a></li> */ ?>
			<?php /* <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishl; ?>"><i class="fa fa-heart"></i><span><?php echo $text_wishlist; ?></span></a></li> */ ?>
			<li><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>"><i class="fa fa-user"></i><span><?php echo $text_account; ?></span></a></li>
			<li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i><span><?php echo $text_shopping_cart; ?></span></a></li>
			<li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i><span><?php echo $text_checkout; ?></span></a></li>
		</ul>
	</div>
	</div>
</nav>

<header>
	<div class="container">
		<div id="logo">
			<?php if ($logo) { ?>
			<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
			<?php } else { ?>
			<h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
			<?php } ?>
		</div>
		<div class="top-panel"></div>
		<div class="box-right">
			<?php echo $cart; ?>
			<?php echo $search; ?>
		</div>
		<div class="box-right2">
			
		</div>
		
	</div>
</header>

<script type="text/javascript">
	jQuery(document).ready(function(){
		if ($('body').width() > 990) { 
			$('.nav__primary').tmStickUp({correctionSelector: $('#menu_stick')});
		};
	});
</script>
<?php if ($categories) { ?>	
	<nav id="menu" class="navbar nav__primary">
	  <div class="container">
		<div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
		  <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
		</div>
		<div class="collapse navbar-collapse navbar-ex1-collapse">
		  <ul class="nav navbar-nav">
			<?php foreach ($categories as $category) { ?>			
			<?php if ($category['children']) { ?>
			<li class="dropdown">
			<?php if ($category['id'] == $category['path']) { ?>
			<a href="<?php echo $category['href']; ?>" class="dropdown-toggle active" ><?php echo $category['name']; ?></a>
			<?php } else { ?>
			<a href="<?php echo $category['href']; ?>" class="dropdown-toggle" ><?php echo $category['name']; ?></a>
			<?php } ?>
			  <div class="dropdown-menu">			  
				<div class="dropdown-inner">				
				  <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
				  <ul class="list-unstyled">
					<?php foreach ($children as $child) { ?>
					<li>
					<?php if ($child['child_id'] === $category['path']) { ?>
					<a href="<?php echo $child['href']; ?>" class="active"><?php echo $child['name']; ?></a>
					<?php } else { ?>
					<a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
					<?php } ?>
					</li>
					<?php } ?>					
				  </ul>
				  <?php } ?>
				  <span class="image-cat">
				  <?php if ($category['thumb2']) { ?>
				  <img src="<?php echo $category['thumb2']; ?>" />
				  <?php } ?>
				  </span>
				</div>
				</div>
			</li>
			<?php } else { ?>
			<li>
			<?php if ($category['id'] === $category['path']) { ?>
				<a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?></a> 
			<?php } else { ?>
				<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
			<?php } ?>
			</li>
			<?php } ?>
			<?php } ?>	
		  </ul>
		</div>
		</div>
	  </nav>	
	
<?php } ?>
<p id="back-top"><a href="#top"><i class="fa fa-chevron-up"></i></a></p>
