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
<!----
<script src="catalog/view/theme/default/tel/intlTelInput-jquery.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/default/tel/intlTelInput.js" type="text/javascript"></script>
<script>
    $("#input-telephone").intlTelInput({
        preferredCountries: ["sa", "gb"],
        separateDialCode: true,
        hiddenInput: "full",
    });
</script>
----->
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->

</body></html>