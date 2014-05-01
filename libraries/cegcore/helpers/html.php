<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Helpers;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class Html extends \GCore\Libs\Helper{
	static $counter = 1;
	static $usedIds = array();
	//static $last_field_params = array();
	//static $template = '';

	static $active_set = 'div';
	static $sets_config = array(
		'table' => array('table', 'tr', 'td'),
		'ul' => array('ul', 'li', 'div'),
		'div' => array('div', 'div', 'div'),
	);

	function __construct(){

	}
	/*
	public static function bs(){
		self::$template = 'bs';
	}
	*/
	public static function active_set($set = 'table'){
		self::$active_set = $set;
	}

	public static function set_tag($index){
		return self::$sets_config[self::$active_set][$index];
	}

	public static function image($src, $params = array()){
		$attributes = array('src', 'height', 'width', 'border', 'alt', 'rel', 'title', 'style', 'class', 'onclick');
		$params['src'] = $src;
		return self::_concat($params, $attributes, '<img ', ' />');
		break;
	}

	public static function url($text, $href = '', $params = array()){
		$attributes = array('href', 'target', 'alt', 'rel', 'title', 'style', 'class', 'onclick');
		//$params['href'] = $href;
		return self::_concat($params, $attributes, '<a href="'.$href.'" ', '>'.$text.'</a>');
		break;
	}

	public static function styles($styles = array()){
		if(is_string($styles)){
			return $styles;
		}
		return implode('; ', array_map(create_function('$k,$v', 'return $k.":".$v;'), array_keys($styles), array_values($styles)));
	}

	private static function _fix_field_params(&$params){
		//force field id if it doesn't exist
		if(!isset($params['id'])){
			$params['id'] = self::_field_uid('fld__#');
		}
		//fix field class
		if(!isset($params['class'])){
			$params['class'] = '';
		}
		//fix label params
		if(!isset($params['label'])){
			$params['label'] = null;
		}
		if(is_string($params['label']) AND !empty($params['label'])){
			$params['label'] = array('text' => $params['label']);
		}
		if(!isset($params['label']['text']) OR $params['label']['text'] == ''){
			$params['label'] = null;
		}
		if(!empty($params['label'])){
			if(!array_key_exists('for', $params['label']) OR (array_key_exists('for', $params['label']) AND strlen($params['label']['for']) == 0 AND $params['label']['for'] !== false)){
				$params['label']['for'] = isset($params['id']) ? $params['id'] : '';
			}
			if(empty($params['label']['position'])){
				$params['label']['position'] = 'left';
			}
		}
		//check multi inputs// not needed!
		/*if(!empty($params['type']) AND $params['type'] == 'multi' AND !empty($params['inputs'])){
			foreach($params['inputs'] as $k => $input){
				self::_fix_field_params($input);
				$params['inputs'][$k] = $input;
			}
		}*/
		/*if(!array_intersect(explode(' ', $params['class']), array('A', 'SSS', 'SS', 'S', 'M', 'L', 'XL', 'XXL', 'XXXL'))){
			$params['class'] = self::addClass(array('A'), $params['class']);
		}*/
	}

	public static function _concat($atts = array(), $valid = array(), $prefix = '', $postfix = ''){
		$out = array();
		foreach($atts as $k => $v){
			if(in_array($k, $valid) OR strpos($k, ':') === 0){
				if(is_array($v) AND $k == 'style'){
					$v = self::styles($v);
				}
				$k = str_replace(':', '', $k);
				$v = str_replace('&amp;', '&', $v);
				$out[] = $k.'="'.htmlspecialchars($v, ENT_QUOTES).'"';
			}
		}
		if(!empty($out)){
			return $prefix.implode(' ', $out).$postfix;
		}
		return $prefix.$postfix;
	}

	private static function _field_uid($id){
		$new_id = str_replace('__#', self::$counter, $id);
		if(!in_array($new_id, self::$usedIds)){
			self::$usedIds[] = $id = $new_id;
			//reset ids counter
			//self::$counter = 1;
			self::$counter++;
		}else{
			if($new_id != $id){
				self::$counter++;
				return self::_field_uid($id);
			}
		}
		return $id;
	}

	public static function html_label($params = array(), $f_params = array()){
		$attributes = array('for', 'class', 'id');
		$tag = 'label';
		$params['class'] = empty($params['class']) ? '' : $params['class'];

		if(!empty($params['sub'])){
			$params['class'] = self::addClass(array('gcore-sub-label'), $params['class']);
		}else{
			$params['position'] = !empty($params['position']) ? $params['position'] : 'left';
			$default_class = 'gcore-label-'.$params['position'];
			$params['class'] = empty($params['class']) ? $default_class : $params['class'];
		}

		return self::_concat($params, $attributes, '<'.$tag.' ', '>'.$params['text'].'</'.$tag.'>');
	}

	public static function container($tag = 'div', $html = '', $params = array()){
		if(!empty($params['id']) AND strpos($params['id'], '__#')){
			$params['id'] = self::_field_uid($params['id']);
		}
		return self::_concat($params, array_keys($params), '<'.$tag.(!empty($params) ? ' ': ''), '>'.$html.'</'.$tag.'>');
	}

	public static function html_formStart($class = 'gcore-all', $id = ''){
		return '<div class="'.$class.'"'.($id ? ' id="'.$id.'"' : '').'>';
	}

	public static function html_formSecStart($class = 'gcore-section', $id = ''){
		return '<'.self::set_tag(0).' class="'.$class.'"'.($id ? ' id="'.$id.'"' : '').'>';
	}

	public static function html_formSecEnd(){
		return '</'.self::set_tag(0).'>';
	}

	public static function html_formEnd(){
		return '</div>';
	}

	public static function html_formLine($name, $params = array()){
		$tags = array();
		switch($params['type']){
			default:
				$formInput = self::formInput($name, $params);
				$postfix = !empty($params['id']) ? '-'.$params['id'] : '__#';

				$table_cell_class = 'gcore-line-td';
				$form_cell = self::container(self::set_tag(2), $formInput, array('class' => $table_cell_class, 'id' => 'ftd'.$postfix));
				$tags[] = self::container(self::set_tag(1), $form_cell, array('class' => 'gcore-line-tr gcore-form-row', 'id' => 'ftr'.$postfix));
				break;
		}
		return implode("\n", $tags);
	}

	public static function html_formInput($name, $params = array(), $formInputParams = array()){
		$postfix = !empty($params['id']) ? '-'.$params['id'] : '__#';

		$tags = array();
		$class = 'gcore-input';
		if(!empty($params['label']['position']) AND $params['label']['position'] == 'top'){
			$class = 'gcore-input-wide';
		}
		if(!empty($formInputParams['class'])){
			$class .= ' '.$formInputParams['class'];
		}else{
			$class = (!empty($params['sub_input'])? 'gcore-input-container ' : '').'gcore-display-table '.$class;//gcore-input-container
		}

		$id = 'fin'.$postfix;
		if(!empty($formInputParams['id'])){
			$id = $formInputParams['id'];
		}
		switch($params['type']){
			case 'radio':
			case 'checkbox_group':
				$input = self::input($name, $params);
				$column = 'single';
				if(!empty($params['horizontal'])){
					$column = 'multiple';
				}
				$input = self::container('div', $input, array('class' => 'gcore-'.$column.'-column', 'id' => 'fclmn__#'));
				break;
			default:
				$input = self::input($name, $params);
				break;
		}
		//$params = self::$last_field_params;
		//the main label is NOT a sub label, inject it before the input
		if(!empty($params['label']) AND empty($params['label']['sub'])){
			$tags[] = self::label($params['label'], $params);
		}

		if(!empty($params['sublabel'])){
			//we have a secondary sublabel description
			$tags[] = self::container('div', $input.self::label(array('text' => $params['sublabel'], 'sub' => true), $params), array('class' => $class, 'id' => $id));
		}else{
			if($params['type'] == 'multi'){
				$tags[] = $input;
			}else{
				$tags[] = self::container('div', $input, array('class' => $class, 'id' => $id));
			}
		}
		//the main label is a sub label, inject it after the input
		if(!empty($params['label']) AND !empty($params['label']['sub'])){
			$tags[] = self::label($params['label'], $params);
		}

		return implode("\n", $tags);
	}

	public static function html_input($name, $params = array()){
		//reset ids counter
		//self::$counter = 1;
		$output = '';

		$tags = array();
		switch($params['type']){
			case 'hidden':
				$attributes = array('type', 'name', 'id', 'value', 'alt', 'class');
				$tags[] = self::_concat($params, $attributes, '<input ', ' />');
				break;
			case 'submit':
			case 'button':
			case 'reset':
				$attributes = array('type', 'name', 'id', 'value', 'class', 'style', 'onclick');
				$tags[] = self::_concat($params, $attributes, '<input ', ' />');
				break;
			case 'textarea':
				$attributes = array('name', 'id', 'class', 'rows', 'cols', 'title', 'style', 'onclick', 'onchange', 'alt', 'placeholder', 'readonly');
				$tags[] = self::_concat($params, $attributes, '<textarea ', '>'.(isset($params['value']) ? $params['value'] : '').'</textarea>');
				break;
			case 'dropdown':
				$attributes = array('name', 'id', 'class', 'title', 'multiple', 'size', 'style', 'onclick', 'onchange', 'alt');
				if(array_key_exists('multiple', $params) AND empty($params['multiple'])){
					unset($params['multiple']);
				}
				$set_empty = false;
				if(array_key_exists('empty', $params) AND !empty($params['empty'])){
					$set_empty = true;
				}
				$tags[] = self::_concat($params, $attributes, '<select ', '>');
				if(!empty($params['options']) AND is_array($params['options'])){
					if($set_empty){
						$params['options'] = array('' => $params['empty']) + $params['options'];
					}
					foreach($params['options'] as $value => $title){
						if(is_array($title)){
							//this is an optgroup
							$tags[] = self::_concat(array('label' => $value), array('value', 'label', 'class'), '<optgroup ', '>');
							foreach($title as $opt_v => $opt_l){
								$option_params = array('value' => $opt_v);
								if(isset($params['values']) AND in_array($opt_v, (array)$params['values'])){
									$option_params['selected'] = 'selected';
								}
								if(!empty($params['options_classes'][$opt_v])){
									$option_params['class'] = $params['options_classes'][$opt_v];
								}
								$tags[] = self::_concat($option_params, array('value', 'selected', 'class'), '<option ', '>'.$opt_l.'</option>');
							}
							$tags[] = '</optgroup>';
						}else{
							$option_params = array('value' => $value);
							if(isset($params['values']) AND in_array($value, (array)$params['values'])){
								$option_params['selected'] = 'selected';
							}
							if(!empty($params['options_classes'][$value])){
								$option_params['class'] = $params['options_classes'][$value];
							}
							$tags[] = self::_concat($option_params, array('value', 'selected', 'class'), '<option ', '>'.$title.'</option>');
						}
					}
				}
				$tags[] = '</select>';
				break;
			case 'radio':
				$attributes = array('type', 'name', 'id', 'class', 'title', 'value', 'style', 'checked', 'onclick', 'onchange', 'alt');
				if(!empty($params['ghost']) AND (bool)$params['ghost'] === true){
					$tags[] = self::input($params['name'], array('type' => 'hidden', 'value' => isset($params['ghost_value']) ? $params['ghost_value'] : ''));
				}
				if(!empty($params['options']) AND is_array($params['options'])){
					$id = $params['id'].'__#';
					$originals = $params;
					foreach($params['options'] as $value => $label){
						unset($params['checked']);
						if(isset($originals['value']) AND strlen($originals['value']) AND $value == $originals['value']){
							$params['checked'] = 'checked';
						}
						$params['value'] = $value;
						$params['id'] = self::_field_uid($id);
						$item = array();
						$item[] = self::_concat($params, $attributes, '<input ', ' />');
						$item[] = self::label(array('text' => $label, 'class' => 'gcore-label', 'for' => $params['id']), $params);
						$tags[] = self::container('div', implode("\n", $item), array('class' => 'gcore-radio-item', 'id' => 'fitem__#'));
					}
					$params['id'] = '';
				}
				break;
			case 'checkbox_group':
				$attributes = array('type', 'name', 'id', 'class', 'title', 'value', 'style', /*'_data',*/ 'checked', 'onclick', 'onchange', 'alt');
				if(!empty($params['ghost']) AND (bool)$params['ghost'] === true){
					$tags[] = self::input($params['name'], array('type' => 'hidden', 'value' => isset($params['ghost_value']) ? $params['ghost_value'] : ''));
				}
				$params['type'] = 'checkbox';
				if(!array_key_exists('brackets', $params) OR $params['brackets'] === true){
					$params['name'] = $params['name'].'[]';
				}
				if(!empty($params['options']) AND is_array($params['options'])){
					$id = $params['id'].'__#';
					foreach($params['options'] as $value => $label){
						unset($params['checked']);
						if(isset($params['values']) AND in_array($value, (array)$params['values'])){
							$params['checked'] = 'checked';
						}
						$params['value'] = $value;
						$params['id'] = self::_field_uid($id);
						$item = array();
						$item[] = self::_concat($params, $attributes, '<input ', ' />');
						$item[] = self::label(array('text' => $label, 'class' => 'gcore-label', 'for' => $params['id']), $params);
						$tags[] = self::container('div', implode("\n", $item), array('class' => 'gcore-checkbox-item', 'id' => 'fitem__#'));
					}
					$params['id'] = '';
				}
				break;
			case 'checkbox':
				$attributes = array('type', 'name', 'id', 'class', 'title', 'value', 'style', 'checked', 'onclick', 'onchange', 'alt');
				if(!empty($params['ghost']) AND (bool)$params['ghost'] === true){
					$tags[] = self::input($params['name'], array('type' => 'hidden', 'value' => isset($params['ghost_value']) ? $params['ghost_value'] : ''));
				}
				if(array_key_exists('checked', $params) AND empty($params['checked'])){
					unset($params['checked']);
				}
				if(array_key_exists('checked', $params) AND !empty($params['checked'])){
					$params['checked'] = 'checked';
				}
				if(array_key_exists('secondary_label', $params) AND !empty($params['secondary_label'])){
					$item = array();
					$item[] = self::_concat($params, $attributes, '<input ', ' />');
					$item[] = self::label(array('text' => $params['secondary_label'], 'class' => 'gcore-label', 'for' => $params['id']), $params);
					$tags[] = self::container('div', implode("\n", $item), array('class' => 'gcore-checkbox-item', 'id' => 'fitem__#'));
				}else{
					$tags[] = self::_concat($params, $attributes, '<input ', ' />');
				}
				break;
			case 'file':
				$attributes = array('type', 'name', 'id', 'class', 'title', 'style', 'onclick', 'onchange', 'alt');
				if(!empty($params['ghost']) AND (bool)$params['ghost'] === true){
					$tags[] = self::input($params['name'], array('type' => 'hidden', 'value' => isset($params['ghost_value']) ? $params['ghost_value'] : ''));
				}
				$tags[] = self::_concat($params, $attributes, '<input ', ' />');
				break;
			case 'text':
			case 'password':
				$attributes = array('type', 'name', 'id', 'value', 'class', 'size', 'maxlength', 'title', 'style', 'onclick', 'onchange', 'alt', 'placeholder', 'readonly');
				$params['id'] = self::_field_uid($params['id']);
				$tags[] = self::_concat($params, $attributes, '<input ', ' />');
				break;
			case 'multi':
				$layout = !empty($params['layout']) ? '-'.$params['layout'] : '';
				if(!empty($params['inputs'])){
					foreach($params['inputs'] as $sub_input){
						if(!empty($sub_input['name'])){
							//$tags[] = self::formInput($sub_input['name'], $sub_input, array('class' => 'gcore-subinput-container'.$layout, 'id' => 'fitem__#'));
							$sub_input['sub_input'] = true;
							$postfix = !empty($sub_input['id']) ? '-'.$sub_input['id'] : '__#';
							$generated_input = self::formInput($sub_input['name'], $sub_input, array('class' => 'gcore-subfield-container'.$layout, 'id' => 'fld'.$postfix));
							$tags[] = self::container('div', $generated_input, array('class' => 'gcore-subinput-container'.$layout, 'id' => 'fitem'.$postfix));
						}
					}
				}
				break;
			case 'custom':
				$tags[] = !empty($params['code']) ? $params['code'] : '';
				break;
		}
		//self::$last_field_params = $params;
		$return = implode("\n", $tags);
		if(!empty($params['beforeInput'])){
			$return = $params['beforeInput'].$return;
		}
		if(!empty($params['afterInput'])){
			$return = $return.$params['afterInput'];
		}
		return $return;
	}

	public static function addClass($new, $orig){
		if(is_array($orig)){
			return trim(implode(' ', array_merge($orig, (array)$new)));
		}else{
			$orig = array_filter(explode(' ', $orig));
			return trim(implode(' ', array_merge($orig, (array)$new)));
		}
	}

	public static function removeClass($rem, $orig){
		if(is_array($orig)){
			foreach($orig as $k => $class){
				if(in_array($class, $rem)){
					unset($orig[$k]);
				}
			}
			return implode(' ', $orig);
		}else{
			$orig = array_filter(explode(' ', $orig));
			return self::removeClass($rem, $orig);
		}
	}

	private static function _check_args($args){
		$name = $args[0];
		$params = $args[1];
		//make sure that we have a field name and type set
		if(empty($name) OR empty($params['type'])){
			return null;
		}
		self::_fix_field_params($params);
		$params['name'] = $name;
		return array(0 => $name, 1 => $params);
	}

	public function __call($name, $args){
		if(in_array($name, array('input', 'formInput', 'formLine'))){
			$args = self::_check_args($args);
			if(is_null($args)){
				return '';
			}
		}
		return parent::__call($name, $args);
	}

	public static function __callStatic($name, $args){
		if(in_array($name, array('input', 'formInput', 'formLine'))){
			$args = self::_check_args($args);
			if(is_null($args)){
				return '';
			}
		}
		return parent::__callStatic($name, $args);
	}
}