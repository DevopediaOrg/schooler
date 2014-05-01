<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Fields\Recaptcha;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class Recaptcha {
	static $title = 'Recaptcha';
	static $cat_id = 'advanced';
	static $cat_title = 'Advanced';
	static $settings = array(
		'tag' => 'input',
		'type' => 'custom',
		'name' => 'recaptcha',
		'id' => 'recaptcha',
		'label' => 'Enter Code',
		'sublabel' => '',
		'class' => '',
		'title' => '',
		'code' => '{ReCaptcha}',
	);
	
	static $configs = array(
		//'label' => array('value' => 'Enter Code', 'label' => 'Label', 'type' => 'text', 'class' => 'L', 'alt' => 'ghost'),
		'label.text' => array('value' => 'Enter Code', 'label' => 'Label', 'type' => 'text', 'class' => 'L'),
		'label.position' => array('values' => 'left', 'label' => 'Label position', 'type' => 'dropdown', 'options' => array('left' => 'Left', 'top' => 'Top')),
		'code' => array('value' => '{ReCaptcha}', 'label' => 'Code', 'type' => 'text', 'id' => 'recaptcha_field_code_{N}', 'readonly' => 'readonly', 'alt' => 'ghost'),
		'sublabel' => array('value' => '', 'label' => 'Sub Label', 'type' => 'text', 'class' => 'L'),
	);
	
	public static function element($data = array()){
		echo \GCore\Helpers\Html::formSecStart('original_element', 'recaptcha_origin');
		echo \GCore\Helpers\Html::formLine(self::$settings['name'], array_merge(self::$settings, $data));
		echo \GCore\Helpers\Html::formSecEnd();
	}
	
	public static function config($data = array(), $k = '{N}'){
		echo \GCore\Helpers\Html::formStart('original_element_config single_element_config', 'recaptcha_origin_config');
		echo \GCore\Helpers\Html::formSecStart();
		foreach(self::$configs as $name => $params){
			$value = \GCore\Libs\Arr::getVal($data, explode('.', $name));
			$field_name = implode('][', explode('.', $name));
			$params['value'] = $value ? (($params['type'] == 'text') ? htmlspecialchars($value, ENT_QUOTES) : $value) : (isset($params['value']) ? $params['value'] : '');
			$params['values'] = $value ? $value : (isset($params['values']) ? $params['values'] : '');
			echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.']['.$field_name.']', $params);
		}
		
		echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][name]', array('type' => 'hidden', 'alt' => 'ghost', 'value' => 'recaptcha'));
		echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][render_type]', array('type' => 'hidden', 'alt' => 'ghost', 'value' => 'recaptcha'));
		echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][type]', array('type' => 'hidden', 'alt' => 'ghost', 'value' => self::$settings['type']));
		echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][container_id]', array('type' => 'hidden', 'id' => 'container_id'.$k, 'value' => '0'));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}
?>