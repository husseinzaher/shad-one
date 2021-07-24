<?php
class ModelTmdsmsTmdSms extends Model {

	public function sendSms($data){
		$tmdsmsurl = $this->config->get('tmdsms_url');
		$tmdsmsstatus =  $this->config->get('tmdsms_status');
		$method =  $this->config->get('tmdsms_method');

     	if(!empty($data['message']) && $tmdsmsstatus == 1 && $method == 1){
     		$find = array(
				'{mobileno}',
				'{message}',
				'&amp;'
			);

			$replace = array(
				'mobileno' =>$data['telephone'],
				'message' => urlencode($data['message']),
				'&amp;' =>'&'
			);
			
			$format = str_replace(array("\r\n", "\r", "\n"), '', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '', trim(str_replace($find, $replace, $tmdsmsurl)))); 
			
			$url = $format;
			$ch = curl_init($url);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
			$ssl=$this->config->get('tmdsms_ssl'); 
			if($ssl == 1){
				curl_setopt($ch,CURLOPT_SSL_VERIFYPEER, 3);
			}
			$curl_scraped_page = curl_exec($ch);
			curl_close($ch);
		}

	}
}
