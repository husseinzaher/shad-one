<?php
class ControllerModuleBestSeller extends Controller {
	public function index($setting) {
		$this->load->language('module/bestseller');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

		$results = $this->model_catalog_product->getBestSellerProducts($setting['limit']);

		if ($results) {
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
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
					$rating = $result['rating'];
				} else {
					$rating = false;
				}

				$swap_bullets = '';
if ($this->config->get('config_swap_bullet')) {
	$bullets = $this->model_catalog_product->getSwapBullets($result['product_id']);
	if (!empty($bullets)) {
		foreach($bullets as $bullet) {
			if ($bullet['image'] != '' && $bullet['image'] != 'no_image.jpg') {
				if ($this->config->get('config_swap_bullet_image')) {
					$swap_option_image = $this->model_tool_image->resize($bullet['image'], $this->config->get('config_swap_bullet_width'), $this->config->get('config_swap_bullet_height'));
				}
				else {
					$swap_option_image = $this->model_tool_image->resize($bullet['thumb'], $this->config->get('config_swap_bullet_width'), $this->config->get('config_swap_bullet_height'));
				}
				$swap_bullets .= '<a href="#" class="swap_bullet" title="'.$bullet['name'].'" thumb="'.$this->model_tool_image->resize($bullet['thumb'], $setting['width'], $setting['height']).'"><img src="'.$swap_option_image.'" title="'.$bullet['name'].'" alt="'.$bullet['name'].'" /></a>';
			}
		}
	}
}
$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'price'       => $price,
'swap_bullets' => $swap_bullets,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
				);
			}

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/bestseller.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/bestseller.tpl', $data);
			} else {
				return $this->load->view('default/template/module/bestseller.tpl', $data);
			}
		}
	}
}