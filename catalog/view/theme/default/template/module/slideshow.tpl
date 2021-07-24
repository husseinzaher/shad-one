<!-- Start Slider-home -->
<section class="slider-home">
      <div id="slideshow<?php echo $module; ?>" class="main-slid owl-carousel" style="opacity: 1;">

          <?php foreach ($banners as $banner) { ?>
          <?php $img=$banner['image'];$myimg= str_replace("-1366x514","",$img);  ?>
              <div class="item">
                  <div class="img-banner">
                    <?php if ($banner['link']) { ?>
                    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo str_replace("/cache","",$myimg); ?>" alt="<?php echo $banner['title']; ?>"  /></a>
                    <?php } else { ?>
                    <img src="<?php echo str_replace("/cache","",$myimg); ?>" alt="<?php echo $banner['title']; ?>"  />
                    <?php } ?>
                  </div>
              </div>
          <?php } ?>

      </div>
</section>
<!-- End Slider-home -->

<script type="text/javascript"><!--
$('#slideshow<?php echo $module; ?>').owlCarousel({
	items: 6,
	autoPlay: 3000,
	singleItem: true,
	navigation: false,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: true
});
--></script>