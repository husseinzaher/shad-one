 <?php foreach ($products as $product) { ?>
  <div class="product-layout product-list col-xs-12">
    <div class="product-thumb">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div>
              <div class="caption">
                <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                <?php if ($product['rating']) { ?>
                <div class="rating">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
                </div>
                <?php } ?>
                <?php if ($product['price']) { ?>
                <p class="price">
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                  <?php } ?>
                  <?php if ($product['tax']) { ?>
                  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                  <?php } ?>
                </p>
                <?php } ?>
                <p class="des"><?php echo $product['description']; ?></p>

              </div>
                
              <div class="button-group">
               <!-- <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="fa flaticon-shopping-store-cart"></i> <span class="add_c"><?php echo $button_cart; ?></span></button>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart-o"></i></button>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button> -->
                
<?php if ($product['quantity']<1 && isset($text_out_of_stock) ) { ?>
<a class=" removequickview red" style="position: absolute;top: 15%;left: 33%;"><?php echo $text_out_of_stock; ?></a>
<?php }else{ ?>
<a class=" removequickview " data-toggle="modal" data-target="#productInfoModal" onclick="quickview_popup('<?php echo $product['product_id']; ?>');" id="quick<?php echo $product['product_id']; ?>" style="position: absolute;top: 15%;left: 33%;" href="#"><i class="fa fa-eye ovalShape"></i></a>
<?php } ?>

              </div>
            </div>
          </div>
  </div>
  <?php } ?>