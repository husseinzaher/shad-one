<div class="modal-header">
  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h3>Track By Tracking Number</h3>
</div>
<br>
<div class="modal-body">
<?php if($result){ ?>
<h4>AWB #<?php echo $awbNo; ?></h4>
<h4>Status :<?php echo $status; ?></h4>
<br>
<div class="table-responsive">
  <table class="table table-bordered table-hover list">
    <thead>
      <tr>
        <td>Date</td>
        <td>Activity</td>
        <td>Details</td>
        <td>Location</td>
      </tr>
    </thead>
    <tbody>
    <?php foreach($result as $track){ ?>
    <tr>
      <td class="text-left"><?php echo $track['Date']; ?></td>
      <td class="text-left"><?php echo $track['Activity']; ?></td>
      <td class="text-left"><?php echo $track['Details']; ?></td>
      <td class="text-left"><?php echo $track['Location']; ?></td>
    </tr>
    <?php } ?>
    </tbody>
  </table>
</div>
<?php }else{ ?>
<p><?php echo text_empty; ?></p>
<?php } ?>
      <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>                
        </div>