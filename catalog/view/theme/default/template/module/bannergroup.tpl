<style>
.bannergroup, .bannergroup > * {
    box-sizing: border-box;
}
.bannergroup:before, .bannergroup:after, .bannergroup > *:before, .bannergroup > *:after  {
    box-sizing: border-box;
}
.bannergroup:before,
.bannergroup:after {
  display: table;
  content: " ";
}
.bannergroup:after,
.bannergroup:after {
  clear: both;
}
.bannergroup > div { float: left; }
.bannergroup img { width: 100%; image-rendering: optimizeQuality; }
<?php if ($remove_left == 1) { ?>
.bannergroup div:first-child { padding-left: 0!important;}
<?php } ?>
<?php if ($remove_right == 1) { ?>
.bannergroup div:last-child { padding-right: 0!important;}
<?php } ?>
@media screen and (max-width: 480px) {
.bannergroup > div { width: 100%!important; }
}
</style>
<?php switch ($banner_num) {
        case "1":
            $width = '100%';
            break; 
        case "2":
        	$width = 'calc((100% - 18px) / 2)';
            break;
        case "3":
        	$width = '33.33333%';
            break;
        case "4": 
        	$width = '25%';
        	break;
        case "5":
        	$width = '20%';
        	break;
        case "6":
        	$width = '16.66666%';
        	break;
        }
?>
<div class="bannergroup">
    <div class="container">
    <div class="row">
        <?php foreach ($banners as $banner) { ?>
    	<div class="col-md-6" style="margin-bottom:15px; margin-top:15px;"> 
            <?php if ($banner['link']) { ?>
                            <a href="<?php echo $banner['link']; ?>">

                <div class="image">
                    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" />
                </div>    

                  
                    
            </a>
            <?php } else { ?>
                    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" />
            <?php } ?>
        </div>        
    <?php } ?>
        
    </div>
    </div>
</div>