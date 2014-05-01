<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Fields\Container;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class Container {
	static $title = 'Container';
	static $cat_id = 'advanced';
	static $cat_title = 'Advanced';
	static $settings = array(
		'tag' => 'input',
		'type' => 'container',
		'name' => 'container',
		'id' => 'container',
		'label' => '',
		'sublabel' => '',
		'class' => '',
		'title' => '',
		'code' => 'Edit to change the element content.',
	);

	static $configs = array(
		'label' => array('value' => 'Container #{N}', 'label' => 'Label', 'type' => 'text', 'class' => 'L', 'alt' => 'ghost', 'id' => 'container_label_config_{N}'),
		'container_type' => array('value' => '', 'label' => 'Type', 'type' => 'dropdown', 'alt' => 'ghost', 'id' => 'container_type_config_{N}', 'options' => array(
			'' => 'None (Holder)',
			'page' => 'Page',
			'div' => 'DIV',
			'fieldset' => 'Field Set',
			'panel' => 'Panel',
			'tabs_area' => 'Tabs area',
			'pills_area' => 'Tabs area (Menus)',
			'tab' => 'Tab',
			'sliders_area' => 'Sliders area',
			'slider' => 'Slider',
			'multi_column' => 'Columns Container',
			'column' => 'Column (Resizable)',
			'custom' => 'Custom',
		)),
		'title' => array('value' => 'Container #{N}', 'label' => 'Title', 'type' => 'text', 'class' => 'L', 'alt' => 'ghost'),
		'id' => array('value' => 'chronoform-container-{N}', 'label' => 'ID', 'type' => 'text', 'class' => 'L', 'alt' => 'ghost'),
		'class' => array('value' => 'chronoform-container', 'label' => 'Class', 'type' => 'text', 'class' => 'L', 'alt' => 'ghost'),
		'start_code' => array('value' => '', 'label' => 'Start code', 'type' => 'textarea', 'cols' => 60, 'rows' => 5, 'alt' => 'ghost', 'sublabel' => 'The start code for a custom container.'),
		'end_code' => array('value' => '', 'label' => 'End code', 'type' => 'textarea', 'cols' => 60, 'rows' => 5, 'alt' => 'ghost', 'sublabel' => 'The end code for a custom container.'),
	);

	public static function element($data = array()){
		echo \GCore\Helpers\Html::formSecStart('original_element', 'container_origin');
		echo \GCore\Helpers\Html::formLine(self::$settings['name'], array_merge(self::$settings, $data));
		echo \GCore\Helpers\Html::formSecEnd();
	}

	public static function config($data = array(), $k = '{N}'){
		echo \GCore\Helpers\Html::formStart('original_element_config', 'container_origin_config');
		echo \GCore\Helpers\Html::formSecStart();
		foreach(self::$configs as $name => $params){
			$params['value'] = isset($data[$name]) ? (($params['type'] == 'text') ? htmlspecialchars($data[$name]) : $data[$name]) : (isset($params['value']) ? $params['value'] : '');
			$params['values'] = isset($data[$name]) ? $data[$name] : (isset($params['values']) ? $params['values'] : '');
			echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.']['.$name.']', str_replace('{N}', $k, $params));
		}

		//echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][code]', array('type' => 'hidden', 'alt' => 'ghost', 'value' => 'My container code here'));
		echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][name]', array('type' => 'hidden', 'alt' => 'ghost', 'value' => 'container'));
		echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][render_type]', array('type' => 'hidden', 'alt' => 'ghost', 'value' => 'container'));
		echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][type]', array('type' => 'hidden', 'alt' => 'ghost', 'value' => self::$settings['type']));
		echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][size][width]', array('type' => 'hidden', 'class' => 'fields_container_width', 'id' => 'fields_container_'.$k.'_width', 'value' => '99'));
		echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][collapsed]', array('type' => 'hidden', 'class' => 'fields_container_collapsed', 'id' => 'fields_container_'.$k.'_collapsed', 'value' => '0'));
		echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][container_id]', array('type' => 'hidden', 'id' => 'container_id'.$k, 'value' => '0'));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}
?>