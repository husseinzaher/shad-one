<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-cod" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-cod" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-payment-method-title"><span data-toggle="tooltip" title="<?php echo $help_payment_method_title; ?>"><?php echo $entry_payment_method_title; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="cod_order_fee_payment_method_title" value="<?php echo $cod_order_fee_payment_method_title; ?>" placeholder="<?php echo $entry_payment_method_title; ?>" id="input-payment-method-title" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-order-total-title"><span data-toggle="tooltip" title="<?php echo $help_order_total_title; ?>"><?php echo $entry_order_total_title; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="cod_order_fee_order_total_title" value="<?php echo $cod_order_fee_order_total_title; ?>" placeholder="<?php echo $entry_order_total_title; ?>" id="input-order-total-title" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-min-total"><span data-toggle="tooltip" title="<?php echo $help_min_total; ?>"><?php echo $entry_min_total; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="cod_order_fee_min_total" value="<?php echo $cod_order_fee_min_total; ?>" placeholder="<?php echo $entry_min_total; ?>" id="input-min-total" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-max-total"><span data-toggle="tooltip" title="<?php echo $help_max_total; ?>"><?php echo $entry_max_total; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="cod_order_fee_max_total" value="<?php echo $cod_order_fee_max_total; ?>" placeholder="<?php echo $entry_max_total; ?>" id="input-max-total" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-quantity"><span data-toggle="tooltip" title="<?php echo $help_quantity; ?>"><?php echo $entry_quantity; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="cod_order_fee_max_quantity" value="<?php echo $cod_order_fee_max_quantity; ?>" placeholder="<?php echo $entry_quantity; ?>" id="input-quantity" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><span data-toggle="tooltip" title="<?php echo $help_fee_type; ?>"><?php echo $entry_fee_type; ?></span></label>
            <div class="col-sm-10">
              <select name="cod_order_fee_type" id="input-status" class="form-control">
              	<option value="per_quantity" <?php echo ($cod_order_fee_type == 'per_quantity')? 'selected="selected"' : '' ; ?> >Per Item Quantity</option>
                <option value="total_percentage" <?php echo ($cod_order_fee_type == 'total_percentage')? 'selected="selected"' : '' ; ?> >Percentage On Subtotal</option>
                <option value="fix_price" <?php echo ($cod_order_fee_type == 'fix_price')? 'selected="selected"' : '' ; ?> >Fix Price</option>
              </select>
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-fee"><?php echo $entry_fee; ?></label>
            <div class="col-sm-10">
              <input type="text" name="cod_order_fee_fee" value="<?php echo $cod_order_fee_fee; ?>" placeholder="<?php echo $entry_fee; ?>" id="input-fee" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-country"><?php echo $entry_country; ?></label>
            <div class="col-sm-10">
              <select name="cod_order_fee_country_id" id="input-country" class="form-control">
                <option value="0"><?php echo $text_none; ?></option>
                <?php foreach ($countries as $country) { ?>
                <?php  if ($country['country_id'] == $cod_order_fee_country_id) { ?>
                  <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                <?php } ?>
              <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-tax-class"><?php echo $entry_tax_class; ?></label>
            <div class="col-sm-10">
              <select name="cod_order_fee_tax_class_id" id="input-tax-class" class="form-control">
                <option value="0"><?php echo $text_none; ?></option>
                <?php foreach ($tax_classes as $tax_class) { ?>
                <?php if ($tax_class['tax_class_id'] == $cod_order_fee_tax_class_id) { ?>
                <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-order-status"><?php echo $entry_order_status; ?></label>
            <div class="col-sm-10">
              <select name="cod_order_fee_order_status" id="input-order-status" class="form-control">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $cod_order_fee_order_status) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="cod_order_fee_status" id="input-status" class="form-control">
                <?php if ($cod_order_fee_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
            <div class="col-sm-10">
              <input type="text" name="cod_order_fee_sort_order" value="<?php echo $cod_order_fee_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?> 