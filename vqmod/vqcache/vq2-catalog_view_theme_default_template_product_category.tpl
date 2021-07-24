<?php echo $header; ?>
<div class="p-head">
    <div class="container">
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
</div>
<div class="category page-p">
    <div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
				<?php echo $content_top; ?>
				
				<?php if( ! empty( $breadcrumbs ) && is_array( $breadcrumbs ) ) { ?>
					<ul style="display:none;">
						<?php foreach( $breadcrumbs as $breadcrumb ) { ?>
							<?php if( NULL != ( $smk_title = strip_tags( $breadcrumb['text'] ) ) ) { ?>
								<li itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
									<a href="<?php echo $breadcrumb['href']; ?>" itemprop="url"><span itemprop="title"><?php echo strip_tags( $breadcrumb['text'] ); ?></span></a>
								</li>
							<?php } ?>
						<?php } ?>
					</ul>
				<?php } ?>
			
			
       <!-- <div class="banner" >
        <img class="img-responsive" src="catalog\view\theme\default\image\slidekk.png" alt=""/>
    </div> -->
          <?php if ($products) { ?>
      <p class="hidden"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></p>
        <div class="filter">
          <div class="row">

            <div class="col-md-2 col-sm-3 col-xs-4 text-right">
              <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
            </div>
            <div class="col-md-2 col-sm-3 col-xs-6 text-right">
              <select id="input-sort" class="form-control" onchange="location = this.value;">
                <?php foreach ($sorts as $sorts) { ?>
                <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
              <div class="clearfix visible-xs-block"></div>
            <div class="col-sm-1 col-xs-4 text-right">
              <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
            </div>
            <div class="col-sm-2 col-xs-6 text-right">
              <select id="input-limit" class="form-control" onchange="location = this.value;">
                <?php foreach ($limits as $limits) { ?>
                <?php if ($limits['value'] == $limit) { ?>
                <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
              <div class="col-md-5 hidden-xs">
              <div class="-group hidden-xs fr">
                <button type="button" id="list-view" class="btn grid" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
                <button type="button" id="grid-view" class="btn list" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
              </div>
            </div>
          </div>
        </div>
      <br />
      <div class="row">
<div class="umf-product-container">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-list col-xs-6">
          <div class="product-thumb">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo empty( $product['smp_alt_images'] ) ? $product['name'] : $product['smp_alt_images']; ?>" title="<?php echo empty( $product['smp_title_images'] ) ? $product['name'] : $product['smp_title_images']; ?>" class="img-responsive" /></a>
<?php if ($product['swap_bullets']) { ?>
	<div class="swap_bullets">
		<?php echo $product['swap_bullets']; ?>
	</div>
<?php } ?></div>
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
            <!--    <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="fa flaticon-shopping-store-cart"></i> <span class="add_c"><?php echo $button_cart; ?></span></button>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart-o"></i></button>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button> -->
              <a class=" removequickview " data-toggle="modal" data-target="#productInfoModal" onclick="quickview_popup('<?php echo $product['product_id']; ?>');" id="quick<?php echo $product['product_id']; ?>" title="Quick View" style="display:none;position: absolute;top: 15%;left: 33%;" href="#"><i class="fa fa-eye ovalShape"></i></a>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
</div>
      </div>
      <div class="row pages">
        <div class="col-sm-6 text-left"><div class="text-left pagination_container"><?php echo $pagination; ?></div></div>
        <div class="col-sm-6 text-left"><div class="text-right pagination_result"><?php echo $results; ?></div></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      				
				<?php if( ! empty( $tags ) ) { ?>
					<?php foreach( $tags as $tagKey => $tag ) { ?><?php if( $tagKey ) { ?>, <?php } ?><a href="<?php echo $tag['href']; ?>"><?php echo $tag['tag']; ?></a><?php } ?>
				<?php } ?>
				
				<?php echo $content_bottom; ?>
			</div>
    <?php echo $column_right; ?></div>
</div>
</div>
<?php echo $footer; ?>