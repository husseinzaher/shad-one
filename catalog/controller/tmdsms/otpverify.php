<?php
class ControllerTmdsmsotpverify extends Controller {
	public function index() {
		$this->load->language('tmdsms/otpverify');
		$this->load->model('tmdsms/otpverify');
			
		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/account', '', true)
		);

		$headingtitle = $this->config->get('tmdsms_title');
		
		$labelotp = $this->config->get('tmdsms_labelotp');
		$data['otpstatus'] = $this->config->get('tmdsms_otpverifystatus');

		$tmdsmsotp=$this->config->get('tmdsms_otpverify');
		$data['descriptiontop']=$tmdsmsotp[$this->config->get('config_language_id')]['descriptiontop'];

		$data['descriptionbottom'] = $tmdsmsotp[$this->config->get('config_language_id')]['descriptionbottom'];
		
		if($tmdsmsotp){
			$data['heading_title'] = $tmdsmsotp[$this->config->get('config_language_id')]['title'];
		} else {
			$data['heading_title'] = $this->language->get('heading_title');
		}

		if($tmdsmsotp){
			$data['button_continue'] = $tmdsmsotp[$this->config->get('config_language_id')]['btnverify'];
		} else {
			$data['button_continue'] = $this->language->get('button_continue');
		}

		if($tmdsmsotp){
			$data['button_resend'] = $tmdsmsotp[$this->config->get('config_language_id')]['resendbtn'];
		} else {
			$data['button_resend'] = $this->language->get('button_resend');
		}

		if($tmdsmsotp){
			$data['text_otp'] = $tmdsmsotp[$this->config->get('config_language_id')]['labelotp'];
		} else {
			$data['text_otp'] = $this->language->get('text_otp');
		}
        $data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$data['customer_id'] = $this->request->get['customer_id'];
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/tmdsms/otpverify.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/tmdsms/otpverify.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/tmdsms/otpverify.tpl', $data));
		}
	}

	public function passunlock() {
		$this->load->language('tmdsms/otpverify');
		$this->load->model('tmdsms/otpverify');
		
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			$json = array();
			$customer_id = $this->customer->isLogged();

			$result = $this->model_tmdsms_otpverify->getotp($customer_id);

			if($this->request->post['otpconfirm'] != $result['otp']) {
				$json['error'] = $this->language->get('error_otp');
			}
			if(empty($json['error'])) {
				
				$this->model_tmdsms_otpverify->accountverify($customer_id,$this->request->post);

				$json['success'] = $this->language->get('text_success');
				$json['redirect']= $this->url->link('account/success');
			}	
		}
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function sendotp(){
		$this->load->language('tmdsms/otpverify');
		$this->load->model('tmdsms/otpverify');
		
		$customer_id = $this->request->get['customer_id'];

		$json = array();
		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {

			if(empty($json['error'])) {

				$this->model_tmdsms_otpverify->sendotp($this->customer->isLogged());

				$json['success'] = $this->language->get('text_otpsuccess');
			}	
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

}