<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\Curl;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class Curl extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'Curl';
	static $group = array('utilities' => 'Utilities');
	var $defaults = array(
		'header_in_response' => 0,
	);

	function execute(&$form, $action_id){
		$config = !empty($form->actions_config[$action_id]) ? $form->actions_config[$action_id] : array();
		$config = new \GCore\Libs\Parameter($config);

		if(function_exists('curl_init')){
            $form->debug[$action_id][self::$title][] = "CURL OK : the CURL function was found on this server.";
        }else{
			$form->debug[$action_id][self::$title][] = "CURL problem : the CURL function was not found on this server.";
			$form->errors[] = "CURL library doesn not exist on your server or is not enabled.";
			return;
		}

		$content = $config->get('content');
		$curl_values = array();
		if($content){
			$curl_values = \GCore\Libs\Str::list_to_array($content);
			foreach($curl_values as $k => $v){
				$curl_values[$k] = $form->data($v);
			}
		}
		$query = http_build_query($curl_values);

		$form->debug[$action_id][self::$title][] = '$curl_values: '.print_r($query, true);
		$form->debug[$action_id][self::$title][] = 'curl_target_url: '.$config->get('target_url');
		$ch = curl_init($config->get('target_url'));
		curl_setopt($ch, CURLOPT_HEADER, $config->get('header_in_response', 0));// set to 0 to eliminate header info from response
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);// Returns response data instead of TRUE(1)
		curl_setopt($ch, CURLOPT_POSTFIELDS, $query);// use HTTP POST to send form data
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
		$response = curl_exec($ch);//execute post and get results
		
		$form->debug[$action_id][self::$title][] = 'curl_errors: '.curl_error($ch);
		$form->debug[$action_id][self::$title][] = 'curl_info: '.print_r(curl_getinfo($ch), true);
		curl_close($ch);

		//add the response in the form data array
		$form->data['curl'] = $response;
	}

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config curl_action_config', 'curl_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();

		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][target_url]', array('type' => 'text', 'label' => l_('CF_CURL_TARGET_URL'), 'class' => 'XL', 'sublabel' => l_('CF_CURL_TARGET_URL_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][header_in_response]', array('type' => 'dropdown', 'label' => l_('CF_CURL_HEADER_RESPONSE'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_CURL_HEADER_RESPONSE_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][content]', array('type' => 'textarea', 'label' => l_('CF_CURL_PARAMS'), 'rows' => '10', 'cols' => '60', 'sublabel' => l_('CF_CURL_PARAMS_DESC')));

		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}