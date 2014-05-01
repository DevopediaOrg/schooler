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
class Bootstrap3 extends \GCore\Helpers\Theme {
	var $view;

	function __construct(){
		$doc = \GCore\Libs\Document::getInstance();
		$doc->_('jquery');
		$doc->_('bootstrap');
	}

	public static function html_label($params = array(), $f_params = array()){
		$attributes = array('for', 'class', 'id');
		//$class = 'gform-label-'.$params['position'].' control-label';
		if(!empty($params['sub'])){
			$class = 'help-block';
			$tag = 'span';
		}else{
			$class = 'control-label';
			$tag = 'label';
			if(!empty($params['position']) AND $params['position'] == 'left'){
				$class .= ' gcore-label-left';
			}
			if(!empty($params['position']) AND $params['position'] == 'top'){
				$class .= ' gcore-label-top';
			}
			if(in_array($f_params['type'], array('checkbox', 'checkbox_group', 'radio'))){
				$class .= ' gcore-label-checkbox';
			}
		}
		$params['class'] = $class;
		return \GCore\Helpers\Html::_concat($params, $attributes, '<'.$tag.' ', '>'.$params['text'].'</'.$tag.'>');
	}

	public static function html_formSecStart($class = 'form-horizontal', $id = ''){
		return '<div class="'.$class.'" id="'.$id.'">';
	}

	public static function html_formLine($name, $params = array()){
		$input = self::html_formInput($name, $params);
		$tags = array();
		$tags[] = \GCore\Helpers\Html::container('div', $input, array('class' => 'form-group gcore-form-row', 'id' => 'form-row-__#'));
		return implode("\n", $tags);
	}

	public static function html_formInput($name, $params = array(), $formInputParams = array()){
		$class = (!empty($params['sub_input'])? 'pull-left gcore-sub-input ' : '').'gcore-display-table';
		if(in_array($params['type'], array('button', 'submit', 'reset'))){
			//$class .= ' col-sm-offset-3';
		}
		//$class = ((!empty($params['sub_input']) AND $params['label']['position'] != 'top')? 'pull-left gcore-sub-input ' : '').'gcore-display-table';
		$formInputParams['class'] = !empty($formInputParams['class']) ? $formInputParams['class'].' '.$class : $class;
		return \GCore\Helpers\Html::html_formInput($name, $params, $formInputParams);
	}

	public static function html_input($name, $params = array()){
		if(!in_array($params['type'], array('radio', 'checkbox', 'checkbox_group'))){
			$params['class'] = \GCore\Helpers\Html::addClass(array('form-control'), $params['class']);
		}
		if(in_array($params['type'], array('file'))){
			$params['class'] = \GCore\Helpers\Html::addClass(array('gcore-height-auto'), $params['class']);
		}
		if(!array_intersect(explode(' ', $params['class']), array('A', 'F', 'SSS', 'SS', 'S', 'M', 'L', 'XL', 'XXL', 'XXXL'))){
			$params['class'] = \GCore\Helpers\Html::addClass(array('A'), $params['class']);
		}
		return \GCore\Helpers\Html::html_input($name, $params);
	}

	public static function data_table_build($params = array()){
		$params['class'] = 'table table-hover table-censored';
		return '<div class="panel panel-default gcore-black-text"><div class="panel-body">'.\GCore\Helpers\DataTable::data_table_build($params).'</div></div>';
	}

	public static function data_table_headerPanel($content = ''){
		$content = '<div class="panel panel-default gcore-black-text"><div class="panel-body">'.$content.'</div></div>';
		return $content;
	}

	public static function data_table_footerPanel($content = ''){
		$content = '<div class="panel panel-default gcore-black-text"><div class="panel-body">'.$content.'</div></div>';
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
			//$params['class'] = 'fa fa-sort-amount-'.$drc;
			$text = $text.' <i class="fa fa-sort-amount-'.$drc.'"></i>';
		}else{
			//$params['class'] = 'icon';
			$text = $text.' <i class="fa fa-sort"></i>';
		}
		return array('params' => $params, 'text' => $text);
	}


	public function paginator_get_nav_link($title, $url, $type, $disabled = false, $lang = array()){
		$styles = array();
		$title = '';
		switch($type){
			case 'previous':
			$class = 'fa fa-backward';
			break;
			case 'first':
			$class = 'fa fa-fast-backward';
			break;
			case 'last':
			$class = 'fa fa-fast-forward';
			break;
			case 'next':
			$class = 'fa fa-forward';
			break;
		}
		if($disabled){
			return '';
			$class .= ' disabled';
			$url = 'javascript:void(0);';
		}
		return '<li>'.\GCore\Helpers\Html::url($title, $url, array('class' => $class, 'style' => $styles)).'</li>';
	}

	public function paginator_get_number_link($url, $page, $active = false){
		$class = 'item';
		if($active){
			$class .= ' active';
		}
		return '<li class="'.$class.'">'.\GCore\Helpers\Html::url($page, $url, array('class' => '')).'</li>';
	}

	public function paginator_get_numbers_links($list){
		return implode("\n", $list);
	}

	function paginator_full_nav($first, $prev, $numbers, $next, $last){
		$full = \GCore\Helpers\Html::container('ul', $first.$prev.$numbers.$next.$last, array('class' => 'pagination pagination-sm gcore-pagination', 'style' => 'margin:0px;'));
		return $full;
	}

	public static function toolbar_renderTitle(){
		$title = \GCore\Helpers\Toolbar::getTitle();
		if(!empty($title)){
			return '<h1 class="pull-left">'.$title.'</h1>';
		}
	}

	public static function toolbar_renderBar($clearBuffer = true){
		$return = \GCore\Helpers\Toolbar::toolbar_renderBar($clearBuffer);
		return '<div class="pull-right">'.$return.'</div>';
	}
	/*
	public static function message_wrap($ul, $type){
		$modes = array('error' => 'danger', 'success' => 'success', 'info' => 'info', 'warning' => 'warning', 'validation' => 'danger');

		$type_container = \GCore\Helpers\Html::container('dd', $ul, array('class' => 'alert alert-'.(isset($modes[$type]) ? $modes[$type] : 'primary')));
		$header = \GCore\Helpers\Html::container('dt', \GCore\Libs\Lang::_(strtoupper($type)), array('class' => $type));
		return \GCore\Helpers\Html::container('dl', $header.$type_container, array('class' => 'system-message'));
	}
	*/
}