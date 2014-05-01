<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\MultiPage;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class MultiPage extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'Multi Page';
	static $group = array('utilities' => 'Utilities');
	var $defaults = array(
		'session_key' => '',
	);

	function execute(&$form, $action_id){
		$config = !empty($form->actions_config[$action_id]) ? $form->actions_config[$action_id] : array();
		$config = new \GCore\Libs\Parameter($config);

		$session = \GCore\Libs\Base::getSession();
		$session_key = $config->get('session_key', '');
		if(empty($session_key)){
			$session_key = $form->form['Form']['title'];
		}
		if($config->get('reset', 0)){
			$session->set('_chronoforms_paging_data_'.$session_key, array());
			$session->set('_chronoforms_paging_files_'.$session_key, array());
		}
		$stored_data = $session->get('_chronoforms_paging_data_'.$session_key, array());
		$stored_files = $session->get('_chronoforms_paging_files_'.$session_key, array());
		$session->set('_chronoforms_paging_data_'.$session_key, array_merge($stored_data, $form->data));
		$session->set('_chronoforms_paging_files_'.$session_key, array_merge($stored_files, $form->files));
		$form->data = array_merge($form->data, $session->get('_chronoforms_paging_data_'.$session_key, array()));
		$form->files = array_merge($form->files, $session->get('_chronoforms_paging_files_'.$session_key, array()));
	}

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config multi_page_action_config', 'multi_page_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();

		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][reset]', array('type' => 'dropdown', 'label' => l_('CF_MULTIPAGE_RESET'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_MULTIPAGE_RESET_DESC')));
		
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}