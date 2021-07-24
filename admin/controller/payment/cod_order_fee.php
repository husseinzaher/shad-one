<?php
class ControllerPaymentCodOrderFee extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('payment/cod_order_fee');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('cod_order_fee', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all_zones'] = $this->language->get('text_all_zones');
		$data['text_none'] = $this->language->get('text_none');

		
		$data['entry_payment_method_title'] = $this->language->get('entry_payment_method_title');
		$data['entry_order_total_title'] = $this->language->get('entry_order_total_title');
		$data['entry_min_total'] = $this->language->get('entry_min_total');
		$data['entry_max_total'] = $this->language->get('entry_max_total');
		$data['entry_quantity'] = $this->language->get('entry_quantity');
		$data['entry_fee_type'] = $this->language->get('entry_fee_type');
		$data['entry_fee'] = $this->language->get('entry_fee');
		$data['entry_country'] = $this->language->get('entry_country');
		$data['entry_tax_class'] = $this->language->get('entry_tax_class');
		$data['entry_order_status'] = $this->language->get('entry_order_status');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['help_payment_method_title'] = $this->language->get('help_payment_method_title');
		$data['help_order_total_title'] = $this->language->get('help_order_total_title');
		$data['help_min_total'] = $this->language->get('help_min_total');
		$data['help_max_total'] = $this->language->get('help_max_total');
		$data['help_quantity'] = $this->language->get('help_quantity');
		$data['help_fee_type'] = $this->language->get('help_fee_type');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_payment'),
			'href' => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('payment/cod_order_fee', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('payment/cod_order_fee', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], true);

		if (isset($this->request->post['cod_order_fee_payment_method_title'])) {
			$data['cod_order_fee_payment_method_title'] = $this->request->post['cod_order_fee_payment_method_title'];
		} else {
			$data['cod_order_fee_payment_method_title'] = $this->config->get('cod_order_fee_payment_method_title');
		}
		
		if (isset($this->request->post['cod_order_fee_order_total_title'])) {
			$data['cod_order_fee_order_total_title'] = $this->request->post['cod_order_fee_order_total_title'];
		} else {
			$data['cod_order_fee_order_total_title'] = $this->config->get('cod_order_fee_order_total_title');
		}
		
		if (isset($this->request->post['cod_order_fee_min_total'])) {
			$data['cod_order_fee_min_total'] = $this->request->post['cod_order_fee_min_total'];
		} else {
			$data['cod_order_fee_min_total'] = $this->config->get('cod_order_fee_min_total');
		}
		
		if (isset($this->request->post['cod_order_fee_max_total'])) {
			$data['cod_order_fee_max_total'] = $this->request->post['cod_order_fee_max_total'];
		} else {
			$data['cod_order_fee_max_total'] = $this->config->get('cod_order_fee_max_total');
		}
		
		if (isset($this->request->post['cod_order_fee_max_quantity'])) {
			$data['cod_order_fee_max_quantity'] = $this->request->post['cod_order_fee_max_quantity'];
		} else {
			$data['cod_order_fee_max_quantity'] = $this->config->get('cod_order_fee_max_quantity');
		}

		if (isset($this->request->post['cod_order_fee_type'])) {
			$data['cod_order_fee_type'] = $this->request->post['cod_order_fee_type'];
		} else {
			$data['cod_order_fee_type'] = $this->config->get('cod_order_fee_type');
		}
		
		if (isset($this->request->post['cod_order_fee_fee'])) {
			$data['cod_order_fee_fee'] = $this->request->post['cod_order_fee_fee'];
		} else {
			$data['cod_order_fee_fee'] = $this->config->get('cod_order_fee_fee');
		}

		if (isset($this->request->post['cod_order_fee_tax_class_id'])) {
			$data['cod_order_fee_tax_class_id'] = $this->request->post['cod_order_fee_tax_class_id'];
		} else {
			$data['cod_order_fee_tax_class_id'] = $this->config->get('cod_order_fee_tax_class_id');
		}
		
		if (isset($this->request->post['cod_order_fee_country_id'])) {
			$data['cod_order_fee_country_id'] = $this->request->post['cod_order_fee_country_id'];
		} else {
			$data['cod_order_fee_country_id'] = $this->config->get('cod_order_fee_country_id');
		}

		$this->load->model('localisation/tax_class');
		$this->load->model('localisation/country');
		$this->load->model('localisation/order_status');
		
		$data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();
		
		$data['countries'] = $this->model_localisation_country->getCountries();
		
		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
		
		if (isset($this->request->post['cod_order_fee_order_status'])) {
			$data['cod_order_fee_order_status'] = $this->request->post['cod_order_fee_order_status'];
		} else {
			$data['cod_order_fee_order_status'] = $this->config->get('cod_order_fee_order_status');
		}

		if (isset($this->request->post['cod_order_fee_status'])) {
			$data['cod_order_fee_status'] = $this->request->post['cod_order_fee_status'];
		} else {
			$data['cod_order_fee_status'] = $this->config->get('cod_order_fee_status');
		}

		if (isset($this->request->post['cod_order_fee_sort_order'])) {
			$data['cod_order_fee_sort_order'] = $this->request->post['cod_order_fee_sort_order'];
		} else {
			$data['cod_order_fee_sort_order'] = $this->config->get('cod_order_fee_sort_order');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('payment/cod_order_fee.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'payment/cod_order_fee')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->request->post['cod_order_fee_min_total']) {
			$this->error['warning'] = $this->language->get('error_cod_order_fee_min_total');
		}
		
		if (!$this->request->post['cod_order_fee_max_total']) {
			$this->error['warning'] = $this->language->get('error_cod_order_fee_max_total');
		}
		
		if (!$this->request->post['cod_order_fee_max_quantity']) {
			$this->error['warning'] = $this->language->get('error_cod_order_fee_max_quantity');
		}
		
		if (!$this->request->post['cod_order_fee_fee']) {
			$this->error['warning'] = $this->language->get('error_cod_order_fee_fee');
		}
		
		if (!$this->request->post['cod_order_fee_country_id']) {
			$this->error['warning'] = $this->language->get('error_cod_order_fee_country_id');
		}
		
		return !$this->error;
	}
	
	public function install() {
		/* permissions */
		$this->load->model('user/user_group');
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'payment/cod_order_fee');
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'payment/cod_order_fee');
	}
	
	public function uninstall() {
        /*  permissions */
		$this->load->model('user/user_group');
		$this->model_user_user_group->removePermission($this->user->getGroupId(), 'access', 'payment/cod_order_fee');
		$this->model_user_user_group->removePermission($this->user->getGroupId(), 'modify', 'payment/cod_order_fee');
    }
}