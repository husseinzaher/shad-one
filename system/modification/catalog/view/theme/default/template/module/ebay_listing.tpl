<h3><?php echo $heading_title; ?></h3>
<div class="row product-layout">
  <?php foreach ($products as $product) { ?>
  <div class="col-lg-3 col-md-3s col-sm-6 col-xs-12">
    <div onmouseout="quickout();" onmouseover="quickview('<?php echo $product['product_id']; ?>')" class="product-thumb transition"> 
      <div class="image"><a target="_blank" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
      <div class="caption">

					<style>
			#product_details ul.bxslider{
			  float: left;
			  width: 100%;
			  list-style-type: none;
			}
			#product_details ul.bxslider li{
			  float: left;
			  width: 15%;
			}
			
			.ovalShape {
			font-size:44px; color:black;
	width: 94px;
	height: 47px;
	text-align: center;
	background: rgba(76, 175, 80, 0.8);
	-moz-border-radius: 100px / 50px;
	-webkit-border-radius: 100px / 50px;
	border-radius: 100px / 50px;
}
           .ovalShape:hover { 
    background-color: #62c465;
}
			</style>
			
			<a class=" removequickview " data-toggle="modal" data-target="#productInfoModal" onclick="quickview_popup('<?php echo $product['product_id']; ?>');" id="quick<?php echo $product['product_id']; ?>" title="Quick View" style="display:none;position: absolute;top: 15%;left: 33%;" href="#"><i class="fa fa-eye ovalShape"></i></a>

		
        <p><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></p>
        <p class="price"><?php echo $product['price']; ?></p>
      </div>
    </div>
  </div>
  <?php } ?>
  <img src="<?php echo $tracking_pixel; ?>" height="0" width="0" />
</div>