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
<style>
.mobile-menu .mob-cart i {
    margin: 0 10px 0 0;
}
#cart .sh_cart{
    margin-top: 0;
}
#d_quickcheckout .input-group .form-control:last-child, #d_quickcheckout .input-group-addon:last-child, #d_quickcheckout .input-group-btn:first-child > .btn-group:not(:first-child) > .btn, #d_quickcheckout .input-group-btn:first-child > .btn:not(:first-child), #d_quickcheckout .input-group-btn:last-child > .btn, #d_quickcheckout .input-group-btn:last-child > .btn-group > .btn, #d_quickcheckout .input-group-btn:last-child > .dropdown-toggle {
    border-top-left-radius: 5px !important;
    border-bottom-left-radius: 5px !important;
    border-top-right-radius: 0 !important;
    border-bottom-right-radius: 0 !important;
}
#d_quickcheckout .checkbox input[type=checkbox], #d_quickcheckout .checkbox-inline input[type=checkbox], #d_quickcheckout .radio input[type=radio], #d_quickcheckout .radio-inline input[type=radio] {
    margin-right: -20px !important;
    margin-left: 0 !important;
}
#d_quickcheckout input[type=checkbox], #d_quickcheckout input[type=radio] {
    margin-right: -15px !important;
    margin-left: 0 !important;
}
#d_quickcheckout #shipping_method .radio label .price, #d_quickcheckout #payment_method .radio label .price {
    float: left !important;
}
</style>
<?php } else { ?>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen" />
<link href="catalog/view/theme/default/stylesheet/stylesheet-en.css" rel="stylesheet">
<link href="catalog/view/theme/default/css/style.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/css/style_en.css" rel="stylesheet" type="text/css" />
<style>
.mobile-menu .mob-cart i {
    margin: 0 0 0 5px;
}
#cart .sh_cart{
    margin-top: -10px;
}
#d_quickcheckout #shipping_method .radio label .price, #d_quickcheckout #payment_method .radio label .price {
    float: right !important;
}
</style>
<?php } ?>
<link href="catalog/view/theme/default/stylesheet/animate.css" rel="stylesheet">
<link href="catalog/view/theme/default/stylesheet/jquery.fancybox.min.css" rel="stylesheet">

