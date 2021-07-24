<!--otp code start here-->
<div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body text-center" id="tmdotpbox">
        <form class="form-horizontal mobilebox" >
            <div class="form-group">
            <div class="col-sm-12">
              <label class="col-sm-12 padd0 control-label"><?php echo $entry_loginlabel; ?></label>
            <div class="col-sm-9 padd0">    
              <input class="form-control telephoneerror" name="telephone" type="text" placeholder="<?php echo $entry_loginlabel; ?>.">
            </div>
            <div class="col-sm-3 padd0">       
                <input type="button" value="Submit" id="chk-telephone" class="btn btn-primary" />
            </div>    
          </div>
          </div>
      
        </form>
		 <form class="form-horizontal showotpbox" style="display:none">
        	<div class="form-group">
        		<div class="col-sm-12">
        			<label class="control-label"><?php echo $entry_label2; ?></label>
        			 <input type="text" name="otp" value="" placeholder="<?php echo $entry_label2; ?>" class="login-input form-control" >
        		</div>
        	</div>
        	<div class="buttons">				
				<input type="button" value="Submit" id="add-otp" class="btn-primary" />				
				<input type="button" value="Resend OTP" id="resend-otp" class="btn-primary" />
            </div>
        </form>
      </div>
    </div>
</div>
 
<script type="text/javascript">
$('#chk-telephone').bind('click', function() {
	$.ajax({
	url: 'index.php?route=tmdsms/tmd_otplogin/chkphonenumber',
	type: 'post',
	data: $('#tmdotpbox input[type=\'text\']'),
	dataType: 'json',
	beforeSend: function() {
		 $('#chk-telephone').button('loading');
	},
	complete: function() {
		$('#chk-telephone').button('reset');
	},
		
	success: function(json) {
	$('.alert, .alert-success, .text-danger').remove();
	
			if (json['error']) {
				$('.telephoneerror').after('<div class="text-danger">'+ json['error'] + '</div>');
			}

			if (json['success']) {
				$('#tmdotpbox').before('<div class="success-box"><div class="alert alert-success" style="padding:10px;">'+ json['success'] +'</div> <img src="image/wait_new.gif" style="position:relative;left:33%;"/></div>');
				$('.mobilebox').hide();
				setTimeout(function(){
				$('.success-box').hide();				
				$('.showotpbox').show();
				}, 4000);				
			}
		}
		});
	});
	
	
$('#add-otp').bind('click', function() {
	$.ajax({
	url: 'index.php?route=tmdsms/tmd_otplogin/addotp',
	type: 'post',
	data: $('#tmdotpbox input[type=\'text\']'),
	dataType: 'json',
	beforeSend: function() {
		 $('#add-otp').button('loading');
	},
	complete: function() {
		$('#add-otp').button('reset');
	},
		
	success: function(json) {
	$('.alert, .alert-success, .text-danger').remove();
	
			if (json['error']) {
				$('.login-input').after('<div class="text-danger">'+ json['error'] + '</div>');
			}

			if (json['success']) {
				$('#tmdotpbox').before('<div class="alert alert-success">'+ json['success'] +'<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				
				$('input[name=otp]').val('');
				if(json['redirect']){
				location=json['redirect'];
				}
			}
		}
		});
	});
	
	$('#resend-otp').bind('click', function() {
		$.ajax({
			url: 'index.php?route=tmdsms/tmd_otplogin/resendotp',
			type: 'post',
			data: $('#tmdotpbox input[type=\'text\']'),
			dataType: 'json',
			beforeSend: function() {
	    $('#resend-otp').button('loading');
	    },
		complete: function() {
			$('#resend-otp').button('reset');
		},
			success: function(json) {
			$('.alert, .alert-success, .text-danger').remove();
				$('#tmdotpbox').before('<div class="alert alert-success" style="padding:10px;">'+ json['success'] +'</div>');
				
			}
		});
	});
</script>
<style>
#mobilelogin .modal-header{
	border-bottom: none;
}	
#mobilelogin .btn-primary{
	background: #e31e24;
	border: 1px solid #e31e24;
	line-height: 42px;
    padding: 0 20px;
    text-transform: uppercase;
    display: inline-block;
    font-size: 116.67%;
    color: #fff;
    font-weight: bold;
}
    #mobilelogin .modal-sm{
    width: 340px !important;
}
     @media(min-width:800px){
        .padd0{padding: 0 1px; }
    }
</style>
 <!--otp code end here-->