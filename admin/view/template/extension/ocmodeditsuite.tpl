<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button onclick="hbSave('<?php echo html_entity_decode($link_update);?>');" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn btn-info" data-original-title="<?php echo $button_update; ?>"><i class="fa fa-refresh"></i></button>
        <button onclick="hbSave('<?php echo html_entity_decode($link_save);?>');" data-toggle="tooltip" title="<?php echo $button_save_and_return; ?>" class="btn btn-primary" data-original-title="<?php echo $button_save_and_return; ?>"><i class="fa fa-save"></i></button>
        <a href="<?php echo $link_abandon; ?>" data-toggle="tooltip" title="<?php echo $button_abandon; ?>" class="btn btn-default" data-original-title="<?php echo $button_abandon; ?>"><i class="fa fa-reply"></i></a>
        <a href="<?php echo $link_beer; ?>" data-toggle="tooltip" title="<?php echo $button_beer; ?>" class="btn btn-default hb_check_save" data-original-title="<?php echo $button_beer; ?>" target="_blank"><i class="fa fa fa-beer"></i></a>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid hb_errors">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>

    <div class="panel panel-default" style="border: none; box-shadow: none; -webkit-box-shadow: none; -moz-box-shadow: none;">

        <div class="well">
          <form method="POST" action="" name="hb_save_form" id="hb_save_form">
            <div class="row">
              <div class="col-sm-4">
                <div class="form-group">
                  <label class="control-label" for="hb_mod_name"><?php echo $entry_hb_mod_name; ?></label>
                  <input type="text" name="name" value="<?php echo $hb_mod_name; ?>" placeholder="<?php echo $placeholder_hb_mod_name;?>" id="hb_mod_name" class="form-control" autocomplete="off">
                </div>
                <div class="form-group">
                  <label class="control-label" for="hb_mod_version"><?php echo $entry_hb_mod_version; ?></label>
                  <input type="text" name="version" value="<?php echo $hb_mod_version; ?>" placeholder="<?php echo $placeholder_hb_mod_version;?>" id="hb_mod_version" class="form-control" autocomplete="off">
                </div>
              </div>
              <div class="col-sm-4">
                <div class="form-group">
                  <label class="control-label" for="hb_mod_author"><?php echo $entry_hb_mod_author; ?></label>
                  <input type="text" name="author" value="<?php echo $hb_mod_author; ?>" placeholder="<?php echo $placeholder_hb_mod_author;?>" id="hb_mod_author" class="form-control" autocomplete="off">
                </div>
                <div class="form-group">
                  <label class="control-label" for="hb_mod_link"><?php echo $entry_hb_mod_link; ?></label>
                  <input type="text" name="link" value="<?php echo $hb_mod_link; ?>" placeholder="<?php echo $placeholder_hb_mod_link;?>" id="hb_mod_link" class="form-control" autocomplete="off">
                </div>
              </div>
              <div class="col-sm-4">
                <div class="form-group">
                  <label class="control-label" for="code"><?php echo $entry_hb_mod_code; ?></label>
                  <input type="text" name="code" value="<?php echo $hb_mod_code; ?>" placeholder="<?php echo $placeholder_hb_mod_code;?>" id="hb_mod_code" class="form-control" autocomplete="off">
                </div>
                <div class="form-group">
                  <label class="control-label" for="hb_mod_status"><?php echo $entry_hb_mod_status; ?></label>
                  <select name="status" id="hb_mod_status" class="form-control">
                    <option value="1"<?php if ($hb_mod_status == 1){echo " selected";}?>>Enabled</option>
                    <option value="0"<?php if ($hb_mod_status == 0){echo " selected";}?>>Disabled</option>
                  </select>
                </div>
              </div>
            </div>
            <div>
              <label class="control-label" for="hb_mod_description"><?php echo $entry_hb_mod_description; ?></label>
              <textarea name="hb_mod_description" id="hb_mod_description" class="form-control"></textarea>
            </div>
            <textarea name="xml" id="hb_textarea" style="display:none;" data-updater="<?php echo $link_updater; ?>"></textarea>
            <input type="hidden" name="modification_id" value="<?php echo $hb_modification_id?>">
          </form>
        </div><!-- well -->

        <div id="hb_mods">
        </div>

      <div class="pull-right">
        <button onclick="hbSave('<?php echo html_entity_decode($link_update);?>');" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn btn-info" data-original-title="<?php echo $button_update; ?>"><i class="fa fa-refresh"></i></button>
        <button onclick="hbSave('<?php echo html_entity_decode($link_save);?>');" data-toggle="tooltip" title="<?php echo $button_save_and_return; ?>" class="btn btn-primary" data-original-title="<?php echo $button_save_and_return; ?>"><i class="fa fa-save"></i></button>
        <a href="<?php echo $link_abandon; ?>" data-toggle="tooltip" title="<?php echo $button_abandon; ?>" class="btn btn-default" data-original-title="<?php echo $button_abandon; ?>"><i class="fa fa-reply"></i></a>
        <a href="<?php echo $link_beer; ?>" data-toggle="tooltip" title="<?php echo $button_beer; ?>" class="btn btn-default hb_check_save" data-original-title="<?php echo $button_beer; ?>" targer="_blank"><i class="fa fa fa-beer"></i></a>
      </div>



        <!-- <pre class="" id="hb_editor" style="height:500px;"><?php //echo htmlentities($hb_mod_xml); ?></pre> -->

    </div>

  </div>