<link href="catalog/view/theme/default/css/mobile.css" rel="stylesheet" type="text/css" />
<?php if (isset($ishome)) {?>
<style>
.eui-widget-title.eapps-instagram-feed-title, #eapps-instagram-feed-1 a.eapps-link {
    display: none !important;
    height: 0 !important;
    font-size: 0 !important;
}
.eapps-instagram-feed-container{
    margin-bottom: -56px;
    zoom: 1;
    z-index: 999999;
    position: relative;
}
</style>
<?php }else{ ?>
<style>
footer {
margin-top:30px
}
</style>
<?php } ?>
<style>
.h-video {
    /***
    padding: 60px 0 30px;
    border-bottom: 1px solid #0b0b0a;
    margin-block-end: 30px;
    ***/
}
.h-video .se-head h2 {
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
.modal-header {
    float: none;
}
.modal-header .close {
    outline: none;
    float: none;
    opacity: 1;
    text-shadow: none;
    color: #fff;
    font-size: 22px;
    font-weight: 700;
    z-index: 999999999999;
    position: relative;
}
.slick-slider .slick-track {
}
.modal-body {
    position: relative;
    padding: 0;
}
.product-page .pr-15 {
    padding-right: 0;
    padding-left: 0;
}
/***
.product-page .slick-initialized .slick-slide {
    right: 5px !important;
    left: 5px !important;
    top: 5px !important;
}
****/
.mob-cart li{
    
}
#cart .sh_cart{
    width: 24px;
}
.mobile-menu .profileed{
    
}
.category .product-grid .product-thumb h4 {
    height: 25px;
    line-height: 25px;
    overflow: hidden;
}
header .menu-header .menu-mid ul li a img{
    width: 45px;
}
.menu-item-has-children > a::after, .menu-mid .dropdown a::after {
    top: 10px;
}
.b-s-con .b-add.red {
    height: 63px;
    background-color: #f00;
    border: 1px solid #f00;
}
a.removequickview.red {
    background-color: #f00;
    padding: 10px 20px;
    font-size: 16px;
    color: #fff;
    border-radius: 5px;
}
.product-page #button-carted.red {
    display: block;
    border-color: #f00;
    color: #fff;
    background-color: #f00;
    display: inline-block;
    max-width: 200px;
    font-size: 16px;
    text-transform: uppercase;
    font-weight: bold;
}
.contact_info {
    margin: 20px 0;
}
.contact_info h3 {
    margin-bottom: 20px;
    text-transform: capitalize;
}
.contact_info .sub_info {
    font-size: 15px;
    font-weight: bold;
    padding: 12px 0;
}
.contact_info .sub_info span {
    display: inline-block;
    direction: ltr;
}
#d_quickcheckout .panel-title {
    color: #000 !important;
}
#newsletter_footer section.subscribe form input {
    color: #fff;
}
@media only screen and (max-width: 767px) {
.product-thumb .button-group {
    bottom: 60px !important;
}
a.removequickview.red {
    left: 22px !important;
    font-size: 13px !important;
}
}
#d_quickcheckout #payment_address input[type=radio], #d_quickcheckout #payment_address input[type=checkbox] ,
#d_quickcheckout #shipping_address input[type=radio], #d_quickcheckout #shipping_address input[type=checkbox] {
    margin: 4px 5px;
}
</style>

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
<?php if ($direction == 'rtl') { ?>
<style>
#cart.cart_mob {
    position: relative;
}
#cart.cart_mob #cart img {
display: none;
}
#cart.cart_mob #cart #cartnav{
display: none;
}
#cart.cart_mob #cart #cart-total {
    z-index: -1;
    top: 15px !important;
    right: 8px;
    width: 18px;
    height: 18px;
}
</style>
<?php } else { ?>
<style>
#cart.cart_mob {
    position: relative;
}
#cart.cart_mob #cart img {
display: none;
}
#cart.cart_mob #cart #cartnav{
display: none;
}
#cart.cart_mob #cart #cart-total {
    z-index: -1;
    top: 20px !important;
    left: 8px;
    width: 18px;
    height: 18px;
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
                                                    xlink:href="data:img/png;base64,iVBORw0KGgoAAAANSUhEUgAAAgAAAAIACAYAAAD0eNT6AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAF92lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNi4wLWMwMDUgNzkuMTY0NTkwLCAyMDIwLzEyLzA5LTExOjU3OjQ0ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgMjIuMSAoTWFjaW50b3NoKSIgeG1wOkNyZWF0ZURhdGU9IjIwMjEtMDYtMjlUMjA6NDE6MTcrMDM6MDAiIHhtcDpNb2RpZnlEYXRlPSIyMDIxLTA3LTAxVDAxOjAyOjI0KzAzOjAwIiB4bXA6TWV0YWRhdGFEYXRlPSIyMDIxLTA3LTAxVDAxOjAyOjI0KzAzOjAwIiBkYzpmb3JtYXQ9ImltYWdlL3BuZyIgcGhvdG9zaG9wOkNvbG9yTW9kZT0iMyIgcGhvdG9zaG9wOklDQ1Byb2ZpbGU9InNSR0IgSUVDNjE5NjYtMi4xIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjUzYjY1NjEzLTM0OWItNDA3Yy05MjdhLWQ0OThkMDUwNDc0NCIgeG1wTU06RG9jdW1lbnRJRD0iYWRvYmU6ZG9jaWQ6cGhvdG9zaG9wOjk5ZTUxMjNkLTMzODEtODg0Mi04YmYzLTNmMjNhYzMzMjE1OSIgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJ4bXAuZGlkOmI0NzU5YTUyLTJiOWQtNGMxMC1hYzQ2LWZlMDJmNzVlMDc0ZCI+IDx4bXBNTTpIaXN0b3J5PiA8cmRmOlNlcT4gPHJkZjpsaSBzdEV2dDphY3Rpb249ImNyZWF0ZWQiIHN0RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6YjQ3NTlhNTItMmI5ZC00YzEwLWFjNDYtZmUwMmY3NWUwNzRkIiBzdEV2dDp3aGVuPSIyMDIxLTA2LTI5VDIwOjQxOjE3KzAzOjAwIiBzdEV2dDpzb2Z0d2FyZUFnZW50PSJBZG9iZSBQaG90b3Nob3AgMjIuMSAoTWFjaW50b3NoKSIvPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiIHN0RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6NTNiNjU2MTMtMzQ5Yi00MDdjLTkyN2EtZDQ5OGQwNTA0NzQ0IiBzdEV2dDp3aGVuPSIyMDIxLTA3LTAxVDAxOjAyOjI0KzAzOjAwIiBzdEV2dDpzb2Z0d2FyZUFnZW50PSJBZG9iZSBQaG90b3Nob3AgMjIuMSAoTWFjaW50b3NoKSIgc3RFdnQ6Y2hhbmdlZD0iLyIvPiA8L3JkZjpTZXE+IDwveG1wTU06SGlzdG9yeT4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz64+RMNAAA2kklEQVR4nO3dd7heRbn38W8KCQmE3kXAIE0C0pEuCIJHPSBdpeixiwXBwjl2D68iINh7pYigYsWGdEFpIkVpoZeEFkroJNnvH5N9DOnZz9wzaz3r+7muXCAm99xskj2/Z9asmWEDAwNIkjQfI4EJwBbAmsBaM3+sAYyb5eeMAx4HHgIeAB4E7gWuA66Z+eOBcm1rfoYZACRJsxkObAfsAWxLmviXzFT7XuBs4A/An4ApmepqERkAJEmQJv2dgH2B1wGrFhhzOnApcArw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" />
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
                    <img src="catalog/view/theme/default/images/cat2.png" alt="<?php echo $category['name']; ?>" />
                    <?php }else if($counter == 2){ ?>
                    <img src="catalog/view/theme/default/images/cat1.png" alt="<?php echo $category['name']; ?>" />
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
    <ul class="mob-cart list-unstyled"><li>
        <div id="cart" class="cart_mob">
<?php echo $cart; ?>
                                    <a class="sh_cart" href="<?php echo $shopping_cart; ?>">
                                        <img src="catalog/view/theme/default/images/i3.png">
                                    </a>
                                    </div>
    </li>
   <li class="profileed"><i class="fa flaticon-profile"></i>
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
