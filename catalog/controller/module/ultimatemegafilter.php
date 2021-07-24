<?php
class ControllerModuleUltimateMegaFilter extends Controller {
	private $k = 1;

	public function index($setting) {
			$this->language->load('module/ultimatemegafilter');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['text_price_range'] = $this->language->get('text_price_range');
			$data['text_manufacturers'] = $this->language->get('text_manufacturers');
			$data['text_tags'] = $this->language->get('text_tags');
			$data['text_categories'] = $this->language->get('text_categories');
			$data['text_attributes'] = $this->language->get('text_attributes');
			$data['text_all'] = $this->language->get('text_all');
			$data['clear_filter'] = $this->language->get('clear_filter');
			$data['text_instock'] = $this->language->get('text_instock');
			$data['text_rating']	= $this->language->get('text_rating');
			$data['heading_title'] = $this->language->get('heading_title');
			$data['pds_sku'] = $this->language->get('pds_sku');
			$data['pds_upc'] = $this->language->get('pds_upc');
			$data['pds_location'] = $this->language->get('pds_location');
			$data['pds_model'] = $this->language->get('pds_model');
			$data['pds_brand'] = $this->language->get('pds_brand');
			$data['pds_stock'] = $this->language->get('pds_stock');
			$data['symbol_right'] = $this->currency->getSymbolRight();
			$data['symbol_left'] = $this->currency->getSymbolLeft();
			
			$data['quick_view'] = $this->language->get('quick_view');

			$data['setting'] = $setting;			
			$ultimatemegafilter_setting = $this->config->get('ultimatemegafilter_setting');

			$ultimatemegafilter_module = $this->config->get('ultimatemegafilter_module');
			$data['ultimatemegafilter_module_position']=isset($ultimatemegafilter_module['position']) ? $ultimatemegafilter_module['position'] : 0 ;

			$data['header_bg_color']  = isset($ultimatemegafilter_setting['header_bg_color']) ? $ultimatemegafilter_setting['header_bg_color'] : 'eaeaea';
			$data['header_fg_color']  = isset($ultimatemegafilter_setting['header_fg_color']) ? $ultimatemegafilter_setting['header_fg_color'] : '666';
			$data['header_br_color']  = isset($ultimatemegafilter_setting['header_br_color']) ? $ultimatemegafilter_setting['header_br_color'] : 'ccc';
			$data['counter_bg_color'] = isset($ultimatemegafilter_setting['counter_bg_color']) ? $ultimatemegafilter_setting['counter_bg_color'] : '428BCA';
			$data['counter_fg_color'] = isset($ultimatemegafilter_setting['counter_fg_color']) ? $ultimatemegafilter_setting['counter_fg_color'] : 'fff';
			$data['widget_br_color'] = isset($ultimatemegafilter_setting['widget_br_color']) ? $ultimatemegafilter_setting['widget_br_color'] : 'ddd';
			$data['font_family'] = isset($ultimatemegafilter_setting['font_family']) ? $ultimatemegafilter_setting['font_family'] : '';
			$data['custom_css'] = isset($ultimatemegafilter_setting['custom_css']) ? $ultimatemegafilter_setting['custom_css'] : '';

			$data['scroll_height'] = isset($ultimatemegafilter_setting['scroll_height']) ? $ultimatemegafilter_setting['scroll_height'] : '';
			$data['scroll_status'] = isset($ultimatemegafilter_setting['scroll_status']) ? $ultimatemegafilter_setting['scroll_status'] : '';

			$image_size_width = isset($ultimatemegafilter_setting['image_size_width']) ? $ultimatemegafilter_setting['image_size_width'] : 20;
			$image_size_height = isset($ultimatemegafilter_setting['image_size_height']) ? $ultimatemegafilter_setting['image_size_height'] : 20;

			if(!empty($ultimatemegafilter_setting['filter_category']) && isset($this->request->get['path'])){
				$categories = explode('_', $this->request->get['path']);
				$last_category_id = array_pop($categories);				
				if(in_array($last_category_id, $ultimatemegafilter_setting['filter_category'])){
					return false;
				}
			}			

			$data['page'] = (isset($this->request->get['page']) && $this->request->get['page']) ? $this->request->get['page'] : 1;

			$special = isset($this->request->get['route']) && $this->request->get['route'] == 'product/special';

			$category_id = false;
			$data['path'] = '';
			if(isset($this->request->get['path'])) {
				$data['path'] = $this->request->get['path'];
				$parts = explode('_', (string)$this->request->get['path']);
				$category_id = array_pop($parts);
			}

			$manufacturer_id = false;
			if(isset($this->request->get['manufacturer_id'])) {
				$manufacturer_id = $this->request->get['manufacturer_id'];
				$filter_data = array(
					'filter_manufacturer_id' => $this->request->get['manufacturer_id']
				);
			} else {
				$filter_data = array(
					'filter_category_id' => $category_id,
					'filter_sub_category' => isset($ultimatemegafilter_setting['subcategories']),
				);
			}
			

			$this->load->model('catalog/product');
			$product_total = $this->model_catalog_product->getTotalProducts($filter_data);			
			if($product_total < 2) {
				return;
			}				

			$data['category_id'] = $category_id;

			$filter_data = array('category_id' => $category_id, 'manufacturer_id' => $manufacturer_id, 'special' => $special,);

			$this->load->model('module/ultimatemegafilter');

			$data['manufacturers'] = false;
			if(isset($this->request->get['manufacturer_id'])) {
				$data['manufacturer_id'] = $this->request->get['manufacturer_id'];
			} else {
				$categories_manufacturer = isset($ultimatemegafilter_setting['category_manufacturer']) ? $ultimatemegafilter_setting['category_manufacturer'] : array();
				$category_manufacturer = in_array($category_id, $categories_manufacturer) ? false : true;
				if($ultimatemegafilter_setting['status_manufacturer'] && $category_manufacturer) {
					$data['manufacturers'] = $this->model_module_ultimatemegafilter->getManufacturers($filter_data);
					$data['display_manufacturer'] = $ultimatemegafilter_setting['display_manufacturer'];
					$data['expanded_manufacturer'] = isset($ultimatemegafilter_setting['expanded_manufacturer']) ? 1 : 0;
					$data['isearch_manufacturer'] = isset($ultimatemegafilter_setting['isearch_manufacturer']) ? $ultimatemegafilter_setting['isearch_manufacturer'] : 0;
					$data['manufacturer_sort_order'] = isset($ultimatemegafilter_setting['manufacturer_sort_order']) ? $ultimatemegafilter_setting['manufacturer_sort_order'] : 0;
				}
			}	

			/*Rating Filter Option*/
			$data['ratings'] = array();
			$categories_rating = isset($ultimatemegafilter_setting['category_rrating']) ? $ultimatemegafilter_setting['category_rrating'] : array();
			$categories_rating = in_array($category_id, $categories_rating) ? false : true;
			if(isset($ultimatemegafilter_setting['status_rrating']) && $ultimatemegafilter_setting['status_rrating'] && $categories_rating) {
				$data['ratings'] = $this->model_module_ultimatemegafilter->getRatings($filter_data);
				$data['display_rrating'] = $ultimatemegafilter_setting['display_rrating'];
				$data['expanded_rrating'] = isset($ultimatemegafilter_setting['expanded_rrating']) ? 1 : 0;
				$data['rrating_sort_order'] = isset($ultimatemegafilter_setting['rrating_sort_order']) ? $ultimatemegafilter_setting['rrating_sort_order'] : 0;
			}
			/*End*/

			$data['options'] = array();
			$this->model_module_ultimatemegafilter->getOptions($filter_data, $data['options']);
			$this->load->model('tool/image');			
			
			$data['tags'] = array();			

			$data['categories'] = false;
			$categories_categories = isset($ultimatemegafilter_setting['category_categories']) ? $ultimatemegafilter_setting['category_categories'] : array();
			$category_categories = in_array($category_id, $categories_categories) ? false : true;
			if($ultimatemegafilter_setting['status_categories'] && $category_categories) {
				$data['categories'] = $this->model_module_ultimatemegafilter->getSubCategories($filter_data);
				$data['expanded_categories'] = isset($ultimatemegafilter_setting['expanded_categories']) ? 1 : 0;
				$data['isearch_categories'] = isset($ultimatemegafilter_setting['isearch_categories']) ? $ultimatemegafilter_setting['isearch_categories'] : 0;
				$data['categories_sort_order'] = isset($ultimatemegafilter_setting['categories_sort_order']) ? $ultimatemegafilter_setting['categories_sort_order'] : 0;
			}
			
			$data['attributes_new'] = $this->model_module_ultimatemegafilter->getAttributes($filter_data);
			
			//Product Filters
			$data['filters'] = array();
			$this->model_module_ultimatemegafilter->getFilters($filter_data, $data['filters']);			

			//Product Stock Status
			$data['stocks_status'] = array();
			$data['stock_status_status'] = isset($ultimatemegafilter_setting['status_stock_status']) ? $ultimatemegafilter_setting['status_stock_status'] : 0;
			$categories_status_status = isset($ultimatemegafilter_setting['category_stock_status']) ? $ultimatemegafilter_setting['category_stock_status'] : array();
			$category_status_status = in_array($category_id, $categories_status_status) ? false : true;
			if($data['stock_status_status'] && $category_status_status)
			$this->model_module_ultimatemegafilter->getStocksStatus($filter_data, $data['stocks_status']);

			$data['stock_status_isearch'] = isset($ultimatemegafilter_setting['isearch_stock_status']) ? $ultimatemegafilter_setting['isearch_stock_status'] : 0;
			$data['stock_status_expanded'] = isset($ultimatemegafilter_setting['expanded_stock_status']) ? $ultimatemegafilter_setting['expanded_stock_status'] : 0;
			$data['pstock_status_display'] = isset($ultimatemegafilter_setting['display_stock_status']) ? $ultimatemegafilter_setting['display_pmethod'] : 0;
			$data['stock_status_sort_order'] = isset($ultimatemegafilter_setting['stock_status_sort_order']) ? $ultimatemegafilter_setting['stock_status_sort_order'] : 0;

			//Payment Methods
			$this->load->model('extension/extension');
			$data['payment_methods'] = array();
			$extensions = $this->model_extension_extension->getExtensions('payment');		
			foreach ($extensions as $extension) {				
				$pcode = $extension['code'];
				if ($this->config->get($pcode . '_status')) {
					$this->language->load('payment/' . $pcode);
					/**Hide Payment Method by status and category by Ashvin Patel 16july2016**/					
					$categories_attribute = isset($ultimatemegafilter_setting['category_pmethod_' . $pcode]) ? $ultimatemegafilter_setting['category_pmethod_' . $pcode] : array();
					$category_attribute = in_array($category_id, $categories_attribute) ? false : true;
					/**End**/
					if($category_attribute) {
						$data['payment_methods'][$pcode]['code'] = $pcode;
						$data['payment_methods'][$pcode]['name'] = $this->language->get('text_title');
						$data['payment_methods'][$pcode]['sort_order'] = isset($ultimatemegafilter_setting['sort_order_pmethod_' . $pcode]) ? $ultimatemegafilter_setting['sort_order_pmethod_' . $pcode] : 0;
						$sort_order_pmethod[$pcode] = isset($ultimatemegafilter_setting['sort_order_pmethod_' . $pcode]) ? $ultimatemegafilter_setting['sort_order_pmethod_' . $pcode] : 0;
					}else{
						unset($data['payment_methods'][$pcode]);			
					}
				}
			}

			$data['pmethod_isearch'] = isset($ultimatemegafilter_setting['isearch_pmethod']) ? $ultimatemegafilter_setting['isearch_pmethod'] : 0;
			$data['pmethod_expanded'] = isset($ultimatemegafilter_setting['expanded_pmethod']) ? $ultimatemegafilter_setting['expanded_pmethod'] : 0;
			$data['pmethod_display'] = isset($ultimatemegafilter_setting['display_pmethod']) ? $ultimatemegafilter_setting['display_pmethod'] : 0;
			$data['pmethod_status'] = isset($ultimatemegafilter_setting['status_pmethod']) ? $ultimatemegafilter_setting['status_pmethod'] : 0;
			$data['pmethod_sort_order'] = isset($ultimatemegafilter_setting['pmethod_sort_order']) ? $ultimatemegafilter_setting['pmethod_sort_order'] : 0;

			if($data['payment_methods']){
				array_multisort($sort_order_pmethod, SORT_ASC, $data['payment_methods']);
			}

			//Shipping Methods			
			$data['shipping_methods'] = array();
			$extensions = $this->model_extension_extension->getExtensions('shipping');		
			foreach ($extensions as $extension) {				
				$scode = $extension['code'];
				if ($this->config->get($scode . '_status')) {
					$this->language->load('shipping/' . $scode);
					/**Hide Shipping Method by status and category by Ashvin Patel 21july2016**/					
					$categories_attribute = isset($ultimatemegafilter_setting['category_smethod_' . $scode]) ? $ultimatemegafilter_setting['category_smethod_' . $scode] : array();
					$category_attribute = in_array($category_id, $categories_attribute) ? false : true;
					/**End**/
					if($category_attribute) {
						$data['shipping_methods'][$scode]['code'] = $scode;
						$data['shipping_methods'][$scode]['name'] = $this->language->get('text_title');
						$data['shipping_methods'][$scode]['sort_order'] = isset($ultimatemegafilter_setting['sort_order_smethod_' . $scode]) ? $ultimatemegafilter_setting['sort_order_smethod_' . $scode] : 0;
						$sort_order_smethod[$scode] = isset($ultimatemegafilter_setting['sort_order_smethod_' . $scode]) ? $ultimatemegafilter_setting['sort_order_smethod_' . $scode] : 0;
					}else{
						unset($data['shipping_methods'][$scode]);			
					}
				}
			}

			$data['smethod_isearch'] = isset($ultimatemegafilter_setting['isearch_smethod']) ? $ultimatemegafilter_setting['isearch_smethod'] : 0;
			$data['smethod_expanded'] = isset($ultimatemegafilter_setting['expanded_smethod']) ? $ultimatemegafilter_setting['expanded_smethod'] : 0;
			$data['smethod_display'] = isset($ultimatemegafilter_setting['display_smethod']) ? $ultimatemegafilter_setting['display_smethod'] : 0;
			$data['smethod_status'] = isset($ultimatemegafilter_setting['status_smethod']) ? $ultimatemegafilter_setting['status_smethod'] : 0;
			$data['smethod_sort_order'] = isset($ultimatemegafilter_setting['smethod_sort_order']) ? $ultimatemegafilter_setting['smethod_sort_order'] : 0;

			if($data['shipping_methods']){
				array_multisort($sort_order_smethod, SORT_ASC, $data['shipping_methods']);
			}	

			$data['price_slider'] = $ultimatemegafilter_setting['price_slider'];

			$categories_price = isset($ultimatemegafilter_setting['category_price']) ? $ultimatemegafilter_setting['category_price'] : array();
			$category_price = in_array($category_id, $categories_price) ? false : true;
			$data['price_slider'] = ($category_price) ? $data['price_slider'] : 0;

			$data['expanded_price'] = isset($ultimatemegafilter_setting['expanded_price']) ? 1 : 0;
			$data['price_sort_order'] = isset($ultimatemegafilter_setting['price_sort_order']) ? $ultimatemegafilter_setting['price_sort_order'] : 0;
			$data['attr_group'] = $ultimatemegafilter_setting['attr_group'];

			$data['instock_checked'] = isset($ultimatemegafilter_setting['instock_checked']) ? 1 : 0;
			$data['instock_visible'] = (isset($ultimatemegafilter_setting['instock_visible']) && $ultimatemegafilter_setting['instock_visible']) ? 1 : 0;
			$data['expanded_instock'] = isset($ultimatemegafilter_setting['expanded_instock']) ? 1 : 0;

			$categories_instock = isset($ultimatemegafilter_setting['category_instock']) ? $ultimatemegafilter_setting['category_instock'] : array();
			$category_instock = in_array($category_id, $categories_instock) ? false : true;
			$data['instock_visible'] = ($category_instock) ? $data['instock_visible'] : 0;
			$data['instock_sort_order'] = isset($ultimatemegafilter_setting['instock_sort_order']) ? $ultimatemegafilter_setting['instock_sort_order'] : 0;
			
			if($data['options'] || $data['manufacturers'] || $data['attributes_new'] || $data['price_slider']) {
				$this->document->addScript('catalog/view/javascript/jquery/jquery.tmpl.min.js');
				$this->document->addScript('catalog/view/javascript/jquery/jquery.deserialize.min.js');
				$this->document->addScript('catalog/view/javascript/jquery/jquery.loadmask.min.js');
				$this->document->addScript('catalog/view/javascript/jquery/umf/ui/jquery-ui.min.js');
				$this->document->addScript('catalog/view/javascript/jquery/umf/jquery.slimscroll.js');
				$this->document->addScript('catalog/view/javascript/ultimatemegafilter.min.js');
				$this->document->addStyle('catalog/view/javascript/jquery/umf/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css');
				$this->document->addStyle('catalog/view/theme/default/stylesheet/ultimatemegafilter-mega.css');				
				$this->document->addStyle('catalog/view/theme/default/stylesheet/jquery.loadmask.css');
				if($this->config->get('config_template') == 'shoppica2') {
					$this->document->addStyle('catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css');
				}
			}

			$data['ultimatemegafilter_container'] = $ultimatemegafilter_setting['ultimatemegafilter_container'];
			$data['ultimatemegafilter_afterload'] = html_entity_decode($ultimatemegafilter_setting['ultimatemegafilter_afterload'], ENT_QUOTES, 'UTF-8');

			//echo $data['ultimatemegafilter_module_position'];die;
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/ultimatemegafilter.tpl')){
				if($data['ultimatemegafilter_module_position']=='content_top' || $data['ultimatemegafilter_module_position']=='content_bottom'){
					return $this->load->view($this->config->get('config_template') . '/template/module/ultimatemegafiltertop.tpl', $data);
				}else{
					return $this->load->view($this->config->get('config_template') . '/template/module/ultimatemegafilter.tpl', $data);	
				}
			} else {
				if($data['ultimatemegafilter_module_position']=='content_top' || $data['ultimatemegafilter_module_position']=='content_bottom'){
					return $this->load->view('extension/module/ultimatemegafiltertop.tpl', $data);
				}else{
					return $this->load->view('extension/module/ultimatemegafilter.tpl', $data);
				}
			}
	}

	private function array_clean(array $array) {
		foreach($array as $key => $value) {
			if(is_array($value)) {
				$array[$key] = $this->array_clean($value);
				if(!count($array[$key])) {
					unset($array[$key]);
				}
			} elseif(is_string($value)) {
				$value = trim($value);
				if(!$value) {
					unset($array[$key]);
				}
			}
		}
		return $array;
	}

	public function getProducts() {
		$this->language->load('module/ultimatemegafilter');
		if(VERSION == '1.5.0') {
			$ultimatemegafilter_setting = unserialize($this->config->get('ultimatemegafilter_setting'));
		} else {
			$ultimatemegafilter_setting = $this->config->get('ultimatemegafilter_setting');
		}
		if((float)$ultimatemegafilter_setting['tax'] > 0) {
			$this->k = 1 + (float)$ultimatemegafilter_setting['tax'] / 100;
		}
		$page = 1;
		if(isset($this->request->post['page'])) {
			$page = (int)$this->request->post['page'];
		}
		if(isset($this->request->post['sort'])) {
			$sort = $this->request->post['sort'];
		} else {
			$sort = 'p.sort_order';
		}
		if(isset($this->request->post['order'])) {
			$order = $this->request->post['order'];
		} else {
			$order = 'ASC';
		}
		if(isset($this->request->post['limit'])) {
			$limit = $this->request->post['limit'];
		} else {
			if($this->config->get('config_product_limit')){
				$limit = $this->config->get('config_product_limit');
			}else{
				$limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
			}
		}

		$this->load->model('module/ultimatemegafilter');
		$this->load->model('catalog/product');
		$this->load->model('tool/image');

		$manufacturer = false;
		if(isset($this->request->post['manufacturer'])) {
			$manufacturer = $this->array_clean($this->request->post['manufacturer']);
			if(!count($manufacturer)) {
				$manufacturer = false;
			}
		}
		$manufacturer_id = false;
		if(isset($this->request->post['manufacturer_id'])) {
			$manufacturer_id = $this->request->post['manufacturer_id'];
			$manufacturer = array($manufacturer_id);
		}

		/*Rating filter*/
		$rrating = false;
		if(isset($this->request->post['rrating'])) {
			$rrating = $this->array_clean($this->request->post['rrating']);
			if(!count($rrating)) {
				$rrating = false;
			}
		} 

		$option_value = array();
		if(isset($this->request->post['option_value'])) {
			$option_value = $this->array_clean($this->request->post['option_value']);
			if(!count($option_value)) {
				$option_value = false;
			}
		}

		/**Product Filter By Ashvin Patel 20july2016**/
		$filter_value = array();
		if(isset($this->request->post['filter_value'])) {
			$filter_value = $this->array_clean($this->request->post['filter_value']);
			if(!count($filter_value)) {
				$filter_value = false;
			}
		}
		/**End**/

		$attribute_value = array();
		if(isset($this->request->post['attribute_value'])) {
			$attribute_value = $this->array_clean($this->request->post['attribute_value']);
			if(!count($attribute_value)) {
				$attribute_value = array();
			}
		}

		$instock = false;
		if(isset($this->request->post['instock'])) {
			$instock = true;
		}

		$filter_name = false;
		if(isset($this->request->post['search'])) {
			$filter_name = $this->request->post['search'];			
		}

		$filter_tag = false;
		if(isset($this->request->post['search'])) {
			$filter_tag = $this->request->post['search'];			
		}

		$filter_description = false;
		if(isset($this->request->post['search'], $this->request->post['description'])) {
			$filter_description = $this->request->post['search'];			
		}

		$tags = false;
		/*if(isset($this->request->post['tags'])) {
			$tags = $this->array_clean($this->request->post['tags']);
			if(!count($tags)) {
				$tags = false;
			}
		}*/

		$categories = false;
		if(isset($this->request->post['categories'])) {
			$categories = $this->array_clean($this->request->post['categories']);
			if(!count($categories)) {
				$categories = false;
			}
		}

		$category_id = 0;
		if(isset($this->request->post['category_id'])) {
			$category_id = $this->request->post['category_id'];
		}
		if(!$categories && $category_id) {
			$categories = array($category_id);
		}

		/**Payment Method Filter By Ashvin Patel 16july2016**/
		$payment_methods = false;
		if(isset($this->request->post['pmethod_value'])) {
			$payment_methods = $this->array_clean($this->request->post['pmethod_value']);
			if(!count($payment_methods)) {
				$payment_methods = false;
			}
		}
		/**End**/

		/**Shipping Method Filter By Ashvin Patel 21july2016**/
		$shipping_methods = false;
		if(isset($this->request->post['smethod_value'])) {
			$shipping_methods = $this->array_clean($this->request->post['smethod_value']);
			if(!count($shipping_methods)) {
				$shipping_methods = false;
			}
		}
		/**End**/

		/**Stock Status Filter By Ashvin Patel 28july2016**/
		$stock_status = false;
		if(isset($this->request->post['stock_status'])) {
			$stock_status = $this->array_clean($this->request->post['stock_status']);
			if(!count($stock_status)) {
				$stock_status = false;
			}
		}

		/**End**/
		$attr_slider = isset($this->request->post['attr_slider']) ? $this->request->post['attr_slider'] : false;

		$special = isset($this->request->post['route']) && $this->request->post['route'] == 'product/special';

		$f_attributes = isset($this->request->post['attributes']) ? $this->request->post['attributes'] : false;

		$stock_status_ids = isset($this->request->post['stock_status_ids']) ? $this->request->post['stock_status_ids'] : false;

		$data = array(
			'instock' => $instock,
			'stock_status' => $stock_status,
			'option_value' => $option_value,
			'filter_value' => $filter_value,
			'manufacturer' => $manufacturer,
			'attribute_value' => $attribute_value,
			'f_attributes' => $f_attributes,
			'rrating'	   => $rrating,
			'stock_status_ids' => $stock_status_ids,
			'filter_name'	=> $filter_name,
			'filter_tag'	=> $filter_tag,
			'filter_description' => $filter_description,
			'tags' => $tags,
			'categories' => $categories,
			'ccategory_id' => $category_id,
			'category_id' => $category_id,
			'payment_methods' => $payment_methods,
			'shipping_methods' => $shipping_methods,
			'attr_slider' => $attr_slider,
			'special' => $special,
			'min_price' => $this->request->post['min_price'] / $this->k,
			'max_price' => $this->request->post['max_price'] / $this->k,
			'start' => ($page - 1) * $limit,
			'limit' => $limit,
			'sort' => $sort,
			'order' => $order
		);

		$results = array();
		$this->model_module_ultimatemegafilter->getProducts($data, $results);			
		$min_price = false;
		$max_price = false;

		$priceLimits = $this->model_module_ultimatemegafilter->getPriceLimits($data);
		$min_price = $priceLimits['min_price'];
		$max_price = $priceLimits['max_price'];
		
		$this->request->get['path'] = isset($this->request->post['path']) ? $this->request->post['path'] : '';

		$product_total;
		$this->model_module_ultimatemegafilter->getTotalProducts($data, $product_total);
		$pagination = new Pagination();
		$pagination->total = $product_total;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&page={page}');

		$pagination = $pagination->render();
		
		$start = ($product_total) ? (($page - 1) * $limit) + 1 : 0;
		$end = ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit);
		$pages = ceil($product_total / $limit);
		$pagination_results = sprintf($this->language->get('text_pagination'), $start, $end, $product_total, $pages);

		$min_price = $this->currency->convert($min_price * $this->k, $this->config->get('config_currency'), $this->currency->getCode());
		$max_price = $this->currency->convert($max_price * $this->k, $this->config->get('config_currency'), $this->currency->getCode());

		$result_html;
		$this->getHtmlProducts($results, $product_total, $result_html);

		$json = json_encode(array(
		                    'result_html' => $result_html, 
		                    'min_price' => $min_price, 
		                    'max_price' => $max_price, 
		                    'pagination' => $pagination,
		                    'result'	=> $pagination_results,
		                    'allow_pag' => true,
								 				)
											);
		$this->response->setOutput($json);
	}

	public function getProductsTotal() {
		$this->language->load('module/ultimatemegafilter');
		if(VERSION == '1.5.0') {
			$ultimatemegafilter_setting = unserialize($this->config->get('ultimatemegafilter_setting'));
		} else {
			$ultimatemegafilter_setting = $this->config->get('ultimatemegafilter_setting');
		}
		if((float)$ultimatemegafilter_setting['tax'] > 0) {
			$this->k = 1 + (float)$ultimatemegafilter_setting['tax'] / 100;
		}
		$page = 1;
		if(isset($this->request->post['page'])) {
			$page = (int)$this->request->post['page'];
		}
		if(isset($this->request->post['sort'])) {
			$sort = $this->request->post['sort'];
		} else {
			$sort = 'p.sort_order';
		}
		if(isset($this->request->post['order'])) {
			$order = $this->request->post['order'];
		} else {
			$order = 'ASC';
		}
		if(isset($this->request->post['limit'])) {
			$limit = $this->request->post['limit'];
		} else {
			if($this->config->get('config_product_limit')){
				$limit = $this->config->get('config_product_limit');
			}else{
				$limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
			}
		}

		$this->load->model('module/ultimatemegafilter');
		$this->load->model('catalog/product');
		$this->load->model('tool/image');

		$manufacturer = false;
		if(isset($this->request->post['manufacturer'])) {
			$manufacturer = $this->array_clean($this->request->post['manufacturer']);
			if(!count($manufacturer)) {
				$manufacturer = false;
			}
		}
		$manufacturer_id = false;
		if(isset($this->request->post['manufacturer_id'])) {
			$manufacturer_id = $this->request->post['manufacturer_id'];
			$manufacturer = array($manufacturer_id);
		}

		/*Rating filter*/
		$rrating = false;
		if(isset($this->request->post['rrating'])) {
			$rrating = $this->array_clean($this->request->post['rrating']);
			if(!count($rrating)) {
				$rrating = false;
			}
		}

		$option_value = array();
		if(isset($this->request->post['option_value'])) {
			$option_value = $this->array_clean($this->request->post['option_value']);
			if(!count($option_value)) {
				$option_value = false;
			}
		}

		/**Product Filter By Ashvin Patel 20july2016**/
		$filter_value = array();
		if(isset($this->request->post['filter_value'])) {
			$filter_value = $this->array_clean($this->request->post['filter_value']);
			if(!count($filter_value)) {
				$filter_value = false;
			}
		}
		/**End**/

		$attribute_value = array();
		if(isset($this->request->post['attribute_value'])) {
			$attribute_value = $this->array_clean($this->request->post['attribute_value']);
			if(!count($attribute_value)) {
				$attribute_value = array();
			}
		}

		$instock = false;
		if(isset($this->request->post['instock'])) {
			$instock = true;
		}

		$filter_name = false;
		if(isset($this->request->post['search'])) {
			$filter_name = $this->request->post['search'];			
		}

		$filter_tag = false;
		if(isset($this->request->post['search'])) {
			$filter_tag = $this->request->post['search'];			
		}

		$filter_description = false;
		if(isset($this->request->post['search'], $this->request->post['description'])) {
			$filter_description = $this->request->post['search'];			
		}

		$tags = false;
		/*if(isset($this->request->post['tags'])) {
			$tags = $this->array_clean($this->request->post['tags']);
			if(!count($tags)) {
				$tags = false;
			}
		}*/

		$categories = false;
		if(isset($this->request->post['categories'])) {
			$categories = $this->array_clean($this->request->post['categories']);
			if(!count($categories)) {
				$categories = false;
			}
		}

		$category_id = 0;
		if(isset($this->request->post['category_id'])) {
			$category_id = $this->request->post['category_id'];
		}
		if(!$categories && $category_id) {
			$categories = array($category_id);
		}

		/**Payment Method Filter By Ashvin Patel 16july2016**/
		$payment_methods = false;
		if(isset($this->request->post['pmethod_value'])) {
			$payment_methods = $this->array_clean($this->request->post['pmethod_value']);
			if(!count($payment_methods)) {
				$payment_methods = false;
			}
		}
		/**End**/

		/**Shipping Method Filter By Ashvin Patel 21july2016**/
		$shipping_methods = false;
		if(isset($this->request->post['smethod_value'])) {
			$shipping_methods = $this->array_clean($this->request->post['smethod_value']);
			if(!count($shipping_methods)) {
				$shipping_methods = false;
			}
		}
		/**End**/

		/**Stock Status Filter By Ashvin Patel 28july2016**/
		$stock_status = false;
		if(isset($this->request->post['stock_status'])) {
			$stock_status = $this->array_clean($this->request->post['stock_status']);
			if(!count($stock_status)) {
				$stock_status = false;
			}
		}

		/**End**/
		$attr_slider = isset($this->request->post['attr_slider']) ? $this->request->post['attr_slider'] : false;

		$special = isset($this->request->post['route']) && $this->request->post['route'] == 'product/special';

		$f_attributes = isset($this->request->post['attributes']) ? $this->request->post['attributes'] : false;

		$stock_status_ids = isset($this->request->post['stock_status_ids']) ? $this->request->post['stock_status_ids'] : false;

		$data = array(
			'instock' => $instock,
			'stock_status' => $stock_status,
			'option_value' => $option_value,
			'filter_value' => $filter_value,
			'manufacturer' => $manufacturer,
			'attribute_value' => $attribute_value,
			'f_attributes' => $f_attributes,
			'stock_status_ids' => $stock_status_ids,
			'filter_name'	=> $filter_name,
			'filter_tag'	=> $filter_tag,
			'rrating'	   => $rrating,
			'filter_description' => $filter_description,
			'tags' => $tags,
			'categories' => $categories,
			'ccategory_id' => $category_id,
			'payment_methods' => $payment_methods,
			'shipping_methods' => $shipping_methods,
			'attr_slider' => $attr_slider,
			'special' => $special,
			'min_price' => $this->request->post['min_price'] / $this->k,
			'max_price' => $this->request->post['max_price'] / $this->k,
			'start' => ($page - 1) * $limit,
			'limit' => $limit,
			'sort' => $sort,
			'order' => $order
		);
		if($ultimatemegafilter_setting['status_rrating'] == 0) {
			$totals_rrating = false;
		} else {
			$totals_rrating = $this->model_module_ultimatemegafilter->getTotalRrating($data);
		}
		if(isset($this->request->post['manufacturer_id']) || (!$ultimatemegafilter_setting['status_manufacturer'])) {
			$totals_manufacturers = false;
		} elseif(isset($this->request->post['manufacturer_count'])){
			$totals_manufacturers = array();
			$this->model_module_ultimatemegafilter->getTotalManufacturers($data, $totals_manufacturers);
		}		

		if(!$ultimatemegafilter_setting['status_pmethod']) {
			$totals_payment_methods = false;
		} elseif(isset($this->request->post['payment_count'])){
			$totals_payment_methods = array();
			$this->model_module_ultimatemegafilter->getTotalPaymentMethods($data, $totals_payment_methods);
		}

		if(!$ultimatemegafilter_setting['status_smethod']) {
			$totals_shipping_methods = false;
		} elseif(isset($this->request->post['shipping_count'])){
			$totals_shipping_methods = array();
			$this->model_module_ultimatemegafilter->getTotalShippingMethods($data, $totals_shipping_methods);
		}


		if(!$ultimatemegafilter_setting['status_stock_status']) {
			$totals_stock_status = false;
		} elseif($stock_status_ids) {
			$totals_stock_status = array();
			$this->model_module_ultimatemegafilter->getTotalStockStatus($data, $totals_stock_status);
		}			

		$totals_options = false;
		$totals_filters = false;
		$totals_attributes = false;

		if(isset($this->request->post['option_count'])){
			$totals_options = $this->model_module_ultimatemegafilter->getTotalOptions($data);
			if($option_value){
				foreach($option_value as $option_id => $options) {				
					foreach($totals_options as $i => $option) {
						if($option['option_id'] == $option_id) {
							unset($totals_options[$i]);
						}
					}
					/*print_r($totals_options); die();*/
					
					$temp_data = $data;
					unset($temp_data['option_value'][$option_id]);					
					foreach($this->model_module_ultimatemegafilter->getTotalOptions($temp_data) as $option){						
						if($option['option_id'] == $option_id) {
							$totals_options[] = $option;
						}
					}
				}
			}
		}

		sort($totals_options);

		if(isset($this->request->post['filter_count'])){
			$totals_filters = $this->model_module_ultimatemegafilter->getTotalFilters($data);			
			foreach($filter_value as $filter_group_id => $filter_values) {				
				foreach($totals_filters as $i => $filters) {
					if($filters['filter_group_id'] == $filter_group_id) {
						unset($totals_filters[$i]);
					}
				}

				$temp_data = $data;
				unset($temp_data['filter_value'][$filter_group_id]);					
				foreach($this->model_module_ultimatemegafilter->getTotalFilters($temp_data) as $filter){						
					if($filter['filter_group_id'] == $filter_group_id) {
						$totals_filters[] = $filter;
					}
				}
			}
		}
		sort($totals_filters);

		if($f_attributes){
			$totals_attributes = $this->model_module_ultimatemegafilter->getTotalAttributes($data);
			foreach($attribute_value as $attribute_id => $values) {
				foreach($totals_attributes as $i => $attribute) {
					if($attribute['id'] == $attribute_id) {
						unset($totals_attributes[$i]);
					}
				}

				$temp_data = $data;
				unset($temp_data['attribute_value'][$attribute_id]);
				foreach($this->model_module_ultimatemegafilter->getTotalAttributes($temp_data) as $attribute){
					if($attribute['id'] == $attribute_id) {
						$totals_attributes[] = $attribute;
					}
				}
			}
			sort($totals_attributes);
		}
		/*die();*/

		$version = array_map('intVal', explode('.', VERSION));
		if($version[2] >= 4) {
			$totals_tags = array();
		} else {
			$totals_tags = array();
		}
		$totals_categories = false;
		if(isset($this->request->post['manufacturer_count'])){
			$this->model_module_ultimatemegafilter->getTotalCategories($data, $category_id, $totals_categories);
		}

		$this->request->get['path'] = isset($this->request->post['path']) ? $this->request->post['path'] : '';
		$json = json_encode(array(
								 				'totals_data' => array(
								 				    'manufacturers' => $totals_manufacturers,
								            'payment_methods' => $totals_payment_methods,
								            'shipping_methods' => $totals_shipping_methods,
								            'rrating' => $totals_rrating,
								            'stock_status' => $totals_stock_status,
														'options' => $totals_options,
														'filters' => $totals_filters,
														'attributes' => $totals_attributes,
														'categories' => $totals_categories,
														'tags' => $totals_tags
													)
								 				)
											);
		$this->response->setOutput($json);
	}

	private function getHtmlProducts($results, $product_total, &$result_html) {

		$this->language->load('product/category');
		$data['text_refine'] = $this->language->get('text_refine');
		$data['text_empty'] = $this->language->get('text_empty');
		$data['text_quantity'] = $this->language->get('text_quantity');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_model'] = $this->language->get('text_model');
		$data['text_price'] = $this->language->get('text_price');
		$data['text_tax'] = $this->language->get('text_tax');
		$data['text_points'] = $this->language->get('text_points');
		$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
		$data['text_display'] = $this->language->get('text_display');
		$data['text_list'] = $this->language->get('text_list');
		$data['text_grid'] = $this->language->get('text_grid');
		$data['text_sort'] = $this->language->get('text_sort');
		$data['text_limit'] = $this->language->get('text_limit');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$data['button_continue'] = $this->language->get('button_continue');

		$data['products'] = array();
		$data['out_of_stock_label_style'] = false;

		foreach ($results as $result) {
                // gun88
        if ($this->config->get('out_of_stock_label_enabled')) {
            $this->load->model('module/out_of_stock_label');
            $data['text_out_of_stock'] = $this->model_module_out_of_stock_label->getLabel((int) $this->config->get('config_language_id'));
            $data['out_of_stock_label_style'] = htmlspecialchars_decode($this->config->get('out_of_stock_label_style'));
        }
        
        // end gun88
        
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			} else {
				$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			}

			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}

			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$special = false;
			}

			if ($this->config->get('config_tax')) {
				$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
			} else {
				$tax = false;
			}

			if ($this->config->get('config_review_status')) {
				$rating = (int)$result['rating'];
			} else {
				$rating = false;
			}

			$data['products'][] = array(
				'product_id'  => $result['product_id'],
                // gun88
                    'quantity' => ($this->config->get('out_of_stock_label_enabled'))?$this->model_module_out_of_stock_label->getQuantity($result):1,
                    // end gun88
				'thumb'       => $image,
				'name'        => $result['name'],
				'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
				'price'       => $price,
				'quantity'    => $result['quantity'],
				'special'     => $special,
				'tax'         => $tax,
				'rating'      => $result['rating'],
				'reviews'     => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'href'        => $this->url->link('product/product', 'path=' . $this->request->get['path'] . '&product_id=' . $result['product_id'])
			);
		}
		
		if(file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/ultimatemegafilter_list.tpl') &&
		   file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/ultimatemegafilter_grid.tpl')
		) {
			$return['list'] = $this->load->view($this->config->get('config_template') . '/template/module/ultimatemegafilter_list.tpl');
			
			$return['grid'] = $this->load->view($this->config->get('config_template') . '/template/module/ultimatemegafilter_grid.tpl');
			
			$result_html = $return;
		} elseif(file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/ultimatemegafilter_products.tpl')) {
			$result_html = $this->load->view($this->config->get('config_template') . '/template/module/ultimatemegafilter_products.tpl', $data);
		} else {
			$result_html = $this->load->view('default/template/module/ultimatemegafilter_products.tpl', $data);
		}
	}
}
?>