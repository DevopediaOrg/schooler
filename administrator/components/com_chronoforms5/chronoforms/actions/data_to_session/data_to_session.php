<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\DataToSession;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class DataToSession extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'Data To Session';
	static $group = array('session' => 'Session');

	var $defaults = array(
		'namespace' => '',
		'key' => '',
		'merge' => 0
	);

	function execute(&$form, $action_id){
		$config =  $form->actions_config[$action_id];
		$config = new \GCore\Libs\Parameter($config);

		$session = \GCore\Libs\Base::getSession();
		$session_ns = $config->get('namespace', '');
		$session_key = $config->get('key', '');
		if(empty($session_key)){
			$session_key = $form->form['Form']['title'];
		}
		if(empty($session_ns)){
			$session_ns = 'default';
		}
		if($session->has('_chronoform_data_'.$session_key)){
			$stored = $session->get('_chronoform_data_'.$session_key, array());
			if(!empty($stored) AND is_array($stored) AND (bool)$config->get('merge', 0) === true){
				$session->set('_chronoform_data_'.$session_key, array_merge($stored, $form->data));
			}else{
				$session->set('_chronoform_data_'.$session_key, $form->data);
			}
		}else{
			$session->set('_chronoform_data_'.$session_key, $form->data);
		}
	}

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config session_to_data_action_config', 'session_to_data_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][merge]', array('type' => 'dropdown', 'label' => l_('CF_SESSION_MERGE'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_SESSION_MERGE_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][key]', array('type' => 'text', 'label' => l_('CF_SESSION_KEY'), 'sublabel' => l_('CF_SESSION_KEY_DESC')));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}