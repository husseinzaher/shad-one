<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-smsa" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-smsa" class="form-horizontal">
          <ul class="nav nav-tabs">
             <li class="active"><a href="#tab-setting" data-toggle="tab"><?php echo $tab_setting;?></a></li>
            <li><a href="#tab-shipping" data-toggle="tab"><?php echo $tab_shipping;?></a></li>
            <li><a href="#tab-support" data-toggle="tab"><?php echo $tab_support;?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-setting">
              <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-mode"><?php echo $entry_mode; ?></label>
                  <div class="col-sm-10">
                    <select name="smsa_mode" id="input-mode" class="form-control">
                      <?php if ($smsa_mode) { ?>
                      <option value="1" selected="selected"><?php echo $text_live; ?></option>
                      <option value="0"><?php echo $text_test; ?></option>
                      <?php } else { ?>
                      <option value="1"><?php echo $text_live; ?></option>
                      <option value="0" selected="selected"><?php echo $text_test; ?></option>
                      <?php } ?>
                    </select>
                  </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-passkey"><?php echo $entry_passkey; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="smsa_passkey" value="<?php echo $smsa_passkey; ?>" placeholder="<?php echo $entry_passkey; ?>" id="input-passkey" class="form-control" />
                  <?php if ($error_passkey) { ?>
                  <div class="text-danger"><?php echo $error_passkey; ?></div>
                  <?php } ?>
                </div>
              </div> 
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="smsa_name" value="<?php echo $smsa_name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
                  <?php if ($error_name) { ?>
                  <div class="text-danger"><?php echo $error_name; ?></div>
                  <?php } ?>
                </div>
              </div> 
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-contact"><?php echo $entry_telephone; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="smsa_telephone" value="<?php echo $smsa_telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-contact" class="form-control" />
                  <?php if ($error_telephone) { ?>
                  <div class="text-danger"><?php echo $error_telephone; ?></div>
                  <?php } ?>
                </div>
              </div>          
               <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-address_1"><?php echo $entry_address_1; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="smsa_address_1" value="<?php echo $smsa_address_1; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-address_1" class="form-control" />
                  <?php if ($error_address_1) { ?>
                  <div class="text-danger"><?php echo $error_address_1; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-address_2"><?php echo $entry_address_2; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="smsa_address_2" value="<?php echo $smsa_address_2; ?>" placeholder="<?php echo $entry_address_2; ?>" id="input-address_2" class="form-control" />
                  <?php if ($error_address_2) { ?>
                  <div class="text-danger"><?php echo $error_address_2; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-city"><?php echo $entry_city; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="smsa_city" value="<?php echo $smsa_city; ?>" placeholder="<?php echo $entry_city; ?>" id="input-city" class="form-control" />
                  <?php if ($error_city) { ?>
                  <div class="text-danger"><?php echo $error_city; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="smsa_postcode" value="<?php echo $smsa_postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control" />
                  <?php if ($error_postcode) { ?>
                  <div class="text-danger"><?php echo $error_postcode; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-country"><?php echo $entry_country; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="smsa_country" value="<?php echo $smsa_country; ?>" placeholder="<?php echo $entry_country; ?>" id="input-country" class="form-control" />
                  <?php if ($error_country) { ?>
                  <div class="text-danger"><?php echo $error_country; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="smsa_status" id="input-status" class="form-control">
                    <?php if ($smsa_status) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
            </div>
            <div class="tab-pane " id="tab-shipping">
              <div class="row">
               <div class="col-sm-2">
                <ul class="nav nav-stacked">
                  <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
                  <?php foreach ($geo_zones as $geo_zone) { ?>
                  <li><a href="#tab-geo-zone<?php echo $geo_zone['geo_zone_id']; ?>" data-toggle="tab"><?php echo $geo_zone['name']; ?></a></li>
                  <?php } ?>
                </ul>
            </div>          
            <div class="col-sm-10">
              <div class="tab-content">
                <div class="tab-pane active" id="tab-general">
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-tax-class"><?php echo $entry_tax_class; ?></label>
                    <div class="col-sm-10">
                      <select name="smsa_tax_class_id" id="input-tax-class" class="form-control">
                        <option value="0"><?php echo $text_none; ?></option>
                        <?php foreach ($tax_classes as $tax_class) { ?>
                        <?php if ($tax_class['tax_class_id'] == $smsa_tax_class_id) { ?>
                        <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                        <?php } ?>
                        <?php } ?>
                      </select>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="smsa_sort_order" value="<?php echo $smsa_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
                    </div>
                  </div>
                </div>
                <?php foreach ($geo_zones as $geo_zone) { ?>
                <div class="tab-pane" id="tab-geo-zone<?php echo $geo_zone['geo_zone_id']; ?>">
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-rate<?php echo $geo_zone['geo_zone_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_rate; ?>"><?php echo $entry_rate; ?></span></label>
                    <div class="col-sm-10">
                      <textarea name="smsa_<?php echo $geo_zone['geo_zone_id']; ?>_rate" rows="5" placeholder="<?php echo $entry_rate; ?>" id="input-rate<?php echo $geo_zone['geo_zone_id']; ?>" class="form-control"><?php echo $smsa__geo_zone_rate[$geo_zone['geo_zone_id']]; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-status<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $entry_status; ?></label>
                    <div class="col-sm-10">
                      <select name="smsa_<?php echo $geo_zone['geo_zone_id']; ?>_status" id="input-status<?php echo $geo_zone['geo_zone_id']; ?>" class="form-control">
                        <?php if ($smsa__geo_zone_status[$geo_zone['geo_zone_id']]) { ?>
                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                        <option value="0"><?php echo $text_disabled; ?></option>
                        <?php } else { ?>
                        <option value="1"><?php echo $text_enabled; ?></option>
                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                        <?php } ?>
                      </select>
                    </div>
                  </div>
                </div>
                <?php } ?>
              </div>
            </div>
            </div>
            </div>          
          <div class="tab-pane" id="tab-support">
            <?php echo $support;?>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?> 