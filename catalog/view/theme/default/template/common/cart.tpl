<div id="cart" class="btn-group btn-block">
<button type="button"  onclick="opencart()" class="btn btn-inverse btn-block btn-lg dropdown-toggle"><img src="catalog/view/theme/default/images/i3.png"><span class="counter" id="cart-total"><?php echo $text_items; ?></span></button>
<div id="cartnav" class="sidenav sidenavqw">
  <a href="javascript:void(0)" class="closebtn" onclick="closecart()">&times;</a>
  <ul class="list-unstyled">
    <?php if ($products || $vouchers) { ?>
    <ol class="list-unstyled">
        <?php foreach ($products as $product) { ?>
        <li>
            <?php if ($product['thumb']) { ?>
            <a class="pro-thumb" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
            <?php } ?>
            <div class="pro-info">
                <p class="productname">
                    <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                    <span class="price"><?php echo $product['price']; ?></span>
                    <?php if ($product['option']) { ?>
                    <?php foreach ($product['option'] as $option) { ?>
                    <br />
                    - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
                    <?php } ?>
                    <?php } ?>
                    <?php if ($product['recurring']) { ?>
                    <br />
                    - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
                    <?php } ?>
                </p>
                <p class="quantity"><?php echo $product['quantity']; ?></p>
                <i onclick="cart.remove('<?php echo $product['key']; ?>');" title="<?php echo $button_remove; ?>" class="remove">&times;</i>
            </div>
        </li>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <li>
            <span></span>
            <p class="descrip"><?php echo $voucher['description']; ?></p>
            <p class="quantatiy">x&nbsp;1</p>
            <p class="amount"><?php echo $voucher['amount']; ?></p>
            <button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button>
        </li>
        <?php } ?>
    </ol>
      <hr>
    <ol class="list-unstyled">
      <?php foreach ($totals as $total) { ?>
        <li>
            <p class="cartotal"><?php echo $total['title']; ?> : </p>
            <p class="total"><?php echo $total['text']; ?></p>
        </li>
      <?php } ?>
      <li class="text-right viewcart"><a href="<?php echo $cart; ?>"><strong><i class="fa flaticon-shopping-cart"></i> <?php echo $text_cart; ?></strong></a><a href="<?php echo $checkout; ?>"><strong><i class="fa fa-share"></i> <?php echo $text_checkout; ?></strong></a></li>
    </ol>
    <?php } else { ?>
    <ol class="list-unstyled">
      <li><p class="text-center"><?php echo $text_empty; ?></p></li>
    </ol>
    <?php } ?>
  </ul>
<!--
    <div class="image" >
        <img src="catalog\view\theme\default\image\child2.png" class="wow bounceInUp" data-wow-duration="2s" alt=""/>
    </div>
-->
</div>

<!-- Use any element to open the sidenav -->
</div>


<!--
<table class="table table-striped">
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="text-center"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
            <?php } ?></td>
          <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <?php if ($product['option']) { ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
            <?php } ?>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
            <br />
            - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
            <?php } ?></td>
          <td class="text-right"></td>
          <td class="text-right"><?php echo $product['total']; ?></td>
          <td class="text-center"><button type="button" onclick="cart.remove('<?php echo $product['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="text-center"></td>
          <td class="text-left"><?php echo $voucher['description']; ?></td>
          <td class="text-right">x&nbsp;1</td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
          <td class="text-center text-danger"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
      </table>
-->
<!--

<div>
        <table class="table table-bordered">
          <?php foreach ($totals as $total) { ?>
          <tr>
            <td class="text-right"><strong><?php echo $total['title']; ?></strong></td>
            <td class="text-right"><?php echo $total['text']; ?></td>
          </tr>
          <?php } ?>
        </table>
        <p class="text-right"><a href="<?php echo $cart; ?>"><strong><i class="fa fa-shopping-cart"></i> <?php echo $text_cart; ?></strong></a>&nbsp;&nbsp;&nbsp;<a href="<?php echo $checkout; ?>"><strong><i class="fa fa-share"></i> <?php echo $text_checkout; ?></strong></a></p>
      </div>
-->
