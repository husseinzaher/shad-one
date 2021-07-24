<fieldset id="section-awb">
<legend style="margin-bottom:0px;"><?php echo $tab_waybill; ?></legend>
  <table class="table table-bordered">
  <thead>
    <tr>
      <td class="text-left"><?php echo $column_date_added; ?></td>
      <td class="text-left"><?php echo $column_reference_number; ?></td>
      <td class="text-left"><?php echo $column_awb_number; ?></td>
      <td class="text-left"><?php echo $column_shipment_label; ?></td>
      <td class="text-left"><?php echo $column_status; ?></td>
      <!-- <td class="text-left"><?php echo $column_action; ?></td> -->
    </tr>
  </thead>
  <tbody>
  <?php if($consignment){ ?> 
  <?php foreach($consignment as $result) { ?>
    <tr>
      <td class="text-left"><?php echo $result['date_added']; ?></td>
      <td class="text-left"><?php echo $result['reference_number']; ?></td>
      <td class="text-left"><?php echo $result['awb_number']; ?></td>
      <td class="text-left">
        <?php if($result['shipment_label']){ ?> 
        <a href="<?php echo $result['shipment_label']; ?>" data-toggle="tooltip" data-original-title="View" title="" target="_blank"><i class="fa fa-eye"></i></a>&nbsp;&nbsp;&nbsp;<a href="<?php echo $result['shipment_label']; ?>" title="" download data-original-title="Download" data-toggle="tooltip"><i class="fa fa-download"></i></a>
        <?php } ?>
      </td>
      <td class="text-left"><a class="agree" href="<?php echo $result['track']; ?>" data-toggle="modal" data-target="#myModal" title="" class="btn btn-lg" data-original-title="Track Order"><i class="fa fa-paper-plane-o"></i>&nbsp;&nbsp;  <?php echo $result['status']; ?> </a> </td>
    </tr>
    <?php } ?>
    <?php } ?>
    <?php if($awb_btn){ ?> 
    <tr>
      <td colspan="5" class="text-center"><button type="button" id="button-smsa-awb" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_awb; ?> <i class="fa fa-plane fa-spin"></i></button></td>
    </tr>
    <?php }else{ ?>
    <tr>
      <td colspan="5" class="text-center">
        <div class="input-group col-sm-9">
          <input id="smsa-reason" name="reason" value="Order incomplete" placeholder="Reason required" class="form-control" type="text">
          <span class="input-group-btn">
            <button type="button" id="button-smsa-cancel" onclick="cancelShipment('<?php echo $awb_number; ?>');" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-danger"><?php echo $button_cancel; ?> <i class="fa fa-reply"></i></button>
          </span>
        </div>
      </td>
    </tr>
   <?php } ?>
  </tbody>
</table>
</fieldset>
<br>
<div id="myModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
        </div>
    </div>
</div>
<script type="text/javascript">
function cancelShipment(awb_number){
  $.ajax({
    url: 'index.php?route=shipping/smsa/cancelShipment&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
    type: 'post',
    dataType: 'json',
    data: {awb_number : awb_number, reason : $('#smsa-reason').val()},
    beforeSend: function() {
      $('#btn'+awb_number).button('loading');
    },
    complete: function() {
      $('#btn'+awb_number).button('reset');
    },
    success: function(json) {
      $('.text-success, .text-danger').remove();
      if (json['error']) {
        $("#section-awb legend").after('<div class="text-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
      }

      if (json['success']) {
        $("#section-awb legend").after('<div class="text-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
        $('#smsa').load('index.php?route=shipping/smsa/shipment&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>');
      }
    }
  });
}
</script>
<script type="text/javascript">
 $('#button-smsa-awb').on('click', function() { 

  $.ajax({
    url: 'index.php?route=shipping/smsa/addShip&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
    type: 'post',
    dataType: 'json',
    //data: $("#section-awb").serialize(),
    beforeSend: function() {
      $('#button-smsa-awb').button('loading');
    },
    complete: function() {
      $('#button-smsa-awb').button('reset');
    },
    success: function(json) {
      $('.text-success, .text-danger').remove();
      if (json['error']) {
        $("#section-awb legend").after('<div class="text-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
      }
      if (json['success']) {
        $("#section-awb legend").after('<div class="text-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
        $('#smsa').load('index.php?route=shipping/smsa/shipment&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>');
      }
    }
  });
});
</script>
<script type="text/javascript"><!--
  $('.date').datetimepicker({
    pickTime: false
  });

  $('.time').datetimepicker({
    pickDate: false
  });

  $('.datetime').datetimepicker({
    pickDate: true,
    pickTime: true
  });
  //--></script>
<script type="text/javascript">
    $('.btn-link').on('click', function(e){
    e.preventDefault();

    $('#myModal').modal('show').find('.modal-content').load($(this).attr('href'));
    });
  </script>
