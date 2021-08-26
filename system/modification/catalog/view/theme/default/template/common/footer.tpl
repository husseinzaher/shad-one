<!-- Start Footer -->
    <footer>
        <!-- Start Footer-top -->
        <div class="footer-top">
            <div class="container-fluid">

                <div class="row">

                    <div class="col-md-3 col-sm-4 col-xs-12 f-logo-con">
                        <div class="f-logo text-center">
                            <?php if ($logo) { ?>
                                <a href="<?php echo $home; ?>" class="logo"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-12 imp-l">
                        <h3><?php echo $text_information; ?></h3>
                        <ul>
                            <?php foreach ($informations as $information) { ?>
                            <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                            <?php } ?>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6 imp-l">
                        <h3><?php echo $text_service; ?></h3>
                        <ul>
                            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                            <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
                        </ul>
                        <div class="u_info">
                            <h3><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></h3>
                           <ul>
                                <li><a href="mailto:<?php echo $config_banner_url; ?>" target="_blank">
                            <?php if ($direction == 'rtl') { ?>
                               الايميل
                            <?php } else { ?>
                                E
                            <?php } ?>
: <span><?php echo $config_banner_url; ?></span></a></li>
                                <li><a href="tel:<?php echo $config_banner_img; ?>" target="_blank">

                            <?php if ($direction == 'rtl') { ?>
                               الجوال
                            <?php } else { ?>
                                p
                            <?php } ?>
: <span>+<?php echo $config_banner_img; ?></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6 imp-l">
                        <h3> 
                            <?php if ($direction == 'rtl') { ?>
                               تابعنا على
                            <?php } else { ?>
                                FOLLOW US ON
                            <?php } ?>
                        </h3>
                        <div class="f-social">
                            <ul class="list-inline">
                                <li><a href="https://api.whatsapp.com/send?l=ar&phone=<?php echo $config_whatsapp_id; ?>" target="_blank"><i class="fa fa-whatsapp"></i></a></li>
                                <li><a href="<?php echo $config_instagram; ?>" target="_blank"><i class="fa fa-instagram"></i></a></li>
                                <li><a href="<?php echo $config_snapchat; ?>" target="_blank"><i class="fa fa-snapchat-ghost"></i></a></li>
                                <li><a href="<?php echo $config_facebookid; ?>" target="_blank"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="<?php echo $config_youtubeid; ?>" target="_blank"><i class="fa fa-youtube"></i></a></li>
                                <li><a href="<?php echo $config_twitterid; ?>" target="_blank"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="<?php echo $config_linkedid; ?>" target="_blank"><i class="fa fa-pinterest"></i></a></li>
                            </ul>
                        </div>
                         <div id="newsletter_footer">
						</div>

                    </div>

                </div>

                <div class="row se-footer">
                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="f-pay">
                            <img src="<?php echo $config_image1; ?>" alt="img" />
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="rights text-center">
                            <p>
                                <?php if ($direction == 'rtl') { ?>
                                    <?php if ($config_adv_1_ar) { ?>
                                        <?php echo $config_adv_1_ar; ?>
                                    <?php } ?>
                                <?php } else { ?>
                                        <?php if ($config_adv_1_en) { ?>
                                            <?php echo $config_adv_1_en; ?>
                                        <?php } ?>
                                <?php } ?>
                            </p>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="comp-rights">
                            <p>
                            <?php if ($direction == 'rtl') { ?>
                               الرقم الضريبى 
                            <?php } else { ?>
                                VAT NUMBER 
                            <?php } ?>
                                : <?php echo $config_location_id; ?>
                            </p>
                        </div>
                    </div>

                </div>


            </div>
        </div>
        <!-- End Footer-top -->
    </footer>
    <!-- End Footer -->
<script async src="https://static.addtoany.com/menu/page.js"></script>
<script src="catalog/view/javascript/jquery.zoom.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery.fancybox.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/wow.min.js" type="text/javascript"></script>
<script>
      new WOW().init();
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.18.2/TweenMax.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.18.2/TimelineMax.min.js"></script>
<script>

 $( "#newsletter_footer" ).append( $( "section.subscribe" ) );

$(document).ready(function () {
    "use strict";
    if( $(window).width() <= 767) {
           $('.remove-xs').remove();
       }
    //select size
    $('.radio input').change(
    function(){
        if ($(this).is(':checked')) {
           $('.radio label').removeClass('actv');
           $(this).closest('label').addClass('actv');
        }
    });
    //Loading Screen
    $(".screen-loading .wrapper").fadeOut(1000, function () {
            // Show The Scroll
            $("body").css("overflow-y", "auto");

            $(this).parent().fadeOut(1000, function () {

                $(this).remove();
            });
        });
                
    $('.zoom_05').zoom();
    
//    $('.product-page .panel-default > .panel-heading').on('click', function () {
//        $(this).children('i').toggleClass('fa-plus fa-minus');
//    })
    if ($('.collapse').hasClass('in')) {
         $(this).siblings('.panel-heading').children('i').toggleClass('fa-plus fa-minus');
        };
    // Mobile Menu 
    (function() {
  
  var Menu = (function() {
    var burger = document.querySelector('.burger');
    var menu = document.querySelector('.menu');
    var menuList = document.querySelector('.menu__list');
    var brand = document.querySelector('.menu__brand');
    var menuItems = document.querySelectorAll('.menu__item');
    
    var active = false;
    
    var toggleMenu = function() {
      if (!active) {
        menu.classList.add('menu--active');
        menuList.classList.add('menu__list--active');
        brand.classList.add('menu__brand--active');
        burger.classList.add('burger--close');
        for (var i = 0, ii = menuItems.length; i < ii; i++) {
          menuItems[i].classList.add('menu__item--active');
        }
        
        active = true;
      } else {
        menu.classList.remove('menu--active');
        menuList.classList.remove('menu__list--active');
        brand.classList.remove('menu__brand--active');
        burger.classList.remove('burger--close');
        for (var i = 0, ii = menuItems.length; i < ii; i++) {
          menuItems[i].classList.remove('menu__item--active');
        }
        
        active = false;
      }
    };
    
    var bindActions = function() {
      burger.addEventListener('click', toggleMenu, false);
    };
    
    var init = function() {
      bindActions();
    };
    
    return {
      init: init
    };
    
  }());
  
  Menu.init();
  
}());
    
    $('#ultimatemegafilter_box .option_box.selec table tr').on('click', function () {
        $(this).addClass('actv').siblings('tr').removeClass('actv');
    })
});
</script>

<script>
    
    //Cart SideNav
    function opencart() {
        document.body.classList.add("active");
        document.getElementById("cartnav").style.right = "0";
        //document.getElementsByClassName("sidenavqw")[0].style.right = "0";
    }

    /* Set the width of the side navigation to 0 */
    function closecart() {
        document.body.classList.remove("active");
       document.getElementById("cartnav").style.right = "-100%";
       // document.getElementsByClassName("sidenavqw")[0].style.right = "-100%";
    }

    
     // Accordion Toggle Items
   var iconOpen = 'fa fa-minus',
        iconClose = 'fa fa-plus';

    $(document).on('.collapse.in ', '.accordion', function (e) {
        var $target = $(e.target)
          $target.siblings('.accordion-heading')
          .find('i').toggleClass(iconOpen + ' ' + iconClose);
          if(e.type == 'show')
              $target.prev('.accordion-heading').find('.accordion-toggle').addClass('active');
          if(e.type == 'hide')
              $(this).find('.accordion-toggle').not($target).removeClass('active');
    });
</script>
<?php if ($direction == 'rtl') { ?>
    <script src="catalog/view/javascript/plugins.js" type="text/javascript"></script>
<?php } else { ?>
    <script src="catalog/view/javascript/pluginsen.js" type="text/javascript"></script>
<?php } ?>
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->


		 <!-- Modal -->
		  <!-- this is a optional css style you can remove it. its just added to make slow fade in & fade out animation in modal becuase using jquery loading product related option from product page take time. so if modal open slowly ? vistor dont have to wait much to see the  option even after opening the modal  -->
		 		 <style> 
	#productInfoModal	 .modal.fade .modal-dialog {
    -webkit-transform: scale(0.1);
    -moz-transform: scale(0.1);
    -ms-transform: scale(0.1);
    transform: scale(0.1);
    top: -300px;
    opacity: 0;
    -webkit-transition: all 0.9s;
    -moz-transition: all 0.9s;
    transition: all 0.9s;
}

