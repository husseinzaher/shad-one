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
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
  <div class="container">

    <div id="content" >
      <h1><?php echo $heading_title; ?></h1>
      <p><?php echo $descriptiontop; ?></p>

      <form action="" method="post" enctype="multipart/form-data" class="form-horizontal otpverify">
         <div class="tab-first" id="myElem"></div>
        <fieldset id="account">
          <legend></legend>
          <div class="form-group required">
		  
		  <div class="col-sm-8">
			<div class="col-sm-2">
            <label class="control-label" for="input-firstname"><?php echo $text_otp; ?></label>
			 </div>
			 
            <div class="col-sm-10">
              <input type="text" name="otpconfirm" placeholder="<?php echo $text_otp; ?>" id="input-firstname" class="form-control" />
            </div>
			</div>
            <div class="col-sm-4"><button type="button" id="login" class="btn btn-primary"><?php echo $button_continue; ?></button>
            <button type="button" id="sendotp" class="btn btn-primary"><?php echo $button_resend; ?></button></div>
          </div>
      </form>
      <legend></legend>
      
      <p><?php echo $descriptionbottom; ?></p>
      <div class="buttons">
     
      </div>
      </div>
    </div>
    </div>
</div>
</div>

<script>
$('#login').click(function(){
  $.ajax({
  url: 'index.php?route=tmdsms/otpverify/passunlock&customer_id=<?php echo $customer_id; ?>',
  data: $('.otpverify input[type=\'text\']'),
  type:'post',
  dataType:'json',
  beforeSend: function() {
    
  },
  
  success: function(json) {
	  $('.alert').remove();
    if(json['error']) {
      $('.tab-first').append('<div class="alert alert-danger">'+json['error']+'</div>');
    }

    if (json['success']) {
      $('.tab-first').append('<div class="alert alert-success">'+json['success']+'</div>');
      location = 'index.php?route=account/success';
    }

   } 
});
});
</script>

<script>
$('#sendotp').click(function(){
  $.ajax({
  url: 'index.php?route=tmdsms/otpverify/sendotp&customer_id=<?php echo $customer_id; ?>',
  data: $('.otpverify input[type=\'text\']'),
  type:'post',
  dataType:'json',
  beforeSend: function() {
    $('.updatebid').button('loading');
  },
  complete: function() {
    $('.updatebid').button('reset');
  },
  success: function(json) {
     
	 $('.alert').remove();
    if (json['success']) {
      $('.tab-first').append('<div class="alert alert-success">'+json['success']+'</div>');
    }

   } 
});
});
</script>
<?php echo $footer; ?> 