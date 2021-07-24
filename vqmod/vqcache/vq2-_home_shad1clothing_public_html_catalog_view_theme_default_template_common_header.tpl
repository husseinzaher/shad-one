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
<?php } else { ?>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen" />
<link href="catalog/view/theme/default/stylesheet/stylesheet-en.css" rel="stylesheet">
<?php } ?>
<link href="catalog/view/theme/default/stylesheet/animate.css" rel="stylesheet">
<link href="catalog/view/theme/default/stylesheet/jquery.fancybox.min.css" rel="stylesheet">
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

				<?php if( ! empty( $smp_canonical_url ) ) { ?>
					<link href="<?php echo $smp_canonical_url; ?>" rel="canonical" />
				<?php } ?>
				
				<?php foreach( $documentGetMeta as $val ) { ?>
					<meta<?php foreach( $val as $k => $v ) { ?> <?php echo $k; ?>="<?php echo $v; ?>"<?php } ?> />
				<?php } ?>
				
				<script type="text/javascript">
					function getURLVar(key) {
						<?php if( ! empty( $smk_current_route ) ) { ?>
							if( key == 'route' ) {
								return '<?php echo addslashes( $smk_current_route ); ?>';
							}
						<?php } ?>
				
						var value 	= [],
							url		= String(document.location),
							query;
						
						if( url.indexOf( '?' ) > -1 ) {
							query = url.split('?');
						} else {
							query = url.split('/');
							query.shift();
							query.shift();
							query.shift();
							query = query.join('/');
							
							query = query.indexOf( '&' ) > -1 ? [ query.substring( 0, query.indexOf('&') ), query.substring( query.indexOf('&')+1 ) ] : [ query, '' ];
							
							value['route'] = query[0];
						}
						
						if (typeof query[1] != 'undefined') {
							var part = query[1].split('&');

							for (i = 0; i < part.length; i++) {
								var data = part[i].split('=');
								
								if (data[0] && data[1]) {
									value[data[0]] = data[1];
								}
							}
							
							if (value[key]) {
								return value[key];
							} else {
								return '';
							}
						}
					}
				</script>
			

				<?php if( ! empty( $smp_meta ) ) { ?>
					<?php foreach( $smp_meta as $k => $v ) { ?>
						<?php if( ! empty( $v ) ) { ?>
							<meta name="<?php echo $k; ?>" content="<?php echo $v; ?>" />
						<?php } ?>
					<?php } ?>
				<?php } ?>
				
				<?php if( ! empty( $smp_extras['facebook_widget']['enabled'] ) ) { ?>
					<script type="text/javascript">
						$().ready(function(){
							$('body').prepend('<div id="fb-root"></div>');
						
							(function(d, s, id) {
								var js, fjs = d.getElementsByTagName(s)[0];
								if (d.getElementById(id)) return;
								js = d.createElement(s); js.id = id;
								js.src = "//connect.facebook.net/<?php echo $smp_config_language . '_' . strtoupper( $smp_config_language ); ?>/sdk.js#xfbml=1&version=v2.4";
								fjs.parentNode.insertBefore(js, fjs);
							}(document, 'script', 'facebook-jssdk'));
						});
					</script>
					<script type="text/javascript">
						$().ready(function(){				
							var html = 
								'<div ' +
									'id="smp-fb-widget" ' +
									'style="border: 1px solid #<?php echo $smp_extras['facebook_widget']['colorscheme'] == 'dark' ? '000' : 'ccc'; ?>; background: #<?php echo $smp_extras['facebook_widget']['colorscheme'] == 'dark' ? '000' : 'fff'; ?>; z-index: 999; position: fixed; display: block; top:<?php echo $smp_extras['facebook_widget']['margin_top']; ?>px; <?php echo $smp_extras['facebook_widget']['position'] == 'left' ? 'left' : 'right'; ?>:-<?php echo $smp_extras['facebook_widget']['width']+2; ?>px;"' +
								'>' +
									'<img ' +
										'style="position: absolute; cursor: pointer;" ' +
										'src="<?php echo ! empty( $smp_extras['facebook_widget']['image'] ) ? 'image/' . $smp_extras['facebook_widget']['image'] : ( 'catalog/view/theme/default/smp/img/fb-' . $smp_extras['facebook_widget']['position'] . '.png' ); ?>" ' +
									'/>' +
									'<div ' +
										'class="fb-page" ' +
										'data-href="<?php echo $smp_extras['facebook_widget']['url']; ?>" ' +
										'data-small-header="<?php echo ! empty( $smp_extras['facebook_widget']['small_header'] ) ? 'true' : 'false'; ?>" ' +
										'data-adapt-container-width="false" ' +
										'data-hide-cover="false" ' +
										'data-show-facepile="<?php echo empty( $smp_extras['facebook_widget']['show_faces'] ) ? 'false' : 'true'; ?>" ' +
										'data-width="<?php echo $smp_extras['facebook_widget']['width']; ?>" ' +
										'data-height="<?php echo $smp_extras['facebook_widget']['height']; ?>" ' +
										'data-show-posts="<?php echo empty( $smp_extras['facebook_widget']['show_posts'] ) ? 'false' : 'true'; ?>">' +
											'<div class="fb-xfbml-parse-ignore">' +
											'<blockquote cite="<?php echo $smp_extras['facebook_widget']['url']; ?>">' +
												'<a href="<?php echo $smp_extras['facebook_widget']['url']; ?>">Facebook</a>' +
											'</blockquote>' +
										'</div>' +
									'</div>';
							
							$('body').prepend( html );
						});
					</script>
					
					<script type="text/javascript">
						$().ready(function(){
							$('#smp-fb-widget').each(function(){
								var self	= $(this),
									img		= self.find('> img:first'),
									box		= self.find('.fb-like-box:first'),
									pos		= '<?php echo $smp_extras['facebook_widget']['position']; ?>',
									width	= <?php echo (int) $smp_extras['facebook_widget']['width']+2; ?>,
									loader	= setInterval(function(){
										if( ! img.width() || ! img.height() ) 
											return;
											
										clearInterval( loader );
											
										img.css('margin-left', pos == 'left' ? width-1 : - img.width());
										img.click(function(){
											var opt = {};
											opt[pos] = 0;
												
											self.animate(opt, 500).unbind('mouseleave').bind('mouseleave', function(){
												var opt = {};
												opt[pos] = - width;
												self.animate(opt,500);
											});
										});
									},100);									
							});
						});
					</script>
				<?php } ?>
				
				<?php if( ! empty( $smp_extras ) && ! empty( $smp_extras['g_plus_widget']['enabled'] ) ) { ?>
					<script type="text/javascript">
						$().ready(function(){
							window.___gcfg = {lang: '<?php echo $smp_config_language; ?>'};

							(function() {
								var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
								po.src = 'https://apis.google.com/js/platform.js';
								var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
							})();
						});
					</script>
					<script type="text/javascript">
						$().ready(function(){
							var html = 
								'<div ' +
									'id="smp-gplus-widget" ' +
									'style="background: #<?php echo $smp_extras['g_plus_widget']['colorscheme'] == 'dark' ? '000' : 'fff'; ?>; z-index: 999; position: fixed; display: block; top:<?php echo $smp_extras['g_plus_widget']['margin_top']; ?>px; <?php echo $smp_extras['g_plus_widget']['position'] == 'left' ? 'left' : 'right'; ?>:<?php echo - $smp_extras['g_plus_widget']['width']; ?>px;"' +
								'>' +
									'<img ' +
										'style="position: absolute; cursor: pointer;" ' +
										'src="<?php echo ! empty( $smp_extras['g_plus_widget']['image'] ) ? 'image/' . $smp_extras['g_plus_widget']['image'] : ( 'catalog/view/theme/default/smp/img/g_plus-' . $smp_extras['g_plus_widget']['position'] . '.png' ); ?>" ' +
									'/>' +
									'<div ' +
										'class="g-<?php echo empty( $smp_extras['g_plus_widget']['type_account'] ) ? 'person' : $smp_extras['g_plus_widget']['type_account']; ?>" ' +
										'data-width="<?php echo $smp_extras['g_plus_widget']['width']; ?>" ' +
										'data-height="<?php echo $smp_extras['g_plus_widget']['height']; ?>" ' +
										'data-href="<?php echo $smp_extras['g_plus_widget']['url']; ?>" ' +
										'data-theme="<?php echo $smp_extras['g_plus_widget']['colorscheme']; ?>" ' +
										( '<?php echo $smp_extras['g_plus_widget']['layout']; ?>' == 'portrait' ? '' : 'data-layout="<?php echo $smp_extras['g_plus_widget']['layout']; ?>" ' ) +
										'data-rel="author">' +
									'</div>' +
								'</div>';
								
							$('body').prepend( html );
						});
					</script>
					
					<script type="text/javascript">
						$().ready(function(){
							$('#smp-gplus-widget').each(function(){
								var self	= $(this),
									img		= self.find('> img:first'),
									box		= self.find('.g-<?php echo empty( $smp_extras['g_plus_widget']['type_account'] ) ? 'person' : $smp_extras['g_plus_widget']['type_account']; ?>:first'),
									pos		= '<?php echo $smp_extras['g_plus_widget']['position']; ?>',
									width	= <?php echo (int) $smp_extras['g_plus_widget']['width']; ?>,
									loader	= setInterval(function(){
										if( ! img.width() || ! img.height() ) 
											return;
											
										clearInterval( loader );
											
										img.css('margin-left', pos == 'left' ? width : - img.width());
										img.click(function(){
											var opt = {};
											opt[pos] = 0;
												
											self.animate(opt, 500).unbind('mouseleave').bind('mouseleave', function(){
												var opt = {};
												opt[pos] = - width;
												self.animate(opt,500);
											});
										});
									},100);									
							});
						});
					</script>
				<?php } ?>
				
				<?php echo (string) $__SMP_HREFLANG; ?>
				
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
    <div class="screen-loading">
        <div class="wrapper">
            <div class="image">
                <img src="catalog\view\theme\default\image\logo.png" class="img-responsive center-block" alt="" />
            </div>
            <div class="sk-folding-cube">
              <div class="sk-cube1 sk-cube"></div>
              <div class="sk-cube2 sk-cube"></div>
              <div class="sk-cube4 sk-cube"></div>
              <div class="sk-cube3 sk-cube"></div>
            </div>
        </div>
    </div>
