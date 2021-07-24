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