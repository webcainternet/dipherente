/* SMOOTH SCROLLING
 ========================================================*/
$(function(){
    var o = $('html');
    if (o.hasClass('desktop')) {
        $(document).ready(function () {
            $.srSmoothscroll({
                step: 120,
                speed: 850
            });
        });
    }
});

jQuery(document).ready(function(){
	


/**************swipe menu***************/

jQuery('#page').click(function(){
	if(jQuery(this).parents('body').hasClass('ind')){
		jQuery(this).parents('body').removeClass('ind');
		return false
	}
	})
	jQuery('.swipe-control').click(function(){
		if(jQuery(this).parents('body').hasClass('ind')){
		jQuery(this).parents('body').removeClass('ind');
		return false
	}
	else{
		jQuery(this).parents('body').addClass('ind');
		return false
	}
})
	
/*********** CATEGORY DROP DOWN****************/

jQuery('#menu').find('li > .dropdown-menu').before('<i class="fa fa-angle-down"></i>');

if ($('body').width() < 767) {
jQuery("#menu").on("click", function(){
  jQuery(this).toggleClass("active");
 });
 
  jQuery('#menu li.dropdown > i').on("click", function(){
   if (jQuery(this).hasClass('fa-angle-up')) { jQuery(this).addClass('fa-angle-down').removeClass('fa-angle-up').parent('li').find('> .dropdown-menu').slideToggle();
   } else {
	 jQuery(this).removeClass('fa-angle-down').addClass('fa-angle-up').parent('li').find('> .dropdown-menu').slideToggle();
	}
  });
} 

/** owl **/

	jQuery('#content .box.specials .product-layout > div').addClass('specials-scroll');
	jQuery('#content .box.featured .product-layout > div').addClass('featured-scroll');
	jQuery('#content .box.latest .product-layout > div').addClass('latest-scroll');
	jQuery('#content .box.bestsellers .product-layout > div').addClass('bestsellers-scroll');

/****************BACK TO TOP*********************/
var IE='\v'=='v';
	// hide #back-top first
	jQuery("#back-top").hide();
	// fade in #back-top
	jQuery(function () {
		jQuery(window).scroll(function () {
			if (!IE) {
				if (jQuery(this).scrollTop() > 100) {
					jQuery('#back-top').fadeIn();
				} else {
					jQuery('#back-top').fadeOut();
				}
			}
			else {
				if (jQuery(this).scrollTop() > 100) {
					jQuery('#back-top').show();
				} else {
					jQuery('#back-top').hide();
				}	
			}
		});

		// scroll body to 0px on click
		jQuery('#back-top a').click(function () {
			jQuery('body,html').animate({
				scrollTop: 0
			}, 800);
			return false;
		});
	});
/********************************************************************************************/	
$(function(){
	$('.breadcrumb li').last().addClass('last');	
	$('.breadcrumb li').last().each(function(){
		var title = $(this).html();
		$(this).html(title+'<span class="lock-buton"></span>');
	})
	
	$('#cart .total tbody tr').last().addClass('last');	
	
})
/***********************shadow height***********************************************************/
var sect = 1;
$(document).ready(function() {
	$('.swipe').height($(window).height()-50);

	$(window).resize(function() {
		$('.swipe').height($(window).height()-50);
	});

	var sects = $('.swipe').size();

});
/**************lazy load***************/
jQuery("img.lazy").unveil(1, function(){
	jQuery(this).load(function() {
		jQuery(this).animate({'opacity':1}, 700);
	});
});

/************product gallery on product page***********/
$("#gallery_zoom").elevateZoom({gallery:'image-additional', cursor: 'pointer',zoomType : 'inner', galleryActiveClass: 'active', imageCrossfade: true}); 
//pass the images to Fancybox
$("#gallery_zoom").bind("click", function(e) {  
  var ez =   $('#gallery_zoom').data('elevateZoom');	
	$.fancybox(ez.getGalleryList());
  return false;
});
$('#image-additional').bxSlider({
	mode:'vertical',
	pager:false,
	controls:true,
	slideMargin:13,
	minSlides: 6,
	maxSlides: 6,
	slideWidth:88,
	nextText: '<i class="fa fa-chevron-down"></i>',
	prevText: '<i class="fa fa-chevron-up"></i>',
	infiniteLoop:false,
	adaptiveHeight:true,
	moveSlides:1
});
$('#gallery').bxSlider({
	pager:false,
	controls:true,
	minSlides: 1,
	maxSlides: 1,
	infiniteLoop:false,
	moveSlides:1
});
/******************* category name height**************************/
(function($){$.fn.equalHeights=function(minHeight,maxHeight){tallest=(minHeight)?minHeight:0;this.each(function(){if($(this).height()>tallest){tallest=$(this).height()}});if((maxHeight)&&tallest>maxHeight)tallest=maxHeight;return this.each(function(){$(this).height(tallest)})}})(jQuery)
$(window).load(function(){
	if($("#content .product-grid .name").length){
	$("#content .product-grid .name").equalHeights()}
});
/**************related name height ******************/
(function($){$.fn.equalHeights=function(minHeight,maxHeight){tallest=(minHeight)?minHeight:0;this.each(function(){if($(this).height()>tallest){tallest=$(this).height()}});if((maxHeight)&&tallest>maxHeight)tallest=maxHeight;return this.each(function(){$(this).height(tallest)})}})(jQuery)
$(window).load(function(){
	if($(".maxheight-r").length){
	$(".maxheight-r").equalHeights()}
});

/***********column dropdown box*******************/
  if ($('body').width() < 768) {
		leftColumn = $('body').find('#column-left');
		leftColumn.remove().insertAfter('#content');
	  jQuery("img.lazy").unveil(1, function(){
			jQuery(this).load(function() {
				jQuery(this).animate({'opacity':1}, 700);
			});
		});
		jQuery('.col-sm-3 .box-heading h3').append('<i class="fa fa-plus-circle"></i>');
		jQuery('.col-sm-3 .box-heading').on("click", function(){
		if (jQuery(this).find('i').hasClass('fa-minus-circle')) { jQuery(this).find('i').removeClass('fa-minus-circle').parents('.col-sm-3 .box').find('.box-content').slideToggle(); }
		else {
			jQuery(this).find('i').addClass('fa-minus-circle').parents('.col-sm-3 .box').find('.box-content').slideToggle();
		}
		})
	};
/************************* RELATED PRODUCTS************************************/
$(".related-slider").owlCarousel({
// Most important owl features
	items : 4,
	itemsCustom : false,
	itemsDesktop : [1199,4],
	itemsDesktopSmall : [991,3],
	itemsTablet: [700,2],
	itemsTabletSmall: false,
	itemsMobile : [500,1],
	singleItem : false,
	itemsScaleUp : false,
 
	//Basic Speeds
	slideSpeed : 200,
	paginationSpeed : 800,
	rewindSpeed : 1000,
 
	//Autoplay
	autoPlay : false,
	stopOnHover : false,
 
	// Navigation
	navigation : true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	rewindNav : true,
	scrollPerPage : false,
 
	//Pagination
	pagination : false,
	paginationNumbers: false,
 
	// Responsive 
	responsive: true,
	responsiveRefreshRate : 200,
	responsiveBaseWidth: window,
 
	// CSS Styles
	baseClass : "owl-carousel",
	theme : "owl-theme",
 
	//Lazy load
	lazyLoad : false,
	lazyFollow : true,
	lazyEffect : "fade",
 
	//Auto height
	autoHeight : false,
 
	//JSON 
	jsonPath : false, 
	jsonSuccess : false,
 
	//Mouse Events
	dragBeforeAnimFinish : true,
	mouseDrag : true,
	touchDrag : true,
 
	//Transitions
	transitionStyle : false,
 
	// Other
	addClassActive : false,


	});

/*********product tabs**********/
if ($('body').width() < 768) {
	jQuery('.tab-heading').append('<i class="fa fa-plus-circle"></i>');
	jQuery('.tab-heading').on("click", function(){
	if (jQuery(this).find('i').hasClass('fa-minus-circle')) { jQuery(this).find('i').removeClass('fa-minus-circle').parents('.tabs').find('.tab-content').slideToggle(); }
		else {
		jQuery(this).find('i').addClass('fa-minus-circle').parents('.tabs').find('.tab-content').slideToggle();
	}
	})
	};
});

