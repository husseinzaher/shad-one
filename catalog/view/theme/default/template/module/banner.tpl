<div id="banner<?php echo $module; ?>" class="owl-carousel banners-common common-carousel">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
  </div>
  <?php } ?>
</div>
<script type="text/javascript"><!--
$('#banner<?php echo $module; ?>').owlCarousel({
	items: 6,
	autoPlay: 3000,
	singleItem: true,
	navigation: true,
	pagination: false,
	transitionStyle: 'fade',
        navigationText: ['<i class="fa fa-angle-left fa-5x"></i>', '<i class="fa fa-angle-right fa-5x"></i>'],

});
--></script>
