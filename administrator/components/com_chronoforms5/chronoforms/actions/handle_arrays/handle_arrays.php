<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\HandleArrays;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class HandleArrays extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'Handle Arrays';
	var $defaults = array(
		'enabled' => 1,
	);

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config handle_arrays_action_config', 'handle_arrays_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][enabled]', array('type' => 'dropdown', 'label' => l_('CF_ENABLED'), 'options' => array(0 => l_('NO'), 1 => l_('YES'))));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][fields_list]', array('type' => 'text', 'label' => l_('CF_FIELDS_LIST'), 'class' => 'XL', 'sublabel' => l_('CF_FIELDS_LIST_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][delimiter]', array('type' => 'text', 'label' => l_('CF_DELIMITER'), 'value' => ',', 'class' => 'SS', 'sublabel' => l_('CF_DELIMITER_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][skipped]', array('type' => 'text', 'label' => l_('CF_SKIPPED_FIELDS'), 'class' => 'XL', 'sublabel' => l_('CF_SKIPPED_FIELDS_DESC')));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}

	function execute(&$form, $action_id){
		$config =  $form->actions_config[$action_id];
		$config = new \GCore\Libs\Parameter($config);
		if((bool)$config->get('enabled', 0) === false){
			return;
		}
		$skipped = $config->get('skipped', '');
		if(!empty($skipped)){
			$skipped = explode(',', $skipped);
			array_walk($skipped, create_function('&$val', '$val = trim($val);'));
		}else{
			$skipped = array();
		}
		$del = $config->get('delimiter', ',');

		//handle specific fields only ?
		if(strlen($config->get('fields_list', ''))){
			$fields_list = explode(',', $config->get('fields_list', ''));
			foreach($fields_list as $field){
				$field = trim($field);
				//get field value
				$field_value = \GCore\Libs\Arr::getVal($form->data, explode('.', $field));
				if(is_array($field_value)){
					$form->data = \GCore\Libs\Arr::setVal($form->data, explode('.', $field), implode($del, $field_value));
				}
			}
		}else{
			$form->data = $this->array_handler($form->data, $skipped, $del);
		}
	}

	function array_handler($data = array(), $skipped = array(), $del = ','){
		foreach($data as $name => $value){
			if(is_array($value) AND !in_array($name, $skipped)){
				$value = $this->array_handler($value, $skipped, $del);
				$data[$name] = implode($del, $value);
			}
		}
		return $data;
	}
}