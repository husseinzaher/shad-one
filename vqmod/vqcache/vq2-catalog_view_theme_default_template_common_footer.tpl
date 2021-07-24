<footer>
  <div class="container">
    <div class="row">
        <div class="col-xs-4">
            <a href="#" class="logo"><img src="catalog\view\theme\default\image\logo.png" class="img-responsive center-block"/></a>
        </div>
      <?php if ($informations) { ?>
      <div class="col-sm-3 col-xs-4 links">
        <h5><?php echo $text_information; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
      <div class="col-xs-4 links">
        <h5><?php echo $text_service; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
        </ul>
          <ul class="pay list-unstyled">
              <li><a href="#"><img src="catalog\view\theme\default\image\p1.png" /></a></li>
              <li><a href="#"><img src="catalog\view\theme\default\image\p2.png" /></a></li>
              <li><a href="#"><img src="catalog\view\theme\default\image\p3.png" /></a></li>
              <li><a href="#"><img src="catalog\view\theme\default\image\p4.png" /></a></li>
          </ul>
      </div>
    </div>
    <hr>
    <!-- Starting Copy Right -->
    <div class="copyright">
        <div class="row">
            <div class="col-sm-12">
                <p><?php echo $copy; ?> <a href="#"> www.shad1clothing.com </a> &copy; 2012 - 2018</p>
                <p><a href="#">www.shad1clothing.com </a><?php echo $responsive ?></p>
            
            </div>
        </div>
    </div>
<!-- Ending Copy Right -->
  </div>
</footer>
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
    }

    /* Set the width of the side navigation to 0 */
    function closecart() {
        document.body.classList.remove("active");
        document.getElementById("cartnav").style.right = "-100%";
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


					<?php if( ! empty( $smp_google_analytics ) ) { ?>
						<?php echo htmlspecialchars_decode( $smp_google_analytics ); ?>
					<?php } ?>
				</body>
			
			</html>