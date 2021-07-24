<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Shortcuts</button>
         <button type="submit" form="form-banner" data-toggle="tooltip" title="<?php echo $button_stay; ?>" class="btn btn-primary"><i class="fa fa-save"></i> <?php echo $button_stay; ?></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-banner" class="form-horizontal">
           <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-sms" data-toggle="tab"><?php echo $tab_setting; ?></a></li>
            <li><a href="#tab-confirmation" data-toggle="tab"><?php echo $tab_registrtion; ?></a></li>
            <li><a href="#tab-status" data-toggle="tab"><?php echo $tab_status; ?></a></li>
            <li><a href="#tab-affiliate" data-toggle="tab"><?php echo $tab_affiliate; ?></a></li>
            <li><a href="#tab-admin" data-toggle="tab"><?php echo $tab_admin; ?></a></li>
            <li><a href="#tab-otpverify" data-toggle="tab"><?php echo $tab_otpverification; ?></a></li>
            <li><a href="#tab-loginotp" data-toggle="tab"><?php echo $tab_loginwithotp; ?></a></li>
          </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tab-sms">
                <fieldset>
				
				<div class="form-group">
						<label class="col-sm-2 control-label" for="input-ssl"><?php echo $entry_method; ?></label>
						<div class="col-sm-10">
						  <select name="tmdsms_method" id="input-method" class="form-control">
							<?php if ($tmdsms_method) { ?>
							<option value="1" selected="selected"><?php echo $text_get; ?></option>
							<option value="0"><?php echo $text_post; ?></option>
							<?php } else { ?>
							<option value="1"><?php echo $text_get; ?></option>
							<option value="0" selected="selected"><?php echo $text_post; ?></option>
							<?php } ?>
						  </select>
						</div>
					</div>
				  <div id="dataget">    
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-tmdsms_secretkey"><?php echo $entry_key; ?></label>
						<div class="col-sm-10">
						   <input type="text" name="tmdsms_key" value="<?php echo $tmdsms_key; ?>" placeholder="<?php echo $entry_key; ?>" id="input-tmdsms_key" class="form-control" />
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-tmdsms_secretkey"><?php echo $entry_secretkey; ?></label>
						<div class="col-sm-10">
						   <input type="text" name="tmdsms_secretkey" value="<?php echo $tmdsms_secretkey; ?>" placeholder="<?php echo $entry_secretkey; ?>" id="input-tmdsms_secretkey" class="form-control" />
						</div>
					</div> 
					
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-tmdsms_masterkey"><?php echo $entry_masterkey; ?></label>
						<div class="col-sm-10">
						   <input type="text" name="tmdsms_masterkey" value="<?php echo $tmdsms_masterkey; ?>" placeholder="<?php echo $entry_masterkey; ?>" id="input-tmdsms_masterkey" class="form-control" />
						</div>
					</div> 
				  </div>
				  <div id="datapost">    
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-tmdsms_url"><?php echo $entry_url; ?></label>
                    <div class="col-sm-10">
                      <textarea name="tmdsms_url" rows="5" placeholder="<?php echo $entry_url; ?>" id="input-tmdsms_url" class="form-control"><?php echo $tmdsms_url; ?></textarea>
                    </div>
                  </div>
                  </div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-tmdsms_dltid"><?php echo $entry_dltid; ?></label>
						<div class="col-sm-10">
						   <input type="text" name="tmdsms_dltid" value="<?php echo $tmdsms_dltid; ?>" placeholder="<?php echo $entry_dltid; ?>" id="input-dltid" class="form-control" />
						</div>
					</div> 
					
					
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-tmdsms_telephone"><?php echo $entry_telephone; ?></label>
						<div class="col-sm-10">
						   <input type="text" name="tmdsms_telephone" maxlength="10" value="<?php echo $tmdsms_telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-tmdsms_telephone" class="form-control" />
						</div>
					</div> 
					
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-debug"><?php echo $entry_debug; ?></label>
						<div class="col-sm-10">
							<select name="tmdsms_debug" id="input-debug" class="form-control">
							<?php if ($tmdsms_debug) { ?>
							<option value="1" selected="selected"><?php echo $text_yes; ?></option>
							<option value="0"><?php echo $text_no; ?></option>
							<?php } else { ?>
							<option value="1"><?php echo $text_yes; ?></option>
							<option value="0" selected="selected"><?php echo $text_no; ?></option>
							<?php } ?>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-ssl"><?php echo $entry_ssl; ?></label>
						<div class="col-sm-10">
						  <select name="tmdsms_ssl" id="input-status" class="form-control">
							<?php if ($tmdsms_ssl) { ?>
							<option value="1" selected="selected"><?php echo $text_yes; ?></option>
							<option value="0"><?php echo $text_no; ?></option>
							<?php } else { ?>
							<option value="1"><?php echo $text_yes; ?></option>
							<option value="0" selected="selected"><?php echo $text_no; ?></option>
							<?php } ?>
						  </select>
						</div>
					</div>

                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                    <div class="col-sm-10">
                      <select name="tmdsms_status" id="input-status" class="form-control">
                        <?php if ($tmdsms_status) { ?>
                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                        <option value="0"><?php echo $text_disabled; ?></option>
                        <?php } else { ?>
                        <option value="1"><?php echo $text_enabled; ?></option>
                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                        <?php } ?>
                      </select>
                    </div>
                  </div>
                </fieldset>
              </div>

              <div class="tab-pane" id="tab-confirmation">

                <div class="form-group">
					<label class="col-sm-2 control-label" for="input-tmdsms_registrtion_approval"><?php echo $entry_registrtion; ?></label>
					<div class="col-sm-10">
						<textarea name="tmdsms_registrtion_approval" rows="5" placeholder="Registrtion Message" id="input-tmdsms_registrtion_approval" class="form-control"><?php echo $tmdsms_registrtion_approval; ?></textarea>
					</div>
					<label class="col-sm-2 control-label" for="input-tmdsms_registrtion_approval_dltid"><?php echo $entry_dltid; ?></label>
					<div class="col-sm-10">
						<input name="tmdsms_registrtion_approval_dltid" value="<?php echo $tmdsms_registrtion_approval_dltid; ?>" placeholder="<?php echo $entry_dltid; ?>" id="input-tmdsms_registrtion_approval_dltid" class="form-control">
					</div>
                </div>
				
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-tmdsms_registrtion_disapproval"><?php echo $entry_registrtiondis; ?></label>
                  <div class="col-sm-10">
                    <textarea name="tmdsms_registrtion_disapproval" rows="5" placeholder="Registrtion Message" id="input-tmdsms_registrtion_disapproval" class="form-control"><?php echo $tmdsms_registrtion_disapproval; ?></textarea>
                  </div>
				  <label class="col-sm-2 control-label" for="input-tmdsms_registrtion_disapproval_dltid"><?php echo $entry_dltid; ?></label>
								<div class="col-sm-10">
									<input name="tmdsms_registrtion_disapproval_dltid" value="<?php echo $tmdsms_registrtion_disapproval_dltid; ?>" placeholder="<?php echo $entry_dltid; ?>" id="input-tmdsms_registrtion_approval_dltid" class="form-control">
								</div>
                </div>
				
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-tmdsms_forgotpassword_sms"><?php echo $entry_forgot_password; ?></label>
                  <div class="col-sm-10">
                    <textarea name="tmdsms_forgotpassword_sms" rows="5" placeholder="Forgot Password" id="input-tmdsms_forgotpassword_sms" class="form-control"><?php echo $tmdsms_forgotpassword_sms; ?></textarea>
                  </div>
				  <label class="col-sm-2 control-label" for="input-tmdsms_forgotpassword_dltid"><?php echo $entry_dltid; ?></label>
								<div class="col-sm-10">
									<input name="tmdsms_forgotpassword_dltid" value="<?php echo $tmdsms_forgotpassword_dltid; ?>" placeholder="<?php echo $entry_dltid; ?>" id="" class="form-control">
								</div>
                </div>
              </div>

              <div class="tab-pane" id="tab-status">
                <?php foreach ($order_statuses as $order_status) { ?>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="input-tmdsms_orderstatus"><?php echo $order_status['name']; ?></label>
					<div class="col-sm-10">
						<textarea name="tmdsms_orderstatus[<?php echo $order_status['order_status_id']; ?>][name]" rows="4" placeholder="<?php echo $order_status['name']; ?>" id="input-tmdsms_orderstatus" class="form-control"><?php echo isset($tmdsms_orderstatus[$order_status['order_status_id']]) ? $tmdsms_orderstatus[$order_status['order_status_id']]['name'] : ''; ?></textarea>
					</div>
					<label class="col-sm-2 control-label" for="input-tmdsms_affiliate_approval"><?php echo $entry_dltid; ?></label>
					<div class="col-sm-10">
						<input name="tmdsms_orderstatus[<?php echo $order_status['order_status_id']; ?>][dltid]" value="<?php echo isset($tmdsms_orderstatus[$order_status['order_status_id']]) ? $tmdsms_orderstatus[$order_status['order_status_id']]['dltid'] : ''; ?>" placeholder="<?php echo $tmdsms_otpmsg_dltid; ?>" id="" class="form-control">
					</div>
				</div>
				<?php } ?>

              </div>

              <div class="tab-pane" id="tab-affiliate">
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-tmdsms_affiliate_approval"><?php echo $entry_affiliate_approval; ?></label>
                  <div class="col-sm-10">
                    <textarea name="tmdsms_affiliate_approval" rows="5" placeholder="<?php echo $entry_affiliate_approval; ?>" id="input-tmdsms_affiliate_approval" class="form-control"><?php echo $tmdsms_affiliate_approval; ?></textarea>
                  </div>
				  <label class="col-sm-2 control-label" for="input-tmdsms_affiliate_approval"><?php echo $entry_dltid; ?></label>
								<div class="col-sm-10">
									<input name="tmdsms_affiliate_approval_dltid" value="<?php echo $tmdsms_affiliate_approval_dltid; ?>" placeholder="<?php echo $entry_dltid; ?>" id="" class="form-control">
								</div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-tmdsms_affiliate_disapproval"><?php echo $entry_affiliate_disapproval; ?></label>
                  <div class="col-sm-10">
                    <textarea name="tmdsms_affiliate_disapproval" rows="5" placeholder="<?php echo $entry_affiliate_disapproval; ?>" id="input-tmdsms_affiliate_disapproval" class="form-control"><?php echo $tmdsms_affiliate_disapproval; ?></textarea>
                  </div>
				  <label class="col-sm-2 control-label" for="input-tmdsms_affiliate_approval"><?php echo $entry_dltid; ?></label>
								<div class="col-sm-10">
									<input name="tmdsms_affiliate_disapproval_dltid" value="<?php echo $tmdsms_affiliate_disapproval_dltid; ?>" placeholder="<?php echo $entry_dltid; ?>" id="" class="form-control">
								</div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-tmdsms_forgotpassword_affiliate"><?php echo $entry_forgot_password; ?></label>
                  <div class="col-sm-10">
                    <textarea name="tmdsms_forgotpassword_affiliate" rows="5" placeholder="<?php echo $entry_forgot_password; ?>" id="input-tmdsms_forgotpassword_affiliate" class="form-control"><?php echo $tmdsms_forgotpassword_affiliate; ?></textarea>
                  </div>
				  <label class="col-sm-2 control-label" for="input-tmdsms_affiliate_approval"><?php echo $entry_dltid; ?></label>
								<div class="col-sm-10">
									<input name="tmdsms_forgotpassword_affiliate_dltid" value="<?php echo $tmdsms_forgotpassword_affiliate_dltid; ?>" placeholder="<?php echo $entry_dltid; ?>" id="" class="form-control">
								</div>
                </div>
              </div>

              <div class="tab-pane" id="tab-admin">

                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-tmdsms_admin_order"><?php echo $entry_order; ?></label>
                  <div class="col-sm-10">
                    <textarea name="tmdsms_admin_order" rows="5" placeholder="<?php echo $entry_order; ?>" id="input-tmdsms_admin_order" class="form-control"><?php echo $tmdsms_admin_order; ?></textarea>
                  </div>
				  <label class="col-sm-2 control-label" for="input-tmdsms_affiliate_approval"><?php echo $entry_dltid; ?></label>
								<div class="col-sm-10">
									<input name="tmdsms_admin_order_dltid" value="<?php echo $tmdsms_admin_order_dltid; ?>" placeholder="<?php echo $entry_dltid; ?>" id="" class="form-control">
								</div>
                </div>

                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-tmdsms_admin_customer"><?php echo $entry_customer; ?></label>
                  <div class="col-sm-10">
                    <textarea name="tmdsms_admin_customer" rows="5" placeholder="<?php echo $entry_customer; ?>" id="input-tmdsms_admin_customer" class="form-control"><?php echo $tmdsms_admin_customer; ?></textarea>
                  </div>
				  <label class="col-sm-2 control-label" for="input-tmdsms_affiliate_approval"><?php echo $entry_dltid; ?></label>
								<div class="col-sm-10">
									<input name="tmdsms_admin_customer_dltid" value="<?php echo $tmdsms_admin_customer_dltid; ?>" placeholder="<?php echo $entry_dltid; ?>" id="" class="form-control">
								</div>
                </div>

                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-tmdsms_admin_affiliate"><?php echo $entry_adminaffiliate; ?></label>
                  <div class="col-sm-10">
                    <textarea name="tmdsms_admin_affiliate" rows="5" placeholder="<?php echo $entry_adminaffiliate; ?>" id="input-tmdsms_admin_affiliate" class="form-control"><?php echo $tmdsms_admin_affiliate; ?></textarea>
                  </div>
				  <label class="col-sm-2 control-label" for="input-tmdsms_affiliate_approval"><?php echo $entry_dltid; ?></label>
								<div class="col-sm-10">
									<input name="tmdsms_admin_affiliate_dltid" value="<?php echo $tmdsms_admin_affiliate_dltid; ?>" placeholder="<?php echo $entry_dltid; ?>" id="" class="form-control">
								</div>
                </div>

              </div>

               <div class="tab-pane" id="tab-otpverify">

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-otpverify"><?php echo $entry_otpverification; ?></label>
                    <div class="col-sm-10">
                      <select name="tmdsms_otpverifystatus" id="input-otpverify" class="form-control">
                        <?php if ($tmdsms_otpverifystatus) { ?>
                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                        <option value="0"><?php echo $text_disabled; ?></option>
                        <?php } else { ?>
                        <option value="1"><?php echo $text_enabled; ?></option>
                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                        <?php } ?>
                      </select>
                    </div>
                  </div>

                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-tmdsms_otpmsg"><?php echo $entry_otpmsg; ?></label>
                  <div class="col-sm-10">
                    <textarea name="tmdsms_otpmsg" rows="5" placeholder="<?php echo $entry_adminaffiliate; ?>" id="input-tmdsms_otpmsg" class="form-control"><?php echo $tmdsms_otpmsg; ?></textarea>
                  </div>
				  <label class="col-sm-2 control-label" for="input-tmdsms_affiliate_approval"><?php echo $entry_dltid; ?></label>
								<div class="col-sm-10">
									<input name="tmdsms_otpmsg_dltid" value="<?php echo $tmdsms_admin_affiliate_dltid; ?>" placeholder="<?php echo $tmdsms_otpmsg_dltid; ?>" id="" class="form-control">
								</div>
                </div>

                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-tmdsms_verifypage"><?php echo $entry_verifypage; ?></label>
                  <div class="col-sm-10">
                    <?php foreach ($languages as $language) { ?>
                    <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                      <input name="tmdsms_otpverify[<?php echo $language['language_id']; ?>][verifypage]" placeholder="<?php echo $entry_verifypage; ?>" value="<?php echo isset($tmdsms_otpverify[$language['language_id']]) ? $tmdsms_otpverify[$language['language_id']]['verifypage'] : ''; ?>" class="form-control"/>
                    </div>
                    <?php } ?>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-mygdpr-title"><?php echo $entry_title; ?></label>
                  <div class="col-sm-10">
                    <?php foreach ($languages as $language) { ?>
                    <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                      <input name="tmdsms_otpverify[<?php echo $language['language_id']; ?>][title]" placeholder="<?php echo $entry_title; ?>" value="<?php echo isset($tmdsms_otpverify[$language['language_id']]) ? $tmdsms_otpverify[$language['language_id']]['title'] : ''; ?>" class="form-control"/>
                    </div>
                    <?php } ?>
                  </div>
                </div>


                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-mygdpr-title"><?php echo $entry_descriptiontop; ?></label>
                  <div class="col-sm-10">
                    <?php foreach ($languages as $language) { ?>
                    <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                      <textarea name="tmdsms_otpverify[<?php echo $language['language_id']; ?>][descriptiontop]" placeholder="<?php echo $entry_descriptiontop; ?>" value="" class="form-control" id="input-destop<?php echo $language['language_id']; ?>"/><?php echo isset($tmdsms_otpverify[$language['language_id']]) ? $tmdsms_otpverify[$language['language_id']]['descriptiontop'] : ''; ?></textarea>
                    </div>
                    <?php } ?>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-mygdpr-title"><?php echo $entry_descriptionbottom; ?></label>
                  <div class="col-sm-10">
                    <?php foreach ($languages as $language) { ?>
                    <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                     <textarea name="tmdsms_otpverify[<?php echo $language['language_id']; ?>][descriptionbottom]" placeholder="<?php echo $entry_descriptionbottom; ?>" class="form-control" id="input-desbottom<?php echo $language['language_id']; ?>"><?php echo isset($tmdsms_otpverify[$language['language_id']]) ? $tmdsms_otpverify[$language['language_id']]['descriptionbottom'] : ''; ?></textarea>
                    </div>
                    <?php } ?>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-mygdpr-title"><?php echo $entry_labelotp; ?></label>
                  <div class="col-sm-10">
                    <?php foreach ($languages as $language) { ?>
                    <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                      <input name="tmdsms_otpverify[<?php echo $language['language_id']; ?>][labelotp]" placeholder="<?php echo $entry_labelotp; ?>" value="<?php echo isset($tmdsms_otpverify[$language['language_id']]) ? $tmdsms_otpverify[$language['language_id']]['labelotp'] : ''; ?>" class="form-control"/>
                    </div>
                    <?php } ?>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-mygdpr-title"><?php echo $entry_btnverify; ?></label>
                  <div class="col-sm-10">
                    <?php foreach ($languages as $language) { ?>
                    <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                      <input name="tmdsms_otpverify[<?php echo $language['language_id']; ?>][btnverify]" placeholder="<?php echo $entry_btnverify; ?>" value="<?php echo isset($tmdsms_otpverify[$language['language_id']]) ? $tmdsms_otpverify[$language['language_id']]['btnverify'] : ''; ?>" class="form-control"/>
                    </div>
                    <?php } ?>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-mygdpr-title"><?php echo $entry_resend; ?></label>
                  <div class="col-sm-10">
                    <?php foreach ($languages as $language) { ?>
                    <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                      <input name="tmdsms_otpverify[<?php echo $language['language_id']; ?>][resendbtn]" placeholder="<?php echo $entry_resend; ?>" value="<?php echo isset($tmdsms_otpverify[$language['language_id']]) ? $tmdsms_otpverify[$language['language_id']]['resendbtn'] : ''; ?>" class="form-control"/>
                    </div>
                    <?php } ?>
                  </div>
                </div>


              </div>

              <div class="tab-pane" id="tab-loginotp">

                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-otpverify"><?php echo $entry_loginbtnstatus; ?></label>
                    <div class="col-sm-10">
                      <select name="tmdsms_loginbtnstatus" id="input-otpverify" class="form-control">
                        <?php if ($tmdsms_loginbtnstatus) { ?>
                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                        <option value="0"><?php echo $text_disabled; ?></option>
                        <?php } else { ?>
                        <option value="1"><?php echo $text_enabled; ?></option>
                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                        <?php } ?>
                      </select>
                    </div>
                  </div>

                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-tmdsms_otpmsg"><?php echo $entry_otpmsg; ?></label>
                    <div class="col-sm-10">
                      <textarea name="tmdsms_loginotpmsg" rows="5" placeholder="<?php echo $entry_adminaffiliate; ?>" id="input-tmdsms_otpmsg" class="form-control"><?php echo $tmdsms_loginotpmsg; ?></textarea>
                    </div>
					<label class="col-sm-2 control-label" for="input-tmdsms_affiliate_approval"><?php echo $entry_dltid; ?></label>
								<div class="col-sm-10">
									<input name="tmdsms_otpmsg_dltid" value="<?php echo $tmdsms_admin_affiliate_dltid; ?>" placeholder="<?php echo $tmdsms_otpmsg_dltid; ?>" id="" class="form-control">
								</div>
                  </div>

                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-mygdpr-title"><?php echo $entry_btntext; ?></label>
                  <div class="col-sm-10">
                    <?php foreach ($languages as $language) { ?>
                    <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                      <input name="tmdsms_loginotp[<?php echo $language['language_id']; ?>][loginbtntext]" placeholder="<?php echo $entry_btntext; ?>" value="<?php echo isset($tmdsms_loginotp[$language['language_id']]) ? $tmdsms_loginotp[$language['language_id']]['loginbtntext'] : ''; ?>" class="form-control"/>
                    </div>
                    <?php } ?>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-mygdpr-title"><?php echo $entry_title; ?></label>
                  <div class="col-sm-10">
                    <?php foreach ($languages as $language) { ?>
                    <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                      <input name="tmdsms_loginotp[<?php echo $language['language_id']; ?>][title]" placeholder="<?php echo $entry_title; ?>" value="<?php echo isset($tmdsms_loginotp[$language['language_id']]) ? $tmdsms_loginotp[$language['language_id']]['title'] : ''; ?>" class="form-control"/>
                    </div>
                    <?php } ?>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-mygdpr-title"><?php echo $entry_label; ?></label>
                  <div class="col-sm-10">
                    <?php foreach ($languages as $language) { ?>
                    <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                      <input name="tmdsms_loginotp[<?php echo $language['language_id']; ?>][label]" placeholder="<?php echo $entry_label; ?>" value="<?php echo isset($tmdsms_loginotp[$language['language_id']]) ? $tmdsms_loginotp[$language['language_id']]['label'] : ''; ?>" class="form-control"/>
                    </div>
                    <?php } ?>
                  </div>
                </div>


                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-mygdpr-title"><?php echo $entry_label2; ?></label>
                  <div class="col-sm-10">
                    <?php foreach ($languages as $language) { ?>
                    <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                      <input name="tmdsms_loginotp[<?php echo $language['language_id']; ?>][label2]" placeholder="<?php echo $entry_label2; ?>" value="<?php echo isset($tmdsms_loginotp[$language['language_id']]) ? $tmdsms_loginotp[$language['language_id']]['label2'] : ''; ?>" class="form-control"/>
                    </div>
                    <?php } ?>
                  </div>
                </div>

                 <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-mygdpr-title"><?php echo $entry_errormsg; ?></label>
                  <div class="col-sm-10">
                    <?php foreach ($languages as $language) { ?>
                    <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                      <input name="tmdsms_loginotp[<?php echo $language['language_id']; ?>][errormsg]" placeholder="<?php echo $entry_errormsg; ?>" value="<?php echo isset($tmdsms_loginotp[$language['language_id']]) ? $tmdsms_loginotp[$language['language_id']]['errormsg'] : ''; ?>" class="form-control"/>
                    </div>
                    <?php } ?>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-mygdpr-title"><?php echo $entry_errornotmatchmsg; ?></label>
                  <div class="col-sm-10">
                    <?php foreach ($languages as $language) { ?>
                    <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                      <input name="tmdsms_loginotp[<?php echo $language['language_id']; ?>][errornotmatch]" placeholder="<?php echo $entry_errornotmatchmsg; ?>" value="<?php echo isset($tmdsms_loginotp[$language['language_id']]) ? $tmdsms_loginotp[$language['language_id']]['errornotmatch'] : ''; ?>" class="form-control"/>
                    </div>
                    <?php } ?>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-mygdpr-title"><?php echo $entry_invalidotpmsg; ?></label>
                  <div class="col-sm-10">
                    <?php foreach ($languages as $language) { ?>
                    <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                      <input name="tmdsms_loginotp[<?php echo $language['language_id']; ?>][invalidotperrormsg]" placeholder="<?php echo $entry_invalidotpmsg; ?>" value="<?php echo isset($tmdsms_loginotp[$language['language_id']]) ? $tmdsms_loginotp[$language['language_id']]['invalidotperrormsg'] : ''; ?>" class="form-control"/>
                    </div>
                    <?php } ?>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-mygdpr-title"><?php echo $entry_submitbtn; ?></label>
                  <div class="col-sm-10">
                    <?php foreach ($languages as $language) { ?>
                    <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                      <input name="tmdsms_loginotp[<?php echo $language['language_id']; ?>][submitbtntext]" placeholder="<?php echo $entry_submitbtn; ?>" value="<?php echo isset($tmdsms_loginotp[$language['language_id']]) ? $tmdsms_loginotp[$language['language_id']]['submitbtntext'] : ''; ?>" class="form-control"/>
                    </div>
                    <?php } ?>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-mygdpr-title"><?php echo $entry_resend; ?></label>
                  <div class="col-sm-10">
                    <?php foreach ($languages as $language) { ?>
                    <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                      <input name="tmdsms_loginotp[<?php echo $language['language_id']; ?>][resendotp]" placeholder="<?php echo $entry_resend; ?>" value="<?php echo isset($tmdsms_loginotp[$language['language_id']]) ? $tmdsms_loginotp[$language['language_id']]['resendotp'] : ''; ?>" class="form-control"/>
                    </div>
                    <?php } ?>
                  </div>
                </div>
				
				<div class="form-group">
				<label class="col-sm-2 control-label" for="input-success"><?php echo $entry_success; ?></label>
				<div class="col-sm-10">
				<?php foreach ($languages as $language) { ?>
				<div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
				<input name="tmdsms_loginotp[<?php echo $language['language_id']; ?>][successmsg]" placeholder="<?php echo $entry_success; ?>" value="<?php echo isset($tmdsms_loginotp[$language['language_id']]) ? $tmdsms_loginotp[$language['language_id']]['successmsg'] : ''; ?>" class="form-control"/>
				</div>
				<?php } ?>
				</div>
				</div>

              </div>

            </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
