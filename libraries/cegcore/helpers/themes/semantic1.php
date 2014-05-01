<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Helpers\Themes;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class Semantic1 extends \GCore\Helpers\Theme {
	var $view;
	
	function __construct(){
		$doc = \GCore\Libs\Document::getInstance();
		$doc->_('jquery');
		$doc->_('semantic-ui');
	}
	
	public static function html_label($params = array(), $f_params = array()){
		$attributes = array('for', 'class', 'id');
		//$class = 'gform-label-'.$params['position'].' control-label';
		if(!empty($params['sub'])){
			$class = 'help-block';
			$tag = 'span';
		}else{
			$class = '';
			$tag = 'label';
			if(!empty($params['position']) AND $params['position'] == 'left'){
				$class .= ' gcore-label-left';
			}else{
				$class .= ' gcore-label';
			}
			if(in_array($f_params['type'], array('checkbox', 'checkbox_group', 'radio'))){
				$class .= ' gcore-label-checkbox';
			}
		}
		$params['class'] = $class;
		return \GCore\Helpers\Html::_concat($params, $attributes, '<'.$tag.' ', '>'.$params['text'].'</'.$tag.'>');
	}
	
	public static function html_formStart($class = 'ui segment-', $id = ''){
		return '<div class="'.$class.'" id="'.$id.'">';
	}
	
	public static function html_formSecStart($class = 'ui form', $id = ''){
		return '<div class="'.$class.'" id="'.$id.'">';
	}
	
	public static function html_formSecEnd(){
		return '</div>';
	}
	
	public static function html_formEnd(){
		return '</div>';
	}
	
	public static function html_input($name, $params = array()){
		if(in_array($params['type'], array('button', 'reset', 'submit'))){
			$params['class'] = 'ui small submit button '.$params['class'];
		}
		if(in_array($params['type'], array('dropdown'))){
			$params['class'] = 'ui dropdown selection '.$params['class'];
		}
		return \GCore\Helpers\Html::html_input($name, $params);
	}
	
	public static function html_formInput($name, $params = array(), $formInputParams = array()){
		$fixed_width_classes = array_intersect(explode(' ', $params['class']), array('A', 'SSS', 'SS', 'S', 'M', 'L', 'XL', 'XXL', 'XXXL'));
		if(!$fixed_width_classes){
			$fixed_width_classes = array('A');
			$params['class'] = \GCore\Helpers\Html::addClass($fixed_width_classes, $params['class']);
		}
		if(!empty($params['inputs'])){
			$inputs = array();
			foreach($params['inputs'] as $sub_input){
				if(!empty($sub_input['name'])){
					$generated_input = \GCore\Helpers\Html::formLine($sub_input['name'], $sub_input);
					$inputs[] = $generated_input;
				}
			}
			$input = implode("\n", $inputs);
		}else{
			$input = self::html_input($name, $params);
		}
		//$input = str_replace('gcore-radio-item', 'gcore-radio-item ui radio checkbox', $input);
		//$input = str_replace('gcore-checkbox-item', 'gcore-checkbox-item ui checkbox', $input);
		if($params['type'] == 'multi'){
			return $input;
		}
		$tags = array();
		$input_class = array('ui', 'left', 'input');
		
		$input_class[] = 'gcore-display-table';
		if(!empty($params['horizontal'])){
			$input_class[] = 'gcore-multiple-column';
		}
		$input_class[] = implode(' ', $fixed_width_classes);
		if(in_array($params['type'], array('button', 'reset', 'submit'))){
			$input_class = array('ui', 'left');
		}
		$input_attachments = array();
		if(!empty($params['icon'])){
			$input_class[] = 'icon';
			$input_attachments[] = $params['icon'];
		}
		if(!empty($params['labeled'])){
			$input_class[] = 'labeled';
			$input_attachments[] = '<div class="ui corner label">'.$params['labeled'].'</div>';
		}
		$tags[] = '<div class="'.implode(' ', $input_class).'">';
		$tags[] = $input;
		$tags = array_merge($tags, $input_attachments);
		$tags[] = '</div>';
		return implode("\n", $tags);
	}
	
	public static function html_formLine($name, $params = array()){
		$input = self::html_formInput($name, $params);
		$tags = array();
		$inline = '';
		if(!empty($params['label']['position']) AND ($params['label']['position'] == 'left') AND empty($params['icon']) AND empty($params['labeled'])){
			//$inline = 'inline ';
		}
		$class = 'field';
		if($params['type'] == 'multi'){
			$class = 'fields';
		}
		$tags[] = '<div class="'.$inline.$class.'">';
		if(!empty($params['label']) AND empty($params['label']['sub'])){
			$tags[] = self::html_label($params['label'], $params);
		}
		$tags[] = $input;
		$tags[] = '</div>';
		return implode("\n", $tags);
	}
	
	
	public static function data_table_build($params = array()){
		$params['class'] = 'ui table segment attached';
		return \GCore\Helpers\DataTable::data_table_build($params);
	}
	
	public static function data_table_headerPanel($content = ''){
		$content = '<div class="ui segment attached top">'.$content.'</div>';
		return $content;
	}
	
	public static function data_table_footerPanel($content = ''){
		$content = '<div class="ui segment attached bottom">'.$content.'</div>';
		return $content;
	}
	
	public static function data_table__l($content = ''){
		$content = '<div class="" style="float:left;">'.$content.'</div>';
		return $content;
	}
	
	public static function data_table__r($content = ''){
		$content = '<div class="" style="float:right;">'.$content.'</div>';
		return $content;
	}
	
	
	public static function sorter_build_link_params($text, $params, $drc, $active){
		$data = array();
		if($active){
			$params['class'] = 'ui label mini icon black';
			$text = $text.' <i class="icon sort attributes '.$drc.'ending"></i>';
		}else{
			$params['class'] = 'icon';
			$text = $text.'<i class="icon sort"></i>';
		}
		return array('params' => $params, 'text' => $text);
	}
	
	
	public function paginator_get_nav_link($title, $url, $type, $disabled = false, $lang = array()){
		$styles = array();
		switch($type){
			case 'previous':
			$class = 'item';
			break;
			case 'first':
			$class = 'item';
			break;
			case 'last':
			$class = 'item';
			break;
			case 'next':
			$class = 'item';
			break;
		}
		if($disabled){
			$class .= ' disabled';
			$url = 'javascript:void(0);';
		}
		return \GCore\Helpers\Html::url($title, $url, array('class' => $class, 'style' => $styles));
	}
	
	public function paginator_get_number_link($url, $page, $active = false){
		$class = 'item';
		if($active){
			$class .= ' active';
		}
		return \GCore\Helpers\Html::url($page, $url, array('class' => $class));
	}
	
	public function paginator_get_numbers_links($list){
		return implode("\n", $list);
	}
	
	function paginator_full_nav($first, $prev, $numbers, $next, $last){
		$full = \GCore\Helpers\Html::container('div', $first.$prev.$numbers.$next.$last, array('class' => 'ui pagination menu small'));
		return $full;
	}
	
	
	public static function toolbar_renderTitle(){
		$title = \GCore\Helpers\Toolbar::getTitle();
		if(!empty($title)){
			return '<h1 class="ui header large floated left">'.$title.'</h1>';
		}
	}
	
	public static function toolbar_renderBar($clearBuffer = true){
		$return = \GCore\Helpers\Toolbar::toolbar_renderBar($clearBuffer);
		return '<div class="ui right floated header">'.$return.'</div>';
	}
}