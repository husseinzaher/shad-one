<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/bootstrap/js/bootstrap.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<?php if ($direction == 'rtl') { ?>
<link href="catalog/view/javascript/bootstrap/css/bootstrap-a.css" rel="stylesheet" media="screen" />
<link href="catalog/view/theme/default/stylesheet/stylesheet-a.css" rel="stylesheet">
<link href="catalog/view/theme/default/css/style.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/css/style_ar.css" rel="stylesheet" type="text/css" />
<?php } else { ?>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen" />
<link href="catalog/view/theme/default/stylesheet/stylesheet-en.css" rel="stylesheet">
<link href="catalog/view/theme/default/css/style.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/css/style_en.css" rel="stylesheet" type="text/css" />
<?php } ?>
<link href="catalog/view/theme/default/stylesheet/animate.css" rel="stylesheet">
<link href="catalog/view/theme/default/stylesheet/jquery.fancybox.min.css" rel="stylesheet">
<?php if (isset($ishome)) {?>
<link href="catalog/view/theme/default/css/mobile.css" rel="stylesheet" type="text/css" />
<style>
.h-video {
    padding: 60px 0 30px;
    border-bottom: 1px solid #0b0b0a;
    margin-block-end: 30px;
}
.h-video .se-head h2 {
    font-size: 30px;
    background-color: #0b0b0a;
    min-width: 60%;
    text-align: center;
    color: #fff;
}
.se-head h2 span {
    display: block;
    text-align: center;
    width: 100%;
}
.f-instagram {
    padding: 0;
}
.f-instagram .owl-carousel {
    margin: 0;
}
</style>
<?php } ?>
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php echo $google_analytics; ?>
    <link href="catalog/view/theme/default/stylesheet/slick.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
 <script src='catalog/view/javascript/slick.min.js'></script>
<style>
    #product_details img{
        width:100%;
    }
</style>
<?php if ($config_swap_bullet) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('body').on('click', '.swap_bullet', function(e){
		e.preventDefault();
		$(this).parent().siblings('a').find('img').attr('src', $(this).attr('thumb'));
	});
});
//--></script>
<style type="text/css">
.swap_bullets {
	float: left;
	position: relative;
	width: 100%;
	z-index: 3;
}
.product-thumb .swap_bullets {
	padding: 10px 20px 10px 20px;
}
.product-list .product-thumb .swap_bullets {
	padding: 5px 0 10px 0;
}
a.swap_bullet {
	float: left;
	margin: 0 3px 3px 0;
	outline: 0;
}
.product-thumb .image .swap_bullet img {
	padding: 1px;
	<?php if ($config_swap_bullet_radius) { ?>
	-webkit-border-radius: <?php echo $config_swap_bullet_radius; ?>px;
	-moz-border-radius: <?php echo $config_swap_bullet_radius; ?>px;
	border-radius: <?php echo $config_swap_bullet_radius; ?>px;
	<?php } ?>
}
.swap_bullet img {
	border: 1px solid #cccccc;
}
.swap_bullet img:hover, .swap_bullet.selected img {
	border: 1px solid #000000;
}
</style>
<?php } ?>
</head>
<body class="<?php echo $class; ?>">
<!----
    <div class="screen-loading">
        <div class="wrapper">
            <div class="image">
                <img src="<?php echo $logo; ?>" class="img-responsive center-block" alt="" />
            </div>
            <div class="sk-folding-cube">
              <div class="sk-cube1 sk-cube"></div>
              <div class="sk-cube2 sk-cube"></div>
              <div class="sk-cube4 sk-cube"></div>
              <div class="sk-cube3 sk-cube"></div>
            </div>
        </div>
    </div>
