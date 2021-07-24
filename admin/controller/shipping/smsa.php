<?php
class ControllerShippingSmsa extends Controller {
	public $_apiUrl = "http://track.smsaexpress.com/SECOM/SMSAwebService.asmx";
	private $error = array();

	public function index() {
		$this->load->language('shipping/smsa');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('smsa', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/shipping', 'token=' . $this->session->data['token'] . '&type=shipping', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_rate'] = $this->language->get('entry_rate');
		$data['entry_tax_class'] = $this->language->get('entry_tax_class');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['help_rate'] = $this->language->get('help_rate');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_setting'] = $this->language->get('tab_setting');
		$data['tab_shipping'] = $this->language->get('tab_shipping');
		$data['tab_support'] = $this->language->get('tab_support');
		$data['entry_rate'] = $this->language->get('entry_rate');
		$data['entry_tax_class'] = $this->language->get('entry_tax_class');
		$data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_passkey'] = $this->language->get('entry_passkey');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_postcode'] = $this->language->get('entry_postcode');
		$data['entry_mode'] = $this->language->get('entry_mode');
		$data['entry_address_1'] = $this->language->get('entry_address_1');
		$data['entry_address_2'] = $this->language->get('entry_address_2');
		$data['entry_zone'] = $this->language->get('entry_zone');
		$data['entry_city'] = $this->language->get('entry_city');
		$data['entry_country'] = $this->language->get('entry_country');
		$data['entry_telephone'] = $this->language->get('entry_telephone');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['text_module'] = $this->language->get('text_module');
		$data['text_extension'] = $this->language->get('text_extension');
		$data['text_success'] = $this->language->get('text_success');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_live'] = $this->language->get('text_live');
		$data['text_test'] = $this->language->get('text_test');
		$data['support'] = $this->language->get('support');		
		
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['passkey'])) {
			$data['error_passkey'] = $this->error['passkey'];
		} else {
			$data['error_passkey'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['telephone'])) {
			$data['error_telephone'] = $this->error['telephone'];
		} else {
			$data['error_telephone'] = '';
		}

		if (isset($this->error['postcode'])) {
			$data['error_postcode'] = $this->error['postcode'];
		} else {
			$data['error_postcode'] = '';
		}

		if (isset($this->error['address_1'])) {
			$data['error_address_1'] = $this->error['address_1'];
		} else {
			$data['error_address_1'] = '';
		}

		if (isset($this->error['address_2'])) {
			$data['error_address_2'] = $this->error['address_2'];
		} else {
			$data['error_address_2'] = '';
		}

		if (isset($this->error['city'])) {
			$data['error_city'] = $this->error['city'];
		} else {
			$data['error_city'] = '';
		}

		if (isset($this->error['country'])) {
			$data['error_country'] = $this->error['country'];
		} else {
			$data['error_country'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/shipping', 'token=' . $this->session->data['token'] . '&type=shipping', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('shipping/smsa', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('shipping/smsa', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/shipping', 'token=' . $this->session->data['token'] . '&type=shipping', true);

		$this->load->model('localisation/geo_zone');

		$geo_zones = $this->model_localisation_geo_zone->getGeoZones();

		foreach ($geo_zones as $geo_zone) {
			if (isset($this->request->post['smsa_' . $geo_zone['geo_zone_id'] . '_rate'])) {
				$data['smsa__geo_zone_rate'][$geo_zone['geo_zone_id']] = $this->request->post['smsa_' . $geo_zone['geo_zone_id'] . '_rate'];
			} else {
				$data['smsa__geo_zone_rate'][$geo_zone['geo_zone_id']] = $this->config->get('smsa_' . $geo_zone['geo_zone_id'] . '_rate');
			}

			if (isset($this->request->post['smsa_' . $geo_zone['geo_zone_id'] . '_status'])) {
				$data['smsa__geo_zone_status'][$geo_zone['geo_zone_id']] = $this->request->post['smsa_' . $geo_zone['geo_zone_id'] . '_status'];
			} else {
				$data['smsa__geo_zone_status'][$geo_zone['geo_zone_id']] = $this->config->get('smsa_' . $geo_zone['geo_zone_id'] . '_status');
			}
		}

		$data['geo_zones'] = $geo_zones;

		if (isset($this->request->post['smsa_tax_class_id'])) {
			$data['smsa_tax_class_id'] = $this->request->post['smsa_tax_class_id'];
		} else {
			$data['smsa_tax_class_id'] = $this->config->get('smsa_tax_class_id');
		}

		$this->load->model('localisation/tax_class');

		$data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();
		if (isset($this->request->post['smsa_passkey'])) {
			$data['smsa_passkey'] = $this->request->post['smsa_passkey'];
		} else {
			$data['smsa_passkey'] = $this->config->get('smsa_passkey');
		}

		if (isset($this->request->post['smsa_mode'])) {
			$data['smsa_mode'] = $this->request->post['smsa_mode'];
		} else {
			$data['smsa_mode'] = $this->config->get('smsa_mode');
		}

		if (isset($this->request->post['smsa_name'])) {
			$data['smsa_name'] = $this->request->post['smsa_name'];
		} else {
			$data['smsa_name'] = $this->config->get('smsa_name');
		}

		if (isset($this->request->post['smsa_telephone'])) {
			$data['smsa_telephone'] = $this->request->post['smsa_telephone'];
		} else {
			$data['smsa_telephone'] = $this->config->get('smsa_telephone');
		}

		if (isset($this->request->post['smsa_postcode'])) {
			$data['smsa_postcode'] = $this->request->post['smsa_postcode'];
		} else {
			$data['smsa_postcode'] = $this->config->get('smsa_postcode');
		}

		if (isset($this->request->post['smsa_address_1'])) {
			$data['smsa_address_1'] = $this->request->post['smsa_address_1'];
		} else {
			$data['smsa_address_1'] = $this->config->get('smsa_address_1');
		}

		if (isset($this->request->post['smsa_address_2'])) {
			$data['smsa_address_2'] = $this->request->post['smsa_address_2'];
		} else {
			$data['smsa_address_2'] = $this->config->get('smsa_address_2');
		}

		if (isset($this->request->post['smsa_city'])) {
			$data['smsa_city'] = $this->request->post['smsa_city'];
		} else {
			$data['smsa_city'] = $this->config->get('smsa_city');
		}

		if (isset($this->request->post['smsa_country'])) {
			$data['smsa_country'] = $this->request->post['smsa_country'];
		} else {
			$data['smsa_country'] = $this->config->get('smsa_country');
		}

		if (isset($this->request->post['smsa_status'])) {
			$data['smsa_status'] = $this->request->post['smsa_status'];
		} else {
			$data['smsa_status'] = $this->config->get('smsa_status');
		}

		if (isset($this->request->post['smsa_sort_order'])) {
			$data['smsa_sort_order'] = $this->request->post['smsa_sort_order'];
		} else {
			$data['smsa_sort_order'] = $this->config->get('smsa_sort_order');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('shipping/smsa.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'shipping/smsa')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		if (empty($this->request->post['smsa_passkey'])) {
			$this->error['passkey'] = $this->language->get('error_passkey');
		}

		if (empty($this->request->post['smsa_name'])) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if ((utf8_strlen($this->request->post['smsa_telephone']) < 3) || (utf8_strlen($this->request->post['smsa_telephone']) > 32)) {
			$this->error['telephone'] = $this->language->get('error_telephone');
		}

		if (empty($this->request->post['smsa_address_1'])) {
			$this->error['address_1'] = $this->language->get('error_address_1');
		}

		if (empty($this->request->post['smsa_address_2'])) {
			$this->error['address_2'] = $this->language->get('error_address_2');
		}

		if (empty($this->request->post['smsa_city'])) {
			$this->error['city'] = $this->language->get('error_city');
		}

		if (empty($this->request->post['smsa_country'])) {
			$this->error['country'] = $this->language->get('error_country');
		}

		if (empty($this->request->post['smsa_postcode'])) {
			$this->error['postcode'] = $this->language->get('error_postcode');
		}

		return !$this->error;
	}
	public function shipment() {
        $this->load->model('sale/order');


        if($this->config->get('smsa_status')){

            $this->load->model('shipping/smsa');

            if (isset($this->request->get['order_id']) && $this->request->get['order_id']) {
                $order_id = $this->request->get['order_id'];
            } else {
                $order_id = 0;
            }

            $results = $this->model_shipping_smsa->getConsignment($order_id);
            $data['consignment'] = array();
            
            $data['awb_btn'] = 1;
            foreach ($results as $result) {
                
                if($result['shipment_label']){
                    $shipment_label = HTTP_CATALOG.'awb/'.$result['shipment_label'];
                } else {
                    $shipment_label = false; 
                }
               $data['consignment'][] = array(
                'awb_number'  => $result['awb_number'],
                'shipment_label'  => $shipment_label,
                'reference_number'  => $result['reference_number'],
                'status'  => $result['status'],
                'pickup_date'  => $result['pickup_date'],
                'date_added'  => $result['date_added'],
                'track'       => $this->url->link('shipping/smsa/trackShipment', 'token=' . $this->session->data['token'] . '&awb_number=' . $result['awb_number'], true),
                );
               $data['awb_btn'] = 0;
               if($result['status'] == 'cancelShipment'){
                   $data['awb_btn'] = 1;
               }

               $data['awb_number'] = $result['awb_number'];
               
            }

            $data['token'] = $this->session->data['token'];
            $data['order_id'] = $order_id;  

             $this->load->language('shipping/smsa');

			$data['tab_waybill'] = $this->language->get('tab_waybill');
			$data['tab_awb'] = $this->language->get('tab_awb');
			$data['tab_pickup'] = $this->language->get('tab_pickup');
			$data['tab_awb'] = $this->language->get('tab_awb');
			$data['button_awb'] = $this->language->get('button_awb');
			$data['button_pickUp'] = $this->language->get('button_pickUp');
			$data['column_date_added'] = $this->language->get('column_date_added');
			$data['column_reference_number'] = $this->language->get('column_reference_number');
			$data['column_awb_number'] = $this->language->get('column_awb_number');
			$data['column_status'] = $this->language->get('column_status');
			$data['column_action'] = $this->language->get('column_action');
			$data['column_shipment_label'] = $this->language->get('column_shipment_label');
			$data['entry_pickup_datetime'] = $this->language->get('entry_pickup_datetime');
			$data['text_loading'] = $this->language->get('text_loading');
			$data['button_cancel'] = $this->language->get('button_cancel');

            $this->response->setOutput($this->load->view('shipping/order_smsa.tpl', $data));
        }
    }
    
    public function addShip(){
        $json = array();
        $this->load->language('shipping/smsa');


        if (!$this->user->hasPermission('modify', 'shipping/smsa')) {
            $json['error'] = $this->language->get('error_permission');
        }

        if(!$this->config->get('smsa_status')){
            $json ['error'] = $this->language->get('error_smsa_status');
        }

        if (!isset($this->request->get['order_id']) || !$this->request->get['order_id']) {
            $json ['error'] = $this->language->get('error_order_id');
        }

        $this->load->model('sale/order');           
        $order_info = $this->model_sale_order->getOrder($this->request->get['order_id']);

        if(!$json && $order_info) {

            $weight = 0;
                
            $order_products = $this->model_sale_order->getOrderProducts($this->request->get['order_id']);

            foreach ($order_products as $product) {
                $options = $this->model_sale_order->getOrderOptions($this->request->get['order_id'], $product['order_product_id']);
                
                foreach ($options as $option) {
                   if($option['type'] == 'text'){
                     $weight += floatval($option['value']);
                   }
                }

                 $item_desc[] = $product['name'];
            }

            if($weight == 0){
                $weight = 1;
            }
            
            $codAmt = 0;
            if($order_info['payment_code'] == 'cod'){
                $codAmt = $order_info['total'];
            }

            if($this->config->get('smsa_mode')){
            	$passKey = $this->config->get('smsa_passkey');
            }else{
            	$passKey = 'Testing0';
            }

            $args = array(
                'passKey'       => $passKey,
                'refNo'         => $this->request->get['order_id'],
                'sentDate'      => date('Y/m/d'),
                'idNo'          => $this->request->get['order_id'],
                'cName'         => $order_info['shipping_firstname'].' '.$order_info['shipping_lastname'],
                'cntry'         => 'KSA',
                'cCity'         => $order_info['shipping_city'],
                'cZip'          => $order_info['shipping_postcode'],
                'cPOBox'        => '',
                'cMobile'       => $order_info['telephone'],
                'cTel1'         => '',
                'cTel2'         => '',
                'cAddr1'        => $order_info['shipping_address_1'],
                'cAddr2'        => $order_info['shipping_address_2'],
                'shipType'      => 'DLV',
                'PCs'           => count($order_products),
                'cEmail'        => $order_info['email'],
                'carrValue'     => $order_info['total'],
                'carrCurr'      => $order_info['currency_code'],
                'codAmt'        => $codAmt,
                'weight'        => $weight,
                'custVal'       => '',
                'custCurr'      => '',
                'insrAmt'       => '',
                'insrCurr'      => '',
                'itemDesc'      => implode(", ",$item_desc),
                'sName'         => $this->config->get('config_name'),
                'sContact'      => $this->config->get('smsa_name'),
                'sAddr1'        => $this->config->get('smsa_address_1'),
                'sAddr2'        => $this->config->get('smsa_address_2'),
                'sCity'         => $this->config->get('smsa_city'),
                'sPhone'        => $this->config->get('smsa_telephone'),
                'sCntry'        => $this->config->get('smsa_country'),
                'prefDelvDate'  => '',
                'gpsPoints'     => ''
            );

            $xml = $this->createXml('http://track.smsaexpress.com/secom/addShip', 'addShip', $args);
            $result = $this->send($xml);
            
            $response = $result['soapBody']['addShipResponse']['addShipResult'];
            if(is_numeric($response)){
                $param = array(
                    'awbNo'  =>$response,
                    'passKey'=>$this->config->get('smsa_passkey'),
                );
                $PDF = $this->createXml('http://track.smsaexpress.com/secom/getPDF', 'getPDF', $param);
                $resultPDF = $this->send($PDF);

                $filename = $response.'.pdf';
                $file_path = str_replace('image', 'awb', DIR_IMAGE).$filename;
                $content =base64_decode($resultPDF['soapBody']['getPDFResponse']['getPDFResult']);
                $fp = fopen($file_path,"wb");
                fwrite($fp,$content);
                fclose($fp);

                $save_data = array(
                    'order_id'  => $this->request->get['order_id'],
                    'awb_number'    => $response,
                    'reference_number'  => $this->request->get['order_id'],
                    'pickup_date' => '',
                    'shipment_label' => $filename,
                    'status' => 'TrackShipment'
                );
                
				
                $this->load->model('shipping/smsa');
				$this->model_shipping_smsa->addConsignment($save_data);

                
                $json['success'] = $this->language->get('txt_success').' - '.$response;
            }else{
                $json['error'] = $response;

            }
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));       

    }
    
    public function cancelShipment(){
        $json = array();
        $this->load->language('shipping/smsa');

        if (!$this->user->hasPermission('modify', 'shipping/smsa')) {
            $json['error'] = $this->language->get('error_permission');
        }

        if(!$this->config->get('smsa_status')){
            $json ['error'] = $this->language->get('error_smsa_status');
        }

        if (!isset($this->request->get['order_id']) || !$this->request->get['order_id']) {
            $json ['error'] = $this->language->get('error_order_id');
        }

        if ($this->request->server['REQUEST_METHOD'] == 'POST') {

            if (empty($this->request->post['reason'])) {
                $json['error'] = $this->language->get('error_reason');
            }

            if(!isset($this->request->post['awb_number'])){
                $json['error'] = $this->language->get('error_awb_number');
            }          

        }

        if(!$json) {
            $this->load->model('sale/order');           
            $order_info = $this->model_sale_order->getOrder($this->request->get['order_id']);
            $args = array(
                'awbNo'     => $this->request->post['awb_number'],
                'passkey'   => $this->config->get('smsa_passkey'),
                'reas'      => $this->request->post['reason']
            );
        
            $xml = $this->createXml('http://track.smsaexpress.com/secom/cancelShipment', 'cancelShipment', $args);
            $result = $this->send($xml);
            if (strpos($result['soapBody']['cancelShipmentResponse']['cancelShipmentResult'], 'Success') !== false) {
                $save_data = array(
                    'order_id'  => $this->request->get['order_id'],
                    'awb_number'    => $this->request->post['awb_number'],
                    'reference_number'  =>'',
                    'pickup_date' => '',
                    'shipment_label' => '',
                    'status' => 'cancelShipment'
                );
                $this->load->model('shipping/smsa');
                $this->model_shipping_smsa->addConsignment($save_data);

                $json['success'] = $result['soapBody']['cancelShipmentResponse']['cancelShipmentResult'];
            } else {
                $json['error'] = $result['soapBody']['cancelShipmentResponse']['cancelShipmentResult'];
            }
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
       
    }

    public function trackShipment(){
        $this->load->language('account/smsa');

        $data['result'] = array();

        if($this->config->get('smsa_status') && (isset($this->request->get['awb_number']) || $this->request->get['awb_number'])){
            $args = array(
                'awbNo'     => $this->request->get['awb_number'],
                'passkey'   => $this->config->get('smsa_passkey'),
            );

            $xml = $this->createXml('http://track.smsaexpress.com/secom/getTracking', 'getTracking', $args);

            $result = $this->send($xml);

            if(isset($result['soapBody']['getTrackingResponse']['getTrackingResult']['diffgrdiffgram']) && $result['soapBody']['getTrackingResponse']['getTrackingResult']['diffgrdiffgram']){
                $response = $result['soapBody']['getTrackingResponse']['getTrackingResult']['diffgrdiffgram'];
                
                if(isset($response['NewDataSet']['Tracking'][0])){
                    $data['awbNo'] = $response['NewDataSet']['Tracking'][0]['awbNo'];
                    $data['status'] = $response['NewDataSet']['Tracking'][0]['Activity'];
                    unset($response['NewDataSet']['Tracking'][0]);
                    $data['result'] = $response['NewDataSet']['Tracking']; 
                } else {
                    $data['awbNo'] = $response['NewDataSet']['Tracking']['awbNo'];
                    $data['status'] = $response['NewDataSet']['Tracking']['Activity'];
                    $data['result'][] = $response['NewDataSet']['Tracking'];
                }
               
            }
        }
        
        $this->response->setOutput($this->load->view('shipping/smsa_track.tpl', $data));
       
    }
    
    public function createXml($SOAPAction, $method, $variables){
        $xmlcontent = '<?xml version="1.0" encoding="utf-8"?>
            <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
              <soap:Body>
                <'.$method.' xmlns="http://track.smsaexpress.com/secom/">';
                  if(count($variables)){
                    foreach($variables As $key=>$val){
                        $xmlcontent .= '<'.$key.'>'.$val.'</'.$key.'>';
                    }
                  }
        $xmlcontent .= '</'.$method.'>
              </soap:Body>
            </soap:Envelope>';
            
        $headers = array(
            "POST /SECOM/SMSAwebService.asmx HTTP/1.1",
            "Host: track.smsaexpress.com",
            "Content-Type: text/xml; charset=utf-8",
            "Content-Length: ".strlen($xmlcontent),
            "SOAPAction: ".$SOAPAction
        );
        
        return array(
            'xml'       => $xmlcontent,
            'header'    => $headers
        );
    }
    
    public function send($arg=array()){
        $ch = curl_init();
        //curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $arg['header']);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
        curl_setopt($ch, CURLOPT_URL, $this->_apiUrl);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $arg['xml']);
        $content=curl_exec($ch);
        
        $response = preg_replace("/(<\/?)(\w+):([^>]*>)/", "$1$2$3", $content);
        $xml = new SimpleXMLElement($response);
        $array = json_decode(json_encode((array)$xml), TRUE);
        return $array;
    }

	public function install() {
		$this->db->query("CREATE TABLE IF NOT EXISTS `".DB_PREFIX."smsa` (
		`consignment_id` int(11) NOT NULL AUTO_INCREMENT,
		`order_id` int(11) NOT NULL,
		`awb_number` varchar(32) NOT NULL,
		`reference_number` varchar(32) NOT NULL,
		`pickup_date` datetime NOT NULL,
		`shipment_label` text,
		`status` varchar(32) NOT NULL,
		`date_added` datetime NOT NULL,
		 PRIMARY KEY (`consignment_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=utf8");

		$directoryName = '../awb/';
		if(!is_dir($directoryName)){
		   mkdir($directoryName, 0755, true);
		}
	}
}