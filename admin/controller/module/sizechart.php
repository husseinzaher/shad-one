<?php
class ControllerModuleSizechart extends Controller {
	private $error = array();
	
	/* Install the size_chart column in product_description table Start */
	public function install() {
		$this->load->model('module/sizechart');
		$this->model_module_sizechart->createSizechartColumn();				
	}
	/* Install the size_chart column in product_description table End */

	public function index() {
		$this->load->language('module/sizechart');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('setting/setting');

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {		
			$this->model_setting_setting->editSetting('sizechart', $this->request->post);		
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['entry_status1'] = $this->language->get('entry_status1');
		$data['help_code'] = $this->language->get('help_code');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['code'])) {
			$data['error_code'] = $this->error['code'];
		} else {
			$data['error_code'] = '';
		}

		$data['breadcrumbs'] = array();
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/sizechart', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('module/sizechart', 'token=' . $this->session->data['token'], 'SSL');
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->post['sizechart_status'])) {
			$data['sizechart_status'] = $this->request->post['sizechart_status'];
		} else {
			$data['sizechart_status'] = $this->config->get('sizechart_status');
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/sizechart.tpl', $data));
	}
	
	/* Delete the size_chart column in product_description table Start */
	public function uninstall()
	{
		$this->load->model('module/sizechart');
		$this->model_module_sizechart->dropSizechartColumn();
	}
	/* Delete the size_chart column in product_description table Start */
}