<!--
<form action="<?php echo $action; ?>" method="get">
  <input type="hidden" name="MEID" value="<?php echo $mid; ?>" />
  <input type="hidden" name="amt" value="<?php echo $amt; ?>" />
  <input type="hidden" name="amt_editable" value="N" />
  <input type="hidden" name="currency" value="<?php echo $currency; ?>" />
  <input type="hidden" name="ref" value="<?php echo $ref; ?>" />
  <input type="hidden" name="pmt_sender_email" value="<?php echo $pmt_sender_email; ?>" />
  <input type="hidden" name="pmt_contact_firstname" value="<?php echo $pmt_contact_firstname; ?>" />
  <input type="hidden" name="pmt_contact_surname" value="<?php echo $pmt_contact_surname; ?>" />
  <input type="hidden" name="pmt_contact_phone" value="<?php echo $pmt_contact_phone; ?>" />
  <input type="hidden" name="pmt_country" value="<?php echo $pmt_country; ?>" />
  <input type="hidden" name="regindi_address1" value="<?php echo $regindi_address1; ?>" />
  <input type="hidden" name="regindi_address2" value="<?php echo $regindi_address2; ?>" />
  <input type="hidden" name="regindi_sub" value="<?php echo $regindi_sub; ?>" />
  <input type="hidden" name="regindi_state" value="<?php echo $regindi_state; ?>" />
  <input type="hidden" name="regindi_pcode" value="<?php echo $regindi_pcode; ?>" />
  <input type="hidden" name="return" value="<?php echo $return; ?>" />
  <input type="hidden" name="popup" value="false" />
  <div class="buttons">
    <div class="pull-right"><input type="submit" value="<?php echo $button_confirm; ?>" class="btn btn-primary" /></div>
  </div>
</form>-->

<form action="<?php echo $action; ?>" method="post">
  <input type="hidden" name="MEID" value="<?php echo $meid; ?>" />
  <input type="hidden" name="UName" value="<?php echo $uname; ?>" />
  <input type="hidden" name="PWD" value="<?php echo $pwd; ?>" />
  <input type="hidden" name="ItemName1" value="<?php echo $itemname1; ?>" />
  <input type="hidden" name="ItemQty1" value="1" />
  <input type="hidden" name="ItemPrice1" value="<?php echo $itemprice1; ?>" />
  <input type="hidden" name="CurrencyCode" value="<?php echo $currencycode; ?>" />
  <input type="hidden" name="OrdID" value="<?php echo $ordid; ?>" />
  <input type="hidden" name="CstEmail" value="<?php echo $cstemail; ?>" />
  <input type="hidden" name="CstFName" value="<?php echo $cstname; ?>" />
  <input type="hidden" name="CstMobile" value="<?php echo $cstmobile; ?>" />
  <input type="hidden" name="Cntry" value="<?php echo $cntry; ?>" />
  <input type="hidden" name="ReturnURL" value="<?php echo $returnurl; ?>" />
  <div class="buttons">
    <div class="right"><input type="submit" value="<?php echo $button_confirm; ?>" class="button" /></div>
  </div>
</form>

