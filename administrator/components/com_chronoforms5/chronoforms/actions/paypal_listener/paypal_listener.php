<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\PaypalListener;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class PaypalListener extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'PayPal Listener';
	static $group = array('payments' => 'Payment Processors');
	var $events = array('verified' => 0, 'invalid' => 0, 'error' => 0);
	var $events_status = array('verified' => 'success', 'invalid' => 'fail', 'error' => 'fail');

	var $defaults = array(
		'sandbox' => 0,
	);

	function execute(&$form, $action_id){
		$config =  $form->actions_config[$action_id];
		$config = new \GCore\Libs\Parameter($config);

		// read the post from PayPal system and add 'cmd'
		$req = 'cmd=_notify-validate';

		foreach ($_POST as $key => $value) {
			$value = urlencode(stripslashes($value));
			$req .= "&$key=$value";
		}

		if((bool)$config->get('sandbox', 0) === true){
			$pp_hostname = "www.sandbox.paypal.com";
		}else{
			$pp_hostname = "www.paypal.com";
		}

		$header = "POST /cgi-bin/webscr HTTP/1.1\r\n";//$header = "POST /cgi-bin/webscr HTTP/1.0\r\n";
		// If testing on Sandbox use:
		if((bool)$config->get('sandbox', 0) === true){
			$header .= "Host: ".$pp_hostname.":443\r\n";
		}else{
			$header .= "Host: ".$pp_hostname.":443\r\n";
		}
		$header .= "Content-Type: application/x-www-form-urlencoded\r\n";
		$header .= "Content-Length: " . strlen($req) . "\r\n\r\n";

		$curl_result = $curl_err = '';
		$ch = curl_init();
		if((bool)$config->get('sandbox', 0) === true){
			curl_setopt($ch, CURLOPT_URL, 'https://'.$pp_hostname.'/cgi-bin/webscr');
		}else{
			curl_setopt($ch, CURLOPT_URL, 'https://'.$pp_hostname.'/cgi-bin/webscr');
		}
		//new change
		curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $req);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 1);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
		curl_setopt($ch, CURLOPT_HTTPHEADER, array('Host: '.$pp_hostname.''));


		$curl_result = @curl_exec($ch);
		$curl_err = curl_error($ch);
		curl_close($ch);
		if(!$curl_result){
			$this->events['error'] = 1;
		}else{
			if(strpos($curl_result, "VERIFIED") !== false){
				$valid = true;
				$this->set_events($valid, $form);
			}else{
				$valid = false;
				$this->set_events($valid, $form);
			}
		}
	}

	function set_events($valid = false, $form){
		if($valid){
			if($form->data['payment_status'] == 'Completed'){
				$this->events['verified'] = 1;
			}
		}else{
			$this->events['invalid'] = 1;
		}
	}

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config paypal_listener_action_config', 'paypal_listener_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][sandbox]', array('type' => 'dropdown', 'label' => l_('CF_PAYPAL_SANDBOX'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_PAYPAL_SANDBOX_DESC')));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}