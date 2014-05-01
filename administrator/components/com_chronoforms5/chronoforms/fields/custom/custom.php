<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Fields\Custom;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class Custom {
	static $title = 'Custom';
	static $cat_id = 'advanced';
	static $cat_title = 'Advanced';
	static $settings = array(
		'tag' => 'input',
		'type' => 'custom',
		'name' => 'custom',
		'id' => 'custom',
		'label' => 'Custom Code',
		'sublabel' => '',
		'class' => '',
		'title' => '',
		'code' => 'The custom element code should go here.',
	);
	
	static $configs = array(
		'label' => array('value' => 'Custom Code', 'label' => 'Label', 'type' => 'text', 'class' => 'L', 'alt' => 'ghost'),
		'code' => array('value' => 'The custom element code should go here.', 'label' => 'Code', 'type' => 'textarea', 'id' => 'custom_field_code_{N}', 'rows' => 15, 'cols' => 70, 'alt' => 'ghost', ':data-render' => 'no'),
	);
	
	public static function element($data = array()){
		if(!empty($data['code'])){
			$data['code'] = '';
		}
		echo \GCore\Helpers\Html::formSecStart('original_element', 'custom_origin');
		echo \GCore\Helpers\Html::formLine(self::$settings['name'], array_merge(self::$settings, $data));
		echo \GCore\Helpers\Html::formSecEnd();
	}
	
	public static function config($data = array(), $k = '{N}'){
		echo \GCore\Helpers\Html::formStart('original_element_config single_element_config', 'custom_origin_config');
		echo \GCore\Helpers\Html::formSecStart();
		foreach(self::$configs as $name => $params){
			$params['value'] = isset($data[$name]) ? (($params['type'] == 'text') ? htmlspecialchars($data[$name]) : $data[$name]) : (isset($params['value']) ? $params['value'] : '');
			$params['values'] = isset($data[$name]) ? $data[$name] : (isset($params['values']) ? $params['values'] : '');
			echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.']['.$name.']', $params);
		}
		
		echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][load_editor]', array('type' => 'button', 'class' => 'btn btn-primary', 'value' => l_('CF_LOAD_EDITOR'), 'onclick' => 'toggleEditor(this, \'custom_field_code_'.$k.'\');'));
		//echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][code]', array('type' => 'hidden', 'alt' => 'ghost', 'value' => 'My custom code here'));
		echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][name]', array('type' => 'hidden', 'alt' => 'ghost', 'value' => 'custom'));
		echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][render_type]', array('type' => 'hidden', 'alt' => 'ghost', 'value' => 'custom'));
		echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][type]', array('type' => 'hidden', 'alt' => 'ghost', 'value' => self::$settings['type']));
		echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][container_id]', array('type' => 'hidden', 'id' => 'container_id'.$k, 'value' => '0'));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}
?>