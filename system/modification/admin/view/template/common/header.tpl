<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
<script type="text/javascript" src="view/javascript/jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="view/javascript/bootstrap/js/bootstrap.min.js"></script>
<!--
<link href="view/javascript/bootstrap/opencart/opencart.css" type="text/css" rel="stylesheet" />//-->
<link href="view/javascript/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
<link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
<script src="view/javascript/summernote/summernote-ar-AR.js"></script>
<script src="view/javascript/jquery/datetimepicker/moment.js" type="text/javascript"></script>
<script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
<?php if ($direction == 'rtl') { ?>
<link href="view/javascript/bootstrap/css/bootstrap-a.css" rel="stylesheet" media="screen" />
<link type="text/css" href="view/stylesheet/stylesheet-a.css" rel="stylesheet" media="screen" />
<?php } else { ?>
<link href="view/javascript/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen" />
<link type="text/css" href="view/stylesheet/stylesheet.css" rel="stylesheet" media="screen" />
<?php } ?>

<?php foreach ($styles as $style) { ?>
<link type="text/css" href="<?php echo $style['href']; ?>" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
</head>
<body>
<div id="container">
<header id="header" class="navbar navbar-static-top">
  <div class="navbar-header">
    <?php if ($logged) { ?>
    <a type="button" id="button-menu" class="pull-left"><i class="fa fa-indent fa-lg"></i></a>
    <?php } ?>
    <a href="<?php echo $home; ?>" class="navbar-brand"><img src="view/image/logo.png" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" /></a></div>
  <?php if ($logged) { ?>
  <ul class="nav pull-right">

<!-- MaintenanceModeWarn -->
<style type="text/css">
#header .nav>li.danger>a,.adwmm.danger{color:#fff;background-color:red}#header .nav>li.danger>a:focus,#header .nav>li.danger>a:hover{background-color:#f56b6b}#header .nav>li.success>a,.adwmm.success{color:#fff;background-color:#4cb64c}#header .nav>li.success>a:focus,#header .nav>li.success>a:hover{background-color:#409e40}.adwmm{white-space:normal}.adwmm .btn{outline:0;outline-offset:0}
</style>
    <li class="dropdown success" id="adwmm_hook"><a class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-home fa-lg"></i></a>
	  <ul class="dropdown-menu" id="adw_maintenance">
        <li class="dropdown-header adwmm success" id="adwmm_status"><?php echo $maintenance_off; ?></li>
		<li class="dropdown-header adwmm" id="adwmm_info"><?php echo $maintenance_off_text; ?></li>
		<li class="dropdown-header adwmm"><button id="adwmm" class="btn btn-danger btn-xs"><?php echo $maintenance_enable; ?></button></li>
      </ul>
    </li>
<script type="text/javascript"><!--
var mmode = '<?php echo $mmode; ?>';

function update_mmode(mmode) {
	if (mmode == 1) {
		$('#adwmm_hook, #adwmm_status').removeClass('success').addClass('danger');
		$('#adwmm').removeClass('btn-danger').addClass('btn-success');
		$('#adwmm_status').html('<?php echo $maintenance_on; ?>');
		$('#adwmm_info').html('<?php echo $maintenance_on_text; ?>');
		$('#adwmm').html('<?php echo $maintenance_disable; ?>');
	} else {
		$('#adwmm_hook, #adwmm_status').removeClass('danger').addClass('success');
		$('#adwmm').removeClass('btn-success').addClass('btn-danger');		
		$('#adwmm_status').html('<?php echo $maintenance_off; ?>');
		$('#adwmm_info').html('<?php echo $maintenance_off_text; ?>');
		$('#adwmm').html('<?php echo $maintenance_enable; ?>');
	}
}

$(document).ready(function(){
	update_mmode(mmode);
})

$('#adwmm_hook').on('show.bs.dropdown', function () {
  $('#adw_maintenance .alert-danger').remove();
})

$('#adwmm').on('click', function(e) {
	e.preventDefault();

	$.ajax({
		url : 'index.php?route=common/column_left/adw_maintenance&token=<?php echo $token; ?>',
		dataType: 'json',
		beforeSend: function() {
			$('#adwmm').prop('disabled', true);
			$('#adw_maintenance .alert-danger').remove();
		},
		complete: function() {
			$('#adwmm').prop('disabled', false);
		},
		success : function (json) {
			if (json['error']) {
				html = '<span class="alert-danger">' + json['error'] + '</span>';
				$('#adwmm').before(html);
			}
			if (json['success']) {
				update_mmode(json['mode']);
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
	e.stopPropagation();
});
//--></script>
<!-- MaintenanceModeWarn -->
			
    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown"><span class="label label-danger pull-left"><?php echo $alerts; ?></span> <i class="fa fa-bell fa-lg"></i></a>
      <ul class="dropdown-menu dropdown-menu-right alerts-dropdown">
        <li class="dropdown-header"><?php echo $text_order; ?></li>
        <li><a href="<?php echo $order_status; ?>" style="display: block; overflow: auto;"><span class="label label-warning pull-right"><?php echo $order_status_total; ?></span><?php echo $text_order_status; ?></a></li>
        <li><a href="<?php echo $complete_status; ?>"><span class="label label-success pull-right"><?php echo $complete_status_total; ?></span><?php echo $text_complete_status; ?></a></li>
        <li><a href="<?php echo $return; ?>"><span class="label label-danger pull-right"><?php echo $return_total; ?></span><?php echo $text_return; ?></a></li>
        <li class="divider"></li>
        <li class="dropdown-header"><?php echo $text_customer; ?></li>
        <li><a href="<?php echo $online; ?>"><span class="label label-success pull-right"><?php echo $online_total; ?></span><?php echo $text_online; ?></a></li>
        <li><a href="<?php echo $customer_approval; ?>"><span class="label label-danger pull-right"><?php echo $customer_total; ?></span><?php echo $text_approval; ?></a></li>
        <li class="divider"></li>
        <li class="dropdown-header"><?php echo $text_product; ?></li>
        <li><a href="<?php echo $product; ?>"><span class="label label-danger pull-right"><?php echo $product_total; ?></span><?php echo $text_stock; ?></a></li>
        <li><a href="<?php echo $review; ?>"><span class="label label-danger pull-right"><?php echo $review_total; ?></span><?php echo $text_review; ?></a></li>
        <li class="divider"></li>
        <li class="dropdown-header"><?php echo $text_affiliate; ?></li>
        <li><a href="<?php echo $affiliate_approval; ?>"><span class="label label-danger pull-right"><?php echo $affiliate_total; ?></span><?php echo $text_approval; ?></a></li>
      </ul>
    </li>
    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-life-ring fa-lg"></i></a>
      <ul class="dropdown-menu dropdown-menu-right">
        <li class="dropdown-header"><?php echo $text_store; ?> <i class="fa fa-shopping-cart"></i></li>
        <?php foreach ($stores as $store) { ?>
        <li><a href="<?php echo $store['href']; ?>" target="_blank"><?php echo $store['name']; ?></a></li>
        <?php } ?>
        <li class="divider"></li>
        <li class="dropdown-header"><?php echo $text_help; ?> <i class="fa fa-life-ring"></i></li>
        <li><a href="http://www.opencart.com" target="_blank"><?php echo $text_homepage; ?></a></li>
        <li><a href="http://docs.opencart.com" target="_blank"><?php echo $text_documentation; ?></a></li>
        <li><a href="http://forum.opencart.com" target="_blank"><?php echo $text_support; ?></a></li>
      </ul>
    </li>
    <li><a href="<?php echo $logout; ?>"><span class="hidden-xs hidden-sm hidden-md"><?php echo $text_logout; ?></span> <i class="fa fa-sign-out fa-lg"></i></a></li>
  </ul>
  <?php } ?>
</header>