<nav id="top">
  <div class="container">
      <div class="row">
          <div class="col-sm-10 col-sm-offset-2">
        <div id="top-links">
            <div class="left fl">
                <ul class="list-unstyled">
                    <li><a href="#"><?php echo $text_qship; ?> </a></li>
                    <li><a href="#"><?php echo $text_quality; ?> </a></li>
                    <li><a href="#"><?php echo $text_ship; ?></a></li>
                </ul>
            </div>
            <div class="right fr">
                <?php echo $currency; ?>
                <?php echo $language; ?>
                <div class="remove-xs pull-left"><?php echo $search; ?></div>
            </div>
        </div>
              <div class="clearfix hr"></div>
      </div>
      </div>
    </div>
</nav>
<header >
  <div class="container">
    <div class="row">
      <div class="col-sm-2">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="col-sm-10 hidden-xs">

          <?php if ($categories) { ?>
              <nav id="menu" class="navbar">
                  <ul class="nav navbar-nav">
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
                    <li><a href="<?php echo $category['href']; ?>" data-hover="<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a></li>
                    <?php } ?>
                    <?php } ?>
                  </ul>
              </nav>
            <?php } ?>
          <ul class="list-unstyled fr icons">
              <span class="remove-xs"><?php echo $cart; ?></span>
              <li><i class="fa flaticon-profile"></i>
              <?php if ($logged) { ?>
                          <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a> <span>-</span>   
                          <a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
                <?php } else { ?>
              <a href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
              <?php } ?>
              </li>
              </ul>
        </div>
    </div>
  </div>
</header>
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