$(document).ready(function(){
	if ($('body').width() > 767) {
		$(".top-info").appendTo(".top-panel");
	}
})

var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent);

/***********************************/
if(!isMobile) {

 // $(".box_html.video_block").vide("image/catalog/video/video_1");

$(document).ready(function(){
	var stickMenu = false;
	var docWidth= $('body').find('.container').width();
	
	
	if(!isMobile) {	
	
	controller = new ScrollMagic();
	
	fadein_left = jQuery('.our-services .col-sm-6:nth-child(1) > div:nth-child(1)');
	fadein_left1 = jQuery('.our-services .col-sm-6:nth-child(1) > div:nth-child(2)');
	fadein_left2 = jQuery('.our-services .col-sm-6:nth-child(1) > div:nth-child(3)');
	fadein_right = jQuery('.our-services .col-sm-6:nth-child(2) > div:nth-child(1)');
	fadein_right1 = jQuery('.our-services .col-sm-6:nth-child(2) > div:nth-child(2)');
	fadein_right2 = jQuery('.our-services .col-sm-6:nth-child(2) > div:nth-child(3)');
	
	left_animate = TweenMax.from(fadein_left, 0.5, {left:"-200px", alpha: 0, ease:Power1.easeOut});
	left_animate1 = TweenMax.from(fadein_left1, 0.5, {left:"-200px", alpha: 0, ease:Power1.easeOut});
	left_animate2 = TweenMax.from(fadein_left2, 0.5, {left:"-200px", alpha: 0, ease:Power1.easeOut});
	right_animate = TweenMax.from(fadein_right, 0.5, {right:"-200px", alpha: 0, ease:Power1.easeOut});
	right_animate1 = TweenMax.from(fadein_right1, 0.5, {right:"-200px", alpha: 0, ease:Power1.easeOut});
	right_animate2 = TweenMax.from(fadein_right2, 0.5, {right:"-200px", alpha: 0, ease:Power1.easeOut});

	if(jQuery(".our-services .col-sm-6:nth-child(1)").length){ 
	var scene_1 = new ScrollScene({
		triggerElement: ".our-services .col-sm-6:nth-child(1)",
		offset: -300
		}).setTween(left_animate)
		  .addTo(controller)
		  .reverse(false);
	var scene_2 = new ScrollScene({
		triggerElement: ".our-services .col-sm-6:nth-child(1)",
		offset: -200
		}).setTween(left_animate1)
		  .addTo(controller)
		  .reverse(false); 
	var scene_3 = new ScrollScene({
		triggerElement: ".our-services .col-sm-6:nth-child(1)",
		offset: -100
		}).setTween(left_animate2)
		  .addTo(controller)
		  .reverse(false); 	  
	  };
	if(jQuery(".our-services .col-sm-6:nth-child(2)").length){ 
	var scene_4 = new ScrollScene({
		triggerElement: ".our-services .col-sm-6:nth-child(2)",
		offset: -300
		}).setTween(right_animate)
		  .addTo(controller)
		  .reverse(false);
	var scene_5 = new ScrollScene({
		triggerElement: ".our-services .col-sm-6:nth-child(2)",
		offset: -200
		}).setTween(right_animate1)
		  .addTo(controller)
		  .reverse(false); 
	var scene_6 = new ScrollScene({
		triggerElement: ".our-services .col-sm-6:nth-child(2)",
		offset: -100
		}).setTween(right_animate2)
		  .addTo(controller)
		  .reverse(false); 	  
	  };
	  
	}	
})

$(window).load(function(){	 
	 if(!isMobile) { 
		 if(jQuery(".parallax-1").length){ 
			 var welcome = new TimelineMax();
			 
			 welcome.from(".parallax-1 h1",0.5,{left:100, autoAlpha:0})
			 .from(".parallax-1 h2",0.5,{left:-100, autoAlpha:0})
			 .from(".parallax-1 p",0.5,{left:50, autoAlpha:0})
			 .from(".parallax-1 a",0.5,{top:50,autoAlpha:0});
			 
			var scene_welcome = new ScrollScene({triggerElement: ".parallax-1",offset: -100}).setTween(welcome).addTo(controller).reverse(false); 
		 }
		 if(jQuery(".parallax-2").length){ 
			 var welcome = new TimelineMax();
			 
			 welcome.from(".parallax-2 h1",0.5,{left:100, autoAlpha:0})
			 .from(".parallax-2 h2",0.5,{left:-100, autoAlpha:0})
			 .from(".parallax-2 p",0.5,{left:50, autoAlpha:0})
			 .from(".parallax-2 a",0.5,{top:50,autoAlpha:0});
			 
			var scene_welcome = new ScrollScene({triggerElement: ".parallax-2",offset: -100}).setTween(welcome).addTo(controller).reverse(false); 
		 }
	
	}
});

}
