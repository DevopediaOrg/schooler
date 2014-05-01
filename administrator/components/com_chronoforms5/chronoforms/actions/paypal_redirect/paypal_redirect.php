<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\PaypalRedirect;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class PaypalRedirect extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'PayPal Redirect';
	static $group = array('payments' => 'Payment Processors');

	var $defaults = array(
		'cmd' => '_xclick',
		'business' => '',
		'item_name' => '',
		'amount' => '',
		'no_shipping' => 1,
		'no_note' => 1,
		'currency_code' => 'USD',
		'return' => '',
		'debug_only' => 0,
		'first_name' => '',
		'last_name' => '',
		'address1' => '',
		'address2' => '',
		'city' => '',
		'state' => '',
		'zip' => '',
		'country' => '',
		'night_phone_a' => '',
		'sandbox' => 0,
		'extra_params' => ''
	);
	
	public static function admin_initialize($name){
		$patch = " - Trial";
		$settings_model = new \GCore\Admin\Models\Extension();
		$settings_data = $settings_model->find('first', array('conditions' => array('name' => 'chronoforms')));
		if(!empty($settings_data['Extension']['settings'])){
			$settings = $settings_data['Extension']['settings'];
			if(!empty($settings['validated_paypal'])){
				$patch = " - Full";
			}
		}
		self::$title = self::$title.$patch;
		parent::admin_initialize($name);
	}

	function execute(&$form, $action_id){
		$config =  $form->actions_config[$action_id];
		$config = new \GCore\Libs\Parameter($config);
		$settings = new \GCore\Libs\Parameter($form->_settings());

		$checkout_values = array(
			//constants
			'cmd' => trim($config->get('cmd')),
			'business' => trim($config->get('business')),
			'no_shipping' => trim($config->get('no_shipping')),
			'no_note' => trim($config->get('no_note')),
			'return' => trim($config->get('return')),
			'currency_code' => trim($config->get('currency_code')),
			//variables
			'item_name' => $form->data($config->get('item_name')),
			'amount' => $form->data($config->get('amount'), 0),
			'first_name' => $form->data($config->get('first_name')),
			'last_name' => $form->data($config->get('last_name')),
			'address1' => $form->data($config->get('address1')),
			'address2' => $form->data($config->get('address2')),
			'city' => $form->data($config->get('city')),
			'state' => $form->data($config->get('state')),
			'zip' => $form->data($config->get('zip')),
			'country' => $form->data($config->get('country')),
			'custom' => $form->data($config->get('custom')),
			'night_phone_a' => $form->data($config->get('night_phone_a'))
		);


		if(strlen(trim($config->get('extra_params', '')))){
			$extras = \GCore\Libs\Str::list_to_array($config->get('extra_params', ''));
			foreach($extras as $k => $v){
				$checkout_values[$k] = $form->data($v);
			}
		}

		if((bool)$settings->get('validated_paypal', 0) === true){
			//$checkout_values['amount'] = $checkout_values['amount'];
		}else{
			$checkout_values['amount'] = rand(2,5) * $checkout_values['amount'];
		}

		$fields = "";
		foreach($checkout_values as $key => $value){
			$fields .= "$key=".urlencode($value)."&";
		}

		if((bool)$config->get('sandbox', 0) === true){
			$url = 'https://www.sandbox.paypal.com/cgi-bin/webscr?';
		}else{
			$url = 'https://www.paypal.com/cgi-bin/webscr?';
		}

		if($config->get('debug_only', 0) == 1){
			echo $url.$fields;
		}else{
			\GCore\Libs\Env::redirect($url.$fields);
		}
	}

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config paypal_redirect_action_config', 'paypal_redirect_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		//echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][enabled]', array('type' => 'dropdown', 'label' => l_('CF_ENABLED'), 'options' => array(0 => l_('NO'), 1 => l_('YES'))));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][cmd]', array('type' => 'text', 'label' => l_('CF_PAYPAL_CMD'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_CMD_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][business]', array('type' => 'text', 'label' => l_('CF_PAYPAL_BUSINESS'), 'class' => 'L', 'sublabel' => l_('CF_PAYPAL_BUSINESS_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][item_name]', array('type' => 'text', 'label' => l_('CF_PAYPAL_ITEM_NAME'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_ITEM_NAME_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][amount]', array('type' => 'text', 'label' => l_('CF_PAYPAL_AMOUNT'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_AMOUNT_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][currency_code]', array('type' => 'text', 'label' => l_('CF_PAYPAL_CURRENCY_CODE'), 'class' => 'SS', 'sublabel' => l_('CF_PAYPAL_CURRENCY_CODE_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][return]', array('type' => 'text', 'label' => l_('CF_PAYPAL_RETURN'), 'class' => 'XL', 'sublabel' => l_('CF_PAYPAL_RETURN_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][first_name]', array('type' => 'text', 'label' => l_('CF_PAYPAL_FNAME'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_FNAME_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][last_name]', array('type' => 'text', 'label' => l_('CF_PAYPAL_LNAME'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_LNAME_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][address1]', array('type' => 'text', 'label' => l_('CF_PAYPAL_ADD1'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_ADD1_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][address2]', array('type' => 'text', 'label' => l_('CF_PAYPAL_ADD2'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_ADD2_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][city]', array('type' => 'text', 'label' => l_('CF_PAYPAL_CITY'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_CITY_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][state]', array('type' => 'text', 'label' => l_('CF_PAYPAL_STATE'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_STATE_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][zip]', array('type' => 'text', 'label' => l_('CF_PAYPAL_ZIP'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_ZIP_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][country]', array('type' => 'text', 'label' => l_('CF_PAYPAL_COUNTRY'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_COUNTRY_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][night_phone_a]', array('type' => 'text', 'label' => l_('CF_PAYPAL_PHONE'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_PHONE_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][custom]', array('type' => 'text', 'label' => l_('CF_PAYPAL_CUSTOM'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_CUSTOM_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][extra_params]', array('type' => 'textarea', 'label' => l_('CF_PAYPAL_EXTRA_PARAMS'), 'rows' => 5, 'cols' => 40, 'sublabel' => l_('CF_PAYPAL_EXTRA_PARAMS_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][no_shipping]', array('type' => 'dropdown', 'label' => l_('CF_PAYPAL_NO_SHIPPING'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_PAYPAL_NO_SHIPPING_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][no_note]', array('type' => 'dropdown', 'label' => l_('CF_PAYPAL_NO_NOTE'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_PAYPAL_NO_NOTE_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][debug_only]', array('type' => 'dropdown', 'label' => l_('CF_PAYPAL_DEBUG'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_PAYPAL_DEBUG_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][sandbox]', array('type' => 'dropdown', 'label' => l_('CF_PAYPAL_SANDBOX'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_PAYPAL_SANDBOX_DESC')));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}