---->

    <!-- Start Header -->
    <header>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-1 col-sm-12">
                    <?php if ($logo) { ?>
                    <a href="<?php echo $home; ?>" class="logo"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
                    <?php } else { ?>
                    <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
                    <?php } ?>
                </div>
                <div class="col-md-11 col-sm-12">
                    <div class="top-header">
                        <div class="row">
                            <div class="col-md-8 hidden-xs hidden-sm">
                                <div class="top-info">
                                    <ul>
                                        <li>
                                            <svg xmlns="http://www.w3.org/2000/svg"
                                                xmlns:xlink="http://www.w3.org/1999/xlink" width="0.417in"
                                                height="0.347in">
                                                <image x="0px" y="0px" width="30px" height="25px"
                                                    xlink:href="data:img/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAZCAQAAACMPFaRAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAAmJLR0QA/4ePzL8AAAAHdElNRQflBgISKzIOEcZNAAAC9klEQVQ4y43UfYwIdBgH8O9xS1NXrmK2c5aal2oUaWZrWliSqzTVktYLG71sN9NYwl8mO+kP/WG2QtgUSi+WVOgMxa0uKVG5Odx552gUq/n0R2c5L/F9/nqe377P7/f8nuf5Ri7D+pplk4luaBq/FO06o6xyxEpT7fCD4ZdL7maabfZ6Sz9FooM3HPGVe/+ffI2h1mjAK4rPihe4xRIHvOu2C5Gb62asKtvMNc6PKvU+L3V/69WZoF3T+x6x0H4c013EjT50whStzkvwMurPOB2MV+WwpYZ40DpVBjWePG2PDfqcRexirGW+MyvibvPU+sVkPTUX0c5MJ8xUJKKTRY6arFDcY5E68LzEEiesNcD1TZ7VzAO22WqgiCs8pd56n9tnlTKlpjtkUZSrsVIvzc6rq7VZ9qloTNvBLtVuFS31MN0R1f/2sx6LGz+pqQ3BOh1FrFShtRHWgHIpMCl9k2zInemZ2Zme/TmD9nk896VrivNC5iZZng45leJ8lM25P22yNObjM83EcLtt8YyI272pxl4VymxvHMoVapW7WcRoiCv19ZNao0Rb0xyx3Mf2qDZSiShR5zkRlWaItqaqcdAUXZule8pyVf7MxHydznk1vXM6hRmWHpmdolRkY4rzR5LkVDrm7WxO/1TnVNrkZFRioWhjgQZzdBZxrYE+cNi3XrOjsZRP/W6Fh0SMwrFoZ4KfzddLDLDOIeOVq3LAUg+LFnYYIWKNWSIGW6jGl8qjlWH24LAZrlZgtN1qve4uEY/5wnFDRSz3jpHWO+B9jyqSWO0vc3Ux2BbbPStKlYpCY2xywGr1nhCdbHHSThV6KDyzz4NUqTNKoZYmOaTSHW4yw241pipVYquZ5tjjGyOUnKskLYyzy/fKNNfGYkc12NjYnvbGOKneJ8oUnDt//63kPMe9p7vop5+IPmbY7VcVul1YqJoqRKWjpmghnrRMg7VeUnpxlWvqFhlhpy2qHbTAwMZ9vqgVyDkoyYs5nYX5LX/nEvgHC6GCJciYwQMAAAAASUVORK5CYII=" />
                                            </svg>
                                            <span><?php echo $text_qship; ?></span>
                                        </li>
                                        <li>
                                            <svg xmlns="http://www.w3.org/2000/svg"
                                                xmlns:xlink="http://www.w3.org/1999/xlink" width="0.444in"
                                                height="0.361in">
                                                <image x="0px" y="0px" width="32px" height="26px"
                                                    xlink:href="data:img/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAaCAQAAAB8kpa0AAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAAmJLR0QA/4ePzL8AAAAHdElNRQflBgISLBsD4sjmAAAC1ElEQVQ4y5WVS0jUURTGf/P3bzpJkDU1OFKaL1LohQplD4mirBTLqUxqoQZtIiGpRRBEtGpVi6CV9DJMmbIpojIiyx6YkQWiFWWJKSRmkegw5vi1yJlmbMo6d/ed737nfPce7rWIScLAhpPN3OISffgmpi1/FYgmmSJ2YKWTufio4zKv8f6bQBw57GAp/VziAr3MooTN2GjGTSs9AZ7CrWwd0wt9UI3yZQThVlVL8qhZR5X5E5vYQTR5lJJNL1dw0x6USaecPLxc4SkZbMdBK1XcDK2codv6povK1YwQfI1c6tET7df8cWS6VqlK/Wo0Q+qnkoOPFNLpGEdicVJOMvcpp4WBX2dHImmI3NAOduqelqhCL9Wj01qng3qhNh1XqswAJ0bZOqH3atMBJepBqECJ7sshZGiL3OqT1KjkoHy8tum6PuqOihUlNFWPQy2IUTzAGPXUk0URq6jjHrW0sIgi8plGEyU0BYxgkRu/yAiJzKGFEzQEJBMowImdDlL5ylWu8TaoYAwNJm+YxhggvMQSz2cGgyhdnOIsZZykkvN8+W3chFCEDBkyhPaoUQ4hiyyyBHnPVKeywgzcVD00AR8QSQWxZJHGYQYxASt3qWdsfLwsWMNPvN9/JEnEMZsoEhjGAGJowxgX+HPILzDMXqCASjbxX2Fio4wkRhBiAelUMcRTqv9pt5BJBPGk4QG82IkiAQ+d/9NBH4eIQIDYTTGl9E/q3B9efCbCEwCGSCKFT3wP2y6Ag9m0MwLAFBaTYoSQHtFKNbVsxT5h+xgmK1lCJc+YB9jI5wwu3v0+HBtUpy616rDSA9gKdWijvqpBy3REy7VPzeqSSwX6w5u4kEIKmckjznEHyKGaMqx4+UIpGxniGm6e+28i/LLLKZe69Vi7tF7tytNa3VC3XHLK8Ys32bOeRjGF2JhJPwNcp45XDAdTLJN+LCZ2SlhNEzX0MDox/QNz46zIO1bSpgAAAABJRU5ErkJggg==" />
                                            </svg>
                                            <span><?php echo $text_quality; ?></span>
                                        </li>
                                        <li>
                                            <svg xmlns="http://www.w3.org/2000/svg"
                                                xmlns:xlink="http://www.w3.org/1999/xlink" width="0.347in"
                                                height="0.347in">
                                                <image x="0px" y="0px" width="25px" height="25px"
                                                    xlink:href="data:img/png;base64,iVBORw0KGgoAAAANSUhEUgAAABkAAAAZCAQAAABu4E3oAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAAmJLR0QA/4ePzL8AAAAHdElNRQflBgISLC8iVjxTAAACy0lEQVQ4y22UbWjVZRjGf///OZ3TZjtxRoI2JmWBUgcnQvlFxxbOrblJCjkisQgJLISgT30J8qWGYAwqzlb4VjTwg/RpEosaWerSJnP5tonYiy8nsi1X1jmL9uvDTtv/0LmfLzfc1/Xw3Ndz3xdS5iRc52e+YXW5aiCRWMEiJphiI82c5GECurhJmpABCrOoCP8hT3vOrzzlgI1itVm/84TH/N6X53BRynv2u8TF1hmPXLPM+93mmOn/Uzq8Zlsxn+8TPu16H53t7YQfWhmlZOz2urusFGt9y68d8rinHfaIT4q42vN+4SZjM5RlfuOntpoU1/qt/W613uU+brtZR33TUMy4xzFfMUBs8qyPOJONucMFkf6SrnXEvSLG7LbXWAjc5g8AatjNYXaRi8heoJ8tPMWzgOS5xT8hUKCSFPAik2SZin4UCeIM8w7bSZAgzRSExHmGSUZI08hhbpQQFrCX1cDHVLGOPOeoZ0lIE+vZwZ9kSHEZiLGURPGhH7GCHHCb8zwG7OMmr4ZsZ5DPgTR57gAJ3uY1YDFHiNHBRWCaH0kB42RpizPABmr5iQIJ4sBfvM9u0tQxwRZ+ASDgXn4HQhq5hPPs85CBD3jGDUVpW7xq79yIeLen3CZu9ILNiA1eNGPgQQ9aUQQtLRn8NY5ZY8IDfmAYAuNMMg/pYRUtRa0uMT6rW5KdfMJ1Aqa5xXQIVFPgBjDIPjpppDRS7GeKTqBAjvkEISC1bKYK2UMvPbzOIipIkOQe2jnKQp5ngrtooIU7MyuW9DmHHbLVQGzzmBfss8dezzjqTlPiQg/5g+9aM7fIFXTSxiaGAFjDSu6jwChH+RkI2U+GFxgpXeSYfWatMGlVRKu4VYau8pp15eyiiW5OMkmKK2TJAR20Ir9RzyAv/QcrdZitrORX/qaBPAdYTjtfkqOaPF2RgS3rYw/a5VX7bS5X/Re2wuscilsMdwAAAABJRU5ErkJggg==" />
                                            </svg>
                                            <span><?php echo $text_ship; ?></span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="lang-currency">
                                    <ul>
                                        <?php echo $language; ?>
                                        <?php echo $currency; ?>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="menu-header hidden-xs hidden-sm">
                        <div class="menu-mid">
                            <ul>
                    <?php $counter = 1; foreach ($categories as $category) { ?>
                    <?php if ($category['children']) { ?>
                    <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown" data-hover="<?php echo $category['name']; ?>">
                    <?php if($counter == 1){ ?>
                    <img src="catalog/view/theme/default/images/cat1.png" alt="<?php echo $category['name']; ?>" />
                    <?php }else if($counter == 2){ ?>
                    <img src="catalog/view/theme/default/images/cat2.png" alt="<?php echo $category['name']; ?>" />
                    <?php } ?>
                    <span><?php echo $category['name']; ?></span>
                    
                    </a>

                      <div class="dropdown-menu">
                        <div class="dropdown-inner">
                          <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                          <ul class="list-unstyled">
                            <?php foreach ($children as $child) { ?>
                            <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                            <?php } ?>
                          </ul>
                          <?php } ?>
                        </div>
                        <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
                    </li>
                    <?php } else { ?>
                    <li>
                    <a href="<?php echo $category['href']; ?>">
                    <?php if($counter == 1){ ?>
                    <img src="catalog/view/theme/default/images/cat2.png" alt="<?php echo $category['name']; ?>" />
                    <?php }else if($counter == 2){ ?>
                    <img src="catalog/view/theme/default/images/cat1.png" alt="<?php echo $category['name']; ?>" />
                    <?php } ?>
                    <span><?php echo $category['name']; ?></span>
                    </a>
                    </li>
                    <?php } ?>
                    <?php $counter++;} ?>
                            </ul>
                        </div>
                        <div class="menu-left">
                            <ul>
                                <li class="search">
                                    <a data-toggle="collapse" href="#collapseSearch" aria-expanded="false" aria-controls="collapseSearch">
                                        <i class="fa fa-search"></i>
                                    </a>
                                    
                                </li>
                                
                                    
                                    
                                    
                                    
                                    
                                <?php if ($logged) { ?>
                                <li class="account">
                                    <a href="<?php echo $account; ?>">
                                        <img src="catalog/view/theme/default/images/i2.png" alt="<?php echo $text_account; ?>">
                                        <span><?php echo $text_account; ?></span>
                                    </a>
                                </li>
                                <?php } else { ?>
                                <li class="account">
                                    <a href="<?php echo $login; ?>">
                                        <img src="catalog/view/theme/default/images/i2.png" alt="<?php echo $text_login; ?>">
                                        <span><?php echo $text_login; ?></span>
                                    </a>
                                </li>
                                <?php } ?>
                                <li class="cart-con">
                                    <?php echo $cart; ?>
                                </li>

                                    
                            </ul>
                            
                        </div>
                        
                    </div>
                    
                    <div  class="collapse" id="collapseSearch">
                                        <?php echo $search; ?>
                                    </div >
                    
                </div>
                <!-- End Head-bottom -->
            </div>
            <!-- /Col -->
        </div>
    </header>
    <!-- End Header -->




    <span class="menu-trigger visible-xs-block">
        <i class="menu-trigger-bar top"></i>
        <i class="menu-trigger-bar middle"></i>
        <i class="menu-trigger-bar bottom"></i>
      </span>
<!-- Starting Mobole Menu -->
<div class="mobile-menu visible-xs-block ">
    <ul class="mob-cart list-unstyled"><li><?php echo $cart; ?></li>
   <li><i class="fa flaticon-profile"></i>
              <?php if ($logged) { ?>
                        <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>  <span>-</span>  
                                                  <a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>


                <?php } else { ?>
              <a href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
              <?php } ?>
              </li>
    </ul>
         

      
  <div class="burger">
    <div class="burger__patty"></div>
    <div class="burger__patty"></div>
    <div class="burger__patty"></div>
  </div>

  <nav class="menu">
    <div class="menu__brand">
      <a href=""><div class="logo">
          <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
          </div>
        </a>
    </div>
    <ul class="menu__list">
        <ul>
        <?php echo $search; ?>
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown" data-hover="<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a>
          <div class="dropdown-menu">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <ul class="list-unstyled">
                <?php foreach ($children as $child) { ?>
                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            </div>
            <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
        </li>
        <?php } else { ?>
        <li class="menu__item"><a href="<?php echo $category['href']; ?>" data-hover="<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
        </ul>
    </ul>
  </nav>
</div>

<!-- Ending Mobile Menu -->
