<?php if($tags || $categories || $options || $manufacturers || $attributes_new || $price_slider) { ?>

<div id="ultimatemegafilter_box" class="box">
	<div id="ultmt_back_btn">
		<i class="fa fa-arrow-left"></i>
	</div>
	<div class="box-heading">
		<div style="height: 15px;">
			<a class="clear_filter" href="javascript:void(0);"><?php echo $clear_filter?></a>			
		</div>
	</div>
	<div class="box-content ultimatemegafilter">
		<form id="ultimatemegafilter">
			<?php if($manufacturers) { ?>
				<?php foreach($manufacturers as $manufacturer) { ?>
				<input type="hidden" class="m_name" id="m_<?php echo $manufacturer['manufacturer_id']?>" value="<?php echo $manufacturer['name']?>">
				<?php } ?>
			<?php } ?>

			<?php if($ratings) { ?>				
				<?php foreach($ratings as $rating) { ?>					
					<input type="hidden" class="r_name" id="r_<?php echo $rating['rating']; ?>" value="<?php echo $rating['rating']?>">				
				<?php } ?>			
			<?php } ?>
			
			<?php if($payment_methods) { ?>
				<?php foreach($payment_methods as $payment_method) { ?>
				<input type="hidden" class="pm_name" id="pm_<?php echo $payment_method['code']?>" value="<?php echo $payment_method['name']?>">
				<?php } ?>
			<?php } ?>

			<?php if($shipping_methods) { ?>
				<?php foreach($shipping_methods as $shipping_method) { ?>
				<input type="hidden" class="sm_name" id="sm_<?php echo $shipping_method['code']?>" value="<?php echo $shipping_method['name']?>">
				<?php } ?>
			<?php } ?>
			
			<?php if($options) { ?>
			<?php foreach($options as $option) { ?>
				<?php foreach($option['option_values'] as $option_value) { ?>
				<input type="hidden" class="o_name" id="o_<?php echo $option_value['option_value_id']?>" value="<?php echo $option_value['name']?>">
					<?php } ?>
				<?php } ?>
			<?php } ?>

			<?php if($filters) { ?>
			<?php foreach($filters as $filter) { ?>
				<?php foreach($filter['filter_values'] as $filter_value) { ?>
				<input type="hidden" class="f_name" id="f_<?php echo $filter_value['filter_id']?>" value="<?php echo $filter_value['name']?>">
					<?php } ?>
				<?php } ?>
			<?php } ?>

			<?php if($category_id !== false) { ?>
				<input type="hidden" name="category_id" value="<?php echo $category_id ?>">
			<?php } ?>
			<?php if(isset($manufacturer_id)) { ?>
				<input type="hidden" name="manufacturer_id" value="<?php echo $manufacturer_id ?>">
			<?php }?>

			<?php foreach($stocks_status as $stock_status) { ?>
				<input type="hidden" id="ss_<?php echo $stock_status['stock_status_id']; ?>" value="<?php echo $stock_status['name']; ?>">
			<?php } ?>			
			<input type="hidden" name="page" id="ultimatemegafilter_page" value="<?php echo $page; ?>">
			<input type="hidden" name="path" value="<?php echo $path ?>">
			<input type="hidden" name="sort" id="ultimatemegafilter_sort" value="">
			<input type="hidden" name="order" id="ultimatemegafilter_order" value="">
			<input type="hidden" name="limit" id="ultimatemegafilter_limit" value="">
			<input type="hidden" name="route" value="<?php echo (isset($this->request->get['route']) ? $this->request->get['route'] : "");?>">
			<input type="hidden" id="ultimatemegafilter_container" value="<?php echo $ultimatemegafilter_container?>">
			<?php 
				$scroll = '';
				$scroll_height;
				$scroll_class;
				if($scroll_status){					
					$scroll_class = ' scrollbar-inner ';
					echo '<style>.scrollbar-inner{max-height:'.$scroll_height.'px;}</style>';
				}
			?>
			
			<!-- Price Slider box by Ashvin Patel -->
			<?php ob_start(); ?>
			<div class="option_box" <?php if(!$price_slider) { echo 'style="display:none"';}?>>
				<div class="row" >
					<div class="col-sm-12">
						<div class="col-sm-3">
							<div class="option_name"><?php echo $text_price_range?> <span class="umf-inl-clear" style="display:none;">Clear</span>
							</div>
						</div>
						<div class="col-sm-9">
							<div class="price_slider collapsible">
								<div class="pf_filter_container">
									<div class="col-sm-12">
										<div class="col-sm-6">
											<table style="margin-top:-10px;">
												<tr>
													<?php if($symbol_left){ echo "<td><label>". $symbol_left  . "</label></td>";}?>
													<td><input type="text" id="min_price" value="-1" name="min_price" class="price_limit"></td>
													<td><label> - </label></td>
													<td><input type="text" id="max_price" value="-1" name="max_price" class="price_limit"></td>
													<?php if($symbol_right){ echo "<td><label>" . $symbol_right . "</label></td>";}?>
												</tr>
											</table>
										</div>
										<div class="col-sm-6">
											<div id="slider-range"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<?php $umf_filter_sorting[] = array('sort_order' => $price_sort_order, 'data' => ob_get_clean());?>

			<!-- Review/Rating box by Ashvin Patel -->			
			<?php if($ratings) { ?>					
				<?php ob_start(); ?>				
					<div class="option_box" data-seo="rating" data-type="<?php echo $display_rrating; ?>">	
						<div class="row">
							<div class="col-sm-12">
								<div class="col-sm-3">	
									<div class="option_name"><?php echo $text_rating; ?> 
										<span class="umf-inl-clear" style="display:none;">Clear</span>
									</div>
								</div>
								<div class="col-sm-9">
									<div class="col-sm-12">					
									<div class="collapsible">
										<div class="pf_filter_container">
											<div>
												<?php if($display_rrating == 'select') { ?>	<div class="col-sm-12">
													<div class="col-sm-6" id="selected1">
													<div>
														<select name="rrating[]" class="filtered">
															<option value=""><?php echo $text_all?></option>
															<?php foreach($ratings as $rating) { ?>
																<option id="rrating_<?php echo $rating['rating']; ?>" class="rrating_value" value="<?php echo $rating['rating']; ?>" data-seo="<?php echo strtolower(str_replace(' ', '-', $rating['rating'])); ?>"><?php echo $rating['rating']; ?>
																</option>
															<?php } ?>
														</select>									
													</div>	
													</div>
												</div>							
												<?php } elseif($display_rrating == 'checkbox') { ?>	
												<div class="col-sm-12">					
													<table id="filter_filter">	
														<?php foreach($ratings as $rating) { ?>
														<tr>												
															<td>													<input id="rrating_<?php echo $rating['rating']; ?>" class="rrating_value filtered" type="checkbox" name="rrating[]" value="<?php echo $rating['rating']; ?>" data-seo="<?php echo strtolower(str_replace(' ', '-', $rating['rating'])); ?>">							
															</td>												
															<td>													<label for="rrating_<?php echo $rating['rating']; ?>"><?php echo $rating['rating']; ?></label>			
															</td>				
														</tr>		
														<?php } ?>
													</table>
												</div>	
												<?php } elseif($display_rrating == 'radio') { ?>
												<div class="col-sm-12">	
													<table id="filter_filter">
														<?php foreach($ratings as $rating) { ?>						
														<tr>			
															<td>					
																<input id="rrating_<?php echo $rating['rating']; ?>" class="rrating_value filtered" type="radio" name="rrating[]" value="<?php echo $rating['rating']; ?>" data-seo="<?php echo strtolower(str_replace(' ', '-', $rating['rating'])); ?>">
															</td>				
															<td>					
																<label for="rrating_<?php echo $rating['rating']; ?>"><?php echo $rating['rating']; ?></label>	
															</td>			
														</tr>		
														<?php } ?>
													</table>
												</div>
												<?php } elseif($display_rrating == 'star') { ?>	
												<div class="col-sm-12">
													<table class="ultimatemegafilter_imagetype" id="filter_filter">							<?php foreach($ratings as $rating) { ?>			<tr>		
															<td>					
																<input style="display: none;" id="rrating_<?php echo $rating['rating']; ?>" class="rrating_value filtered" type="checkbox" name="rrating[]" value="<?php echo $rating['rating']; ?>" data-seo="<?php echo strtolower(str_replace(' ', '-', $rating['rating'])); ?>">
																<img src="catalog/view/theme/default/image/umf/stars-<?php echo $rating['rating'];?>.png"/>
															</td>
															<td>				
																<label for="rrating_<?php echo $rating['rating']; ?>"></label>		
															</td>			
														</tr>	
														<?php } ?>	
													</table>							
												</div>	
												<?php }?>							
											</div>				
										</div>					
									</div>
									</div>
								</div>
							</div>
						</div>				
					</div>				
				<?php $umf_filter_sorting[] = array('sort_order' => $rrating_sort_order, 'data' => ob_get_clean());?>			
			<?php } ?>

			<!-- Instaock box by Ashvin Patel -->
			<?php if($instock_visible){ ?>
			<?php ob_start(); ?>
			<div class="option_box" >
				<div class="row" >
					<div class="col-sm-12">
						<div class="col-sm-3">
							<div class="option_name">Stock <span class="umf-inl-clear" style="display:none;">Clear</span></div>
						</div>
						<div class="collapsible">
							<div class="pf_filter_container">
								<div class="col-sm-9">
									<div class="col-sm-12">
										<div class="col-sm-12">
											
											<table id="filter_filter">
												<tr>
													<td><input type="checkbox" class="filtered" name="instock" id="instock" <?php if($instock_checked) echo 'checked="checked"'; ?>></td>
													<td><label for="instock"><?php echo $text_instock?></label></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<?php $umf_filter_sorting[] = array('sort_order' => $instock_sort_order, 'data' => ob_get_clean());?>
			<?php } ?>

			<!-- staock status by Ashvin Patel -->
			<?php $stock_status_ids = array(); 
			if($stock_status_status && $stocks_status){ ?>
			<?php ob_start(); ?>
			<div class="option_box" >
				<div class="row" >
					<div class="col-sm-12">
						<div class="col-sm-3">
							<div class="option_name">Stock Status <span class="umf-inl-clear" style="display:none;">Clear</span>
							</div>
						</div>
						<div class="collapsible">
							<div class="pf_filter_container">
								<div class="col-sm-9">
									<div class="col-sm-12">
										<div class="col-sm-12">
											<table id="filter_filter">
												<?php foreach($stocks_status as $stock_status){ ?>
												<?php $stock_status_ids[] = (int) $stock_status['stock_status_id'];?>
												<tr>
													<td><input type="checkbox" class="filtered stock_status" name="stock_status[]" id="stock_status_<?php echo $stock_status['stock_status_id']; ?>" value="<?php echo $stock_status['stock_status_id']; ?>"></td>
													<td><label for="stock_status_<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></label></td>
												</tr>
												<?php } ?>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<?php $umf_filter_sorting[] = array('sort_order' => $stock_status_sort_order, 'data' => ob_get_clean());?>
			<?php } ?>

			<!-- Category box by Ashvin Patel -->
			<?php $category_count = 0; if($categories) { $category_count = 1; ?>
				<?php ob_start(); ?>
				<div class="option_box">
					<div class="row" >
						<div class="col-sm-12">
							<div class="col-sm-3">
								<div class="option_name"><?php echo $text_categories; ?> <span class="umf-inl-clear" style="display:none;">Clear</span>
								</div>
							</div>
							<div class="col-sm-9">
								<div class="col-sm-12">
									<div class="collapsible">
										<?php if($isearch_categories){ ?>
											<div class="col-sm-12">
												<div class="isearch">
													<input type="text">
												</div>
											</div>
										<?php } ?>				
										<div class="pf_filter_container">
											<div>
												<div class="col-sm-12">
													<table id="filter_categories">										
														<?php foreach($categories as $category) { ?>
														<tr>
															<td>
																<input id="cat_<?php echo $category['category_id']; ?>" class="filtered"
																	   type="checkbox" name="categories[]"
																	   value="<?php echo $category['category_id']; ?>">
															</td>
															<td>
																<label for="cat_<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></label>
															</td>
														</tr>
														<?php } ?>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<?php $umf_filter_sorting[] = array('sort_order' => $categories_sort_order, 'data' => ob_get_clean());?>
			<?php } ?>

			<!-- Tags box by Ashvin Patel -->
			<?php if($tags) { ?>
				<div class="option_box">
					<div class="option_name <?php if($expanded_tags){echo "hided";}?>"><?php echo $text_tags; ?> <span class="umf-inl-clear" style="display:none;">Clear</span> <span class="pf_arrow"></span></div>
					<div class="collapsible" <?php if($expanded_tags){echo 'style="display:none"';}?>>
						<div class="pf_filter_container">
							<table id="filter_tags">
								<?php foreach($tags as $tag) { ?>
								<tr>
									<td>
										<input id="tag_<?php echo $tag['tag']; ?>" class="filtered"
											   type="checkbox" name="tags[]"
											   value="<?php echo $tag['tag']; ?>">
									</td>
									<td>
										<label for="tag_<?php echo $tag['tag']; ?>"><?php echo $tag['name']; ?></label>
									</td>
								</tr>
								<?php } ?>
							</table>
						</div>
					</div>
				</div>
			<?php } ?>

			<!-- Manufacturers box by Ashvin Patel -->
			<?php $manufacturer_count = 0; if($manufacturers) { $manufacturer_count = 1; ?>
				<?php ob_start(); ?>
				<div class="option_box">
					<div class="row" >
						<div class="col-sm-12">
							<div class="col-sm-3">
								<div class="option_name"><?php echo $text_manufacturers; ?> <span class="umf-inl-clear" style="display:none;">Clear</span>
								</div>
							</div>
							<div class="col-sm-9">
								<div class="col-sm-12">
									<div class="collapsible">
										<?php if($isearch_manufacturer){ ?>
											<div class="col-sm-12">
												<div class="isearch">
													<input type="text">			
												</div>			
											</div>
										<?php } ?>
										<div class="pf_filter_container">
											<div>
											<?php if($display_manufacturer == 'select') { ?>
												<div>
												<div class="col-sm-12" id="selected1">
													<select name="manufacturer[]" class="filtered">
														<option value=""><?php echo $text_all?></option>
														<?php foreach($manufacturers as $manufacturer) { ?>
														<option id="manufacturer_<?php echo $manufacturer['manufacturer_id']?>" class="manufacturer_value"
																value="<?php echo $manufacturer['manufacturer_id']?>"><?php echo $manufacturer['name']?></option>
														<?php } ?>
													</select>
												</div>
												</div>
											<?php } elseif($display_manufacturer == 'checkbox') { ?>
											<div class="col-sm-12">
												<table id="filter_filter">
													<?php foreach($manufacturers as $manufacturer) { ?>
													<tr>
														<td>
															<input id="manufacturer_<?php echo $manufacturer['manufacturer_id']?>" class="manufacturer_value filtered"
																   type="checkbox" name="manufacturer[]"
																   value="<?php echo $manufacturer['manufacturer_id']?>">
														</td>
														<td>
															<label for="manufacturer_<?php echo $manufacturer['manufacturer_id']?>"><?php echo $manufacturer['name']?></label>
														</td>
													</tr>
													<?php } ?>
												</table>
											</div>
											<?php } elseif($display_manufacturer == 'radio') { ?>
											<div class="col-sm-12">
												<table id="filter_filter">
													<?php foreach($manufacturers as $manufacturer) { ?>
													<tr>
														<td>
															<input id="manufacturer_<?php echo $manufacturer['manufacturer_id']?>" class="manufacturer_value filtered"
																   type="radio" name="manufacturer[]"
																   value="<?php echo $manufacturer['manufacturer_id']?>">
														</td>
														<td>
															<label for="manufacturer_<?php echo $manufacturer['manufacturer_id']?>"><?php echo $manufacturer['name']?></label>
														</td>
													</tr>
													<?php } ?>
												</table>
											</div>
											<?php }?>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<?php $umf_filter_sorting[] = array('sort_order' => $manufacturer_sort_order, 'data' => ob_get_clean());?>
			<?php } ?>

			<!-- Attributes box by Ashvin Patel -->
			<?php $attributes = array(); if($attributes_new) { ?>
				<?php foreach($attributes_new as $attribute_value) { ?>
				<?php 
					$attribute_value_id = $attribute_value['attribute_value_id'];
					$attributes[] = (int) $attribute_value_id;
				?>
				<?php ob_start(); ?>
				<div class="option_box <?php if($attr_group=="0") echo "option_box"; ?>">
					<div class="row" >
						<div class="col-sm-12">
							<div class="col-sm-3">
								<div class="option_name"><?php echo $attribute_value['name']; ?> <span class="umf-inl-clear" style="display:none;">Clear</span>
								</div>
							</div>
							<div class="col-sm-9">
								<div class="col-sm-12">				
									<div class="collapsible">
										<?php if($attribute_value['isearch']){ ?>
											<div class="col-sm-12">	
												<div class="isearch">	
													<input type="text">
												</div>
											</div>
										<?php } ?>
										<div class="pf_filter_container">
											<div>
												<?php if($attribute_value['display'] == 'select') { ?>
												<div>
												<div class="col-sm-12" id="selected1">
													<select class="filtered" name="attribute_value[<?php echo $attribute_value_id?>][]">
														<option value=""><?php echo $text_all?></option>
														<?php foreach($attribute_value['values'] as $i => $value) { ?>
														<option class="a_name"
																at_v_i="<?php echo $attribute_value_id . '_' . $value ?>"
																at_v_t="<?php echo $attribute_value_id . '_' . htmlspecialchars(preg_replace('/\s+|\n|\r|\s+$/m', '_', $value)) ?>"
																data-value="<?php echo $value ?>"
																value="<?php echo $value ?>"><?php echo $value ?></option>
														<?php }?>
													</select>
												</div>
												</div>
												<?php } elseif($attribute_value['display'] == 'checkbox') { ?>
												<div class="col-sm-12">	
													<table id="filter_filter">
														<?php foreach($attribute_value['values'] as $i => $value) { ?>
														<tr>
															<td>
																<input class="filtered a_name"
																	   id="attribute_value_<?php echo $attribute_value_id . $i; ?>"
																	   type="checkbox" name="attribute_value[<?php echo $attribute_value_id?>][]"
																	   at_v_i="<?php echo $attribute_value_id . '_' . $value; ?>"
																	   value="<?php echo $value ?>">
															</td>
															<td>
																<label for="attribute_value_<?php echo $attribute_value_id . $i; ?>"
																	   at_v_t="<?php echo $attribute_value_id . '_' . htmlspecialchars(preg_replace('/\s+|\n|\r|\s+$/m', '_', $value)); ?>"
																	   data-value="<?php echo $value; ?>"
																	   value="<?php echo $value ?>"><?php echo $value?></label>
															</td>
														</tr>
														<?php } ?>
													</table>
												</div>
												<?php } elseif($attribute_value['display'] == 'radio') { ?>
												<div class="col-sm-12">	
													<table id="filter_filter">
														<?php foreach($attribute_value['values'] as $i => $value) { ?>
														<tr>
															<td>
																<input class="filtered a_name"
																	   id="attribute_value_<?php echo $attribute_value_id . $i; ?>"
																	   type="radio" name="attribute_value[<?php echo $attribute_value_id?>][]"
																	   at_v_i="<?php echo $attribute_value_id . '_' . $value ?>"
																	   value="<?php echo $value ?>">
															</td>
															<td>
																<label for="attribute_value_<?php echo $attribute_value_id . $i; ?>"
																	   at_v_t="<?php echo $attribute_value_id . '_' . htmlspecialchars(preg_replace('/\s+|\n|\r|\s+$/m', '_', $value)) ?>"
																	   data-value="<?php echo $value ?>"
																	   value="<?php echo $value ?>"><?php echo $value?></label>
															</td>
														</tr>
														<?php } ?>
													</table>
												</div>
												<?php } elseif($attribute_value['display'] == 'slider') { ?>
												<div class="col-sm-12">	
													<table style="width:100%" id="filter_filter">
														<tr>
															<td style="width: 50%"><span id="attribute_label_<?php echo $attribute_value_id; ?>_min">0</span>
																<input type="hidden" id="attribute_value_<?php echo $attribute_value_id; ?>_min" name="attr_slider[<?php echo $attribute_value_id?>][min]" value="">
															</td>
															<td><span id="attribute_label_<?php echo $attribute_value_id; ?>_max">&infin;</span>
																<input type="hidden" id="attribute_value_<?php echo $attribute_value_id; ?>_max" name="attr_slider[<?php echo $attribute_value_id?>][max]" value="">
															</td>
														</tr>
														<tr>
															<td colspan="2">
																<div id="slider-range-<?php echo $attribute_value_id; ?>" style="margin-left: 5px;margin-right: 5px;"></div>
															</td>
														</tr>
													</table>
												</div>
												<script>
													var attr_arr_<?php echo $attribute_value_id; ?> = ['', <?php echo implode(',', $attribute_value['values']); ?>, ''];
													$('#slider-range-<?php echo $attribute_value_id; ?>').slider({
														range:true,
														min:0,
														max:<?php echo count($attribute_value['values'])+1 ; ?>,
														values:[0, <?php echo count($attribute_value['values'])+1 ; ?>],
														slide:function (a, b) {
															var min = attr_arr_<?php echo $attribute_value_id; ?>[b.values[0]];
															var max = attr_arr_<?php echo $attribute_value_id; ?>[b.values[1]];
															$("#attribute_label_<?php echo $attribute_value_id; ?>_min").html(min ? (min + '<?php echo $attribute_value['suffix']; ?>') : '0');
															$("#attribute_label_<?php echo $attribute_value_id; ?>_max").html(max?(max + '<?php echo $attribute_value['suffix']; ?>'):'&infin;');
														},
														stop:function (a, b) {
															var min = attr_arr_<?php echo $attribute_value_id; ?>[b.values[0]];
															var max = attr_arr_<?php echo $attribute_value_id; ?>[b.values[1]];
															$("#attribute_value_<?php echo $attribute_value_id; ?>_min").val(min);
															$("#attribute_value_<?php echo $attribute_value_id; ?>_max").val(max);
															iF()
														}
													});
												</script>
												<?php } ?>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<?php $umf_filter_sorting[] = array('sort_order' => $attribute_value['sort_order'], 'data' => ob_get_clean());?>
				<?php } ?>		
			<?php } ?>

			<!-- Options box by Ashvin Patel -->
			<?php $option_count = 0; if($options) { $option_count = 1; ?>
				<?php foreach($options as $option) { ?>
				<?php ob_start(); ?>
				<div class="option_box">
					<div class="row" >
						<div class="col-sm-12">
							<div class="col-sm-3">
								<div class="option_name"><?php echo $option['name']; ?> <span class="umf-inl-clear" style="display:none;">Clear</span>
								</div>
							</div>
							<?php if($option['display'] == 'select') { ?>
								<div class="col-sm-9">
									<div class="col-sm-12">
										<div class="collapsible">
											<?php if($option['isearch']){ ?>
											<div class="col-sm-12">
												<div class="isearch">
													<input type="text">
												</div>
											</div>
											<?php } ?>
											<div class="pf_filter_container">
											<div class="col-sm-12" id="selected1">
												<select class="filtered" name="option_value[<?php echo $option['option_id']?>][]">
													<option value=""><?php echo $text_all?></option>
													<?php foreach($option['option_values'] as $option_value) { ?>
													<option class="option_value" id="option_value_<?php echo $option_value['option_value_id']?>"
															value="<?php echo $option_value['option_value_id'] ?>"><?php echo $option_value['name']?></option>
													<?php }?>
												</select>
											</div>
											</div>
										</div>
									</div>
								</div>
							<?php } elseif($option['display'] == 'checkbox') { ?>		
								<div class="col-sm-9">
									<div class="col-sm-12">	
										<div class="collapsible">
											<?php if($option['isearch']){ ?>
											<div class="col-sm-12">
												<div class="isearch">	
													<input type="text">
												</div>
											</div>
											<?php } ?>
											<div class="pf_filter_container">
												<div>
													<div class="col-sm-12">	
														<table id="filter_filter">
															<?php foreach($option['option_values'] as $option_value) { ?>
															<tr>
																<td>
																	<input class="filtered option_value" id="option_value_<?php echo $option_value['option_value_id']?>"
																		   type="checkbox" name="option_value[<?php echo $option['option_id']?>][]"
																		   value="<?php echo $option_value['option_value_id']?>">
																</td>
																<td>
																	<label for="option_value_<?php echo $option_value['option_value_id']?>"><?php echo $option_value['name']?></label>
																</td>
															</tr>
															<?php } ?>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							<?php } elseif($option['display'] == 'radio') { ?>
								<div class="col-sm-9">
									<div class="col-sm-12">	
										<div class="collapsible">
											<?php if($option['isearch']){ ?>
												<div class="col-sm-12">	
													<div class="isearch">	
														<input type="text">
													</div>
												</div>
											<?php } ?>
											<div class="pf_filter_container">
												<div>
												<div class="col-sm-12">	
													<table id="filter_filter">
														<?php foreach($option['option_values'] as $option_value) { ?>
														<tr>
															<td>
																<input class="filtered option_value" id="option_value_<?php echo $option_value['option_value_id']?>"
																	   type="radio" name="option_value[<?php echo $option['option_id']?>][]"
																	   value="<?php echo $option_value['option_value_id']?>">
															</td>
															<td>
																<label for="option_value_<?php echo $option_value['option_value_id']?>"><?php echo $option_value['name']?></label>
															</td>
														</tr>
														<?php } ?>
													</table>
												</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							<?php } elseif($option['display'] == 'image') { ?>
								<div class="collapsible">
									<?php if($option['isearch']){ ?>
										<div class="col-sm-12">	
											<div class="isearch">
												<input type="text">
											</div>
										</div>
									<?php } ?>
									<div class="pf_filter_container">
										<div class="col-sm-12">	
											<div>
												<ul class="ultimatemegafilter_imagetype">
												<?php foreach($option['option_values'] as $option_value) { ?>
													<li>
														<input style="display: none;" class="filtered option_value" id="option_value_<?php echo $option_value['option_value_id']?>"
															   type="checkbox" name="option_value[<?php echo $option['option_id']?>][]"
															   value="<?php echo $option_value['option_value_id']?>">
														<img src="<?php echo $option_value['thumb'];?>"/>
													</li>
												<?php } ?>
												</ul>
											</div>
										</div>
									</div>
								</div>
							<?php }?>
						</div>
					</div>
				</div>
				<?php $umf_filter_sorting[] = array('sort_order' => $option['sort_order'], 'data' => ob_get_clean());?>
				<?php } ?>
			<?php } ?>

			<!-- Filters box by Ashvin Patel -->
			<?php $filter_count = 0; if($filters) { $filter_count = 1; ?>
				<?php foreach($filters as $filter) { ?>
				<?php ob_start(); ?>
				<div class="option_box">
					<div class="row">
						<div class="col-sm-12">
							<div class="col-sm-3">
								<div class="option_name"><?php echo $filter['name']; ?> <span class="umf-inl-clear" style="display:none;">Clear</span>
								</div>
							</div>
							<?php if($filter['display'] == 'select') { ?>
								<div class="col-sm-9">
									<div class="col-sm-12">
										<div class="collapsible">
											<div class="pf_filter_container">
											<div class="col-sm-12" id="selected1">
												<select class="filtered" name="filter_value[<?php echo $filter['filter_group_id']?>][]">
													<option value=""><?php echo $text_all?></option>
													<?php foreach($filter['filter_values'] as $filter_value) { ?>
													<option class="filter_value" id="filter_<?php echo $filter_value['filter_id']?>"
															value="<?php echo $filter_value['filter_id'] ?>"><?php echo $filter_value['name']?></option>
													<?php }?>
												</select>
											</div>
											</div>
										</div>
									</div>
								</div>
							<?php } elseif($filter['display'] == 'checkbox') { ?>
								<div class="col-sm-9">
									<div class="col-sm-12">
										<div class="col-sm-12">
											<div class="collapsible">
												<?php if($filter['isearch']){ ?>
												<div class="col-sm-12" >
													<div class="isearch">	
														<input type="text">
													</div>
												</div>
												<?php } ?>
												<div class="pf_filter_container" >
													<div>
														<table id="filter_filter">
														<?php foreach($filter['filter_values'] as $filter_value) { ?>
														<tr>
															<td>
																<input class="filtered filter_value" id="filter_value_<?php echo $filter_value['filter_id']?>"
																	   type="checkbox" name="filter_value[<?php echo $filter['filter_group_id']?>][]"
																	   value="<?php echo $filter_value['filter_id']?>">
															</td>
															<td>
																<label for="filter_value_<?php echo $filter_value['filter_id']?>"><?php echo $filter_value['name']?></label>
															</td>
														</tr>
														<?php } ?>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							<?php } elseif($filter['display'] == 'radio') { ?>
								<div class="col-sm-9">
									<div class="col-sm-12">
										<div class="collapsible">
											<?php if($filter['isearch']){ ?>
												<div class="col-sm-12">
													<div class="isearch">
														<input type="text">
													</div>
												</div>
											<?php } ?>
											<div class="pf_filter_container">
												<div>
													<div class="col-sm-12">
													<table id="filter_filter">
														<?php foreach($filter['filter_values'] as $filter_value) { ?>
														<tr>
															<td>
																<input class="filtered filter_value" id="filter_value_<?php echo $filter_value['filter_id']?>"
																	   type="radio" name="filter_value[<?php echo $filter['filter_group_id']?>][]"
																	   value="<?php echo $filter_value['filter_id']?>">
															</td>
															<td>
																<label for="filter_value_<?php echo $filter_value['filter_id']?>"><?php echo $filter_value['name']?></label>
															</td>
														</tr>
														<?php } ?>
													</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							<?php } elseif($filter['display'] == 'image') { ?>
								<div class="col-sm-9">
									<div class="col-sm-12">
										<div class="col-sm-12">
										<div class="collapsible">
											<div class="pf_filter_container">
												<div>
													<ul class="ultimatemegafilter_imagetype">
													<?php foreach($filter['filter_values'] as $filter_value) { ?>
													<?php if($filter_value['thumb']){ ?>
													<li>
														<input style="display: none;" class="filtered filter_value" id="filter_value_<?php echo $filter_value['filter_id']?>"
															   type="checkbox" name="filter_value[<?php echo $filter['filter_group_id']?>][]"
															   value="<?php echo $filter_value['filter_id']?>">
														<img src="<?php echo $filter_value['thumb'];?>"/>
													</li>
													<?php } ?>
													<?php } ?>
													</ul>
												</div>
											</div>
										</div>
										</div>
									</div>
								</div>
							<?php }?>
						</div>
					</div>
				</div>
				<?php $umf_filter_sorting[] = array('sort_order' => $filter['sort_order'], 'data' => ob_get_clean());?>
				<?php } ?>
			<?php } ?>

			<!-- Payment Method box by Ashvin Patel -->
			<?php $payment_count = 0;  if($pmethod_status) { $payment_count = 1; ?>
				<?php ob_start(); ?>
				<div class="option_box">
					<div class="row" >
						<div class="col-sm-12">
							<div class="col-sm-3">
								<div class="option_name">Payment Methods <span class="umf-inl-clear" style="display:none;">Clear</span>
								</div>
							</div>
							<div class="col-sm-9">
								<div class="col-sm-12">
									<?php if($pmethod_display == 'select') { ?>
										<div class="collapsible">
										<div class="col-sm-12" id="selected1">
											<select class="filtered" name="pmethod_value[]">
												<option value=""><?php echo $text_all?></option>		
												<?php
												if($payment_methods){
													foreach ($payment_methods as $key => $payment_method) {
														echo "<option class='pmethod_value' id='pmethod_value_".$payment_method['code']."' value='".$payment_method['code']."'>".$payment_method['name']."</option>";
													}
												}
												?>	
											</select>
										</div>
										</div>
									<?php } elseif($pmethod_display == 'checkbox') { ?>
										<div class="collapsible">
											<?php if($pmethod_isearch){ ?>
												<div class="col-sm-12">
													<div class="isearch">
														<input type="text">
													</div>
												</div>
											<?php } ?>
											<div class="col-sm-12">
											<div class="pf_filter_container">
												<table id="filter_filter">
													<?php
													if($payment_methods){
													foreach ($payment_methods as $payment_method) {
													?>				
													<tr>
														<td>
															<input class="filtered pmethod_value" id="pmethod_value_<?php echo $payment_method['code']; ?>" type="checkbox" name="pmethod_value[]" value="<?php echo $payment_method['code']; ?>">
														</td>
														<td>
															<label for="pmethod_value_<?php echo $payment_method['code']; ?>"><?php echo $payment_method['name']; ?></label>
														</td>
													</tr>
													<?php } ?>
													<?php } ?>
												</table>
											</div>
											</div>
										</div>
									<?php } elseif($pmethod_display == 'radio') { ?>
										<div class="collapsible">
											<?php if($pmethod_isearch){ ?>
												<div class="col-sm-12">
													<div class="isearch">	
														<input type="text">
													</div>
												</div>
											<?php } ?>
											<div class="col-sm-12">
											<div class="pf_filter_container">
												<table id="filter_filter">						
													<?php
													if($payment_methods){
													foreach ($payment_methods as $payment_method) {
													?>				
													<tr>
														<td>
															<input class="filtered pmethod_value" id="pmethod_value_<?php echo $payment_method['code']; ?>" type="radio" name="pmethod_value[]" value="<?php echo $payment_method['code']; ?>">
														</td>
														<td>
															<label for="pmethod_value_<?php echo $payment_method['code']; ?>"><?php echo $payment_method['name']; ?></label>
														</td>
													</tr>
													<?php } ?>
													<?php } ?>						
												</table>
											</div>
											</div>
										</div>
									<?php } ?>
								</div>
							</div>
						</div>
					</div>
				</div>
				<?php $umf_filter_sorting[] = array('sort_order' => $pmethod_sort_order, 'data' => ob_get_clean());?>
			<?php } ?>

			<!-- Shipping Method box by Ashvin Patel -->
			<?php $shipping_count = 0; if($shipping_methods && $smethod_status) { $shipping_count = 1; ?>
				<?php ob_start(); ?>
				<div class="option_box">
					<div class="row" >
						<div class="col-sm-12">
							<div class="col-sm-3">
								<div class="option_name">Shipping Methods <span class="umf-inl-clear" style="display:none;">Clear</span>
								</div>
							</div>
							<div class="col-sm-9">
								<div class="col-sm-12">
									<?php if($smethod_display == 'select') { ?>
										<div class="collapsible">
										<div class="col-sm-12" id="selected1">
											<select class="filtered" name="smethod_value[]">
												<option value=""><?php echo $text_all?></option>
												<?php foreach($shipping_methods as $shipping_method) { ?>
												<option class="smethod_value" id="smethod_value_<?php echo $shipping_method['code']?>"
														value="<?php echo $shipping_method['code'] ?>"><?php echo $shipping_method['name']?></option>
												<?php }?>
											</select>
										</div>
										</div>
									<?php } elseif($smethod_display == 'checkbox') { ?>
										<div class="collapsible">
											<?php if($smethod_isearch){ ?>
												<div class="col-sm-12">
													<div class="isearch">	
														<input type="text">
													</div>
												</div>
											<?php } ?>
											<div class="pf_filter_container ">
												<div>
												<div class="col-sm-12">
													<table id="filter_filter">
														<?php foreach($shipping_methods as $shipping_method) { ?>
														<tr>
															<td>
																<input class="filtered smethod_value" id="smethod_value_<?php echo $shipping_method['code']?>" type="checkbox" name="smethod_value[]" value="<?php echo $shipping_method['code']?>">
															</td>
															<td>
																<label for="smethod_value_<?php echo $shipping_method['code']?>"><?php echo $shipping_method['name']?></label>
															</td>
														</tr>
														<?php } ?>
													</table>
												</div>
												</div>
											</div>
										</div>
									<?php } elseif($smethod_display == 'radio') { ?>
										<div class="collapsible">
											<?php if($smethod_isearch){ ?>
												<div class="col-sm-12">
													<div class="isearch">
														<input type="text">
													</div>
												</div>
											<?php } ?>
											<div class="pf_filter_container">
												<div>
												<div class="col-sm-12">
													<table id="filter_filter">
														<?php foreach($shipping_methods as $shipping_method) { ?>
														<tr>
															<td>
																<input class="filtered smethod_value" id="smethod_value_<?php echo $shipping_method['code']?>" type="radio" name="smethod_value[]" value="<?php echo $shipping_method['code']?>">
															</td>
															<td>
																<label for="smethod_value_<?php echo $shipping_method['code']?>"><?php echo $shipping_method['name']?></label>
															</td>
														</tr>
														<?php } ?>
													</table>
												</div>
												</div>
											</div>
										</div>
									<?php } ?>
								</div>
							</div>
						</div>
					</div>
				</div>
				<?php $umf_filter_sorting[] = array('sort_order' => $smethod_sort_order, 'data' => ob_get_clean());?>
			<?php } ?>
			<?php 
				$sorting = array(); 
				foreach ($umf_filter_sorting as $umf_filter_sorting_) {
					$sorting[] = $umf_filter_sorting_['sort_order'];
				}			
				array_multisort($sorting, SORT_ASC, $umf_filter_sorting);

				foreach ($umf_filter_sorting as $key => $umf_filter_sorting_1) {
					echo $umf_filter_sorting_1['data'];
				}			
			?>
		</form>
	</div>
</div>
<script>
	$('body').on('click', '#ultmt_back_btn i, .umf-filter-m-button button', function(){		
		$('.umf_filter-mobile').toggleClass('ultm_active');
	})
</script>
	<?php
		$attributes = array_unique($attributes);
	?>
<script>
	window.attributes = <?php echo json_encode($attributes); ?>;
	window.stock_status_ids = <?php echo json_encode($stock_status_ids); ?>;
	window.category_count = <?php echo $category_count; ?>;
	window.manufacturer_count = <?php echo $manufacturer_count; ?>;
	window.option_count = <?php echo $option_count; ?>;
	window.filter_count = <?php echo $filter_count; ?>;
	window.payment_count = <?php echo $payment_count; ?>;
	window.shipping_count = <?php echo $shipping_count; ?>;
	var scroll_height = <?php echo (int) $scroll_height; ?>;
	function forMobile(){
		var umf_filter = $('#ultimatemegafilter_box');
		$('#ultimatemegafilter_box').remove();
		var umf_filter_mobile = '<div class="umf_filter-mobile"><div class="umf-filter-m-button"><button><i class="fa fa-search"></i></button></div><div class="umf-filter-filter-wrap"><div id="ultimatemegafilter_box" class="box">'+umf_filter.html()+'</div></div>';
		$('body').prepend(umf_filter_mobile);
		$("#slider-range", "#ultimatemegafilter_box").slider({range:true, min:0, max:0, values:[0, 0], stop:function (a, b) {
          iF()
      }, slide:function (a, b) {
          $("#min_price", "#ultimatemegafilter_box").val(b.values[0]);
          $("#max_price", "#ultimatemegafilter_box").val(b.values[1]);
      }});
      $("#min_price", "#ultimatemegafilter_box").val($("#slider-range", "#ultimatemegafilter_box").slider("values", 0));
      $("#max_price", "#ultimatemegafilter_box").val($("#slider-range", "#ultimatemegafilter_box").slider("values", 1));
      afterload();
	}
	function forDesktop(){
		var umf_filter = $('#ultimatemegafilter_box');
		$('#ultimatemegafilter_box').remove();
		var umf_filter_mobile = '<div class="umf_filter-mobile"><div class="umf-filter-m-button"><button><i class="fa fa-search"></i></button></div><div class="umf-filter-filter-wrap"><div id="ultimatemegafilter_box" class="box">'+umf_filter.html()+'</div></div>';
		$('body').prepend(umf_filter_mobile);
		$("#slider-range", "#ultimatemegafilter_box").slider({range:true, min:0, max:0, values:[0, 0], stop:function (a, b) {
          iF()
      }, slide:function (a, b) {
          $("#min_price", "#ultimatemegafilter_box").val(b.values[0]);
          $("#max_price", "#ultimatemegafilter_box").val(b.values[1]);
      }});
      $("#min_price", "#ultimatemegafilter_box").val($("#slider-range", "#ultimatemegafilter_box").slider("values", 0));
      $("#max_price", "#ultimatemegafilter_box").val($("#slider-range", "#ultimatemegafilter_box").slider("values", 1));
	}
	jQuery(document).ready(function(){
		if($(window).width() <= 768){
			forMobile();
		}	
		$('.scrollbar-inner table, .scrollbar-inner .ultimatemegafilter_imagetype').each(function(){
			var isvisible = ($(this).parents('.collapsible').css('display')  == 'none') ? false : true;
			if(!isvisible){
				$(this).parents('.collapsible').show();
			}
			var table_height = $(this).height();		
			if(table_height >= scroll_height){
				$(this).parent().parent().css({height:scroll_height});
			}else{
				$(this).parent().parent().css({height:table_height+10});
			}
			if(!isvisible){
				$(this).parents('.collapsible').hide();
			}		
		});
		setTimeout(function(){		

			$('.scrollbar-inner').slimScroll({
			    position: 'right',
			    height: 'auto',
			    maxHeight: <?php echo (int) ($scroll_height-2); ?>,
			    railVisible: true,
			    alwaysVisible: false
			});
		}, 1000);
	});
</script>
<script type="text/javascript">
	function afterload(){
		<?php echo $ultimatemegafilter_afterload; ?>
	}
</script>
<style>
#ultimatemegafilter_box input {
     margin: 3px; 
}
#ultimatemegafilter_box .option_box table tr td label .ffilter-counter {
	float: none;
}
#ultimatemegafilter_box .option_box .pf_filter_container #filter_categories tr {
	float: left;
	background-color: #f8f8f8;
	border: 1px #ccc solid;
	margin-left: 5px;
	margin-bottom: 5px;
	text-align: center;
	border-radius: 3px;
	padding: 3px 3px 0px 0px;
}
#ultimatemegafilter_box .option_box .pf_filter_container #filter_filter tr {
	float: left;
	background-color: #f8f8f8;
	border: 1px #ccc solid;
	margin-left: 5px;
	margin-bottom: 5px;
	text-align: center;
	border-radius: 3px;
	padding: 3px 3px 0px 0px;
}
#ultimatemegafilter_box .option_box .pf_filter_container .instock tr {
	float: left;
    background-color: #f8f8f8;
    border: 1px #ccc solid;
    margin-left: 5px;
    margin-top: -4px;
    margin-bottom: 5px;
    text-align: center;
    border-radius: 3px;
    padding: 3px 12px 0px 7px;
}
#ultimatemegafilter_box .option_box .pf_filter_container .stockstatus1 tr {
	float: left;
    background-color: #f8f8f8;
    border: 1px #ccc solid;
    margin-left: 5px;
    margin-top: 0px;
    margin-bottom: 5px;
    text-align: center;
    border-radius: 3px;
    padding: 3px 12px 0px 7px;
}
#ultimatemegafilter_box .option_box .price_slider table tr td:nth-child(1) {
     padding: 0px 0px;
}
.option_box .row{
	margin-right: 0px;
    margin-left: 0px;
    border:1px #ccc solid;
    padding-top: 10px;

}
#ultimatemegafilter_box .option_box {
    margin-bottom: 0px;
    padding: 0px 7px;
}
#ultimatemegafilter_box .box-content {
	padding-bottom: 9px;
}
#ultimatemegafilter_box .option_box table tr td label .ffilter-counter {
    color: #000 !important;
}
@media only screen and (max-width: 770px) {
#ultimatemegafilter_box .option_box .pf_filter_container {
    border-color: #FFFFFF;
    margin-top: 8px;
    margin-left: -27px;
}
}
#selected1{margin-bottom: 15px;}
.umf-inl-clear{
  color: #d14747;
  font-size: 12px;
  text-transform: capitalize;
  line-height: 1;
}
<?php if($font_family != 'initial' && $font_family != 'inherit'){ ?>
@font-face {
  font-family: '<?php echo $font_family; ?>';
  src: url('<?php echo HTTP_SERVER ?>/catalog/view/theme/default/stylesheet/fp/fonts/<?php echo $font_family; ?>.ttf') format('truetype');
  font-weight: normal;
  font-style: normal;
}
<?php } ?>
<?php $font_family = ($font_family == 'initial' || $font_family == 'inherit') ? $font_family : '"'.$font_family.'"'?>
#ultimatemegafilter_box td, #ultimatemegafilter_box th, #ultimatemegafilter_box input, #ultimatemegafilter_box select, #ultimatemegafilter_box a, #ultimatemegafilter_box .option_box .option_name {
    font-family: <?php echo $font_family; ?>;
}
<?php if($header_bg_color || $header_fg_color){ ?>
#ultimatemegafilter_box .option_box .option_name{
	<?php echo ($header_bg_color) ? "background-color: #".$header_bg_color : ''; ?>;
	<?php echo ($header_fg_color) ? "color: #".$header_fg_color : ''; ?>;
}
<?php } ?>
<?php if($widget_br_color){ ?>
#ultimatemegafilter_box .box-heading, #ultimatemegafilter_box .box-content{
border-color:#<?php echo $widget_br_color; ?>;
}
<?php } ?>
<?php if($header_br_color){ ?>
#ultimatemegafilter_box .option_box .pf_filter_container{
border-color:#<?php echo $header_br_color; ?>;
}
<?php } ?>
<?php if($counter_bg_color || $counter_fg_color){ ?>
#ultimatemegafilter_box .option_box table tr td label .ffilter-counter{
	<?php echo ($header_bg_color) ? "background-color: #".$counter_bg_color : ''; ?>;
	<?php echo ($header_fg_color) ? "color: #".$counter_fg_color : ''; ?>;
}
<?php } ?>
<?php echo $custom_css; ?>
</style>
<?php } ?>