<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Fields\Multi;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class Multi {
	static $title = 'Multi Field';
	static $cat_id = 'advanced';
	static $cat_title = 'Advanced';
	static $settings = array(
		'tag' => 'input',
		'type' => 'multi',
		'name' => 'multi',
		'label' => '',
		'sublabel' => '',
		'class' => '',
		'title' => '',
		//'layout' => 'wide',
		'inputs' => array(
			/*'multi_1' => array(
				'type' => 'text',
				'name' => 'multi_1',
				'id' => 'multi_1',
				'sublabel' => '',
			)*/
		)
	);
	
	static $configs = array(
		'label' => array('value' => 'Multi Field', 'label' => 'Label', 'type' => 'text', 'class' => 'L'),
	);
	
	public static function element($data = array()){
		if(!empty($data['inputs'])){
			foreach($data['inputs'] as $k => $input){
				if(isset($input['options']) AND is_string($input['options'])){
					$options = array();
					if(!empty($input['options'])){
						$lines = explode("\n", $input['options']);
						foreach($lines as $line){
							$opts = explode("=", $line);
							$options[trim($opts[0])] = isset($opts[1]) ? trim($opts[1]) : trim($opts[0]);
						}
					}
					$data['inputs'][$k]['options'] = $options;
				}
			}
		}
		echo \GCore\Helpers\Html::formSecStart('original_element', 'multi_origin');
		echo \GCore\Helpers\Html::formLine(self::$settings['name'], array_merge(self::$settings, $data));
		echo \GCore\Helpers\Html::formSecEnd();
	}
	
	public static function config($data = array(), $k = '{N}'){
		echo '<div class="original_element_config">';//\GCore\Helpers\Html::formSecStart('original_element_config', 'multi_origin_config');
		$sub_fields_count = $k;
		$fields = !empty($data['inputs']) ? $data['inputs'] : array();
		$i = 0;
		foreach($fields as $sub_id => $field){
			$sub_type = !empty($field['render_type']) ? $field['render_type'] : $field['type'];
			$class = '\GCore\Admin\Extensions\Chronoforms\Fields\\'.\GCore\Libs\Str::camilize($sub_type).'\\'.\GCore\Libs\Str::camilize($sub_type);
			ob_start();
			$class::config($field, $sub_fields_count);
			$con = ob_get_clean();
			$con = str_replace('{N}', $sub_fields_count, $con);
			$con = str_replace('Form[extras][fields]['.$sub_fields_count.']', 'Form[extras][fields]['.$k.'][inputs]['.$sub_id.']', $con);
			$con = str_replace('-'.$sub_fields_count, '-'.$k.'-'.$i, $con);//fix for tabs
			$con = str_replace('original_element_config', '', $con);
			echo '<div class="panel panel-default">';
			echo '<div class="well well-sm">'.$sub_id.'</div>';
			echo $con;
			echo '</div>';
			$sub_fields_count++;
			$i++;
		}
		echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][type]', array('type' => 'hidden', 'value' => 'multi'));
		echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][id]', array('type' => 'hidden', 'value' => 'multi-'.$k));
		//echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][layout]', array('type' => 'hidden', 'value' => 'wide'));
		echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][name]', array('type' => 'hidden', 'value' => 'multi'));
		echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][container_id]', array('type' => 'hidden', 'id' => 'container_id'.$k, 'value' => '0'));
		echo '</div>';//\GCore\Helpers\Html::formSecEnd();
	}
}
?>