#productInfoModal .modal.fade.in .modal-dialog {
    -webkit-transform: scale(1);
    -moz-transform: scale(1);
    -ms-transform: scale(1);
    transform: scale(1);
    -webkit-transform: translate3d(0, 300px, 0);
    transform: translate3d(0, 300px, 0);
    opacity: 1;
}

#productInfoModal .qty .sizeg {
	display:none
}
/* when product picture zoon & swipe extension is installed ? than product picture on modals look outside out of border of modal in left side so add morgin  to fix the issue */
.thumbnail {
 margin-left: 5px;

}
</style> 
<div class="product-page ">
<div id="productInfoModal" class="modal fade" role="dialog">
  <div  class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title text-center">Quick View</h4>
      </div>
      <div id="product_details" class="modal-body">
        <i class='fa fa-spinner fa-spin' style='font-size:26px;color:red'></i> &nbsp; Loading Product Details...Please Wait
      </div>
      <div class="modal-footer">
        <button type="button" id="modalCloseButton" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
</div>
<script type="text/javascript"> 
function quickview(id){
$("#quick"+id).show();
}
function quickout(){

$(".removequickview").css("display","none");
}
function quickview_popup(id){
$("#product_details").load("index.php?route=product/product&product_id="+id+" #content .row:first", function(){
    cart_add();
});    
 
}

  $('#productInfoModal').on('shown.bs.modal', function() {
  //  $(".fade").removeClass('modal-backdrop');

});
function cart_add(){
// script for add to cart button 
$('#product_details').find('#button-cart').on('click', function() {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function() {
                $('#product_details').find('#button-cart').button('loading');
            },
            complete: function() {
                $('#product_details').find('#button-cart').button('reset');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            var element = $('#input-option' + i.replace('_', '-'));

                            if (element.parent().hasClass('input-group')) {
                                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            } else {
                                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            }
                        }
                    }

                    if (json['error']['recurring']) {
                        $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');
                }

                if (json['success']) {
                    $('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

					document.getElementById('modalCloseButton').click();
					
                    $('html, body').animate({
                        scrollTop: 0
                    }, 'slow');										

				$('#cart ul').load('index.php?route=common/cart/info ul li');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

	$('.qty .fa-plus').on('click', function () {
        var valu = parseInt($('.form-control.count').val());
        $('.form-control.count').val(valu + 1);
    });
    
    $('.qty .fa-minus').on('click', function () {
        var valu = parseInt($('.form-control.count').val());
        if(valu > 1) {
           $('.form-control.count').val(valu - 1); 
        }

    });

    $('.zoom_05').zoom();
$('#product_details .slider-for').slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: false,
      fade: true,
      asNavFor: '#product_details .slider-nav',
        rtl : true
    });
    $('#product_details .slider-nav').slick({
      slidesToShow: 4,
      slidesToScroll: 1,
      asNavFor: '#product_details .slider-for',
      dots: false,
      focusOnSelect: true
    });
	// script for buy now button 
	$('#product_details').find('#button-cart2').on('click', function() {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function() {
                $('#product_details').find('#button-cart2').button('loading');
            },
            complete: function() {
                $('#product_details').find('#button-cart2').button('reset');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            var element = $('#input-option' + i.replace('_', '-'));

                            if (element.parent().hasClass('input-group')) {
                                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            } else {
                                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            }
                        }
                    }

                    if (json['error']['recurring']) {
                        $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');
                }

                if (json['success']) {
                    $('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

					document.getElementById('modalCloseButton').click();
					
                    $('html, body').animate({
                        scrollTop: 0
                    }, 'slow');
					
					location = '/index.php?route=checkout/checkout';

                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
 

    $('button[id^=\'button-upload\']').on('click', function() {
        var node = this;

        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        if (typeof timer != 'undefined') {
            clearInterval(timer);
        }

        timer = setInterval(function() {
            if ($('#form-upload input[name=\'file\']').val() != '') {
                clearInterval(timer);

                $.ajax({
                    url: 'index.php?route=tool/upload',
                    type: 'post',
                    dataType: 'json',
                    data: new FormData($('#form-upload')[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function() {
                        $(node).button('loading');
                    },
                    complete: function() {
                        $(node).button('reset');
                    },
                    success: function(json) {
                        $('.text-danger').remove();

                        if (json['error']) {
                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                        }

                        if (json['success']) {
                            alert(json['success']);

                            $(node).parent().find('input').val(json['code']);
                        }
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });
  
}
// Clear modal content when its get hidden (close) otherwise it will show last product content in new product also until the new product get loaded
$(document).ready(function() {
  $("#productInfoModal").on("hidden.bs.modal", function() {
    $(".modal-body").html("<i class='fa fa-spinner fa-spin' style='font-size:26px;color:red'></i> &nbsp; Loading Product Details...Please Wait");
  });
});




</script>
		
</body></html>