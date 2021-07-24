<?php
class ModelTotalCodOrderFeeTotal extends Model {
	public function getTotal(&$total_data, &$total, &$taxes) {
		if ((isset($this->session->data['shipping_address']['country_id']) && isset($this->session->data['payment_method']['code']))
				&& ($this->session->data['payment_method']['code'] == 'cod_order_fee') 
				&& ($this->session->data['shipping_address']['country_id'] == $this->config->get('cod_order_fee_country_id'))
			    && ($this->cart->getSubTotal() >= $this->config->get('cod_order_fee_min_total'))
				&& ($this->cart->getSubTotal() <= $this->config->get('cod_order_fee_max_total')) 
				&& ($this->cart->countProducts() <= $this->config->get('cod_order_fee_max_quantity'))
			) {
			
			$total_cod_order_fee = 0;
			
			if($this->config->get('cod_order_fee_type') == 'per_quantity' ){
				$total_cod_order_fee = $this->config->get('cod_order_fee_fee') * $this->cart->countProducts();
			}elseif($this->config->get('cod_order_fee_type') == 'total_percentage' ){
				$total_cod_order_fee = $this->cart->getSubTotal() * ($this->config->get('cod_order_fee_fee')/100);
			}elseif($this->config->get('cod_order_fee_type') == 'fix_price' ){
				$total_cod_order_fee = $this->config->get('cod_order_fee_fee');
			}

			$total_data[] = array(
				'code'       => 'cod_order_fee_total',
				'title'      => !empty($this->config->get('cod_order_fee_order_total_title'))? $this->config->get('cod_order_fee_order_total_title') : 'COD Order Fee',
				'value'      => $total_cod_order_fee,
				'sort_order' => $this->config->get('cod_order_fee_total_sort_order')
			);

			if ($this->config->get('cod_order_fee_tax_class_id')) {
				$tax_rates = $this->tax->getRates($total_cod_order_fee, $this->config->get('cod_order_fee_tax_class_id'));

				foreach ($tax_rates as $tax_rate) {
					if (!isset($taxes[$tax_rate['tax_rate_id']])) {
						$taxes[$tax_rate['tax_rate_id']] = $tax_rate['amount'];
					} else {
						$taxes[$tax_rate['tax_rate_id']] += $tax_rate['amount'];
					}
				}
			}
			
			$total += $total_cod_order_fee;
		}
	}
}