</div>
<?php 
$color_head = '#1e91cf';//'rgba(34, 121, 168, 0.77)';
$color_mid = 'rgba(81, 81, 81, 1)';//'rgba(69, 157, 205, 0.7)';
$color_body = '#f5f5f5';
$color_delete = 'rgba(253, 31, 31, 0.74)';
$color_divider = '#e8e8e8';

?>
<style type="text/css">

div#hb_mods{
  /*background-color: #f5f5f5;*/
  background-color: <?echo $color_head; ?>;
  /*border: 1px solid #e3e3e3;*/
  border-radius: 3px;
  /*-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);*/
  /*box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);*/
  border-top-left-radius: 3px;
  border-top-right-radius: 3px;
}
table.hb_file{
  width:100%;
  border-bottom: 45px solid white;
  table-layout:fixed; 
}
table.hb_file:last-child{
  border-bottom:none;
  margin-bottom:10px;
}
table.hb_file button{width:auto;}
table.hb_file td:nth-child(1),
table.hb_file th:nth-child(1) {
  width: 11em;
}
table.hb_file td:nth-child(2),
table.hb_file th:nth-child(2) {
  /*width: 100%;*/
}
table.hb_file td:nth-child(3),
table.hb_file th:nth-child(3) {
  width: 7.6em;
  /*text-align:right;*/
}
table.hb_file td, table.hb_file th{
  padding:10px;
}

thead.hb_file_head{
}

thead.hb_file_head span[data-toggle="tooltip"]:after, 
thead.hb_file_head span[data-toggle="tooltip"],
thead.hb_file_head th:nth-child(1)
{color: rgb(63, 63, 63);}

table.hb_collapsed thead.hb_file_head {
  border-bottom: 5px solid <?php echo $color_body; ?>;
}
tbody.hb_operation{
  border-bottom:5px solid white;
  background-color: <?php echo $color_body; ?>;
}
tbody.hb_operation:last-child{
  border-bottom:none;
}
tfoot.hb_links, {
  text-align: right;
}

tfoot.hb_links button{
  display:inline;
  width:auto;
  float: right;
  margin-left:5px;
}

tbody.hb_operation:nth-child(even){
}

table.hb_file td:nth-child(3),
table.hb_file th:nth-child(3),
{
  text-align: right;
}

tbody.hb_operation:last-child tr:last-child{
  display:none;
}
tbody.hb_operation tr:nth-last-child(2){
  vertical-align: top;
}


tbody.hb_operation tr:last-child {
  text-align: right;
  border-top:5px solid white;  
  background-color:<?php echo $color_mid;?>;
}
tbody.hb_operation tr:last-child td button{
  float: right;
}

.hb_narrow_input{
  width:80px;
  display:inline-block;
}

.hb_field_info{
  padding-left:20px;
  font-style:italic;
}

.hb_collapse{
  display: inline;
  padding-right: 8px;
  cursor: pointer;
}

/*.hb_file.hb_collapsed thead th:not(:last-child){opacity: 0.5;}*/
.hb_file.hb_collapsed tbody {display:none;}
.hb_file.hb_collapsed button:nth-child(2){display:none;}
.hb_file.hb_collapsed tfoot.hb_links{border-bottom:15px solid white;}

.hb_file.hb_delete_file thead th:not(:last-child){opacity: 0.7; pointer-events: none;}
.hb_file.hb_delete_file thead {background: <?php echo $color_delete; ?>;}
.hb_file.hb_delete_file tbody {display:none;}
.hb_file.hb_delete_file button:nth-child(2){display:none;}
.hb_file.hb_delete_file tfoot.hb_links{border-bottom:15px solid white;}

