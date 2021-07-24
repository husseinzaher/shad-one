<div id="layerslider<?php echo $module; ?>" class="layerslider_wrapper" style="width: <?php echo $width; ?>px; height: <?php echo $height; ?>px;">
<?php foreach($sections as $section) { ?>
<?php if($section['sort_order'] != '-1'){ ?>
<div class="ls-slide" data-ls="slidedelay: <?php echo $section['duration']; ?>; <?php echo $section['slide_transition']; ?>;">
<?php if (!empty($section['is_bg'])) { ?>
<img src="<?php echo $section['thumb_image']; ?>" class="ls-bg" alt="">
<?php } ?> 
  <?php foreach($section['groups'] as $key => $group){ ?>
  	<?php if($group['type'] == 'image'){ ?>
          <img src="<?php echo $group['image']; ?>" class="ls-l" alt="" style="
          top: <?php echo $group['top']; ?>px; 
          left: <?php echo $group['left']; ?>px;
          " data-ls="
            delayin:<?php echo $group['start']; ?>;
            showuntil:<?php echo $group['end']; ?>;
            durationin:<?php echo $group['durationin']; ?>;
			durationout:<?php echo $group['durationout']; ?>;
            easingin:<?php echo $group['easingin']; ?>;
            easingout:<?php echo $group['easingout']; ?>;
            <?php echo $group['transitionin']; ?>
            <?php echo $group['transitionout']; ?>
            ">
    <?php } ?> 
    <?php if($group['type'] == 'text'){ ?>
            <span class="ls-l" alt="" style="
            top: <?php echo $group['top']; ?>px; 
            left: <?php echo $group['left']; ?>px; 
            font-family:<?php echo $group['font']; ?>; 
            font-weight:<?php echo $group['fontweight']; ?>; 
            font-size:<?php echo $group['fontsize']; ?>; 
            color:<?php echo $group['color']; ?>; 
            background-color:<?php echo $group['bg']; ?>; 
            padding:<?php echo $group['padding']; ?>; 
            border-radius:<?php echo $group['radius']; ?>; 
            <?php echo $group['customcss']; ?>
            " data-ls="
            delayin:<?php echo $group['start']; ?>;
            showuntil:<?php echo $group['end']; ?>;
            durationin:<?php echo $group['durationin']; ?>;
			durationout:<?php echo $group['durationout']; ?>;
            easingin:<?php echo $group['easingin']; ?>;
            easingout:<?php echo $group['easingout']; ?>;
            <?php echo $group['transitionin']; ?>
            <?php echo $group['transitionout']; ?>
            ">
            <?php echo $group['description']; ?>
            </span>
    <?php } ?>
    <?php if($group['type'] == 'button'){ ?>
            <a class="ls-l <?php echo $group['button_class']; ?>" href="<?php echo $group['button_href']; ?>" <?php if ($group['button_target']) { echo 'target="_blank"'; } ?> style="
            top: <?php echo $group['top']; ?>px; 
            left: <?php echo $group['left']; ?>px; 
            font-family:<?php echo $group['font']; ?>; 
            font-weight:<?php echo $group['fontweight']; ?>; 
            " data-ls="
            delayin:<?php echo $group['start']; ?>;
            showuntil:<?php echo $group['end']; ?>;
            durationin:<?php echo $group['durationin']; ?>;
			durationout:<?php echo $group['durationout']; ?>;
            easingin:<?php echo $group['easingin']; ?>;
            easingout:<?php echo $group['easingout']; ?>;
            <?php echo $group['transitionin']; ?>
            <?php echo $group['transitionout']; ?>
            ">
            <span><?php echo $group['description']; ?></span>
            </a>
    <?php } ?>
  <?php } ?> <!-- foreach groups -->
  <?php if ($section['link']) { ?>
  <a href="<?php echo $section['link']; ?>" class="ls-link" <?php if ($section['link_new_window']) { echo 'target="_blank"'; } ?> ?></a>
  <?php } ?>
</div> <!-- .ls-slide ends -->
<?php } ?>
<?php } ?> <!-- foreach sections ends -->
</div> <!-- id Layerslider ends -->
<script type="text/javascript">
$(document).ready(function(){
	$('#layerslider<?php echo $module; ?>').layerSlider({
		<?php if ($nav_buttons == 'hover') { ?>
		hoverPrevNext: true,
		<?php } else if ($nav_buttons == 'false') { ?>
		navPrevNext: false,
		<?php } else { ?>
		hoverPrevNext: false,
		<?php } ?>
		<?php if ($nav_bullets == 'hover') { ?>
		hoverBottomNav: true,
		<?php } else if ($nav_bullets == 'false') { ?>
		navButtons: false,
		<?php } else { ?>
		hoverBottomNav: false,
		<?php } ?>
		navStartStop: <?php echo $nav_play_pause; ?>,
		thumbnailNavigation: '<?php echo $nav_thumbs; ?>',
		showCircleTimer: <?php echo $nav_circle; ?>,
		showBarTimer: <?php echo $nav_timer_bar; ?>,
		pauseOnHover: <?php echo $nav_pause_hover; ?>,
		skinsPath: 'catalog/view/javascript/layerslider/skins/',
		skin: '<?php echo $slideshow_skin; ?>'
	});
});
</script>