<?php
class ControllerModuleUltimateMegaFilter extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/ultimatemegafilter');

		$this->document->setTitle(strip_tags($this->language->get('heading_title')));
		$this->document->addScript('view/javascript/select2/js/select2.js');
		$this->document->addStyle('view/javascript/select2/css/select2.css');
		$this->document->addScript('view/javascript/jquery/jscolor-2.0.4/jscolor.js');
		$this->load->model('setting/setting');
		$this->load->model('tool/image');

		if(($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {			
			$this->model_setting_setting->editSetting('ultimatemegafilter', $this->request->post);
			$layout_ids = $this->request->post['ultimatemegafilter_module']['layout_id'];
			$position = $this->request->post['ultimatemegafilter_module']['position'];
			$sort_order = ($this->request->post['ultimatemegafilter_module']['sort_order']) ? $this->request->post['ultimatemegafilter_module']['sort_order'] : 0;
			$this->db->query("DELETE FROM `".DB_PREFIX."layout_module` WHERE `code` = 'ultimatemegafilter'");
			if(is_array($layout_ids)){
				foreach ($layout_ids as $key => $layout_id) {
					$sql = "INSERT INTO `".DB_PREFIX."layout_module` SET `layout_id` = $layout_id, `code` = 'ultimatemegafilter', `position` = '$position', `sort_order` = $sort_order";
					$this->db->query($sql);
				}
			}
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$sql = "SELECT * FROM `".DB_PREFIX."layout_module` WHERE `code` = 'ultimatemegafilter'";

		$query = $this->db->query($sql);
		$row = $query->row;
		$data['position'] = isset($row['position']) ? $row['position'] : '';
		$data['sort_order'] = isset($row['sort_order']) ? $row['sort_order'] : 0;
		$data['layout_ids'] = array();
		foreach($query->rows as $row){
			$data['layout_ids'][] = $row['layout_id'];
		}

		$data['status'] = $this->config->get('ultimatemegafilter_status');
		$data['token'] = $this->session->data['token'];

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		//-----------------------------------------------------------------------------//
		$data['text_rating'] = $this->language->get('text_rating');
		$data['text_display_star'] = $this->language->get('text_display_star');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_content_top'] = $this->language->get('text_content_top');
		$data['text_content_bottom'] = $this->language->get('text_content_bottom');
		$data['text_column_left'] = $this->language->get('text_column_left');
		$data['text_column_right'] = $this->language->get('text_column_right');
		$data['text_option_mode'] = $this->language->get('text_option_mode');
		$data['text_attribute_mode'] = $this->language->get('text_attribute_mode');
		$data['text_attribute_value_mode'] = $this->language->get('text_attribute_value_mode');
		$data['text_mode_or'] = $this->language->get('text_mode_or');
		$data['text_mode_and'] = $this->language->get('text_mode_and');
		$data['text_attr_group'] = $this->language->get('text_attr_group');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_filter_position'] = $this->language->get('text_filter_position');
		$data['text_product_container'] = $this->language->get('text_product_container');
		$data['text_expanded'] = $this->language->get('text_expanded');
		$data['text_tax'] = $this->language->get('text_tax');
		$data['text_ultimatemegafilter_container'] = $this->language->get('text_ultimatemegafilter_container');
		$data['text_ultimatemegafilter_afterload'] = $this->language->get('text_ultimatemegafilter_afterload');
		$data['text_theme_mega'] = $this->language->get('text_theme_mega');

		$data['text_none'] = $this->language->get('text_none');
		$data['text_price_slider'] = $this->language->get('text_price_slider');
		$data['text_attr_delimeter'] = $this->language->get('text_attr_delimeter');
		$data['text_subcategories'] = $this->language->get('text_subcategories');

		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_categories'] = $this->language->get('text_categories');
		$data['text_tags'] = $this->language->get('text_tags');
		$data['text_instock'] = $this->language->get('text_instock');
		$data['text_checked'] = $this->language->get('text_checked');
		$data['text_visible'] = $this->language->get('text_visible');

		$data['entry_layout'] = $this->language->get('entry_layout');
		$data['entry_position'] = $this->language->get('entry_position');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_apply'] = $this->language->get('button_apply');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_module_add'] = $this->language->get('button_module_add');
		$data['button_remove'] = $this->language->get('button_remove');
		$data['button_create'] = $this->language->get('button_create');


		/**Get Product Options**/
		$this->load->model('catalog/option');

		$total_options = $this->model_catalog_option->getTotalOptions();
		$data['options'] = $this->model_catalog_option->getOptions(array('start' => 0, 'limit' => $total_options));
		foreach($data['options'] as $i => $option) {
			if(!in_array($option['type'], array('radio', 'checkbox', 'select', 'image'))) {
				unset($data['options'][$i]);
			}
		}

		/**Get Product Attributes**/
		$this->load->model('catalog/attribute');		
		$total_attributes = $this->model_catalog_attribute->getTotalAttributes();
		$page = 1;
		$limit = 20;
		$data['attributes'] = $this->model_catalog_attribute->getAttributes(array('start' => 0, 'limit' => $limit));
		
		$pagination = new Pagination();
		$pagination->total = $total_attributes;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('module/ultimatemegafilter/getAttributes', 'token=' . $this->session->data['token'] .'&page={page}', 'SSL');
		$data['page'] = $page+1;
		$data['attr_pagination'] = $pagination->render();

		$data['attr_results'] = sprintf($this->language->get('text_pagination'), ($total_attributes) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($total_attributes - $limit)) ? $total_attributes : ((($page - 1) * $limit) + $limit), $total_attributes, ceil($total_attributes / $limit));
		
		/**Get Product Filters**/
		$this->load->model('catalog/filter');		
		$total_filter_groups = $this->model_catalog_filter->getTotalFilterGroups();
		$data['filter_groups'] = $this->model_catalog_filter->getFilterGroups(array('start' => 0, 'limit' => $total_filter_groups));

		if(isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if(isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if(isset($this->session->data['error'])) {
			$data['error'] = $this->session->data['error'];
			unset($this->session->data['error']);
		} else {
			$data['error'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/ultimatemegafilter', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$data['action'] = $this->url->link('module/ultimatemegafilter', 'token=' . $this->session->data['token'], 'SSL');
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$data['modules'] = array();

		$this->load->model('design/layout');

		$data['layouts'] = $this->model_design_layout->getLayouts();
		$data['container_layouts'] = $data['layouts'];

		$cat_layout = false;
		foreach($data['layouts'] as $i => $layout) {
			if($layout['layout_id'] == 3) {
				$cat_layout = $i;
				break;
			}
		}
		if($cat_layout) {
			$temp = $data['layouts'][$cat_layout];
			$data['layouts'][$cat_layout] = $data['layouts'][0];
			$data['layouts'][0] = $temp;
			unset($data['container_layouts'][$cat_layout]);
		}

		if(VERSION == '1.5.0') {
			$modules = array();
			if(!is_null($this->config->get('ultimatemegafilter_module'))) {
				$modules = explode(',', $this->config->get('ultimatemegafilter_module'));
			}
			foreach($modules as $module) {
				$data['modules'][] = array('layout_id' => $this->config->get('ultimatemegafilter_' . $module . '_layout_id'),
												 'position' => $this->config->get('ultimatemegafilter_' . $module . '_position'),
												 'status' => $this->config->get('ultimatemegafilter_' . $module . '_status'),
												 'sort_order' => $this->config->get('ultimatemegafilter_' . $module . '_sort_order')
				);
			}
			$data['setting'] = unserialize($this->config->get('ultimatemegafilter_setting'));
		} else {
			if(isset($this->request->post['ultimatemegafilter_module']) || isset($this->request->post['ultimatemegafilter_setting'])) {
				$data['modules'] = $this->request->post['ultimatemegafilter_module'];
				$data['setting'] = $this->request->post['ultimatemegafilter_setting'];
			} elseif($this->config->get('ultimatemegafilter_module') || $this->config->get('ultimatemegafilter_setting')) {
				$data['modules'] = $this->config->get('ultimatemegafilter_module');
				$data['setting'] = $this->config->get('ultimatemegafilter_setting');
			}
		}		
		if (!isset($data['setting']['ultimatemegafilter_container'])) {
			$data['setting']['ultimatemegafilter_container'] = ".product-{view}";
		}
		if (!isset($data['setting']['ultimatemegafilter_afterload'])) {
			$data['setting']['ultimatemegafilter_afterload'] = "";
		}

		$data['display_categories'][] = array('value' => 'checkbox', 'name' => $this->language->get('text_display_checkbox'));

		$data['display_stocks'][] = array('value' => 'checkbox', 'name' => $this->language->get('text_display_checkbox'));
		$data['display_stocks'][] = array('value' => 'radio', 'name' => $this->language->get('text_display_radio'));

		$data['display_options'][] = array('value' => 'checkbox', 'name' => $this->language->get('text_display_checkbox'));
		/*$data['display_options'][] = array('value' => 'none', 'name' => $this->language->get('text_display_none'));*/
		$data['display_options'][] = array('value' => 'select', 'name' => $this->language->get('text_display_select'));
		$data['display_options'][] = array('value' => 'radio', 'name' => $this->language->get('text_display_radio'));
		$data['display_options'][] = array('value' => 'image', 'name' => $this->language->get('text_display_image'));

		$data['display_rating'][] = array('value' => 'star', 'name' => $this->language->get('text_display_star'));		$data['display_rating'][] = array('value' => 'checkbox', 'name' => $this->language->get('text_display_checkbox'));		$data['display_rating'][] = array('value' => 'radio', 'name' => $this->language->get('text_display_radio'));		$data['display_rating'][] = array('value' => 'select', 'name' => $this->language->get('text_display_select'));

		$data['display_options_attr'] = $data['display_options'];
		$data['display_options_attr'][] = array('value' => 'slider', 'name' => $this->language->get('text_display_slider'));

		// Categories
		$this->load->model('catalog/category');

		if (isset($data['setting']['filter_category'])) {
			$categories = $data['setting']['filter_category'];			
		} else {
			$categories = array();
		}

		$data['filter_categories'] = array();

		foreach ($categories as $category_id) {
			$category_info = $this->model_catalog_category->getCategory($category_id);

			if ($category_info) {
				$data['filter_categories'][] = array(
					'category_id' => $category_info['category_id'],
					'name'        => ($category_info['path'] ? $category_info['path'] . ' &gt; ' : '') . $category_info['name']
				);
			}
		}

		$data['categories'] = $this->model_catalog_category->getCategories('');

		//Payment Methods
		$this->load->model('extension/extension');
		$data['payment_methods'] = array();
		$extensions = $this->model_extension_extension->getInstalled('payment');		
		foreach ($extensions as $code) {
			if ($this->config->get($code . '_status')) {
				$this->language->load('payment/' . $code);
				$data['payment_methods'][$code] = $this->language->get('heading_title');
			}
		}

		//Shipping Methods		
		$data['shipping_methods'] = array();
		$extensions = $this->model_extension_extension->getInstalled('shipping');		
		foreach ($extensions as $code) {
			if ($this->config->get($code . '_status')) {
				$this->language->load('shipping/' . $code);
				$data['shipping_methods'][$code] = $this->language->get('heading_title');
			}
		}

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/ultimatemegafilter.tpl', $data));
	}

	function getAttributes(){
		$this->load->language('module/ultimatemegafilter');
		/**Get Product Attributes**/
		// Categories
		$data['display_options'][] = array('value' => 'checkbox', 'name' => $this->language->get('text_display_checkbox'));
		/*$data['display_options'][] = array('value' => 'none', 'name' => $this->language->get('text_display_none'));*/
		$data['display_options'][] = array('value' => 'select', 'name' => $this->language->get('text_display_select'));
		$data['display_options'][] = array('value' => 'radio', 'name' => $this->language->get('text_display_radio'));
		$data['display_options'][] = array('value' => 'image', 'name' => $this->language->get('text_display_image'));
		$data['display_options_attr'] = $data['display_options'];
		$data['display_options_attr'][] = array('value' => 'slider', 'name' => $this->language->get('text_display_slider'));

		$this->load->model('catalog/category');
		$data['modules'] = $this->config->get('ultimatemegafilter_module');
		$data['setting'] = $this->config->get('ultimatemegafilter_setting');
		$data['categories'] = $this->model_catalog_category->getCategories('');

		$this->load->model('catalog/attribute');		
		$total_attributes = $this->model_catalog_attribute->getTotalAttributes();
		$page = isset($this->request->get['page']) ? $this->request->get['page'] : 1;
		$limit = 20;
		$data['attributes'] = $this->model_catalog_attribute->getAttributes(array('start' => ($page - 1) * $limit, 'limit' => $limit));
		
		$pagination = new Pagination();
		$pagination->total = $total_attributes;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('module/ultimatemegafilter/getAttributes', 'token=' . $this->session->data['token'] .'&page={page}', 'SSL');

		$rdata['pagination'] = $pagination->render();

		$data['attr_results'] = sprintf($this->language->get('text_pagination'), ($total_attributes) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($total_attributes - $limit)) ? $total_attributes : ((($page - 1) * $limit) + $limit), $total_attributes, ceil($total_attributes / $limit));
		$rdata['html'] = $this->load->view('module/ultimatemegafilter_attr.tpl', $data);
		if($rdata['html']){
			$rdata['page'] = $page+1;
		}
		$this->response->setOutput(json_encode($rdata));
	}

	public function install() {

		$store_id = (int)$this->config->get('config_store_id');
		$query = $this->db->query("SELECT `layout_id` FROM `" . DB_PREFIX . "layout_route` WHERE store_id='" . $store_id . "' AND route='product/filter'");
		if($query->num_rows) {
			$layout_id = $query->row['layout_id'];
		} else {
			$this->load->model('design/layout');

			$this->model_design_layout->addLayout(array('name' => 'UltimateMegaFilter',
													   'layout_route' => array(0 => array('store_id' => $store_id, 'route' => 'product/filter'))));
		}
		$index_tables = array(
		  'product' => array('product_id', 'manufacturer_id'),
		  'manufacturer' => array('manufacturer_id'),
		  'product_filter' => array('product_id', 'filter_id'),
		  'product_description' => array('product_id'),
		  'product_to_store' => array('product_id'),
		  'product_to_category' => array('product_id', 'category_id'),
		  'product_attribute' => array('product_id', 'attribute_id'),
		  'product_special'	=> array('product_id'),
		  'filter' => array('filter_id', 'filter_group_id'),
		  'category' => array('category_id'),
		  'category_description' => array('category_id'),
			'product_option_value' => array('option_value_id', 'product_id')
		);
		foreach($index_tables as $table => $indexes) {
			$query = $this->db->query("SHOW INDEX FROM `" . DB_PREFIX . $table . "`");

			$keys = array();
			foreach($query->rows as $row) {
				if($row['Key_name'] != 'PRIMARY') {
					$keys[] = $row['Column_name'];
				}
			}
			$keys = array_diff($indexes, $keys);
			foreach($keys as $key) {
				$this->db->query("ALTER TABLE `" . DB_PREFIX . $table . "` ADD INDEX ( `" . $key . "` )");
			}
		}
		$this->db->query("ALTER TABLE `" . DB_PREFIX . "product` ADD `product_payment` VARCHAR(255) NULL DEFAULT NULL AFTER `model`");
		$this->db->query("ALTER TABLE `" . DB_PREFIX . "product` ADD `product_shipping` VARCHAR(255) NULL DEFAULT NULL AFTER `model`");
		$this->db->query("ALTER TABLE `" . DB_PREFIX . "filter`  ADD `image` TEXT NULL DEFAULT NULL AFTER `filter_group_id`");
	}
	function uninstall(){
		$this->db->query("ALTER TABLE `" . DB_PREFIX . "product` DROP `product_payment`;");
		$this->db->query("ALTER TABLE `" . DB_PREFIX . "product` DROP `product_shipping`;");
		$this->db->query("ALTER TABLE `" . DB_PREFIX . "filter` DROP `image`;");
	}

	private function validate() {
		if(!$this->user->hasPermission('modify', 'module/ultimatemegafilter')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if(!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	public function getProducts(){
		$this->load->model('module/ultimatemegafilter');

		$category_id = $this->request->get['category_id'];
		$data = array(
			'filter_category_id' => $category_id,
		);		
		$results = $this->model_module_ultimatemegafilter->getProducts($data);

		echo json_encode($results);
	}

	public function saveProductPayment(){
		if(isset($this->request->post['product_ids'], $this->request->post['pp_payment_method'])){
			$product_ids = $this->request->post['product_ids'];
			$payment_method = $this->request->post['pp_payment_method'];
			foreach ($product_ids as $product_id) {
				$sql = "UPDATE `".DB_PREFIX."product` SET `product_payment` = '$payment_method' WHERE `product_id` = $product_id";
				$this->db->query($sql);
			}
		}
	}

	public function saveProductShipping(){
		if(isset($this->request->post['product_ids'], $this->request->post['ps_shipping_method'])){
			$product_ids = $this->request->post['product_ids'];
			$shipping_method = $this->request->post['ps_shipping_method'];
			foreach ($product_ids as $product_id) {
				$sql = "UPDATE `".DB_PREFIX."product` SET `product_shipping` = '$shipping_method' WHERE `product_id` = $product_id";
				$this->db->query($sql);
			}
		}
	}

	public function getFilters(){
		$this->load->model('module/ultimatemegafilter');
		$filter_group_id = $this->request->get['filter_group_id'];
		$filters = $this->model_module_ultimatemegafilter->getFilterDescriptions($filter_group_id);
		$json['filters'] = $filters;
		$this->response->setOutput(json_encode($json));
	}

	public function saveFilters(){
		$filter_group_id = $this->request->get['filter_group_id'];
		$filters = $this->request->post['image'];
		if($filters){
			foreach ($filters as $filter_id => $image) {
				$this->db->query("UPDATE `".DB_PREFIX."filter` SET `image` = '".$image."' WHERE `filter_id` = '".(int)$filter_id."' AND `filter_group_id` = '".(int)$filter_group_id."'");
			}
		}
		$this->response->setOutput(json_encode(array('status' => true)));
	}
}

?>