/*.hb_operation.hb_collapsed tr:first-child td:not(:last-child){}*/
.hb_operation.hb_collapsed tr:not(:first-child){display:none;}
.hb_operation.hb_collapsed:last-child tr:last-child, :not(.hb_operation:last-child tr:last-child){display:table-row;}
.hb_operation.hb_collapsed {border-bottom:3px solid <?php echo $color_divider; ?>;}
.hb_operation.hb_collapsed:last-child{border-bottom:none;}
.hb_file_protect{display:none;}
.hb_operation.hb_delete_operation tr:first-child td:not(:last-child){opacity: 0.7; pointer-events: none;}
.hb_operation.hb_delete_operation tr:first-child {background: <?php echo $color_delete; ?>;}
.hb_operation.hb_delete_operation tr:not(:first-child) {display:none;}
.hb_operation.hb_delete_operation:last-child tr:last-child, :not(.hb_operation:last-child tr:last-child){display:table-row;}
.hb_operation.hb_delete_operation {border-bottom:3px solid <?php echo $color_divider; ?>;}

.hb_collapse:before {content: "\f151";}
.hb_collapsed .hb_collapse:before {content: "\f150";}

</style>

<link rel="stylesheet" href="view/javascript/codemirror/codemirror.css">
<script src="view/javascript/codemirror/codemirror.js"></script>
<script src="view/javascript/codemirror/xml.js"></script>
<script type="text/javascript"><!--
  function hbSave(url){
    $('.CodeMirror').each(function(i, el){
      el.CodeMirror.save();
    });
    var xml = hbMakexml();
    //fix it
    $("#hb_textarea").val("<?php echo '<?xml version=\\"1.0\\" encoding=\\"utf-8\\"?>';?>\n"+xml.replace(/&amp;/g, "&").replace(/&lt;/g, "<").replace(/&gt;/g, ">"));
    //test it's valid xml
    try {
        $.parseXML( $("#hb_textarea").val() );
    }
    catch(e){ 
        alert('Cannot save. One of you operations conatins data that will compile an invalid XML file. Check your browser\'s console log for details.');
        console.log(e);
        return false;
    }
    //post it
    $("#hb_save_form").attr('action',url).submit();
  }
