<?php
ob_start();
class ControllerPaymentPaytabs extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('payment/paytabs');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
		session_start();


		$this->model_setting_setting->editSetting('paytabs', $this->request->post);
		$_SESSION['website_merchant'] = $this->request->post['website_merchant'];
		$website = $_SESSION['website_merchant'];
		//$this->config->get('website_merchant') = $website;

//echo $_SESIION['website_merchant'];


			$this->session->data['success'] = $this->language->get('text_success');



			$this->response->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all_zones'] = $this->language->get('text_all_zones');

		$data['entry_merchant'] = $this->language->get('entry_merchant');
		$data['entry_password'] = $this->language->get('entry_password');
		$data['entry_website'] = $this->language->get('entry_website');
		
		$data['entry_callback'] = $this->language->get('entry_callback');
		$data['entry_total'] = $this->language->get('entry_total');
		$data['entry_order_status'] = $this->language->get('entry_order_status');
		$data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['help_callback'] = $this->language->get('help_callback');
		$data['help_total'] = $this->language->get('help_total');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['merchant'])) {
			$data['error_merchant'] = $this->error['merchant'];
		} else {
			$data['error_merchant'] = '';
		}

		if (isset($this->error['website'])) {
			$data['error_website'] = $this->error['website'];
			} else {
				$data['error_website'] = '';
			}

		if (isset($this->error['security'])) {
			$data['error_security'] = $this->error['security'];
		} else {
			$data['error_security'] = '';
		}

		


		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_payment'),
			'href' => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('payment/paytabs', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('payment/paytabs', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['paytabs_merchant'])) {
			$data['paytabs_merchant'] = $this->request->post['paytabs_merchant'];
		} else {
			$data['paytabs_merchant'] = $this->config->get('paytabs_merchant');
		}


		if (isset($this->request->post['paytabs_password'])) {
			$data['paytabs_password'] = $this->request->post['paytabs_password'];
		} else {
			$data['paytabs_password'] = $this->config->get('paytabs_password');
		}


		if (isset($this->request->post['website_merchant'])) {

			$data['website_merchant'] = $this->request->post['website_merchant'];
		} else {
			$data['website_merchant'] = $this->config->get('website_merchant');//$_SESSION['website_merchant'];  //$this->config->get('website_merchant');
		}


		$data['callback'] = HTTP_CATALOG . 'index.php?route=payment/paytabs/callback';

		if (isset($this->request->post['paytabs_total'])) {
			$data['paytabs_total'] = $this->request->post['paytabs_total'];
		} else {
			$data['paytabs_total'] = $this->config->get('paytabs_total');
		}




		if (isset($this->request->post['paytabs_order_status_id'])) {
			$data['paytabs_order_status_id'] = $this->request->post['paytabs_order_status_id'];
		} else {
			$data['paytabs_order_status_id'] = $this->config->get('paytabs_order_status_id');
		}

		$this->load->model('localisation/order_status');

		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		if (isset($this->request->post['paytabs_geo_zone_id'])) {
			$data['paytabs_geo_zone_id'] = $this->request->post['paytabs_geo_zone_id'];
		} else {
			$data['paytabs_geo_zone_id'] = $this->config->get('paytabs_geo_zone_id');
		}

		$this->load->model('localisation/geo_zone');

		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

		if (isset($this->request->post['paytabs_status'])) {
			$data['paytabs_status'] = $this->request->post['paytabs_status'];
		} else {
			$data['paytabs_status'] = $this->config->get('paytabs_status');
		}

		if (isset($this->request->post['paytabs_sort_order'])) {
			$data['paytabs_sort_order'] = $this->request->post['paytabs_sort_order'];
		} else {
			$data['paytabs_sort_order'] = $this->config->get('paytabs_sort_order');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		//echo "<pre>";
			//print_r($data);//die;
		
			if (isset($this->request->post['paytabs_website'])) {

			$data['paytabs_website'] = $this->request->post['paytabs_website'];
			} else {
			$data['paytabs_website'] = $this->config->get('paytabs_website');//$_SESSION['website_merchant'];  //$this->config->get('website_merchant');
			}

		$this->response->setOutput($this->load->view('payment/paytabs.tpl', $data));
	}


	protected function validate() {
		if (!$this->user->hasPermission('modify', 'payment/paytabs')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['paytabs_merchant']) {
			$this->error['merchant'] = $this->language->get('error_merchant');
		}



		if (!$this->request->post['paytabs_password']) {
			$this->error['security'] = $this->language->get('error_security');
		}

		return !$this->error;
	}
}