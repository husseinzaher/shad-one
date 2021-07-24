<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
      <a class="btn btn-primary" id="apply_button" data-toggle="tooltip" title="<?php echo $button_apply; ?>" onclick="apply()"><span><?php echo $button_apply; ?></span></a>
      <button type="submit" form="form-account" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
			<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
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
		  	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
			  	<ul class="nav nav-tabs">
			  		<li class="active"><a href="#tab-general" data-toggle="tab">General</a></li>
			  		<li><a href="#tab-layout" data-toggle="tab">Layout</a></li>
			  		<li><a href="#tab-attribute" data-toggle="tab">Attributes</a></li>
			  		<li><a href="#tab-option" data-toggle="tab">Options</a></li>
			  		<li><a href="#tab-filter" data-toggle="tab">Filters</a></li>
			  		<li><a href="#tab-p-method" data-toggle="tab">Payment Method</a></li>
			  		<li><a href="#tab-s-method" data-toggle="tab">Shipping Method</a></li>
			  		<li><a href="#tab-setting" data-toggle="tab">Setting</a></li>
			  		<li><a href="#tab-pp-method" data-toggle="tab">Product Payment Method</a></li>
			  		<li><a href="#tab-ps-method" data-toggle="tab">Product Shipping Method</a></li>
			  	</ul>
		      <div class="tab-content">
			    	<div class="tab-pane active" id="tab-general">
			    		<table id="general" class="table table-bordered table-hover">
								<thead>
									<tr>
										<th>Attribute Name</th>
										<th>Enable</th>
										<th>Display as Type</th>
										<th class="left"><input type="checkbox"onclick="$('.expanded').prop('checked', $(this).prop('checked'))">&nbsp;Collapsed by default</th>
										<th>Hide in Categories</th>
										<th>Inline Search</th>
										<th>Sort Order</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="left"><?php echo $text_price_slider?></td>
										<td class="left">								
											<select name="ultimatemegafilter_setting[price_slider]" class="form-control">
												<option value="1" <?php if(isset($setting['price_slider']) && $setting['price_slider'] == '1') echo " selected='selected'"?>><?php echo $text_yes?></option>
												<option value="0" <?php if(isset($setting['price_slider']) && $setting['price_slider'] == '0') echo " selected='selected'"?>><?php echo $text_no?></option>										
											</select>
										</td>
										<td class="center">-</td>
										<td class="left"><input type="checkbox" class="expanded" name="ultimatemegafilter_setting[expanded_price]" <?php if(isset($setting['expanded_price'])) echo ' checked="checked"';?>></td>
										<td class="left" width="300">
											<select name="ultimatemegafilter_setting[category_price][]" multiple="multiple" class="js-example-basic-multiple" style="width:100%;" >
												<?php foreach($categories as $category){  ?>
												<?php $pcategories = isset($setting['category_price']) ? $setting['category_price'] : array(); ?>
												<?php $selected = in_array($category['category_id'], $pcategories) ? 'selected="selected"' : ''; ?>
												<option value="<?php echo $category['category_id']; ?>" <?php echo $selected; ?> ><?php echo $category['name']; ?></option>
												<?php } ?>
											</select>
										</td>
										<td class="center">-</td>
										<td class="center">
											<input type="text" name="ultimatemegafilter_setting[price_sort_order]" value="<?php echo isset($setting['price_sort_order']) ? $setting['price_sort_order'] : 0; ?>" class="form-control">
										</td>
									</tr>
									<tr>
										<td class="left"><?php echo $text_categories?></td>
										<td class="left">								
											<select name="ultimatemegafilter_setting[status_categories]" class="form-control">
												<option value="0" <?php if(isset($setting['status_categories']) && $setting['status_categories'] == '0') echo " selected='selected'"?>><?php echo $text_no?></option>
												<option value="1" <?php if(isset($setting['status_categories']) && $setting['status_categories'] == '1') echo " selected='selected'"?>><?php echo $text_yes?></option>												
											</select>
										</td>
										<td class="left">
											<select name="ultimatemegafilter_setting[display_categories]" class="form-control">
												<?php foreach($display_categories as $display) { ?>
												<option value="<?php echo $display['value']?>"
													<?php if(isset($setting['display_categories']) && $display['value'] == $setting['display_categories']) echo ' selected="selected"';?>>
													<?php echo $display['name']?>
												</option>
												<?php }?>
											</select>
										</td>
										<td class="left"><input type="checkbox" class="expanded" name="ultimatemegafilter_setting[expanded_categories]" <?php if(isset($setting['expanded_categories'])) echo ' checked="checked"';?>></td>
										<td class="left" width="300">
											<select name="ultimatemegafilter_setting[category_categories][]" multiple="multiple" class="js-example-basic-multiple" style="width:100%;" >
												<?php foreach($categories as $category){  ?>
													<?php $ccategories = isset($setting['category_categories']) ? $setting['category_categories'] : array(); ?>
													<?php $selected = in_array($category['category_id'], $ccategories) ? 'selected="selected"' : ''; ?>
													<option value="<?php echo $category['category_id']; ?>" <?php echo $selected; ?> ><?php echo $category['name']; ?></option>
												<?php } ?>
											</select>
										</td>
										<td>
											<select name="ultimatemegafilter_setting[isearch_categories]" class="form-control">
												<option value="0" <?php echo (isset($setting['isearch_categories']) && $setting['isearch_categories'] == 0) ? 'selected="selected"' : ''; ?>>No</option>
												<option value="1" <?php echo (isset($setting['isearch_categories']) && $setting['isearch_categories'] == 1) ? 'selected="selected"' : ''; ?>>Yes</option>	
											</select>
										</td>
										<td class="center">
											<input type="text" name="ultimatemegafilter_setting[categories_sort_order]" value="<?php echo isset($setting['categories_sort_order']) ? $setting['categories_sort_order'] : 0; ?>" class="form-control">
										</td>
									</tr>
									<tr>
										<td class="left"><?php echo $text_manufacturer?></td>
										<td class="left">								
											<select name="ultimatemegafilter_setting[status_manufacturer]" class="form-control">
												<option value="0" <?php if(isset($setting['status_manufacturer']) && $setting['status_manufacturer'] == '0') echo " selected='selected'"?>><?php echo $text_no?></option>
												<option value="1" <?php if(isset($setting['status_manufacturer']) && $setting['status_manufacturer'] == '1') echo " selected='selected'"?>><?php echo $text_yes?></option>												
											</select>
										</td>
										<td class="left">
											<select name="ultimatemegafilter_setting[display_manufacturer]" class="form-control">
												<?php foreach($display_options as $display_option) { ?>
												<option value="<?php echo $display_option['value']?>"
													<?php if(isset($setting['display_manufacturer']) && $display_option['value'] == $setting['display_manufacturer']) echo ' selected="selected"';?>>
													<?php echo $display_option['name']?>
												</option>
												<?php }?>
											</select>
										</td>
										<td class="left"><input type="checkbox" class="expanded" name="ultimatemegafilter_setting[expanded_manufacturer]" <?php if(isset($setting['expanded_manufacturer'])) echo ' checked="checked"';?>></td>
										<td class="left" width="300">
											<select name="ultimatemegafilter_setting[category_manufacturer][]" multiple="multiple" class="js-example-basic-multiple" style="width:100%;" >
												<?php foreach($categories as $category){  ?>
													<?php $mcategories = isset($setting['category_manufacturer']) ? $setting['category_manufacturer'] : array(); ?>
													<?php $selected = in_array($category['category_id'], $mcategories) ? 'selected="selected"' : ''; ?>
													<option value="<?php echo $category['category_id']; ?>" <?php echo $selected; ?> ><?php echo $category['name']; ?></option>
												<?php } ?>
											</select>
										</td>
										<td>
											<select name="ultimatemegafilter_setting[isearch_manufacturer]" class="form-control">
												<option value="0" <?php echo (isset($setting['isearch_manufacturer']) && $setting['isearch_manufacturer'] == 0) ? 'selected="selected"' : ''; ?>>No</option>
												<option value="1" <?php echo (isset($setting['isearch_manufacturer']) && $setting['isearch_manufacturer'] == 1) ? 'selected="selected"' : ''; ?>>Yes</option>
												
											</select>
										</td>
										<td class="center">
											<input type="text" name="ultimatemegafilter_setting[manufacturer_sort_order]" value="<?php echo isset($setting['manufacturer_sort_order']) ? $setting['manufacturer_sort_order'] : 0; ?>" class="form-control">
										</td>
									</tr>							
									<tr>
										<td class="left">Stock Status</td>
										<td class="left">								
											<select name="ultimatemegafilter_setting[status_stock_status]" class="form-control">
												<option value="0" <?php if(isset($setting['status_stock_status']) && $setting['status_stock_status'] == '0') echo " selected='selected'"?>><?php echo $text_no?></option>
												<option value="1" <?php if(isset($setting['status_stock_status']) && $setting['status_stock_status'] == '1') echo " selected='selected'"?>><?php echo $text_yes?></option>
												
											</select>
										</td>
										<td class="left">
											<select name="ultimatemegafilter_setting[display_stock_status]" class="form-control">
												<?php foreach($display_stocks as $display) { ?>
												<option value="<?php echo $display['value']?>"
													<?php if(isset($setting['display_stock_status']) && $display['value'] == $setting['display_stock_status']) echo ' selected="selected"';?>>
													<?php echo $display['name']?>
												</option>
												<?php }?>
											</select>
										</td>
										<td class="left"><input type="checkbox" class="expanded" name="ultimatemegafilter_setting[expanded_stock_status]" <?php if(isset($setting['expanded_stock_status'])) echo ' checked="checked"';?>></td>
										<td class="left" width="300">
											<select name="ultimatemegafilter_setting[category_stock_status][]" multiple="multiple" class="js-example-basic-multiple" style="width:100%;" >
												<?php foreach($categories as $category){  ?>
													<?php $sscategories = isset($setting['category_stock_status']) ? $setting['category_stock_status'] : array(); ?>
													<?php $selected = in_array($category['category_id'], $sscategories) ? 'selected="selected"' : ''; ?>
													<option value="<?php echo $category['category_id']; ?>" <?php echo $selected; ?> ><?php echo $category['name']; ?></option>
												<?php } ?>
											</select>
										</td>
										<td>
											<select name="ultimatemegafilter_setting[isearch_stock_status]" class="form-control">
												<option value="0" <?php echo (isset($setting['isearch_stock_status']) && $setting['isearch_stock_status'] == 0) ? 'selected="selected"' : ''; ?>>No</option>
												<option value="1" <?php echo (isset($setting['isearch_stock_status']) && $setting['isearch_stock_status'] == 1) ? 'selected="selected"' : ''; ?>>Yes</option>
												
											</select>
										</td>
										<td class="center">
											<input type="text" name="ultimatemegafilter_setting[stock_status_sort_order]" value="<?php echo isset($setting['stock_status_sort_order']) ? $setting['stock_status_sort_order'] : 0; ?>" class="form-control">
										</td>
									</tr>
									<tr>
										<td class="left"><?php echo $text_instock; ?></td>
										<td class="left">								
											<select name="ultimatemegafilter_setting[instock_visible]" class="form-control">
												<option value="0" <?php if(isset($setting['instock_visible']) && $setting['instock_visible'] == '0') echo " selected='selected'"?>><?php echo $text_no?></option>
												<option value="1" <?php if(isset($setting['instock_visible']) && $setting['instock_visible'] == '1') echo " selected='selected'"?>><?php echo $text_yes?></option>
												
											</select>
										</td>
										<td class="left"><input id="instock_checked" type="checkbox" name="ultimatemegafilter_setting[instock_checked]" <?php if (isset($setting['instock_checked'])) echo ' checked="checked"'; ?>>&nbsp;<label for="instock_checked"><?php echo $text_checked; ?></label></td>
										<td class="left" width="300">
											<select name="ultimatemegafilter_setting[category_instock][]" multiple="multiple" class="js-example-basic-multiple" style="width:100%;" >
												<?php foreach($categories as $category){  ?>
													<?php $incategories = isset($setting['category_instock']) ? $setting['category_instock'] : array(); ?>
													<?php $selected = in_array($category['category_id'], $incategories) ? 'selected="selected"' : ''; ?>
													<option value="<?php echo $category['category_id']; ?>" <?php echo $selected; ?> ><?php echo $category['name']; ?></option>
												<?php } ?>
											</select>
										</td>
										<td class="left"><input type="checkbox" class="expanded" name="ultimatemegafilter_setting[expanded_instock]" <?php if(isset($setting['expanded_instock'])) echo ' checked="checked"';?>></td>
										<td class="center">-</td>
										<td class="center">
											<input type="text" name="ultimatemegafilter_setting[instock_sort_order]" value="<?php echo isset($setting['instock_sort_order']) ? $setting['instock_sort_order'] : 0; ?>" class="form-control">
										</td>
									</tr>
									<!-- ==================================================== -->
									<tr>
										<td class="text-left"><?php echo $text_rating; ?></td>										<td class="text-left">																			<select name="ultimatemegafilter_setting[status_rrating]" class="form-control">												<option value="0" <?php if(isset($setting['status_rrating']) && $setting['status_rrating'] == '0') echo " selected='selected'"?>><?php echo $text_no?></option>												<option value="1" <?php if(isset($setting['status_rrating']) && $setting['status_rrating'] == '1') echo " selected='selected'"?>><?php echo $text_yes?></option>											</select>										</td>										<td class="text-left">											<select name="ultimatemegafilter_setting[display_rrating]" class="form-control">												<?php foreach($display_rating as $display) { ?>												<option value="<?php echo $display['value']?>"													<?php if(isset($setting['display_rrating']) && $display['value'] == $setting['display_rrating']) echo ' selected="selected"';?>>													<?php echo $display['name']?>												</option>												<?php }?>											</select>										</td>										<td class="text-left"><input type="checkbox" class="expanded form-control" name="ultimatemegafilter_setting[expanded_rrating]" <?php if(isset($setting['expanded_rrating'])) echo ' checked="checked"';?>></td>										<td class="text-left" width="300">											<select name="ultimatemegafilter_setting[category_rrating][]" multiple="multiple" class="js-example-basic-multiple form-control" style="width:100%;" >												<?php foreach($categories as $category){  ?>													<?php $incategories = isset($setting['category_rrating']) ? $setting['category_rrating'] : array(); ?>													<?php $selected = in_array($category['category_id'], $incategories) ? 'selected="selected"' : ''; ?>													<option value="<?php echo $category['category_id']; ?>" <?php echo $selected; ?> ><?php echo $category['name']; ?></option>												<?php } ?>											</select>										</td>										<td>-</td>										<td class="text-center">											<input type="text" name="ultimatemegafilter_setting[rrating_sort_order]" value="<?php echo isset($setting['rrating_sort_order']) ? $setting['rrating_sort_order'] : 0; ?>" class="form-control">		</td>									
									</tr>
								</tbody>
							</table>
			    	</div>
			    	<div class="tab-pane" id="tab-layout">
			    		<?php echo $text_filter_position; ?>
				    	<table id="module" class="table table-bordered">				       
				        <tbody id="module-row<?php echo $module_row; ?>">
				          <tr>
				          	<td><?php echo $entry_layout; ?></td>
				            <td class="left">
				            	<div class="col-sm-12">
				            		<div class="well well-sm" style="height: 150px; overflow: auto;">
					            		<?php foreach ($layouts as $layout) { ?>
					            		<div class="checkbox">
					                  <label>
					                    <input type="checkbox" name="ultimatemegafilter_module[layout_id][]" value="<?php echo $layout['layout_id']; ?>" <?php echo in_array($layout['layout_id'], $layout_ids) ? 'checked="checked"' : ''; ?>><?php echo $layout['name']; ?>
					                  </label>
					                </div>
					                <?php } ?>
				              	</div>
				                <a onclick="$(this).parent().find(':checkbox').prop('checked', true);">Select All</a> /
				                <a onclick="$(this).parent().find(':checkbox').prop('checked', false);">Unselect All</a>
				              </div>
				            </td>
				          </tr>
				          <tr>
				          	<td><?php echo $entry_position; ?></td>
				            <td class="left">
				            	<select name="ultimatemegafilter_module[position]" class="form-control">
				            		<option value="column_left" <?php echo ($position == 'column_left') ? 'selected="selected"' : ''; ?>><?php echo $text_column_left; ?></option>
				                <option value="content_top" <?php echo ($position == 'content_top') ? 'selected="selected"' : ''; ?>><?php echo $text_content_top; ?></option>
				                <option value="column_right" <?php echo ($position == 'column_right') ? 'selected="selected"' : ''; ?>><?php echo $text_column_right; ?></option>
				              </select>
				            </td>
				          </tr>
				          <tr>
				          	<td><?php echo $entry_status; ?></td>
				            <td>
				            	<select name="ultimatemegafilter_status" class="form-control">
				                <option value="1" <?php echo ($status == 1) ? 'selected="selected"' : ''; ?>><?php echo $text_enabled; ?></option>
				                <option value="0" <?php echo (!$status) ? 'selected="selected"' : ''; ?>><?php echo $text_disabled; ?></option>
				              </select>
				            </td>
				          </tr>
				          <tr>
				          	<td><?php echo $entry_sort_order; ?></td>
				            <td class="right">
				            	<input type="text" name="ultimatemegafilter_module[sort_order]" value="<?php echo $sort_order; ?>" class="form-control" />
				            </td>				            
				          </tr>
				        </tbody>
					  	</table>					  	
				  	</div>
				  	<div class="tab-pane" id="tab-attribute">
				  		<table id="attribute" class="table table-bordered table-hover">
				  			<thead>
									<tr>
										<td class="left">Attribute Name</td>
										<td class="left">Enabled</td>
										<td class="left">Display as type</td>
										<td class="left"><input type="checkbox" onclick="$('.attribute_expanded').prop('checked', $(this).prop('checked'))">Collapsed by default</td>
										<td>Hide in Categories</td>
										<td>Inline Search</td>
										<td class="left">Sort Order</td>
									</tr>
								</thead>
				  			<?php $attribute_group = false;?>
										<?php foreach($attributes as $attribute){?>
										<?php if ($attribute_group !=$attribute['attribute_group']) { ?>
										<?php $attribute_group = $attribute['attribute_group'];?>								
										<?php }	?>
										<tr>
											<td><br>
												<?php echo $attribute['name']?><br>
												[<?php echo $attribute['attribute_group']?>]<br><br>
											</td>
											<td>
												<select name="ultimatemegafilter_setting[status_attribute_<?php echo $attribute['attribute_id']?>]" class="form-control">
													<option value="0" <?php echo (isset($setting['status_attribute_' . $attribute['attribute_id']]) &&$setting['status_attribute_' . $attribute['attribute_id']] == 0) ? 'selected="selected"' : ''; ?>>No</option>
													<option value="1" <?php echo (isset($setting['status_attribute_' . $attribute['attribute_id']]) && $setting['status_attribute_' . $attribute['attribute_id']] == 1) ? 'selected="selected"' : ''; ?>>Yes</option>
												</select>
											</td>
											<td>
												<select name="ultimatemegafilter_setting[display_attribute_<?php echo $attribute['attribute_id']?>]" class="form-control">
													<?php foreach($display_options_attr as $display_option) { ?>
													<option value="<?php echo $display_option['value']?>"
														<?php if(isset($setting['display_attribute_' . $attribute['attribute_id']]) && $display_option['value'] == $setting['display_attribute_' . $attribute['attribute_id']]) echo '  selected="selected"';?>>
														<?php echo $display_option['name']?>
													</option>
													<?php }?>
												</select>
											</td>
											<td><input type="checkbox" class="attribute_expanded" name="ultimatemegafilter_setting[expanded_attribute_<?php echo $attribute['attribute_id']?>]" <?php if(isset($setting['expanded_attribute_' . $attribute['attribute_id']])) echo ' checked="checked"';?>></td>
											<td class="left" width="300">
												<select name="ultimatemegafilter_setting[category_attribute_<?php echo $attribute['attribute_id']?>][]" multiple="multiple" class="js-example-basic-multiple" style="width:100%;" >
													<?php foreach($categories as $category){  ?>
													<?php $s_categories = isset($setting['category_attribute_' . $attribute['attribute_id']]) ? $setting['category_attribute_' . $attribute['attribute_id']] : array(); ?>
													<?php $selected = in_array($category['category_id'], $s_categories) ? 'selected="selected"' : ''; ?>
													<option value="<?php echo $category['category_id']; ?>" <?php echo $selected; ?>><?php echo $category['name']; ?></option>
													<?php } ?>
												</select>
											</td>
											<td>
												<select name="ultimatemegafilter_setting[isearch_attribute_<?php echo $attribute['attribute_id']?>]" class="form-control">
													<option value="0" <?php echo (isset($setting['isearch_attribute_' . $attribute['attribute_id']]) && $setting['isearch_attribute_' . $attribute['attribute_id']] == 0) ? 'selected="selected"' : ''; ?>>No</option>
													<option value="1" <?php echo (isset($setting['isearch_attribute_' . $attribute['attribute_id']]) && $setting['isearch_attribute_' . $attribute['attribute_id']] == 1) ? 'selected="selected"' : ''; ?>>Yes</option>
												</select>
											</td>
											<td width="100">
												<input type="text" name="ultimatemegafilter_setting[sort_order_attribute_<?php echo $attribute['attribute_id']?>]" value="<?php echo isset($setting['sort_order_attribute_' . $attribute['attribute_id']]) ? $setting['sort_order_attribute_' . $attribute['attribute_id']] : 0; ?>" class="form-control">
											</td>
										</tr>
										<?php }?>
				  		</table>
				  		<div class="row">
				  			<div class="col-sm-6 text-left">
				  				<a href="javascript:;" data-page="<?php echo $page; ?>" class="load_more btn btn-primary">Load More</a>
				  			</div>
				  			<div class="col-sm-6 text-right">
				  				<?php /*echo $attr_results;*/ ?>
				  			</div>
				  		</div>
				  	</div>
				  	<div class="tab-pane" id="tab-option">
				  		<table id="option" class="table table-bordered table-hover">
				  			<thead>
									<tr>
										<td class="left">Option Name</td>
										<td class="left">Enabled</td>
										<td class="left">Display as type</td>
										<td class="left"><input type="checkbox" onclick="$('.option_expanded').prop('checked', $(this).prop('checked'))">Collapsed by default</td>
										<td>Hide in Categories</td>
										<td>Inline Search</td>
										<td class="left">Sort Order</td>
									</tr>
								</thead>
								<tbody>
					  			<?php foreach($options as $option){?>
										<tr>
											<td class="left"><?php echo $option['name']?></td>
											<td class="left">
												<select name="ultimatemegafilter_setting[status_option_<?php echo $option['option_id']?>]" class="form-control">
													<option value="0" <?php echo (isset($setting['status_option_' . $option['option_id']]) && $setting['status_option_' . $option['option_id']] == 0) ? 'selected="selected"' : ''; ?>>No</option>
													<option value="1" <?php echo (isset($setting['status_option_' . $option['option_id']]) && $setting['status_option_' . $option['option_id']] == 1) ? 'selected="selected"' : ''; ?>>Yes</option>
												</select>
											</td>
											<td>
												<select name="ultimatemegafilter_setting[display_option_<?php echo $option['option_id']?>]" class="form-control">
													<?php foreach($display_options as $display_option) { ?>
													<option value="<?php echo $display_option['value']?>"
														<?php if(isset($setting['display_option_' . $option['option_id']]) && $display_option['value'] == $setting['display_option_' . $option['option_id']]) echo '  selected="selected"';?>>
														<?php echo $display_option['name']?>
													</option>
													<?php }?>
												</select>
											</td>
											<td><input type="checkbox" class="option_expanded" name="ultimatemegafilter_setting[expanded_option_<?php echo $option['option_id']?>]" <?php if(isset($setting['expanded_option_' . $option['option_id']])) echo ' checked="checked"';?>></td>

											<td class="left" width="300">
												<select name="ultimatemegafilter_setting[category_option_<?php echo $option['option_id']?>][]" multiple="multiple" class="js-example-basic-multiple" style="width:100%;">
													<?php foreach($categories as $category){  ?>
													<?php $os_categories = isset($setting['category_option_' . $option['option_id']]) ? $setting['category_option_' . $option['option_id']] : array(); ?>
													<?php $selected = in_array($category['category_id'], $os_categories) ? 'selected="selected"' : ''; ?>
													<option value="<?php echo $category['category_id']; ?>" <?php echo $selected; ?>><?php echo $category['name']; ?></option>
													<?php } ?>
												</select>
											</td>
											<td>
												<select name="ultimatemegafilter_setting[isearch_option_<?php echo $option['option_id']?>]" class="form-control">
													<option value="0" <?php echo (isset($setting['isearch_option_' . $option['option_id']]) && $setting['isearch_option_' . $option['option_id']] == 0) ? 'selected="selected"' : ''; ?>>No</option>
													<option value="1" <?php echo (isset($setting['isearch_option_' . $option['option_id']]) && $setting['isearch_option_' . $option['option_id']] == 1) ? 'selected="selected"' : ''; ?>>Yes</option>
												</select>
											</td>
											<td width="100">
												<input type="text" name="ultimatemegafilter_setting[sort_order_option_<?php echo $option['option_id']?>]" value="<?php echo isset($setting['sort_order_option_' . $option['option_id']]) ? $setting['sort_order_option_' . $option['option_id']] : ''; ?>" class="form-control">
											</td>
										</tr>
									<?php }?>
								</tbody>
				  		</table>
				  	</div>
				  	<div class="tab-pane" id="tab-filter">
				  		<table id="filter_group" class="table table-bordered table-hover">
				  			<thead>
									<tr>
										<td class="left">Filter Group Name</td>
										<td class="left">Enabled</td>
										<td class="left">Display as type</td>
										<td class="left"><input type="checkbox" onclick="$('.filter_expanded').prop('checked', $(this).prop('checked'))">Collapsed by default</td>
										<td>Hide in Categories</td>
										<td>Inline Search</td>
										<td class="left">Sort Order</td>
									</tr>
								</thead>	  			
									<?php foreach($filter_groups as $filter_group){ ?>
									<tr>
										<td><br>
											<?php echo $filter_group['name']?><br>
										</td>
										<td>
											<select name="ultimatemegafilter_setting[status_filter_<?php echo $filter_group['filter_group_id']?>]" class="form-control">
												<option value="0" <?php echo (isset($setting['status_filter_' . $filter_group['filter_group_id']]) && $setting['status_filter_' . $filter_group['filter_group_id']] == 0) ? 'selected="selected"' : ''; ?>>No</option>
												<option value="1" <?php echo (isset($setting['status_filter_' . $filter_group['filter_group_id']]) && $setting['status_filter_' . $filter_group['filter_group_id']] == 1) ? 'selected="selected"' : ''; ?>>Yes</option>	
											</select>
										</td>
										<td>
											<select name="ultimatemegafilter_setting[display_filter_<?php echo $filter_group['filter_group_id']?>]" class="form-control">
												<?php foreach($display_options_attr as $display_option) { ?>
												<option value="<?php echo $display_option['value']?>"
													<?php if(isset($setting['display_filter_' . $filter_group['filter_group_id']]) && $display_option['value'] == $setting['display_filter_' . $filter_group['filter_group_id']]) echo '  selected="selected"';?>>
													<?php echo $display_option['name']?>
												</option>
												<?php }?>
											</select>
										</td>
										<td><input type="checkbox" class="filter_expanded" name="ultimatemegafilter_setting[expanded_filter_<?php echo $filter_group['filter_group_id']?>]" <?php if(isset($setting['expanded_filter_' . $filter_group['filter_group_id']])) echo ' checked="checked"';?>></td>
										<td class="left" width="300">
											<select name="ultimatemegafilter_setting[category_filter_<?php echo $filter_group['filter_group_id']?>][]" multiple="multiple" class="js-example-basic-multiple" style="width:100%;">
												<?php foreach($categories as $category){  ?>
												<?php $s_categories = isset($setting['category_filter_' . $filter_group['filter_group_id']]) ? $setting['category_filter_' . $filter_group['filter_group_id']] : array(); ?>
												<?php $selected = in_array($category['category_id'], $s_categories) ? 'selected="selected"' : ''; ?>
												<option value="<?php echo $category['category_id']; ?>" <?php echo $selected; ?>><?php echo $category['name']; ?></option>
												<?php } ?>
											</select>
										</td>
										<td>
											<select name="ultimatemegafilter_setting[isearch_filter_<?php echo $filter_group['filter_group_id']?>]" class="form-control">
												<option value="0" <?php echo (isset($setting['isearch_filter_' . $filter_group['filter_group_id']]) && $setting['isearch_filter_' . $filter_group['filter_group_id']] == 0) ? 'selected="selected"' : ''; ?>>No</option>
												<option value="1" <?php echo (isset($setting['isearch_filter_' . $filter_group['filter_group_id']]) && $setting['isearch_filter_' . $filter_group['filter_group_id']] == 1) ? 'selected="selected"' : ''; ?>>Yes</option>
											</select>
										</td>
										<td width="100">
											<input type="text" name="ultimatemegafilter_setting[sort_order_filter_<?php echo $filter_group['filter_group_id']?>]" value="<?php echo isset($setting['sort_order_filter_' . $filter_group['filter_group_id']]) ? $setting['sort_order_filter_' . $filter_group['filter_group_id']] : 0; ?>" class="form-control">
										</td>
									</tr>
									<?php }?>
				  		</table>
				  	</div>
				  	<div class="tab-pane" id="tab-p-method">
				  		<?php /*print_r($setting);*/ ?>
				  		<table class="table table-bordered table-hover">
				  			<tr>
				  				<td width="200">Enable</td>
				  				<td>
				  					<select name="ultimatemegafilter_setting[status_pmethod]" class="form-control">
											<option value="0" <?php echo (isset($setting['status_pmethod']) && $setting['status_pmethod'] == 0) ? 'selected="selected"' : ''; ?>>No</option>
											<option value="1" <?php echo (isset($setting['status_pmethod']) && $setting['status_pmethod'] == 1) ? 'selected="selected"' : ''; ?>>Yes</option>
										</select>
				  				</td>
				  			</tr>
				  			<tr>
				  				<td>Display as Type</td>
				  				<td>
				  					<select name="ultimatemegafilter_setting[display_pmethod]" class="form-control">
											<?php foreach($display_options as $display_option) { ?>
											<option value="<?php echo $display_option['value']?>"
												<?php if(isset($setting['display_pmethod']) && $display_option['value'] == $setting['display_pmethod']) echo '  selected="selected"';?>>
												<?php echo $display_option['name']?>
											</option>
											<?php }?>
										</select>
				  				</td>
				  			</tr>
				  			<tr>
				  				<td>Inline Search</td>
				  				<td>
										<select name="ultimatemegafilter_setting[isearch_pmethod]" class="form-control">
											<option value="0" <?php echo (isset($setting['isearch_pmethod']) && $setting['isearch_pmethod'] == 0) ? 'selected="selected"' : ''; ?>>No</option>
											<option value="1" <?php echo (isset($setting['isearch_pmethod']) && $setting['isearch_pmethod'] == 1) ? 'selected="selected"' : ''; ?>>Yes</option>
										</select>
									</td>
				  			</tr>
				  			<tr>
				  				<td>Collapsed by default</td>
				  				<td >
				  					<input type="checkbox" class="expanded_pmethod" name="ultimatemegafilter_setting[expanded_pmethod]" <?php if(isset($setting['expanded_pmethod'])) echo ' checked="checked"';?>>
				  				</td>
				  			</tr>
				  			<tr>
				  				<td>Sort Order</td>
				  				<td class="center">
										<input type="text" name="ultimatemegafilter_setting[pmethod_sort_order]" class="form-control" value="<?php echo isset($setting['pmethod_sort_order']) ? $setting['pmethod_sort_order'] : 0; ?>">
									</td>
				  			</tr>
				  		</table>
				  		<table id="option" class="table table-bordered table-hover">
				  			<thead>
									<tr>
										<td class="left">Payment Method Name</td>										
										<td>Hide in Categories</td>
										<td class="left">Sort Order</td>
									</tr>
								</thead>
								<tbody>
									<?php if($payment_methods){ foreach ($payment_methods as $pcode => $payment_method) { ?>
					  			<tr>
					  				<td class="left"><?php echo $payment_method; ?></td>		  					  				
					  				<td class="left">
					  					<select name="ultimatemegafilter_setting[category_pmethod_<?php echo $pcode; ?>][]" multiple="multiple" class="js-example-basic-multiple" style="width:100%;">
												<?php foreach($categories as $category){  ?>
												<?php $pm_categories = isset($setting['category_pmethod_' . $pcode]) ? $setting['category_pmethod_' . $pcode] : array(); ?>
												<?php $selected = in_array($category['category_id'], $pm_categories) ? 'selected="selected"' : ''; ?>
												<option value="<?php echo $category['category_id']; ?>" <?php echo $selected; ?>><?php echo $category['name']; ?></option>
												<?php } ?>
											</select>
					  				</td>
					  				<td class="left">
					  					<input type="text" name="ultimatemegafilter_setting[sort_order_pmethod_<?php echo $pcode; ?>]" value="<?php echo isset($setting['sort_order_pmethod_' . $pcode]) ? $setting['sort_order_pmethod_' . $pcode] : ''; ?>" class="form-control">
					  				</td>
					  			</tr>
					  			<?php } } ?>
								</tbody>
				  		</table>
				  	</div>
				  	<div class="tab-pane" id="tab-s-method">	  		
				  		<table class="table table-bordered table-hover">
				  			<tr>
				  				<td width="200">Enable</td>
				  				<td>
				  					<select name="ultimatemegafilter_setting[status_smethod]" class="form-control">
											<option value="0" <?php echo (isset($setting['status_smethod']) && $setting['status_smethod'] == 0) ? 'selected="selected"' : ''; ?>>No</option>
											<option value="1" <?php echo (isset($setting['status_smethod']) && $setting['status_smethod'] == 1) ? 'selected="selected"' : ''; ?>>Yes</option>
										</select>
				  				</td>
				  			</tr>
				  			<tr>
				  				<td>Display as Type</td>
				  				<td>
				  					<select name="ultimatemegafilter_setting[display_smethod]" class="form-control">
											<?php foreach($display_options as $display_option) { ?>
											<option value="<?php echo $display_option['value']?>"
												<?php if(isset($setting['display_smethod']) && $display_option['value'] == $setting['display_smethod']) echo '  selected="selected"';?>>
												<?php echo $display_option['name']?>
											</option>
											<?php }?>
										</select>
				  				</td>
				  			</tr>
				  			<tr>
				  				<td>Inline Search</td>
				  				<td>
										<select name="ultimatemegafilter_setting[isearch_smethod]" class="form-control">
											<option value="0" <?php echo (isset($setting['isearch_smethod']) && $setting['isearch_smethod'] == 0) ? 'selected="selected"' : ''; ?>>No</option>
											<option value="1" <?php echo (isset($setting['isearch_smethod']) && $setting['isearch_smethod'] == 1) ? 'selected="selected"' : ''; ?>>Yes</option>
										</select>
									</td>
				  			</tr>
				  			<tr>
				  				<td>Collapsed by default</td>
				  				<td>
				  					<input type="checkbox" class="expanded_smethod" name="ultimatemegafilter_setting[expanded_smethod]" <?php if(isset($setting['expanded_smethod'])) echo ' checked="checked"';?>>
				  				</td>
				  			</tr>
				  			<tr>
				  				<td>Sort Order</td>
				  				<td class="center">
										<input type="text" name="ultimatemegafilter_setting[smethod_sort_order]" class="form-control" value="<?php echo isset($setting['smethod_sort_order']) ? $setting['smethod_sort_order'] : 0; ?>">
									</td>
				  			</tr>
				  		</table>
				  		<table id="option" class="table table-bordered table-hover">
				  			<thead>
									<tr>
										<td class="left">Shipping Method Name</td>										
										<td>Hide in Categories</td>
										<td class="left">Sort Order</td>
									</tr>
								</thead>
								<tbody>
									<?php if($shipping_methods){ foreach ($shipping_methods as $scode => $shipping_method) { ?>
					  			<tr>
					  				<td class="left"><?php echo $shipping_method; ?></td>		  					  				
					  				<td class="left">
					  					<select name="ultimatemegafilter_setting[category_smethod_<?php echo $scode; ?>][]" multiple="multiple" class="js-example-basic-multiple" style="width:100%;">
												<?php foreach($categories as $category){  ?>
												<?php $sm_categories = isset($setting['category_smethod_' . $scode]) ? $setting['category_smethod_' . $scode] : array(); ?>
												<?php $selected = in_array($category['category_id'], $sm_categories) ? 'selected="selected"' : ''; ?>
												<option value="<?php echo $category['category_id']; ?>" <?php echo $selected; ?>><?php echo $category['name']; ?></option>
												<?php } ?>
											</select>
					  				</td>
					  				<td class="left">
					  					<input type="text" name="ultimatemegafilter_setting[sort_order_smethod_<?php echo $scode; ?>]" value="<?php echo isset($setting['sort_order_smethod_' . $scode]) ? $setting['sort_order_smethod_' . $scode] : ''; ?>" class="form-control">
					  				</td>
					  			</tr>
					  			<?php } } ?>
								</tbody>
				  		</table>
				  	</div>
				  	<div class="tab-pane" id="tab-setting">
				  		<ul class="nav nav-tabs">
				  			<li class="active"><a href="#tab-basic" data-toggle="tab">Basic</a></li>
				  			<li><a href="#tab-style" data-toggle="tab">Style</a></li>
				  			<li><a href="#tab-filter-setting" data-toggle="tab">Filter</a></li>
				  		</ul>
				  		<div class="tab-content">
					  		<div class="tab-pane active" id="tab-basic">
						  		<table class="table table-bordered table-hover" >
										<tr>
											<td><?php echo $text_attr_delimeter?></td>
											<td><input id="attr_delimeter" type="text" name="ultimatemegafilter_setting[attr_delimeter]" size="3" value="<?php if(isset($setting['attr_delimeter'])) echo $setting['attr_delimeter']; else echo ':'; ?>" class="form-control">
											</td>
										</tr>
										<tr>
											<td><?php echo $text_tax?></td>
											<td><input id="tax" type="text" name="ultimatemegafilter_setting[tax]" size="3"  value="<?php if(isset($setting['tax'])) echo $setting['tax']; else echo '0'; ?>" class="form-control">
											</td>
										</tr>
										<tr>
											<td><?php echo $text_option_mode?></td>
											<td><input id="option_mode_or" type="radio" name="ultimatemegafilter_setting[option_mode]"
													   value="or" <?php if(!isset($setting['option_mode']) || $setting['option_mode'] == 'or') echo " checked='checked'"?>>
												<label for="option_mode_or"><?php echo $text_mode_or?></label>
												<input id="option_mode_and" type="radio" name="ultimatemegafilter_setting[option_mode]"
													   value="and" <?php if(isset($setting['option_mode']) && $setting['option_mode'] == 'and') echo " checked='checked'"?>>
												<label for="option_mode_and"><?php echo $text_mode_and?></label>
											</td>
										</tr>
										<tr>
											<td><?php echo $text_attribute_mode?></td>
											<td><input id="attribute_mode_or" type="radio" name="ultimatemegafilter_setting[attribute_mode]"
													   value="or" <?php if(!isset($setting['attribute_mode']) || $setting['attribute_mode'] == 'or') echo " checked='checked'"?>>
												<label for="attribute_mode_or"><?php echo $text_mode_or?></label>
												<input id="attribute_mode_and" type="radio" name="ultimatemegafilter_setting[attribute_mode]"
													   value="and" <?php if(isset($setting['attribute_mode']) && $setting['attribute_mode'] == 'and') echo " checked='checked'"?>>
												<label for="attribute_mode_and"><?php echo $text_mode_and?></label>
											</td>
										</tr>
										<tr>
											<td><?php echo $text_attribute_value_mode?></td>
											<td><input id="attribute_value_mode_or" type="radio" name="ultimatemegafilter_setting[attribute_value_mode]"
													   value="or" <?php if(!isset($setting['attribute_value_mode']) || $setting['attribute_value_mode'] == 'or') echo " checked='checked'"?>>
												<label for="attribute_value_mode_or"><?php echo $text_mode_or?></label>
												<input id="attribute_value_mode_and" type="radio" name="ultimatemegafilter_setting[attribute_value_mode]"
													   value="and" <?php if(isset($setting['attribute_value_mode']) && $setting['attribute_value_mode'] == 'and') echo " checked='checked'"?>>
												<label for="attribute_value_mode_and"><?php echo $text_mode_and?></label>
											</td>
										</tr>
										<tr>
											<td colspan="2">&nbsp;</td>
										</tr>
										<tr>
											<td><?php echo $text_attr_group?></td>
											<td><input id="text_attr_group_off" type="radio" name="ultimatemegafilter_setting[attr_group]"
													   value="0" <?php if(!isset($setting['attr_group']) || $setting['attr_group'] == '0') echo " checked='checked'"?>>
												<label for="text_attr_group_off"><?php echo $text_no?></label>
												<input id="text_attr_group_on" type="radio" name="ultimatemegafilter_setting[attr_group]"
													   value="1" <?php if(isset($setting['attr_group']) && $setting['attr_group'] == '1') echo " checked='checked'"?>>
												<label for="text_attr_group_on"><?php echo $text_yes?></label>
											</td>
										</tr>										
										<tr>
											<td class="left"><label for="subcategories"><?php echo $text_subcategories?></label></td>
											<td class="left"><input type="checkbox" name="ultimatemegafilter_setting[subcategories]" id="subcategories" <?php if(isset($setting['subcategories'])) echo " checked='checked'"; ?>>
											</td>
										</tr>

										<tr>
					            <td class="left">Hide in category</td>
					            <td class="left"><input type="text" name="category" value="" class="form-control"/></td>
					          </tr>
					          <tr>
					            <td class="left">&nbsp;</td>
					            <td class="left">
					            	<div id="filter-category" class="well well-sm" style="height: 150px; overflow: auto;">					                
					                <?php if(!empty($filter_categories)){ ?>
						                <?php foreach ($filter_categories as $filter_category) { ?>
						                <div id="filter-category<?php echo $filter_category['category_id']; ?>">
						                	<i class="fa fa-minus-circle"></i> <?php echo $filter_category['name']; ?>
				                      <input type="hidden" name="ultimatemegafilter_setting[filter_category][]" value="<?php echo $filter_category['category_id']; ?>" />
				                    </div>
						                <?php } ?>
						              <?php } ?>
					              </div>
					            </td>
					          </tr>

										<tr>
											<td class="left"><?php echo $text_ultimatemegafilter_container?></td>
											<td class="left">
												<input type="text" name="ultimatemegafilter_setting[ultimatemegafilter_container]" value="<?php echo $setting['ultimatemegafilter_container']?>" class="form-control">
											</td>
										</tr>
										<tr>
											<td><?php echo $text_ultimatemegafilter_afterload?></td>
											<td>
												<textarea type="text" name="ultimatemegafilter_setting[ultimatemegafilter_afterload]" style="height: 350px; width: 600px;" class="form-control"><?php echo $setting['ultimatemegafilter_afterload']?></textarea>
											</td>
										</tr>
									</table>
								</div>
								<div class="tab-pane" id="tab-style">
									<table class="table table-bordered table-hover">
										<tr>
											<td>Font family:</td>
											<?php $font = isset($setting['font_family']) ? $setting['font_family'] : ''; ?>
											<td width="170">
												<select name="ultimatemegafilter_setting[font_family]" class="form-control">
													<option value="initial" <?php echo ($font == 'initial') ? 'selected="selected"' : ''; ?>>Initial</option>
													<option value="inherit" <?php echo ($font == 'inherit') ? 'selected="selected"' : ''; ?>>inherit</option>
													<option value="Alegreya-Regular" <?php echo ($font == 'Alegreya-Regular') ? 'selected="selected"' : ''; ?>>Alegreya</option>									
													<option value="AlegreyaSans-Regular" <?php echo ($font == 'AlegreyaSans-Regular') ? 'selected="selected"' : ''; ?>>AlegreyaSans</option>
													<option value="AnonymousPro-Regular" <?php echo ($font == 'AnonymousPro-Regular') ? 'selected="selected"' : ''; ?>>AnonymousPro</option>
													<option value="ArchivoNarrow-Regular" <?php echo ($font == 'ArchivoNarrow-Regular') ? 'selected="selected"' : ''; ?>>ArchivoNarrow</option>
													<option value="Arvo-Regular" <?php echo ($font == 'Arvo-Regular') ? 'selected="selected"' : ''; ?>>Arvo</option>
													<option value="BioRhyme-Regular" <?php echo ($font == 'BioRhyme-Regular') ? 'selected="selected"' : ''; ?>>BioRhyme</option>
													<option value="Bitter-Regular" <?php echo ($font == 'Bitter-Regular') ? 'selected="selected"' : ''; ?>>Bitter</option>
													<option value="Cabin-Regular" <?php echo ($font == 'Cabin-Regular') ? 'selected="selected"' : ''; ?>>Cabin</option>
													<option value="Cardo-Regular" <?php echo ($font == 'Cardo-Regular') ? 'selected="selected"' : ''; ?>>Cardo</option>
													<option value="Chivo-Regular" <?php echo ($font == 'Chivo-Regular') ? 'selected="selected"' : ''; ?>>Chivo</option>
													<option value="Lato-Regular" <?php echo ($font == 'Lato-Regular') ? 'selected="selected"' : ''; ?>>Lato</option>
													<option value="Roboto-Regular" <?php echo ($font == 'Roboto-Regular') ? 'selected="selected"' : ''; ?>>Roboto</option>
												</select>
											</td>
											<td><span class="font_preview" style="font-family:<?php echo $font; ?>;">ABCXYZ</span></td>
										</tr>
										<tr>
											<td>Header background color:</td>
											<td width="170"><input type="text" name="ultimatemegafilter_setting[header_bg_color]" class="jscolor form-control" value="<?php echo isset($setting['header_bg_color']) ? $setting['header_bg_color'] : 'F5F4F4'; ?>" ></td>
											<td><span><img src="view/image/fp/header_color.png"></span></td>
										</tr>
										<tr>
											<td>Header text color:</td>
											<td><input type="text" name="ultimatemegafilter_setting[header_fg_color]" class="jscolor form-control" value="<?php echo isset($setting['header_fg_color']) ? $setting['header_fg_color'] : '595959'; ?>"></td>
											<td><span><img src="view/image/fp/header_color.png"></td>
										</tr>
										<tr>
											<td>Header border color:</td>
											<td><input type="text" name="ultimatemegafilter_setting[header_br_color]" class="jscolor form-control" value="<?php echo isset($setting['header_br_color']) ? $setting['header_br_color'] : 'FFFFFF'; ?>"></td>
											<td><span><img src="view/image/fp/header_border_color.png"></td>
										</tr>
										<tr>
											<td>Counter background color:</td>
											<td><input type="text" name="ultimatemegafilter_setting[counter_bg_color]" class="jscolor form-control" value="<?php echo isset($setting['counter_bg_color']) ? $setting['counter_bg_color'] : 'FFFFFF'; ?>"></td>
											<td><span><img src="view/image/fp/counter_color.png"></span></td>
										</tr>
										<tr>
											<td>Counter text color:</td>
											<td><input type="text" name="ultimatemegafilter_setting[counter_fg_color]" class="jscolor form-control" value="<?php echo isset($setting['counter_fg_color']) ? $setting['counter_fg_color'] : 'BDBDBD'; ?>"></td>
											<td><span><img src="view/image/fp/counter_color.png"></span></td>
										</tr>
										<tr>
											<td>Widget border color:</td>
											<td><input type="text" name="ultimatemegafilter_setting[widget_br_color]" class="jscolor form-control" value="<?php echo isset($setting['widget_br_color']) ? $setting['widget_br_color'] : 'EFEFEF'; ?>"></td>
											<td><span><img src="view/image/fp/widget_border_color.png"></td>
										</tr>
										<tr>
											<td>Image Size[W x H]:</td>
											<td style="position:relative">
												<div class="col-sm-6">
												<input type="text" name="ultimatemegafilter_setting[image_size_width]" value="<?php echo isset($setting['image_size_width']) ? $setting['image_size_width'] : '20'; ?>" size="2" class="form-control"></div> 
												<span style="position: absolute;margin: auto;left: 0;right: 0;bottom: 0;top: 0;width: 7px;height: 18px;">x</span>
												<div class="col-sm-6">
												<input type="text" name="ultimatemegafilter_setting[image_size_height]" value="<?php echo isset($setting['image_size_height']) ? $setting['image_size_height'] : '20'; ?>" size="2" class="form-control"></div>
											</td>
											<td><span><img src="view/image/fp/image_size.png"></span></td>
										</tr>
										<tr>
											<td>Filter option scroll:</td>
											<td style="position:relative">
												<label>Scroll height</label>												
												<div class="input-group">									
													<input type="text" name="ultimatemegafilter_setting[scroll_height]" value="<?php echo isset($setting['scroll_height']) ? $setting['scroll_height'] : '160'; ?>" size="2" class="form-control">
													<span class="input-group-addon" id="basic-addon2">px</span>
												</div><br>
												<label>Enable</label>
												<select class="form-control" name="ultimatemegafilter_setting[scroll_status]">
													<option value="1" <?php echo (isset($setting['scroll_status']) && $setting['scroll_status'] == 1) ? 'selected="selected"' : ''; ?>><?php echo $text_yes; ?></option>
													<option value="0" <?php echo (isset($setting['scroll_status']) && $setting['scroll_status'] == 0) ? 'selected="selected"' : ''; ?>><?php echo $text_no; ?></option>
												</select>
											</td>
											<td><!-- <span><img src="view/image/fp/image_size.png"></span> --></td>
										</tr>
										<tr>
											<th valign="top">Custom Css Style:</th>
											<td colspan="2">
												<div>To define own styles for this module please use prefix <code>#ultimatemegafilter_box</code></div><br>
												<textarea name="ultimatemegafilter_setting[custom_css]" cols="80" rows="15" class="form-control"><?php echo isset($setting['custom_css']) ? $setting['custom_css'] : ''; ?></textarea>
											</td>
										</tr>
									</table>
								</div>
								<div class="tab-pane" id="tab-filter-setting">
									<table class="table table-without-thead">
										<tbody>
											<tr>
												<td><i class="fa fa-image"></i> Set images:</td>
												<td>
													<select id="image-filter" class="form-control">
														<option value="">--Select filter--</option>
														<?php if(!empty($filter_groups)){ foreach($filter_groups as $filter_group){ ?>
															<option value="<?php echo $filter_group['filter_group_id']; ?>"><?php echo $filter_group['name']; ?></option>
														<?php } }?>
													</select>
												</td>
												<td>
													<button class="btn btn-success btn-sm" type="button" id="save-filter"><i class="fa fa-save"></i> Save</button>
												</td>
											</tr>
										</tbody>
									</table>
									<table class="table table-without-thead" id="image-filter-table">
										<thead>
											<tr>
												<th>Value</th>
												<th>Image</th>
											</tr>
										</thead>
										<tbody>

										</tbody>
									</table>
								</div>
							</div>
				  	</div>
				  	<div class="tab-pane" id="tab-pp-method">
				  		<table class="table table-bordered table-hover">
				  			<tr>
				  				<td class="left">Select Category:</td>
				  				<td class="left" width="300">
				  					<select class="js-example-basic-single" id="pp_product_category" style="width:300px;">
				  						<option value="">--select--</option>
											<?php foreach($categories as $category){  ?>								
											<option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
											<?php } ?>
										</select>
				  				</td>
				  				<td class="left">&nbsp;</td>
				  			</tr>
				  			<tr>
				  				<td class="left">Select Payment Method:</td>
				  				<td class="left">
				  					<select class="js-example-basic-single" name="pp_payment_method" id="pp_payment_method" style="width:300px;">
				  						<option value="">--select--</option>
				  						<?php 
				  						if($payment_methods){
				  							foreach ($payment_methods as $code => $payment_method) {
				  								echo "<option value='$code'>$payment_method</option>";
				  							}
				  						}
				  						?>
				  					</select>
				  				</td>
				  				<td class="left"><a class="btn btn-primary" id="save_pp_payment">Save</a></td>
				  			</tr>
				  		</table>

				  		<table class="list pp_product table table-bordered table-hover">
				  			<thead>
				  				<tr>
				  					<td class="left">
				  						<input type="checkbox" onchange="$('.pp_product input[name=\'product_ids[]\']').prop('checked', this.checked)">
				  					</td>
				  					<td class="left">
				  						Product
				  					</td>
				  					<td class="left">
				  						Payment Method
				  					</td>	  					
				  				</tr>
				  			</thead>
				  			<tbody>

				  			</tbody>
				  		</table>
				  	</div>
				  	<div class="tab-pane" id="tab-ps-method">
				  		<table class="table table-bordered table-hover">
				  			<tr>
				  				<td class="left">Select Category:</td>
				  				<td class="left" width="300">
				  					<select class="js-example-basic-single" id="ps_product_category" style="width:300px;">
				  						<option value="">--select--</option>
											<?php foreach($categories as $category){  ?>								
											<option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
											<?php } ?>
										</select>
				  				</td>
				  				<td class="left">&nbsp;</td>
				  			</tr>
				  			<tr>
				  				<td class="left">Select Shipping Method:</td>
				  				<td class="left">
				  					<select class="js-example-basic-single" name="ps_shipping_method" id="ps_shipping_method" style="width:300px;">
				  						<option value="">--select--</option>
				  						<?php
				  						if($shipping_methods){
				  							foreach ($shipping_methods as $code => $shipping_method) {
				  								echo "<option value='$code'>$shipping_method</option>";
				  							}
				  						}
				  						?>
				  					</select>
				  				</td>
				  				<td class="left"><a class="btn btn-primary" id="save_ps_payment">Save</a></td>
				  			</tr>
				  		</table>

				  		<table class="list ps_product table table-bordered table-hover" >
				  			<thead>
				  				<tr>
				  					<td class="left">
				  						<input type="checkbox" onchange="$('.ps_product input[name=\'product_ids[]\']').prop('checked', this.checked)">
				  					</td>
				  					<td class="left">
				  						Product
				  					</td>
				  					<td class="left">
				  						Shipping Method
				  					</td>	  					
				  				</tr>
				  			</thead>
				  			<tbody>

				  			</tbody>
				  		</table>
				  	</div>
					</div>
		    </form>
		  </div>
		</div>
	</div>
