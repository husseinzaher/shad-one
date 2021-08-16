<?php
class ControllerPaymentTap extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('payment/tap');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('tap', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all_zones'] = $this->language->get('text_all_zones');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');

		$data['entry_merchantid'] = $this->language->get('entry_merchantid');
		$data['entry_username'] = $this->language->get('entry_username');
		$data['entry_password'] = $this->language->get('entry_password');
		$data['entry_test'] = $this->language->get('entry_test');
		$data['entry_total'] = $this->language->get('entry_total');
		$data['entry_order_status'] = $this->language->get('entry_order_status');
		$data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['help_password'] = $this->language->get('help_password');
		$data['help_total'] = $this->language->get('help_total');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['merchantid'])) {
			$data['error_merchantid'] = $this->error['merchantid'];
		} else {
			$data['error_merchantid'] = '';
		}
		
		if (isset($this->error['username'])) {
			$data['error_username'] = $this->error['username'];
		} else {
			$data['error_username'] = '';
		}

		if (isset($this->error['password'])) {
			$data['error_password'] = $this->error['password'];
		} else {
			$data['error_password'] = '';
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
			'href' => $this->url->link('payment/tap', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('payment/tap', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['tap_merchantid'])) {
			$data['tap_merchantid'] = $this->request->post['tap_merchantid'];
		} else {
			$data['tap_merchantid'] = $this->config->get('tap_merchantid');
		}
		
		if (isset($this->request->post['tap_username'])) {
			$data['tap_username'] = $this->request->post['tap_username'];
		} else {
			$data['tap_username'] = $this->config->get('tap_username');
		}

		if (isset($this->request->post['tap_password'])) {
			$data['tap_username'] = $this->request->post['tap_username'];
		} elseif ($this->config->get('tap_password')) {
			$data['tap_password'] = $this->config->get('tap_password');
		} else {
			$data['tap_password'] = md5(mt_rand());
		}

		if (isset($this->request->post['tap_test'])) {
			$data['tap_test'] = $this->request->post['tap_test'];
		} else {
			$data['tap_test'] = $this->config->get('tap_test');
		}

		if (isset($this->request->post['tap_total'])) {
			$data['tap_total'] = $this->request->post['tap_total'];
		} else {
			$data['tap_total'] = $this->config->get('tap_total');
		}

		if (isset($this->request->post['tap_order_status_id'])) {
			$data['tap_order_status_id'] = $this->request->post['tap_order_status_id'];
		} else {
			$data['tap_order_status_id'] = $this->config->get('tap_order_status_id');
		}

		$this->load->model('localisation/order_status');

		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		if (isset($this->request->post['tap_geo_zone_id'])) {
			$data['tap_geo_zone_id'] = $this->request->post['tap_geo_zone_id'];
		} else {
			$data['tap_geo_zone_id'] = $this->config->get('tap_geo_zone_id');
		}

		$this->load->model('localisation/geo_zone');

		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

		if (isset($this->request->post['tap_status'])) {
			$data['tap_status'] = $this->request->post['tap_status'];
		} else {
			$data['tap_status'] = $this->config->get('tap_status');
		}

		if (isset($this->request->post['tap_sort_order'])) {
			$data['tap_sort_order'] = $this->request->post['tap_sort_order'];
		} else {
			$data['tap_sort_order'] = $this->config->get('tap_sort_order');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('payment/tap.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'payment/tap')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['tap_merchantid']) {
			$this->error['merchantid'] = $this->language->get('error_merchantid');
		}
		
		if (!$this->request->post['tap_username']) {
			$this->error['username'] = $this->language->get('error_username');
		}

		if (!$this->request->post['tap_password']) {
			$this->error['password'] = $this->language->get('error_password');
		}

		return !$this->error;
	}
}
