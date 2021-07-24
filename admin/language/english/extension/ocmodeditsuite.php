<?php
// Heading
$_['heading_title']          = 'OCMOD Edit Suite';
$_['text_modifications']     = 'Modifications';

// Text
$_['text_error']           = 'Error: That link didn\'t look right!';
$_['text_clear']          = 'Modification cache has been cleared.';
$_['text_update']         = 'Changes saved. Modification cache has been rebuilt.';
$_['text_save']           = 'Modification Saved.';
$_['hb_text_index']       = 'Number instance of search string to be modified. If set, only this instance will be replaced. Comma separate a list of indexes. Leave blank for all.';
$_['hb_text_index']       = 'Instance of search string. Only this instance will be replaced. Comma separate multiple. Blank for all.';
$_['hb_text_offset']      = 'Offset code injection by this many lines.';
$_['hb_text_limit']       = 'How many instances of search string to be modified. Leave blank for all.';

// Entry
$_['entry_hb_mod_name']         = 'Modification Name';
$_['entry_hb_mod_version']      = 'Version';
$_['entry_hb_mod_author']       = 'Author';
$_['entry_hb_mod_code']         = 'Code';
$_['entry_hb_mod_status']       = 'Status';
$_['entry_hb_mod_link']         = 'Link';
$_['entry_hb_mod_description']  = 'Description';

// Placeholder
$_['placeholder_hb_mod_name']        = 'Modification Name';
$_['placeholder_hb_mod_version']     = '0.0.1';
$_['placeholder_hb_mod_author']      = 'Author\'s name';
$_['placeholder_hb_mod_code']        = 'some_unique_mod_code';
$_['placeholder_hb_mod_link']        = 'http://www.yoursite.com';
$_['placeholder_hb_operation_notes'] = 'What does this operation do?';

//tooltips

$_['hb_tooltip_path'] = 'Path to the file you wish to modify';
$_['hb_tooltip_search'] = 'String to search for in file';
$_['hb_tooltip_regex'] = 'Search using regex';
$_['hb_tooltip_limit'] = 'Positive Integer';
$_['hb_tooltip_action'] = 'Do what with string';
$_['hb_tooltip_offset'] = 'Number of lines';
$_['hb_tooltip_index'] = 'Comma separated';
$_['hb_tooltip_trim_search'] = 'Trim whitespace from search';
$_['hb_tooltip_trim_add'] = 'Trim whitespace from injection';
$_['hb_tooltip_replace'] = 'Code to be injected';
$_['hb_tooltip_notes'] = 'Has no effect on modification.';


// button
$_['button_update']                 = 'Save and rebuild';
$_['button_save_and_return']        = 'Save and return';
$_['button_abandon']                = 'Canel';
$_['button_beer']                   = 'Beer';

// Help

// Error
$_['hb_retrieve_error']          = 'There was an error retrieving your XML file. Possibly the XML was not properly formed.';
$_['warning_save_fail']          = 'Warning: Something went wrong - plugin did not save!';
$_['warning_load_fail']          = 'That OCMOD does not exist - perhaps it was deleted?';
$_['warning_save_refresh_fail']  = 'Warning: Something went wrong - plugin may not have saved or refreshed!';
$_['hb_mod_number_error']        = 'Warning: The XML for this OCMOD contains more than one modification node. Upon saving, these modifications will be compiled into one and subsequently will only be attributed to one name, author, version, link and code. This will have no effect on the overall function of the OCMOD.';
$_['error_permission']            = 'You do not have permission to modify OCMODs';