<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\PaypalData;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class PaypalData extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'PayPal Data Processor';
	static $group = array('payments' => 'Payment Processors');
	var $events = array('verified' => 0, 'invalid' => 0, 'error' => 0);
	var $events_status = array('verified' => 'success', 'invalid' => 'fail', 'error' => 'fail');

	var $defaults = array(
		'sandbox' => 0,
	);

	function execute(&$form, $action_id){
		$config =  $form->actions_config[$action_id];
		$config = new \GCore\Libs\Parameter($config);

		if((bool)$config->get('sandbox', 0) === true){
			$pp_hostname = "www.sandbox.paypal.com";
		}else{
			$pp_hostname = "www.paypal.com";
		}
		// read the post from PayPal system and add 'cmd'
		$req = 'cmd=_notify-synch';

		$tx_token = $form->data['tx'];
		$auth_token = $config->get('auth_token', '');
		$req .= "&tx=$tx_token&at=$auth_token";

		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, "https://$pp_hostname/cgi-bin/webscr");
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $req);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 1);
		//set cacert.pem verisign certificate path in curl using 'CURLOPT_CAINFO' field here,
		//if your server does not bundled with default verisign certificates.
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
		curl_setopt($ch, CURLOPT_HTTPHEADER, array("Host: $pp_hostname"));
		$res = curl_exec($ch);
		curl_close($ch);

		if(!$res){
			//HTTP ERROR
			$this->events['error'] = 1;
		}else{
			// parse the data
			$lines = explode("\n", $res);
			$keyarray = array();
			if(strcmp ($lines[0], "SUCCESS") == 0){
				for($i=1; $i<count($lines);$i++){
					list($key,$val) = explode("=", $lines[$i]);
					$keyarray[urldecode($key)] = urldecode($val);
				}
				// check the payment_status is Completed
				// check that txn_id has not been previously processed
				// check that receiver_email is your Primary PayPal email
				// check that payment_amount/payment_currency are correct
				// process payment
				$firstname = $keyarray['first_name'];
				$lastname = $keyarray['last_name'];
				$itemname = $keyarray['item_name'];
				$amount = $keyarray['payment_gross'];

				$this->events['verified'] = 1;
			}else if(strcmp ($lines[0], "FAIL") == 0){
				$this->events['invalid'] = 1;
			}
		}
	}

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config paypal_data_action_config', 'paypal_data_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][sandbox]', array('type' => 'dropdown', 'label' => l_('CF_PAYPAL_SANDBOX'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_PAYPAL_SANDBOX_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][auth_token]', array('type' => 'text', 'label' => l_('CF_PAYPAL_AUTH_TOKEN'), 'class' => 'XL', 'sublabel' => l_('CF_PAYPAL_AUTH_TOKEN_DESC')));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}