</div>
<style>
	@font-face {
	  font-family: 'Alegreya-Regular';
	  src: url('<?php echo HTTP_CATALOG ?>/catalog/view/theme/default/stylesheet/fp/fonts/Alegreya-Regular.ttf') format('truetype');
	  font-weight: normal;
	  font-style: normal;
	}
	@font-face {
	  font-family: 'AlegreyaSans-Regular';
	  src: url('<?php echo HTTP_CATALOG ?>/catalog/view/theme/default/stylesheet/fp/fonts/AlegreyaSans-Regular.ttf') format('truetype');
	  font-weight: normal;
	  font-style: normal;
	}
	@font-face {
	  font-family: 'AnonymousPro-Regular';
	  src: url('<?php echo HTTP_CATALOG ?>/catalog/view/theme/default/stylesheet/fp/fonts/AnonymousPro-Regular.ttf') format('truetype');
	  font-weight: normal;
	  font-style: normal;
	}
	@font-face {
	  font-family: 'ArchivoNarrow-Regular';
	  src: url('<?php echo HTTP_CATALOG ?>/catalog/view/theme/default/stylesheet/fp/fonts/ArchivoNarrow-Regular.ttf') format('truetype');
	  font-weight: normal;
	  font-style: normal;
	}
	@font-face {
	  font-family: 'Arvo-Regular';
	  src: url('<?php echo HTTP_CATALOG ?>/catalog/view/theme/default/stylesheet/fp/fonts/Arvo-Regular.ttf') format('truetype');
	  font-weight: normal;
	  font-style: normal;
	}
	@font-face {
	  font-family: 'BioRhyme-Regular';
	  src: url('<?php echo HTTP_CATALOG ?>/catalog/view/theme/default/stylesheet/fp/fonts/BioRhyme-Regular.ttf') format('truetype');
	  font-weight: normal;
	  font-style: normal;
	}
	@font-face {
	  font-family: 'Bitter-Regular';
	  src: url('<?php echo HTTP_CATALOG ?>/catalog/view/theme/default/stylesheet/fp/fonts/Bitter-Regular.ttf') format('truetype');
	  font-weight: normal;
	  font-style: normal;
	}
	@font-face {
	  font-family: 'Cabin-Regular';
	  src: url('<?php echo HTTP_CATALOG ?>/catalog/view/theme/default/stylesheet/fp/fonts/Cabin-Regular.ttf') format('truetype');
	  font-weight: normal;
	  font-style: normal;
	}
	@font-face {
	  font-family: 'Cardo-Regular';
	  src: url('<?php echo HTTP_CATALOG ?>/catalog/view/theme/default/stylesheet/fp/fonts/Cardo-Regular.ttf') format('truetype');
	  font-weight: normal;
	  font-style: normal;
	}
	@font-face {
	  font-family: 'Chivo-Regular';
	  src: url('<?php echo HTTP_CATALOG ?>/catalog/view/theme/default/stylesheet/fp/fonts/Chivo-Regular.ttf') format('truetype');
	  font-weight: normal;
	  font-style: normal;
	}
	@font-face {
	  font-family: 'Lato-Regular';
	  src: url('<?php echo HTTP_CATALOG ?>/catalog/view/theme/default/stylesheet/fp/fonts/Alegreya-Regular.ttf') format('truetype');
	  font-weight: normal;
	  font-style: normal;
	}
	@font-face {
	  font-family: 'Roboto-Regular';
	  src: url('<?php echo HTTP_CATALOG ?>/catalog/view/theme/default/stylesheet/fp/fonts/Roboto-Regular.ttf') format('truetype');
	  font-weight: normal;
	  font-style: normal;
	}
	code{
	  background-color: #ddd;
	  padding: 3px 7px;
	  border-radius: 3px;
	}
