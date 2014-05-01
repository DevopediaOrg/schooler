<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Fields\Submit;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class Submit {
	static $title = 'Submit Button';
	static $cat_id = 'basic';
	static $cat_title = 'Basic';
	static $settings = array(
		'tag' => 'input',
		'type' => 'submit',
		'render_type' => 'submit',
		'name' => 'button_',
		'id' => 'button_',
		'value' => 'Submit',
		'class' => '',
		'style' => ''
	);

	static $configs = array(
		'render_type' => array('value' => 'submit', 'type' => 'hidden', 'class' => 'L'),
		'name' => array('value' => 'button{N}', 'label' => 'Name', 'type' => 'text', 'class' => 'element_field_name'),
		'id' => array('value' => 'button{N}', 'label' => 'ID', 'type' => 'text', 'class' => 'L'),
		'type' => array('values' => 'submit', 'label' => 'Type', 'type' => 'dropdown', 'options' => array('submit' => 'submit', 'reset' => 'reset', 'button' => 'button')),
		'value' => array('value' => 'Submit', 'label' => 'Value/Label', 'type' => 'text', 'class' => 'L'),
		'class' => array('value' => '', 'label' => 'Class', 'type' => 'text', 'class' => 'L'),
		'style' => array('value' => '', 'label' => 'Style', 'type' => 'text', 'class' => 'L'),
		'params' => array('value' => '', 'label' => 'Extra params', 'type' => 'textarea', 'alt' => 'multiline', 'rows' => 5, 'cols' => 60, 'sublabel' => 'In Multiline format:param_name=param_value'),
		':data-load-state' => array('label' => 'Load state', 'type' => 'dropdown', 'options' => array('' => 'Visible & Enabled', 'hidden' => 'Hidden', 'hidden_parent' => 'Parent hidden', 'disabled' => 'Disabled')),
	);

	public static function element($data = array()){
		echo \GCore\Helpers\Html::formSecStart('original_element', 'submit_origin');
		echo \GCore\Helpers\Html::formLine(self::$settings['name'], array_merge(self::$settings, $data, array('type' => 'button')));
		echo \GCore\Helpers\Html::formSecEnd();
	}

	public static function config($data = array(), $k = '{N}'){
		echo \GCore\Helpers\Html::formStart('original_element_config single_element_config', 'submit_origin_config');
		echo \GCore\Helpers\Html::formSecStart();
		foreach(self::$configs as $name => $params){
			$params['value'] = isset($data[$name]) ? (($params['type'] == 'text') ? htmlspecialchars($data[$name]) : $data[$name]) : (isset($params['value']) ? $params['value'] : '');
			$params['values'] = isset($data[$name]) ? $data[$name] : (isset($params['values']) ? $params['values'] : '');
			echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.']['.$name.']', $params);
		}
		//echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][type]', array('type' => 'hidden', 'value' => self::$settings['type']));
		echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][container_id]', array('type' => 'hidden', 'id' => 'container_id'.$k, 'value' => '0'));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}
?>