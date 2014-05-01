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
class Sorter extends \GCore\Libs\Helper{
	var $direction = 'asc';
	var $active_field = '';
	var $action = 'index';
	var $view;
	
	function initialize(){
		$this->url = !empty($this->url) ? $this->url : \GCore\Libs\Url::current();
		$this->action = !empty($this->view->data['act']) ? $this->view->data['act'] : $this->action;
	}
	
	public function link($text, $field, $params = array()){
		$drc = ($field == $this->active_field) ? $this->direction : 'asc';
		$drc_new = (strtolower($this->direction) == 'asc') ? 'desc' : 'asc';
		$drc = strtolower($drc);
		
		if($field == $this->active_field){
			$href = r_(\GCore\Libs\Url::buildQuery($this->url, array('act' => $this->action, 'orderfld' => $field, 'orderdrc' => $drc_new)));
			$data = self::build_link_params($text, $params, $drc, true);
		}else{
			$href = r_(\GCore\Libs\Url::buildQuery($this->url, array('act' => $this->action, 'orderfld' => $field, 'orderdrc' => $drc)));
			$data = self::build_link_params($text, $params, $drc, false);
		}
		extract($data);
		
		$full = \GCore\Helpers\Html::url($text, $href, $params);
		return $full;
	}
	
	public static function sorter_build_link_params($text, $params, $drc, $active){
		//$params = array();
		if($active){
			$params['class'] = 'sort-link sorted-'.$drc;
			$params['style'] = !empty($params['style']) ? $params['style'] : array();
			$params['style']['padding-right'] = '15px';
			$params['style']['background'] = "right center url('".\GCore\C::get('GCORE_FRONT_URL')."assets/images/sort_".$drc.".png') no-repeat transparent";
			$params['style'] = \GCore\Helpers\Html::styles($params['style']);
		}else{
			$params['class'] = 'sort-link';
		}
		return array('params' => $params, 'text' => $text);
	}
}