</style>
<script>
$(document).delegate('#tab-attribute .load_more', 'click', function(e) {
		e.preventDefault();
  	var page = $(this).data('page');
  	var elem = $(this);
  	$.ajax({
  		url: 'index.php?route=module/ultimatemegafilter/getAttributes&token=<?php echo $token; ?>',
  		data:{page:page},
  		dataType:'json',
  		beforeSend: function(){
  			elem.addClass('disabled');
  			elem.text('Loading...');
  		},
  		complete: function(){
  			elem.removeClass('disabled');
  			elem.text('Load More');
  		},
  		success: function(response){
  			if(response.html){
	  			$('#tab-attribute #attribute tbody').append(response.html);
	  			elem.data('page', response.page);
	  			$(".js-example-basic-multiple").select2();
	  			$(".js-example-basic-single").select2();
  			}else{
  				alert('No more data available.');
  			}
  		}
  	})
});
</script>
<script type="text/javascript">
var payment_methods = $.parseJSON('<?php echo json_encode($payment_methods); ?>');
var shipping_methods = $.parseJSON('<?php echo json_encode($shipping_methods); ?>');
$(document).ready(function() {
  $(".js-example-basic-multiple").select2();
  $(".js-example-basic-single").select2();

	$('select[name="ultimatemegafilter_setting[font_family]"]').change(function(){
		var font = $(this).val();
		$('.font_preview').css({'font-family':font});
	});

	$('#image-filter').change(function(){
  	var filter_group_id = $(this).val();
  	$.ajax({
			url: 'index.php?route=module/ultimatemegafilter/getFilters&token=<?php echo $token; ?>',
			dataType: 'json',
			data:{filter_group_id:filter_group_id},
			beforeSend: function(){				
				$('#image-filter-table tbody').html('<td align="center" colspan="2" style="padding: 10px;">Loading...</td>');
			},success: function(json) {
				var html = '';
				if(json.filters){
					var filters = json.filters;
					$.each(filters, function(i, filter){						
						html += '<tr>';
						html += '<td>'+filter['filter_description'][1]['name']+'</td>';
						html += '<td>';
						html += '<div class="col-sm-10">';
						html += '<a href="" id="thumb-'+filter.filter_id+'" data-toggle="image" class="img-thumbnail">'
						html += '<img src="'+filter.thumb+'" alt="" title="" data-placeholder="<?php echo $placeholder; ?>"><input type="hidden" name="image['+filter.filter_id+']" class="filter_image" value="'+filter.image+'" id="input-'+filter.filter_id+'">'
						html += '</a>'
						html += '</div>';
						html += '</td>';
						html += '</tr>';
					});
				}
				$('#image-filter-table tbody').html(html);
			}
		});
  });

  $('#save-filter').click(function(){
  	if($('.filter_image').length){
  		var filter_group_id = $('#image-filter').val();
  		$.ajax({
				url: 'index.php?route=module/ultimatemegafilter/saveFilters&token=<?php echo $token; ?>&filter_group_id='+filter_group_id,
				type:'post',
				dataType: 'json',
				data:$('.filter_image'),
				beforeSend: function(){
					$('.alert').remove();
					$('#save-filter').button('loading');
				},complete: function(){
					$('#save-filter').button('reset');
				},success: function(json) {
					if(json.status){
						$('#image-filter-table').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> Success: saved!<button type="button" class="close" data-dismiss="alert">×</button></div>');
						$('#image-filter').trigger('change');
					}
				}
			});
  	}
  });
  
  $('#pp_product_category').change(function(){
  	var category_id = $(this).val();
  	$.ajax({
			url: 'index.php?route=module/ultimatemegafilter/getProducts&token=<?php echo $token; ?>',
			dataType: 'json',
			data:{category_id:category_id},
			success: function(json) {
				var html = '';
				if(json){
					$.each(json, function(i, v){
						var payment  = payment_methods[v['product_payment']];
						html += '<tr>';						
						html += '<td class="left"><input type="checkbox" name="product_ids[]" value="'+v['product_id']+'"></td>';
						html += '<td class="left">'+v['name']+'</td>';
						html += '<td class="left">'+payment+'</td>';
						html += '</tr>';
					});
				}
				$('.pp_product tbody').html(html);
			}
		});
  });

  $('#save_pp_payment').click(function(){
  	var payment = $('#pp_payment_method').val();
  	var products = $('input[name="product_id[]"]:checked');
  	$.ajax({
			url: 'index.php?route=module/ultimatemegafilter/saveProductPayment&token=<?php echo $token; ?>',
			type:'post',
			dataType: 'json',
			data:$('.pp_product input[name="product_ids[]"]:checked, select[name="pp_payment_method"]'),
			success: function(json) {
				$('#pp_product_category').trigger('change');
			}
		});
  });

  $('#ps_product_category').change(function(){
  	var category_id = $(this).val();
  	$.ajax({
			url: 'index.php?route=module/ultimatemegafilter/getProducts&token=<?php echo $token; ?>',
			dataType: 'json',
			data:{category_id:category_id},
			success: function(json) {
				var html = '';
				if(json){
					$.each(json, function(i, v){
						var shipping  = (typeof shipping_methods[v['product_shipping']] !== 'undefined') ? shipping_methods[v['product_shipping']] : '';
						html += '<tr>';						
						html += '<td class="left"><input type="checkbox" name="product_ids[]" value="'+v['product_id']+'"></td>';
						html += '<td class="left">'+v['name']+'</td>';
						html += '<td class="left">'+shipping+'</td>';
						html += '</tr>';
					});
				}
				$('.ps_product tbody').html(html);
			}
		});
  });

  $('#save_ps_payment').click(function(){
  	var payment = $('#ps_payment_method').val();
  	var products = $('input[name="product_id[]"]:checked');
  	$.ajax({
			url: 'index.php?route=module/ultimatemegafilter/saveProductShipping&token=<?php echo $token; ?>',
			type:'post',
			dataType: 'json',
			data:$('.ps_product input[name="product_ids[]"]:checked, select[name="ps_shipping_method"]'),
			success: function(json) {
				$('#ps_product_category').trigger('change');
			}
		});
  });
});
</script>
<script type="text/javascript"><!--