//--></script> 
<script type="text/javascript"><!--
 $( document ).ready(function() {
  <?php if(isset($hb_mod_xml)){ ?>
    hbDoxml($.parseXML(<?php echo $hb_mod_xml; ?>));
  <?php }else{ ?>
    $.ajax({
      type: "GET",
      url: "<?php echo html_entity_decode($link_xml); ?>",
      dataType: "xml",
      success: function(xml) {hbDoxml(xml); },
      error: function(error){alert('<?php echo $hb_retrieve_error; ?>');window.location.href = "<?php echo html_entity_decode($link_abandon); ?>";}
    });
  <?php } ?>
    $.getScript( "<?php echo $hb_mod_updater; ?>");
  }); 

  function hbDoxml(hb_xml){
    if ( $(hb_xml).find("modification").length > 1 ){ //more than one mod if the xml - this will never, EVER happen as it breaks OC (and the server!) - oops.
      var hb_html = '<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $hb_mod_number_error; ?> <button type="button" class="close" data-dismiss="alert">&times;</button> </div>'
      $(".hb_errors").prepend(hb_html);
    }

    var description = $(hb_xml).find('description').html();
    $("#hb_mod_description").val(description)

    $(hb_xml).find("file").each(function(){
      var hb_protect = $(hb_xml).find
      var hb_table = hbCreatefile(this.attributes);
      
      $(this).find("operation").each(function(n){
        var operation = hbCreateoperation(hb_table, this);
      });
    });  
  }
  

  function hbCreatefile(attributes, pos){
    var hb_path = '';
    var hb_prot = false;

    if(attributes){
      var hb_path = (attributes.getNamedItem('path')||false)?attributes.getNamedItem('path').value : '' ;
      var hb_prot = (attributes.getNamedItem('protect')||false)?attributes.getNamedItem('protect').value : false ;
    }
    var n = $(".hb_file").length;
    var hb_class = 'hb_file'+ ((hb_prot||false)?' hb_file_protect':'');
    var hb_table = $("<table>", {class: hb_class, id: "hb_file_" + n });
    var hb_thead = $("<thead>", {id: 'hb_thead' + n, class: 'hb_file_head' }).append('<tr><th><label class="col-sm-2 control-label"><div class="hb_collapse fa" onclick="$(\'#hb_file_' + n + '\').toggleClass(\'hb_collapsed\');"></div><span data-toggle="tooltip" title="" data-original-title="<?php echo $hb_tooltip_path; ?>">Path:</span></label></th><th> <input type="text" placeholder="admin/view/template/catalog/example.php" id="hb_file_' + n + '_path" value="' + hb_path + '\" class="form-control" onclick="$(\'#hb_file_' + n + '\').removeClass(\'hb_collapsed\');"/></th><th><button class="form-control" onclick="$(\'#hb_file_' + n + '\').hasClass(\'hb_delete_file\') ? $(this).html(\'Delete\') : $(this).html(\'Undelete\') ; if( $(\'#hb_file_' + n + '\').hasClass(\'hb_delete_file\') ) $(\'#hb_file_' + n + '\').removeClass(\'hb_collapsed\'); $(\'#hb_file_' + n + '\').toggleClass(\'hb_delete_file\');">Delete</button></th></tr>');
    var hb_tfoot = $("<tfoot>", {id: 'hb_tfoot' + n, class:'hb_links' }).append('<tr> <td></td> <td colspan="2"><button class="form-control" onclick="hbCreateoperation(hbCreatefile(null,$(this).closest(\'.hb_file\').index(\'.hb_file\') + 1) );">New File</button><button class="form-control" onclick="hbCreateoperation( $(\'#hb_file_' + n + '\'),null, $(\'#hb_file_' + n + ' .hb_operation\').length ); ">+ Operation</button></td></tr>');

    //build it
    $(hb_table).append(hb_thead).append(hb_tfoot);

    //append to page
    (pos || false) ? $(".hb_file:nth-child("+pos+")").after(hb_table) : $("#hb_mods").append(hb_table);
    if(pos) $('html, body').animate({scrollTop: $('#hb_file_' + n).offset().top - 100 }, 1000);

    //return container for operations
    return hb_table;
  }

  function hbCreateoperation(table, obj, pos){ 

    var n = $(table).children(".hb_operation").length;

    var hb_file  = table[0].id;
    var hb_after = ( pos || n ) + $(table).children(':not(.hb_operation)').length;

    var hb_search           = $(obj).find("search").html()        || '' ;
    var hb_index            = $(obj).find("search").attr('index') || '' ;
    var hb_trim_search      = $(obj).find("search").attr('trim')  || '' ;
    var hb_regex            = $(obj).find("search").attr('regex') || '' ;
    var hb_limit            = $(obj).find("search").attr('limit') || '' ;
    var hb_offset           = $(obj).find("add").attr('offset')   || '0' ;
    var hb_trim_add         = $(obj).find("add").attr('trim')     || '' ;
    var hb_add              = $(obj).find("add").html()           || '' ;
    var hb_action           = $(obj).find("add").attr('position') || '' ;
    var hb_notes            = $(obj).find("notes").html()   || '' ;
    
    var hb_toggle           = ' class="hb_regex_toggle"' + ( hb_regex ? ' style="display:none;"' : '' );
    var hb_toggle_i         = ' class="hb_regex_toggle"' + ( hb_regex ? '' : ' style="display:none;"' );
    var hb_before_selected  = hb_action.toLowerCase() == 'before' ? ' selected="selected"' : ''; 
    var hb_replace_selected = hb_action.toLowerCase() == 'replace'? ' selected="selected"' : '';
    var hb_after_selected   = hb_action.toLowerCase() == 'after'  ? ' selected="selected"' : '';

    //build it
    html  = '<tbody class="hb_operation" id="'+hb_file+'_operation_' + n + '">';
    html += '<tr> <td><label class="col-sm-2 control-label"><div class="hb_collapse fa" onclick="$(\'#'+hb_file+'_operation_' + n + '\').toggleClass(\'hb_collapsed\');"></div><span data-toggle="tooltip" title="" data-original-title="<?php echo $hb_tooltip_search; ?>">Search:</span></label></td> <td><input type="text" id="'+hb_file+'_operation_' + n + '_search" value="'+ htmlEscape(hb_search) + '" class="form-control"></td> <td><button class="form-control" onclick="$(\'#'+hb_file+'_operation_' + n + '\').hasClass(\'hb_delete_operation\') ? $(this).html(\'Remove\') : $(this).html(\'Reinstate\') ; if( $(\'#'+hb_file+'_operation_' + n + '\').hasClass(\'hb_delete_operation\') ) $(\'#'+hb_file+'_operation_' + n + '\').removeClass(\'hb_collapsed\'); $(\'#'+hb_file+'_operation_' + n + '\').toggleClass(\'hb_delete_operation\');">Remove</button></td></tr>';
    html += '<tr> <td><label class="col-sm-2 control-label"><span data-toggle="tooltip" title="" data-original-title="<?php echo $hb_tooltip_regex; ?>">Regex:</span></label></td> <td colspan="2"><input type="checkbox" id="'+hb_file+'_operation_' + n + '_regex" onclick="$(\'#'+hb_file+'_operation_' + n + ' .hb_regex_toggle\').toggle();" class="form-control"></td> </tr>';
    html += '<tr' + hb_toggle + '> <td><label class="col-sm-2 control-label"><span data-toggle="tooltip" title="" data-original-title="<?php echo $hb_tooltip_trim_search; ?>">Trim Search:</span></label></td> <td colspan="2"><input type="checkbox" id="'+hb_file+'_operation_' + n + '_trim_search" value ="'+ htmlEscape(hb_trim_search) +'" class="form-control"></td> </tr>';
    html += '<tr'+ hb_toggle + '> <td><label class="col-sm-2 control-label"><span data-toggle="tooltip" title="" data-original-title="<?php echo $hb_tooltip_action; ?>">Action:</span></label></td> <td colspan="2">';
    html += '  <select id="'+hb_file+'_operation_' + n + '_action">';
    html += '    <option value="before"' + hb_before_selected + '>Add before</option>';
    html += '    <option value="replace"' + hb_replace_selected + '>Replace</option>';
    html += '    <option value="after"' + hb_after_selected + '>Add after</option>';
    html += '  </select>'; 
    html += '</td> </tr>';
    html += '<tr> <td><label class="col-sm-2 control-label"><span data-toggle="tooltip" title="" data-original-title="<?php echo $hb_tooltip_index; ?>">Index:</span></label></td> <td colspan="2"><input type="text" id="'+hb_file+'_operation_' + n + '_index" value ="'+ htmlEscape(hb_index) +'" class="form-control hb_narrow_input"><span class="hb_field_info"><?php echo $hb_text_index; ?></span></td> </tr>';
    html += '<tr' + hb_toggle_i + '> <td><label class="col-sm-2 control-label"><span data-toggle="tooltip" title="" data-original-title="<?php echo $hb_tooltip_limit; ?>">Limit:</span></label></td> <td colspan="2"><input type="text"id="'+hb_file+'_operation_' + n + '_limit" value="'+ htmlEscape(hb_limit) + '" class="form-control hb_narrow_input"><span class="hb_field_info"><?php echo $hb_text_limit; ?></span></td> </tr>';
    html += '<tr> <td><label class="col-sm-2 control-label"><span data-toggle="tooltip" title="" data-original-title="<?php echo $hb_tooltip_offset; ?>">Offset:</span></label></td> <td colspan="2"><input type="text" id="'+hb_file+'_operation_' + n + '_offset" value ="'+ htmlEscape(hb_offset) +'" class="form-control hb_narrow_input"><span class="hb_field_info"><?php echo $hb_text_offset; ?></span></td> </tr>';
    html += '<tr> <td><label class="col-sm-2 control-label"><span data-toggle="tooltip" title="" data-original-title="<?php echo $hb_tooltip_trim_add; ?>">Trim Add:</span></label></td> <td colspan="2"><input type="checkbox" id="'+hb_file+'_operation_' + n + '_trim_add" value ="'+ htmlEscape(hb_trim_add) +'" class="form-control"></td> </tr>';
    html += '<tr> <td><label class="col-sm-2 control-label"><span data-toggle="tooltip" title="" data-original-title="<?php echo $hb_tooltip_notes; ?>">Notes:</span></label></td> <td colspan="2"><input type="text" id="'+hb_file+'_operation_' + n + '_notes" value ="'+ htmlEscape(hb_notes) +'" placeholder="<?php echo $placeholder_hb_operation_notes; ?>" class="form-control"></td> </tr>';
    html += '<tr> <td><label class="col-sm-2 control-label"><span data-toggle="tooltip" title="" data-original-title="<?php echo $hb_tooltip_replace; ?>">Replace:</span></label></td> <td colspan="2"><textarea id="'+hb_file+'_operation_' + n + '_add" class="form-control" rows="9">' + htmlEscape(hb_add) + '</textarea></td> </tr>';
    html += '<tr> <td></td><td colspan="2"><button class="form-control" onclick="hbCreateoperation( $(\'#'+ hb_file +'\'),null, $(this).closest(\'.hb_operation\').index(\'#'+ hb_file +' .hb_operation\') + 1 );">Add another</button></td> </tr>';
    html += '</tbody>';
    
    $(table).children(':nth-child('+hb_after+')').after(html);
    if(pos) {
      $('html, body').animate({scrollTop: $('#'+hb_file+'_operation_' + n).offset().top - 100 }, 1000);
    }

    var myTextArea = $('#'+hb_file+'_operation_' + n + '_add')[0];    
    var myCodeMirror = CodeMirror.fromTextArea(myTextArea);

  }

  function htmlEscape(str) {
      return String(str).replace("<![CDATA[","").replace("]]>","").replace(/&/g, '&amp;').replace(/"/g, '&quot;').replace(/'/g, '&#39;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
  }
//--></script> 
<script type="text/javascript"><!--
    // function hbRegexfields(elem){
    //   $(elem+" .hb_regex_toggle").toggle();
    // }
//--></script> 
<script type="text/javascript"><!--

function hbMakexml(){
  //set up mod vars
  var hb_name        = $("#hb_mod_name").val();
  var hb_version     = $("#hb_mod_version").val();
  var hb_author      = $("#hb_mod_author").val();
  var hb_code        = $("#hb_mod_code").val();
  var hb_description = $("#hb_mod_description").val();

  //create mod container
  var hb_xml = $("<modification>");

  //append mod info
  $(hb_xml).append("\n\t").append( $("<name>",{text:hb_name}) );
  $(hb_xml).append("\n\t").append( $("<version>",{text:hb_version}) );
  $(hb_xml).append("\n\t").append( $("<author>",{text:hb_author}) );
  $(hb_xml).append("\n\t").append( $("<code>",{text:hb_code}) );
  $(hb_xml).append("\n\t").append( $("<description>",{text:hb_description}) );
  $(hb_xml).append("\n\n");

  //add files
  $(".hb_file").each(function(){
    $(hb_xml).append("\t").append( hbMakefile(this) ).append("\n\n");
  });

  //stick it in a temporary textarea to read out of (div is vunerable to xss?)
  return $("<textarea />").append(hb_xml).html();
}

function hbMakefile(obj){
  //skip if delete selected or prot enable
  if ( $("#"+obj.id).hasClass("hb_delete_file") && !$("#"+obj.id).hasClass("hb_file_protect" ) ) return '';

  var operations = $("#"+obj.id+" .hb_operation");
  var path = $("#"+obj.id+"_path").val();
  var hb_file = $("<file>",{ path:path });

  $(operations).each(function(){
    $(hb_file).append("\n\t\t").append(hbMakeoperation(this)).append("\n\t");
  });

  return hb_file;

}

function hbMakeoperation(obj){
  var elem = "#"+obj.id;
  // skip if delete checked
  if ( $(elem).hasClass("hb_delete_operation") ) return '';

  //search vars
  var index = $(elem+"_index").val();
  var trim_search = $(elem+"_trim_search").is(':checked');
  var regex = $(elem+"_regex").is(':checked');
  var limit = $(elem+"_limit").val();
  var search = "<![CDATA["+$(elem+"_search").val()+"]]>";

  //add vars
  var action = $(elem+"_action").val();
  var offset = $(elem+"_offset").val();
  var trim_add = $(elem+"_trim_add").is(':checked');
  var add = "<![CDATA["+$(elem+"_add").val()+"]]>";
  
  //other vars
  var notes = $(elem+"_notes").val();

  var hb_search = $("<search />", {text:search}).attr({ 'index':index, 'regex':regex });
  var hb_add = $("<add />",{text:add}).attr({ offset:offset, trim:trim_add });
  var hb_notes = $("<notes />",{text:notes});

  if(!regex){
    hb_search.attr({trim:trim_search});
    hb_add.attr({position:action});
  }else{
    hb_search.attr({'limit':limit});
  }

  return $("<operation>").append("\n\t\t\t").append(hb_notes).append("\n\t\t\t").append(hb_search).append("\n\t\t\t").append(hb_add).append("\n\t\t");
}
  
//--></script> 

<?php echo $footer; ?>