$('#input-destop<?php echo $language['language_id']; ?>').summernote({height: 300});
<?php } ?>
<?php foreach ($languages as $language) { ?>
$('#input-desbottom<?php echo $language['language_id']; ?>').summernote({
	height: 300
});
<?php } ?>
//--></script>

<?php echo $footer; ?>

<script type="text/javascript"><!--
  $('select[name=\'tmdsms_method\']').on('change', function() {
    if (this.value == '1') {
      $('#datapost').show();
      $('#dataget').hide();
    } else if(this.value == '0'){
      $('#datapost').hide();
      $('#dataget').show();
    }
  });

  $('select[name=\'tmdsms_method\']').trigger('change');
</script>


<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header"><button type="button" class="close" data-dismiss="modal">&times;</button><h3>Shortcuts</h3></div>
       <div class="modal-body">
        <b>Format:-</b></br>
          {message}</br>
         {mobileno}</br>
      </div>
      <div class="modal-body">
        <b>SMS Registration Tab:-</b></br>
        {customername}</br>
        {email}</br>
        {company}</br>
        {address_1}</br>
        {city}</br>
        {telephone}</br>

      </div>
      <div class="modal-body">
        <b>Order Status Tab:-</b></br>
        {customername}</br>
        {telephone}</br>
        {order_id}</br>
        {order_status}</br>
        {order_amount}</br>
      </div>
      <div class="modal-body">
        <b>Affiliate Tab:-</b></br>
        {customername}</br>
        {email} </br>
         {telephone}</br>
      </div>
	  <div class="modal-body">
        <b>Product</b></br>
        {products}= Product information  | product name (select:red) * qty</br>
      </div>
      <div class="modal-body">
        <b>Admin Notify Tab:-</b></br>

      </div>

      <div class="modal-body">
        <b>Registration Forgotten Password:-</b></br>
        {customername}</br>
        {link}</br>
        {email}</br>
         {telephone}</br>
      </div>

      <div class="modal-body">
        <b>Affiliate Forgotten Password:-</b></br>
        {customername}</br>
        {password}</br>
        {email}</br>
         {telephone}</br>
      </div>

    </div>

  </div>
</div>
