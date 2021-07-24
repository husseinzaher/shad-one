    <!-- Start f-instagram -->
    <section class="f-instagram">
        <div class="container-fluid">
            <div id="carousel<?php echo $module; ?>" class="owl-carousel">
            


  <?php foreach ($banners as $banner) { ?>
  <?php $img=$banner['image'];$myimg= str_replace("-130x100","",$img);  ?>
  <div class="item text-center">
            <div>
                    <div class="instagram-block swap-on-hover" style="background-image: url('catalog/view/theme/default/images/bg.png');">
                        <a href="<?php echo $banner['link']; ?>">
                            <img class="swap-on-hover__front-image" src="<?php echo str_replace("/cache","",$myimg); ?>" alt="<?php echo $banner['title']; ?>" />
                            <div class="swap-on-hover__back-image">
                                <img class="" src="catalog/view/theme/default/images/hover0.png" alt="img" />
                                <span><?php echo $banner['title']; ?> >></span>
                            </div>
                        </a>

                    </div>
                </div>
            </div>
            <?php } ?>


            </div>
        </div>
    </section>
    <!-- End review -->


<script type="text/javascript"><!--
$('#carousel<?php echo $module; ?>').owlCarousel({
	items: 4,
        itemsTablet: [767,1],
        itemsMobile: [480,1],
	autoPlay: 3000,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: false
});
--></script>