    <!-- Start BEST SEILING -->
    <section class="best-selling">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="se-head text-center">
                        <h2>
                            <img src="catalog/view/theme/default/images/icon.png" alt="img" />
                            <span><?php echo $heading_title; ?></span>
                        </h2>
                    </div>
                    
                </div>


      <div id="best_selling" class="owl-carousel">
        <?php foreach ($products as $product) { ?>
        <?php $img=$product['thumb'];$myimg= str_replace("-200x200","",$img);  ?>
          <div class="item text-center">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="best-selling-block">
                        <div class="b-s-img">
                            <a href="<?php echo $product['href']; ?>">
                            <img src="<?php echo str_replace("/cache","",$myimg); ?>" alt="<?php echo $product['name']; ?>" />
                            </a>
                        </div>
                        <div class="b-s-con text-center">
                            <h3><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
                            <?php if ($product['price']) { ?>
                            <div class="p-price">
                                <?php if (!$product['special']) { ?>
                                <?php echo $product['price']; ?>
                                <?php } else { ?>
                                <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                                <?php } ?>
                            </div>
                            <?php } ?>
                            <div class="add-to-cartt text-center">
<?php if ($product['quantity']<1 && isset($text_out_of_stock) ) { ?>
                                <button class="b-add red">
                                    <?php echo $text_out_of_stock; ?>
                                </button>
<?php }else{ ?>
                                <button class="b-add" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                                        width="0.528in" height="0.500in">
                                        <image x="0px" y="0px" width="38px" height="42px"
                                            xlink:href="data:img/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAqCAQAAAB19uFeAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAAmJLR0QA/4ePzL8AAAAHdElNRQflBgIVGxVxElNQAAAC70lEQVRIx6XWvW9bZRTH8Y9v7LpuQ14IsRPSpi0tLwtCQWKADrB0AAorRcCAYO3CwP8AAwNjJIYuiA6RECCxVAJFSEUdYEIgqgbaUjfETZomUV6a2ofBjh1R38ixf3e5zzn3+T73nOc8L5mwp17xvheU5Cy7ZsYFq3t8HelPMaZjJSJuxHdxMa5ENWrxS5xN75GOGosfIuLneD0K0RdJ5OJkfB7rsRHn9gs7FDMR8Vkc/J/9TJTjTpzeH+zDiPiqredsbMelGOgcNhSzUYknUwaajojX2nmStrPyhJfMuJoyZ1+qebmdoz3spD5/pBbA366Zku8UNoSlVNiGVSP6HnZk235+H1upsHVVGesPOzKNFTDlIwNqoOak5/xqrt3oqg57EbOqDUvOrE93w95zQcamDEJW1gPbbZMQEjncFzIg77LTohXmuKrzvpcVqt7yiY9dVGgD21b0Bd62IRFyLjngsLUWbELiiuuNVgVl5ZSc3VOVuGq70Z5TNGStNZtHJNYa7yXn8YHRFNi7nvaUd5rtOUNK7MCyxmxabjhPmcIZx9uiDnvVIQVvNC1lQ4ot2LBHLLjXcP7pJ/d846+UwvjWokVfNy0LDtajqOesaNDNZmVVvOkZv1lpCwvTZvF701KhHma2kaVhs7s63HVZumIXCG7haCvMUf0pQXWi2yjp24ENyrjRNWzFkpKB1gTUf7Y7bbqp2IKN9QTbcsOwQh2WGLNlsQfYdSMO1WH9iuZtdg2ruSVnsA4bNGbBg65h9RSN78DGLTSXbTeqYKIOGzC8q/670SrGZRKM4mZz3+xGa9ZNyic4opfCgBVlkwqJepXd7hE275h8os+o2h4HW6ewUf2JnFELKdtNp9q2IOOxRN6Eco8w/sGjiYOOKTd32W5VxkiioGTJRo+wO7YdTZRkeg6SimUnEo9jvmfYslXHE5N6rTJYsW4ycdxW6tnduf5111jWKXnnPN/u8taxQjghn4kfPetAyqVvP7pv8T8E64cEKcpB0AAAAABJRU5ErkJggg==" />
                                    </svg>
                                    <span><?php echo $button_cart; ?></span>
                                </button>
<?php } ?>

                            </div>
                        </div>
                    </div>
                </div>

          </div>
          <?php } ?>
      </div>


            </div>
        </div>
    </section>
    <!-- End BEST SEILING -->
        <script type="text/javascript"><!--
$('#best_selling').owlCarousel({
	items: 3,
        itemsTablet: [767,1],
        itemsMobile: [480,1],
	autoPlay: 3000,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: false
});
--></script>