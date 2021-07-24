<?php
class ModelPaymentCodOrderFee extends Model {
	public function getMethod($address, $total) {
		if (isset($this->session->data['shipping_address']['country_id']) 
				&& ($this->session->data['shipping_address']['country_id'] == $this->config->get('cod_order_fee_country_id'))
			    && ($this->cart->getSubTotal() >= $this->config->get('cod_order_fee_min_total'))
				&& ($this->cart->getSubTotal() <= $this->config->get('cod_order_fee_max_total')) 
				&& ($this->cart->countProducts() <= $this->config->get('cod_order_fee_max_quantity'))
			) {
			$status = true;
		} else {
			$status = false;
		}
		
		$method_data = array();

		if ($status) {
			$method_data = array(
				'code'       => 'cod_order_fee',
				'title'      => !empty($this->config->get('cod_order_fee_payment_method_title'))? $this->config->get('cod_order_fee_payment_method_title') : 'Cash On Delivery',
				'terms'      => '',
				'sort_order' => $this->config->get('cod_order_fee_sort_order')
			);
		}

		return $method_data;
	}
}