// Category
$('input[name=\'category\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',			
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['category_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'category\']').val('');
		
		$('#filter-category' + item['value']).remove();
		
		$('#filter-category').append('<div id="filter-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="ultimatemegafilter_setting[filter_category][]" value="' + item['value'] + '" /></div>');	
	}
});

$('#filter-category').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

/*var module_row = <?php echo $module_row; ?>;*/

/*function addModule() {
	html  = '<tbody id="module-row' + module_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><input type="hidden" name="ultimatemegafilter_module[' + module_row + '][type]" value="0">'+
		'<select name="ultimatemegafilter_module[' + module_row + '][layout_id]" class="form-control">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="ultimatemegafilter_module[' + module_row + '][position]" class="form-control">';
	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="ultimatemegafilter_module[' + module_row + '][status]" class="form-control">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="right"><input type="text" name="ultimatemegafilter_module[' + module_row + '][sort_order]" value="" size="3" class="form-control" /></td>';
	html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="btn btn-danger"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';

	$('#module tfoot').before(html);

	module_row++;
}

function addModuleContainer() {
	html  = '<tbody id="modulec-row' + module_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><input type="hidden" name="ultimatemegafilter_module[' + module_row + '][type]" value="1">'+
			'<input type="hidden" name="ultimatemegafilter_module[' + module_row + '][position]" value="content_top">'+
			'<select name="ultimatemegafilter_module[' + module_row + '][layout_id]" class="form-control">';
	<?php foreach ($container_layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="ultimatemegafilter_module[' + module_row + '][status]" class="form-control">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="right"><input type="text" name="ultimatemegafilter_module[' + module_row + '][sort_order]" value="" size="3" class="form-control" /></td>';
	html += '    <td class="left"><a onclick="$(\'#modulec-row' + module_row + '\').remove();" class="btn btn-danger"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';

	$('#module_container tfoot').before(html);

	module_row++;
}*/

function expand_all(checked){
	$('#settings input.expanded:checkbox').attr('checked', checked);
}

function apply(){
	$(".alert").remove();
	$.post($("#form").attr('action'), $("#form").serialize(), function(html) {
		var $success = $(html).find(".alert-success");
		if ($success.length > 0) {
			$(".panel").before($success);
		}
   });
}
//--></script>
<?php echo $footer; ?>