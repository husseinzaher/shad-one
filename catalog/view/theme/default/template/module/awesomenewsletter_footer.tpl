<div id="newsletterModule-footer" class="text-center">
	<div id="newsletterFooterModule<?php echo $module; ?>" class="container">
		<div class="row" id="subsribe">	
			<div id="successmsg"></div>
			<div class="col-sm-4">
				<h3><?php echo $heading_title ?></h3>
			</div>			
			<?php if($namestatus) { ?>
			<div class="col-sm-3">
				<div class="input-group">
				  <span class="input-group-addon" id="basic-addon1"><i class="fa fa-user"></i></span>
				  <input type="text" id="input-newsletter-name" class="form-control" placeholder="<?php echo $entry_name_placeholder; ?>" value="" name="name"/>
				</div>
			</div>			
			<div class="col-sm-3">
				<div class="input-group">
				  <span class="input-group-addon" id="basic-addon1"><i class="fa fa-envelope"></i></span>
				  <input type="text" id="input-newsletter-email" class="form-control" placeholder="<?php echo $entry_email_placeholder; ?>" value="" name="email"/>
				</div>
			</div>
			<div class="col-sm-2">
				<a id="button-subsribe" class="btn btn-primary btn-xs"><?php echo $button_subscribe; ?></a>
			</div>
			<?php } else{ ?>
			
			<div class="form-group required col-sm-8">
				<div class="input-group">
				  <span class="input-group-addon" id="basic-addon1"><i class="fa fa-paper-plane"></i></span>
				   <input type="text" id="input-newsletter-email" class="fem form-control" placeholder="<?php echo $entry_email_placeholder; ?>" value="" name="email"/>
				  <span class="input-group-btn">
					<a id="button-subsribe" class="btn btn-primary btn-xs"><?php echo $button_subscribe; ?></a>
				  </span>
				</div>
			</div>
			<?php } ?>			
		</div>
	</div>
</div>
<script type="text/javascript">
$('#newsletterFooterModule<?php echo $module; ?> #button-subsribe').on('click', function() {
	$.ajax({
		url: 'index.php?route=module/awesomenewsletter/addsubscribe',
		type: 'post',
		data: $('#newsletterFooterModule<?php echo $module; ?> #subsribe input[type=\'text\']'),
		dataType: 'json',
		beforeSend: function(){
			$('#newsletterFooterModule<?php echo $module; ?> #button-subsribe').button('loading');
		},
		complete: function(){
			$('#newsletterFooterModule<?php echo $module; ?> #button-subsribe').button('reset');
		},
		success: function(json){
			$('.text-danger').parent().removeClass('has-error');
			$('.alert, .text-danger').remove();
			$('#newsletterFooterModule<?php echo $module; ?> #successmsg').html('');
			
			if(json['error']) {
				if(json['error']['email']) {
					$('#newsletterFooterModule<?php echo $module; ?> #input-newsletter-email').parent().after('<div class="text-left text-danger">' + json['error']['email'] + '</div>');
					
					$('.text-danger').parent().addClass('has-error');
				}
				
				if(json['error']['name']) {
					$('#newsletterFooterModule<?php echo $module; ?> #input-newsletter-name').parent().after('<div class="text-left text-danger">' + json['error']['name'] + '</div>');
					$('.text-danger').parent().addClass('has-error');
				}
			}
			
			if(json['success']){
				$('#newsletterFooterModule<?php echo $module; ?> #input-newsletter-email').parent().after('<div class="text-left text-success">' +  json['success'] + '</div>');	
				setTimeout(function(){
					$('.text-success').remove();
				}, 2000);
				
				$('#newsletterFooterModule<?php echo $module; ?> #subsribe input[type=\'text\']').val('');
			}
			
			if(json['warring']) {
				$('#newsletterFooterModule<?php echo $module; ?> #successmsg').html('<div class="alert alert-danger">' + json['warring'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}
			
		}
	});
});
</script>

<?php if($awesomenewsletter_css) { ?>
<style>
<?php echo $awesomenewsletter_css; ?>
</style>
<?php } ?>