<?php
class ControllerCommonHeader extends Controller {
	public function index() {

				if( $this->config->get( 'smp_is_install' ) && isset( $this->request->get['route'] ) ) {
					switch( $this->request->get['route'] ) {
						case 'product/manufacturer/info' : {
							if( ! empty( $this->request->get['manufacturer_id'] ) ) {
								$data['smp_canonical_url'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'], 'SSL' );
							}

							break;
						}
					}
				}
				
				$data['documentGetMeta'] = $this->document->getMeta();
				
				if( ! empty( $this->request->get['route'] ) ) {
					$data['smk_current_route'] = $this->request->get['route'];
				}
			
		$data['title'] = $this->document->getTitle();

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		if ($this->config->get('config_google_analytics_status')) {
			$data['google_analytics'] = html_entity_decode($this->config->get('config_google_analytics'), ENT_QUOTES, 'UTF-8');
		} else {
			$data['google_analytics'] = '';
		}

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$data['icon'] = $server . 'image/' . $this->config->get('config_icon');
		} else {
			$data['icon'] = '';
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');

		$data['text_home'] = $this->language->get('text_home');
		$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');
        $data['text_qship'] = $this->language->get('text_qship');
        $data['text_quality'] = $this->language->get('text_quality');
        $data['text_ship'] = $this->language->get('text_ship');
        
		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', 'SSL');
		$data['register'] = $this->url->link('account/register', '', 'SSL');
		$data['login'] = $this->url->link('account/login', '', 'SSL');
		$data['order'] = $this->url->link('account/order', '', 'SSL');
		$data['transaction'] = $this->url->link('account/transaction', '', 'SSL');
		$data['download'] = $this->url->link('account/download', '', 'SSL');
		$data['logout'] = $this->url->link('account/logout', '', 'SSL');
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');

		$status = true;

		if (isset($this->request->server['HTTP_USER_AGENT'])) {
			$robots = explode("\n", str_replace(array("\r\n", "\r"), "\n", trim($this->config->get('config_robots'))));

			foreach ($robots as $robot) {
				if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
					$status = false;

					break;
				}
			}
		}

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['config_swap_bullet'] = $this->config->get('config_swap_bullet');
$data['config_swap_bullet_radius'] = $this->config->get('config_swap_bullet_radius');
$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}

		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {

				$data['smp_meta'] = (array) $this->config->get('smp_meta');
				$data['smp_extras'] = $this->config->get('smp_extras');
				$data['smp_config_language'] = $this->config->get('config_language');
				$data['__SMP_HREFLANG'] = $this->config->get( '__SMP_HREFLANG' );
				
				if( isset( $data['smp_meta'][$this->config->get('config_store_id')] ) ) {
					$data['smp_meta'] = $data['smp_meta'][$this->config->get('config_store_id')];
				} else {
					$data['smp_meta'] = NULL;
				}
				
				if( isset( $data['smp_extras'][$this->config->get('config_store_id')] ) ) {
					$data['smp_extras'] = $data['smp_extras'][$this->config->get('config_store_id')];
				} else {
					$data['smp_extras'] = array();
				}
			
			
			return $this->load->view($this->config->get('config_template') . '/template/common/header.tpl', $data);
		} else {

				$data['smp_meta'] = (array) $this->config->get('smp_meta');
				$data['smp_extras'] = $this->config->get('smp_extras');
				$data['smp_config_language'] = $this->config->get('config_language');
				$data['__SMP_HREFLANG'] = $this->config->get( '__SMP_HREFLANG' );
				
				if( isset( $data['smp_meta'][$this->config->get('config_store_id')] ) ) {
					$data['smp_meta'] = $data['smp_meta'][$this->config->get('config_store_id')];
				} else {
					$data['smp_meta'] = NULL;
				}
				
				if( isset( $data['smp_extras'][$this->config->get('config_store_id')] ) ) {
					$data['smp_extras'] = $data['smp_extras'][$this->config->get('config_store_id')];
				} else {
					$data['smp_extras'] = array();
				}
			
			
			return $this->load->view('default/template/common/header.tpl', $data);
		}
	}
}