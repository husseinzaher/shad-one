<?php
class ControllerCommonColumnLeft extends Controller {

//MaintenanceModeWarn
	public function adw_maintenance() {
		if (isset($this->request->get['token']) && isset($this->session->data['token']) && ($this->request->get['token'] == $this->session->data['token'])) {

		$json = array();
		$this->load->language('setting/setting');

		if (!$this->user->hasPermission('modify', 'setting/setting')) {
			$json['error'] = $this->language->get('error_permission');
		} else {
			$m_mode = $this->config->get('config_maintenance') ? '0' : '1';
			$this->db->query("UPDATE `" . DB_PREFIX . "setting` SET `value`='" . (int)$m_mode . "' WHERE `key` = 'config_maintenance'");
			$this->config->set('config_maintenance', $m_mode);
			$json['mode'] = $m_mode;
			$json['success'] = $this->language->get('text_success');
		}
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
		}
	}
//MaintenanceModeWarn
			
	public function index() {
		if (isset($this->request->get['token']) && isset($this->session->data['token']) && ($this->request->get['token'] == $this->session->data['token'])) {
			$data['profile'] = $this->load->controller('common/profile');
			$data['menu'] = $this->load->controller('common/menu');
			$data['stats'] = $this->load->controller('common/stats');

			return $this->load->view('common/column_left.tpl', $data);
		}
	}
}