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
class DataTable extends \GCore\Helpers\DataPresenter{
	static $count = 1;
	//static $template = '';
	
	function __construct(){
		
	}
	/*
	public static function bs(){
		self::$template = 'bs';
	}
	*/
	public static function data_table_build($params = array()){
		$tds = array();
		$trs = array();
		$ths = array();
		
		$thead = \GCore\Helpers\Html::container('thead', implode("\n", $ths), array());
		$tbody = $tbody = \GCore\Helpers\Html::container('tbody', implode("\n", $trs), array());
		if(!empty(\GCore\Helpers\DataPresenter::$columns)){
			\GCore\Helpers\DataPresenter::set_cells_data();
			$trs = self::trs();
			$tbody = \GCore\Helpers\Html::container('tbody', implode("\n", $trs), array());
			foreach(\GCore\Helpers\DataPresenter::$headers as $k => $header){
				$th_tag = \GCore\Helpers\Html::container($header['tag'], $header['text'], $header['atts']);
				$ths[] = \GCore\Helpers\Html::container('th', $th_tag, array('class' => 'th-'.$k));
			}
			$thead = \GCore\Helpers\Html::container('thead', \GCore\Helpers\Html::container('tr', implode("\n", $ths)), array());
		}
		
		$table = \GCore\Helpers\Html::container('table', $thead.$tbody, array('class' => !empty($params['class']) ? $params['class'] : 'gcore_table_list', 'id' => !empty($params['id']) ? $params['id'] : 'gcore_table_list__#'));
		$table = \GCore\Helpers\DataLoader::load($table, \GCore\Helpers\DataPresenter::$data);
		\GCore\Helpers\DataPresenter::_flush();
		return $table;
	}
	
	public static function trs($depth = 0){
		$trs = array();
		foreach(\GCore\Helpers\DataPresenter::$cells_data as $k => $column_data){
			$tds = array();
			$row = \GCore\Helpers\DataPresenter::$cells_rows[$k];
			foreach(\GCore\Helpers\DataPresenter::$columns as $column){
				$data = $column_data[$column];
				$info = !empty(\GCore\Helpers\DataPresenter::$columns_info[$column]) ? \GCore\Helpers\DataPresenter::$columns_info[$column] : array();
				
				$indent_class = '';
				/*if(!empty(\GCore\Helpers\DataPresenter::$config['children']) AND \GCore\Helpers\DataPresenter::$config['indent_column'] == $column){
					$indent_class = " depth-".$depth;
				}*/
				
				$class = !empty($info['class']) ? \GCore\Helpers\Html::addClass($info['class'], "td-".$column.$indent_class) : "td-".$column.$indent_class;
				$tds[] = \GCore\Helpers\Html::container('td', $data, array("class" => $class, "style" => empty($info['style']) ? '' : \GCore\Helpers\Html::styles($info['style'])));
			}
			self::$count = 1 - self::$count;
			$row['k'] = $k;
			$tr_contents = \GCore\Libs\Str::replacer(implode("\n", $tds), $row, array('escape' => true));
			//$tr_contents = \GCore\Helpers\DataLoader::load($tr_contents, $row);
			$trs[] = \GCore\Helpers\Html::container('tr', $tr_contents, array("class" => "row".self::$count." tr-list-".self::$count));
			//check children
			/*if(!empty(\GCore\Helpers\DataPresenter::$config['children'])){
				$children = \GCore\Libs\Arr::getVal($row, array(\GCore\Helpers\DataPresenter::$config['model_alias'], 'children'));
				if(!empty($children)){
					$trs = array_merge($trs, self::trs($children, $depth + 1));
				}
			}*/
		}
		return $trs;
	}
	
	public static function data_table_headerPanel($content = ''){
		return \GCore\Helpers\Html::container('div', $content, array('class' => 'fg-toolbar ui-toolbar ui-widget-header ui-corner-tl ui-corner-tr ui-helper-clearfix'));
	}
	
	public static function data_table_footerPanel($content = ''){
		return \GCore\Helpers\Html::container('div', $content, array('class' => 'fg-toolbar ui-toolbar ui-widget-header ui-corner-bl ui-corner-br ui-helper-clearfix'));
	}
	
	public static function data_table__l($content = ''){
		return \GCore\Helpers\Html::container('div', $content, array('class' => 'gcore-datatable-box-left'));
	}
	
	public static function data_table__r($content = ''){
		return \GCore\Helpers\Html::container('div', $content, array('class' => 'gcore-datatable-box-right'));
	}
}