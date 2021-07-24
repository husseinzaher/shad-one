/*

◄------------------------------------------------------------► 
This file includes all cusomized javascript and all plugins libraries options 
◄------------------------------------------------------------►

*/

(function ()
{
  //-- Enable Use Strict Mode --
  "use strict";

  //--Preloaing Effect --
  jQuery(window).load(function(){
    jQuery('.switcher').css({'opacity' : 1 , 'visibility' : 'visible'});
    jQuery('.back-to-top').css({'opacity' : 1 , 'visibility' : 'visible'});
  });
  //--------------------------------------------------------------------------------------------


  //-- customizing position of loading container --
  var jQueryloadingContainer = jQuery('.loading-container');

  jQueryloadingContainer.resize(function(){
    jQuery('.loading-container').css({ 
      'margin-left' : - jQueryloadingContainer.width() / 2 , 
      'margin-top' : - jQueryloadingContainer.height()  / 2
    });
  });

  
  jQueryloadingContainer.trigger('resize');
  //--------------------------------------------------------------------------------------------

  //-- Making the header fixed --
  var jQueryheader = jQuery('header#header');
  var jQueryheaderTop = jQueryheader.offset().top;

  jQuery('.offset').height( jQueryheader.outerHeight() )
  
  //-- Window Scroll Functions --
   
  jQuery(window).scroll(function(){
    (jQuery(window).scrollTop() > jQueryheaderTop) ? jQuery('body').addClass('fixed-header') : jQuery('body').removeClass('fixed-header');
  });

  //-- customizing homeslider slide width --
  // var jQueryallWrapper = jQuery('.all-wrapper');

  // jQueryallWrapper.resize(function(){
  //   jQuery('.slider-home .slide').css({
  //     'width' : jQueryallWrapper.width()
  //   });
  // });

  // jQueryallWrapper.trigger('resize');
  //--------------------------------------------------------------------------------------------


  /* ◄------ Nice Scroll -------------------------------► */

  //-- The whole page --
  jQuery("html").niceScroll({
    cursorborder: 0,
    cursorcolor: '#363636',
    autohidemode: true,
    zindex: 9999999,
    scrollspeed: 60,
    mousescrollstep: 36,
    cursorwidth: 6,
    horizrailenabled: false,
    cursorborderradius: 3
  });
  //--------------------------------------------------------------------------------------------



  jQuery('.dropdown-menu').click(function(event){
    event.stopPropagation();
  });


  //-- Tooltip --
  jQuery(document).ready(function(){
    jQuery('.tooltip-h').tooltip();
  });
  //--------------------------------------------------------------------------------------------




  //-- Alert Custom closing effect --
  jQuery('.alert-general .close').click(function () {
    jQuery('.alert-general').slideToggle(500);
  });

  jQuery('.alert-success .close').click(function () {
    jQuery('.alert-success').slideToggle(500);
  });

  jQuery('.alert-warning .close').click(function () {
    jQuery('.alert-warning').slideToggle(500);
  });


  jQuery('.alert-info .close').click(function () {
    jQuery('.alert-info').slideToggle(500);
  });

  jQuery('.alert-error .close').click(function () {
    jQuery('.alert-error').slideToggle(500);
  });

  jQuery('.alert-attention .close').click(function () {
    jQuery('.alert-attention').slideToggle(500);
  });
  //--------------------------------------------------------------------------------------------


  /* ◄------ Remove an item from the shopping cart -------------------------------► */
  jQuery('.remove-cart-item').click(function () {
    jQuery(this).parent().slideToggle(500);
  });
  //--------------------------------------------------------------------------------------------
  
  /* ◄------ animation -------------------------------► */
  jQuery(document).ready(function() {
    jQuery(document).scroll(function() {
      jQuery('[data-animated="animated"]').each( function() {
        var jQuerythis = jQuery(this);
        var animation = jQuery(this).attr("data-animate");
        var imagePos = jQuery(this).offset().top;
        var topOfWindow = jQuery(document).scrollTop();

        if (imagePos < topOfWindow+jQuery(window).height() * 0.8) {
          jQuerythis.addClass(animation);
        }
      });
    });

    jQuery('[data-animated="animated"]').addClass("sa");
  });

  //--------------------------------------------------------------------------------------------

		// scroll body to 0px on click
	$("#to_content").click(function(e) {
		e.preventDefault();
		 $('html, body').animate({
				scrollTop: $($(this).children("a").attr("href")).offset().top
		 },1500);
	 });


  /* ◄------ All Carousels Init all over the template -------------------------------► */

  //-- Slider --
  jQuery(document).ready(function() {

    //Init the carousel
    jQuery(".slider").owlCarousel({
      items:1,
      margin:0,
      loop:true,
      rtl: true,
      autoplay:true,
      autoplayTimeout:10000,
      autoplayHoverPause:false,
      nav: true,
      dots: false,
      stagePadding:0,
      smartSpeed:1000,
      mouseDrag: true,
      touchDrag: true, 
      responsive:{
        0:{
          items:1,
          slideBy: 1
        }
      }
    });

  });
  //--------------------------------------------------------------------------------------------
  //-- Slider --
  jQuery(document).ready(function() {

    //Init the carousel
    jQuery(".custom-slider").owlCarousel({
      animateIn: 'fadeIn',
      animateOut: 'fadeOut',
      items:1,
      autoHeight: true,
      margin:0,
      loop:true,
      autoplay:true,
      autoplayTimeout:7000,
      autoplayHoverPause:false,
      nav: true,
      dots: true,
      rtl: true,
      stagePadding:0,
      smartSpeed:1000,
      mouseDrag: true,
      touchDrag: true,
      responsive:{
        0:{
          items:1,
          slideBy: 1
        }
      }
    });

  });
  //--------------------------------------------------------------------------------------------

  //-- carousel-col-1  --
  jQuery(document).ready(function() {

    var owl = jQuery(".carousel-col-1");

    owl.owlCarousel({
      nav : true,
      dots : true,
      loop:true,
      autoplay : true,
      autoplayHoverPause: true,
      margin:30,
      rtl: true,
      items : 1, 
      responsive:{
        0:{
            items:1,
            slideBy: 1
        }
      }
    });
  });
  //--------------------------------------------------------------------------------------------

  //-- carousel-col-3  --
  jQuery(document).ready(function() {

    var owl = jQuery(".carousel-col-2");

    owl.owlCarousel({
      nav : true,
      dots : true,
      loop:true,
      autoplay : true,
      autoplayHoverPause: true,
      margin:30,
      rtl: true,
      items : 2, 
      responsive:{
        0:{
            items:1,
            slideBy: 1
        },
        768:{
            items:1,
            slideBy: 1
        },
        1000:{
            items:2,
            slideBy: 2
        }
      }
    });
  });
  //--------------------------------------------------------------------------------------------

  //-- carousel-col-3  --
  jQuery(document).ready(function() {

    var owl = jQuery(".carousel-col-3");

    owl.owlCarousel({
      nav : false,
      dots : false,
      loop:true,
      autoplay : true,
      autoplayHoverPause: true,
      items : 3, 
      margin:30,
      rtl: true,
      responsive:{
        0:{
            items:1,
            slideBy: 1
        },
        992:{
            items:2,
            slideBy: 2
        },
        1200:{
            items:3,
            slideBy: 3
        }
      }
    });
  });
  //--------------------------------------------------------------------------------------------


  //-- carousel-col-4  --
  jQuery(document).ready(function() {

    var owl = jQuery(".carousel-col-4");

    owl.owlCarousel({
      nav : true,
      dots : true,
      loop:true,
      autoplay : true,
      autoplayHoverPause: true,
      items:4,
      rtl: true,
      margin:30,
      responsive:{
        0:{
            items:1,
            slideBy: 1
        },
        768:{
            items:2,
            slideBy: 2
        },
        992:{
            items:3,
            slideBy: 3
        },
        1200:{
            items:4,
            slideBy: 4
        }
      }
    });
  });
  //--------------------------------------------------------------------------------------------


  //-- carousel-col-4  --
  jQuery(document).ready(function() {

    var owl = jQuery(".carousel-col-6");

    owl.owlCarousel({
      nav : false,
      dots : false,
      loop:true,
      autoplay : true,
      autoplayHoverPause: true,
      items:6,
      margin:30,
      rtl: true,
      responsive:{
        0:{
            items:1,
            slideBy: 1
        },
        400:{
            items:2,
            slideBy: 2
        },
        480:{
            items:3,
            slideBy: 3
        },
        750:{
            items:4,
            slideBy: 4
        },
        992:{
            items:6,
            slideBy: 6
        },
        1200:{
            items:6,
            slideBy: 6
        }
      }
    });
  });
  //--------------------------------------------------------------------------------------------

  /* ◄------ marquee -------------------------------► */

  jQuery(document).ready(function() {
    $('.marquee').marquee();
  });
  //--------------------------------------------------------------------------------------------


  /* ◄------ Foucs and Blur for inputs & textareas -------------------------------► */

  //--------------------------------------------------------------------------------------------




  /* ◄------ Accordion & Toggle -------------------------------► */

  //-- Accordion 1 --
  jQuery(document).ready(function(){
    jQuery(".accordian-shortCode .accordion-row > .title").on("click", function(e){
      if(jQuery(this).parent().has("ul")) {
        e.preventDefault();
      }
      
      if(!jQuery(this).hasClass("active")) {
        // hide any open menus and remove all other classes
        jQuery(".accordian-shortCode .accordion-row > .title").removeClass("active");
        jQuery(".accordian-shortCode .accordion-row > .accordion-content").removeClass("opened");
        jQuery(".accordian-shortCode .accordion-row > .accordion-content").slideUp(200);
        
        // open our new menu and add the active class
        jQuery(this).addClass("active");
        jQuery(".accordian-shortCode .accordion-row > .accordion-content").addClass("opened");
        jQuery(this).next(".accordion-content").slideDown(200);
      }
      
      else if(jQuery(this).hasClass("active")) {
        jQuery(this).removeClass("active");
        jQuery(".accordian-shortCode .accordion-row > .accordion-content").removeClass("opened");
        jQuery(this).next(".accordion-content").slideUp(200);
      }
    });
  });
  //--------------------------------------------------------------------------------------------



  /* ◄------ Responsive Nav -------------------------------► */
 
  jQuery(document).ready(function () {

    //-- Including the main nav contents in responsive main nav DIV --
    jQuery('.main-nav-tabs').clone().appendTo('.responsive-main-nav');

    //-- Show and Hide responsive nav --
    jQuery('#responsive-main-nav-toggler').click(function(event){
      event.preventDefault();
      jQuery('#responsive-main-nav-toggler').toggleClass('opened');
      jQuery('.responsive-main-nav').slideToggle(500);


      if ( jQuery('#responsive-main-nav-toggler i').hasClass('fa-bars') )
      {   
          jQuery('#responsive-main-nav-toggler i').removeClass('fa-bars');
          jQuery('#responsive-main-nav-toggler i').addClass('fa-close');
      }else
      {  
          jQuery('#responsive-main-nav-toggler i').removeClass('fa-close');
          jQuery('#responsive-main-nav-toggler i').addClass('fa-bars');
      }

    });

    // dropdown level 1
    if(jQuery(".responsive-main-nav .main-nav-tabs > li > a").parent().has("ul")) {
      jQuery(".responsive-main-nav .main-nav-tabs > li > a:first-child").addClass("toggle-responsive");
      jQuery(".responsive-main-nav .main-nav-tabs > li > a:last-child").removeClass("toggle-responsive");
    }

    jQuery(".responsive-main-nav .main-nav-tabs > li > .toggle-responsive").on("click", function(e){
      if(jQuery(this).parent().has("ul")) {
        e.preventDefault();
      }
      
      if(!jQuery(this).hasClass("active")) {
        // hide any open menus and remove all other classes
        jQuery(".responsive-main-nav .main-nav-tabs > li > .toggle-responsive").removeClass("active");
        jQuery(".responsive-main-nav .main-nav-tabs > li > ul").slideUp(500);
        
        // open our new menu and add the active class
        jQuery(this).addClass("active");
        jQuery(this).next(".responsive-main-nav .main-nav-tabs > li > ul").slideDown(500);
      }
      
      else if(jQuery(this).hasClass("active")) {
        jQuery(this).removeClass("active");
        jQuery(this).next(".responsive-main-nav .main-nav-tabs > li > ul").slideUp(500);
      }
    });


    // dropdown level 2
    if(jQuery(".responsive-main-nav .main-nav-tabs > li > ul > li > a").parent().has("ul")) {
      jQuery(".responsive-main-nav .main-nav-tabs > li > ul > li > a:first-child").addClass("toggle-responsive");
      jQuery(".responsive-main-nav .main-nav-tabs > li > ul > li > a:last-child").removeClass("toggle-responsive");
    }


    jQuery(".responsive-main-nav .main-nav-tabs > li > ul > li > .toggle-responsive").on("click", function(e){
      if(jQuery(this).parent().has("ul")) {
        e.preventDefault();
      }

      if(!jQuery(this).hasClass("active")) {
        // hide any open menus and remove all other classes
        jQuery(".responsive-main-nav .main-nav-tabs > li > ul > li > .toggle-responsive").removeClass("active");
        jQuery(".responsive-main-nav .main-nav-tabs > li > ul li ul").slideUp(500);
        
        // open our new menu and add the active class
        jQuery(this).addClass("active");
        jQuery(this).next(".responsive-main-nav .main-nav-tabs > li > ul li ul").slideDown(500);
      }
      
      else if(jQuery(this).hasClass("active")) {
        jQuery(this).removeClass("active");
        jQuery(this).next(".responsive-main-nav .main-nav-tabs > li > ul li ul").slideUp(500);
      }
    });

  });
  //--------------------------------------------------------------------------------------------

})();//end of use strict
    
