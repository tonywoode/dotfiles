/*-----------------------------------------------------------------------------------*/
/*	Load
/*-----------------------------------------------------------------------------------*/

jQuery(document).ready(function() {
	
	
/*-----------------------------------------------------------------------------------*/
/*	Tabbed Widget
/*-----------------------------------------------------------------------------------*/
	
	jQuery("#tabs").tabs({ fx: { opacity: 'show' } });
	
	jQuery(".tz_tab_widget .tab-tags a").css({
		backgroundColor: "#333333",
		color: "#E2E2E1"
	});
	
	jQuery(".tz_tab_widget .tab-tags a").hover(function() {
		jQuery(this).stop().animate({
			backgroundColor: "#A0410D",
			color: "#ffffff"
		}, 200);
	},function() {
		jQuery(this).stop().animate({
			backgroundColor: "#333333",
			color: "#E2E2E1"
		}, 500);
	});
	
/*-----------------------------------------------------------------------------------*/
/*	sidebar Thumbs
/*-----------------------------------------------------------------------------------*/

	jQuery("#tabs img").css({
		backgroundColor: "#F9F8F8",
		borderColor: "#AFAEA6"
	});
	
	jQuery("#tabs img").hover(function() {
		jQuery(this).stop().animate({
			backgroundColor: "#222222",
			borderColor: "#111111"
		}, 100);
	},function() {
		jQuery(this).stop().animate({
			backgroundColor: "#F9F8F8",
			borderColor: "#AFAEA6"
		}, 300);
	});
	
	// Content Thumbs
	jQuery(".post-lead img, a.fancybox img").css({
		backgroundColor: "#FCFCFC",
		borderColor: "#C8C8C2"
	});
	
	jQuery(".post-lead img, a.fancybox img").hover(function() {
		jQuery(this).stop().animate({
			backgroundColor: "#222222",
			borderColor: "#111111"
		}, 100);
		},function() {
		jQuery(this).stop().animate({
			backgroundColor: "#FCFCFC",
			borderColor: "#C8C8C2"
		}, 300);
	});
	
/*-----------------------------------------------------------------------------------*/
/*	Content Thumb Corrections
/*-----------------------------------------------------------------------------------*/

	jQuery(".single .post-lead img").css({
		backgroundColor: "#FCFCFC",
		borderColor: "#C8C8C2"
	});
	jQuery(".single .post-lead img").hover(function() {
		jQuery(this).stop().animate({
			backgroundColor: "#FCFCFC",
			borderColor: "#C8C8C2"
		}, 100);
		},function() {
		jQuery(this).stop().animate({
			backgroundColor: "#FCFCFC",
			borderColor: "#C8C8C2"
		}, 300);
	});
	
/*-----------------------------------------------------------------------------------*/
/*	flickr Thumbs
/*-----------------------------------------------------------------------------------*/

	jQuery("#flickr .flickr_badge_image img").css({
		backgroundColor: "#C5C5C5",
		borderColor: "#111111"
	});
	jQuery("#flickr .flickr_badge_image img").hover(function() {
		jQuery(this).stop().animate({
			backgroundColor: "#222222",
			borderColor: "#111111"
		}, 100);
		},function() {
		jQuery(this).stop().animate({
			backgroundColor: "#C5C5C5",
			borderColor: "#111111"
		}, 300);
	});
	
	jQuery("#sidebar #flickr .flickr_badge_image img").css({
		backgroundColor: "#FCFCFC",
		borderColor: "#AFAEA6"
	});
	jQuery("#sidebar #flickr .flickr_badge_image img").hover(function() {
		jQuery(this).stop().animate({
			backgroundColor: "#222222",
			borderColor: "#AFAEA6"
		}, 100);
		},function() {
		jQuery(this).stop().animate({
			backgroundColor: "#FCFCFC",
			borderColor: "#AFAEA6"
		}, 300);
	});
	
/*-----------------------------------------------------------------------------------*/
/*	Main Entry Titles
/*-----------------------------------------------------------------------------------*/

	jQuery("#primary .entry-title a").css({
		color: "#444444"
	});
	jQuery("#primary .entry-title a").hover(function() {
		jQuery(this).stop().animate({
			color: "#A0410D"
		}, 100);
		},function() {
			jQuery(this).stop().animate({
			color: "#444444"
		}, 500);
	});
	
/*-----------------------------------------------------------------------------------*/
/*	Superfish Menu
/*-----------------------------------------------------------------------------------*/
	
	jQuery('#top-nav ul').superfish({
		delay: 200,
		animation: {opacity:'show', height:'show'},
		speed: 'fast',
		autoArrows: false,
		dropShadows: false
	}); 
	
});