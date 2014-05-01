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
class DataPresenter extends \GCore\Libs\Helper{
	static $columns = array();
	static $columns_info = array();
	static $headers = array();
	static $data = array();
	static $cells_data = array();
	static $cells_rows = array();
	static $config = array();
	static $count = 1;
	
	function __construct(){
		
	}
	
	public static function _flush(){
		self::$columns = array();
		self::$columns_info = array();
		self::$headers = array();
		self::$data = array();
		self::$cells_data = array();
		self::$cells_rows = array();
	}
	
	public static function create($config = array()){
		self::_flush();
		self::$config = $config;
	}
	
	public static function header($ths = array()){
		if(!empty($ths)){
			self::$columns = array_keys($ths);
			foreach($ths as $c => $th){
				self::$headers[$c]['atts'] = array();
				if(is_array($th)){
					self::$headers[$c]['text'] = $th['text'];
					if(!empty($th['style'])){
						self::$headers[$c]['atts']['style'] = \GCore\Helpers\Html::styles($th['style']);
					}
					self::$headers[$c]['tag'] = 'span';
				}else{
					self::$headers[$c]['text'] = $th;
					self::$headers[$c]['tag'] = 'span';
				}
			}
		}
	}
	
	public static function cells($cells = array(), $config = array()){
		if(!empty($cells) && array_values((array)$cells) === (array)$cells){
			self::$data = $cells;
		}
		if(!empty($config)){
			self::_config_cells($config);
		}
	}
	
	public static function _config_cells($columns_info = array()){
		foreach($columns_info as $c => $info){
			if(!empty($info['function'])){
				$function = !empty($info['function']) ? $info['function'] : '';
				if(is_array($info['function'])){
					foreach($info['function'] as $k => $fn){
						self::$columns_info[$c]['function'][$k] = $fn;
					}
				}else{					
					self::$columns_info[$c]['function'] = $function;
				}
			}
			if(!empty($info['html'])){
				$html = !empty($info['html']) ? $info['html'] : '';
				if(is_array($info['html'])){
					foreach($info['html'] as $k => $htm){
						self::$columns_info[$c]['html'][$k] = $htm;
					}
				}else{					
					self::$columns_info[$c]['html'] = $html;
				}
			}
			if(!empty($info['image'])){
				$image_params = !empty($info['image_params']) ? $info['image_params'] : array();
				$src = !empty($info['image']) ? $info['image'] : '';
				if(is_array($info['image'])){
					foreach($info['image'] as $k => $img){
						self::$columns_info[$c]['image'][$k] = \GCore\Helpers\Html::image($img, $image_params);
					}
				}else{					
					self::$columns_info[$c]['image'] = \GCore\Helpers\Html::image($src, $image_params);
				}
			}
			if(!empty($info['link'])){
				$path = !empty($info['link']) ? $info['link'] : '';
				if(is_array($info['link'])){
					foreach($info['link'] as $k => $link){
						self::$columns_info[$c]['link'][$k] = r_($link);
					}
				}else{					
					self::$columns_info[$c]['link'] = r_($path);
				}
			}
			if(!empty($info['field'])){
				$field = !empty($info['field']) ? $info['field'] : '';
				if(is_array($info['field'])){
					foreach($info['field'] as $k => $fld){
						self::$columns_info[$c]['field'][$k] = $fld;
					}
				}else{					
					self::$columns_info[$c]['field'] = $field;
				}
			}
			self::$columns_info[$c]['style'] = !empty($info['style']) ? $info['style'] : '';
			self::$columns_info[$c]['class'] = !empty($info['class']) ? (array)$info['class'] : '';
		}
	}
	
	public static function set_cells_data($data_rows = array()){
		$data_rows = empty($data_rows) ? self::$data : $data_rows;
		self::$cells_rows = $data_rows;
		foreach($data_rows as $k => $row){
			$row = (array)$row;
			foreach(self::$columns as $column){
				$info = !empty(self::$columns_info[$column]) ? self::$columns_info[$column] : array();
				$r_val = $data = \GCore\Libs\Arr::getVal($row, explode(".", $column));
				if(isset($info['function'])){
					if(!is_array($info['function'])){
						$data = $info['function']($data, $row, $column);
					}else{
						if(isset($info['function'][$r_val])){
							$data = $info['function'][$r_val]($data, $row, $column);
						}elseif(isset($info['function']['*'])){
							$_fn = $info['function']['*'];
							$data = $_fn($data, $row, $column);
						}
					}
					//update the record value based on returned function value
					$r_val = $data;
				}
				if(isset($info['html'])){
					if(!is_array($info['html'])){
						$data = $info['html'];
					}else{
						if(isset($info['html'][$r_val])){
							$data = $info['html'][$r_val];
						}elseif(isset($info['html']['*'])){
							$data = $info['html']['*'];
						}
					}
				}
				if(isset($info['image'])){
					if(!is_array($info['image'])){
						$data = $info['image'];
					}else{
						if(isset($info['image'][$r_val])){
							$data = $info['image'][$r_val];
						}elseif(isset($info['image']['*'])){
							$data = $info['image']['*'];
						}
					}
				}
				if(isset($info['link']) AND !empty($data)){
					if(!is_array($info['link'])){
						if(!empty($info['link']))
						$data = \GCore\Helpers\Html::url($data, $info['link']);
					}else{
						if(isset($info['link'][$r_val])){
							if(!empty($info['link'][$r_val]))
							$data = \GCore\Helpers\Html::url($data, $info['link'][$r_val]);
						}elseif(isset($info['link']['*'])){
							$data = \GCore\Helpers\Html::url($data, $info['link']['*']);
						}
					}
				}
				if(isset($info['field'])){
					if(!is_array($info['field'])){
						$data = $info['field'];
					}else{
						if(isset($info['field'][$r_val])){
							$data = $info['field'][$r_val];
						}elseif(isset($info['field']['*'])){
							$data = $info['field']['*'];
						}
					}
					$data = \GCore\Helpers\DataLoader::load($data, $row);
				}
				if(empty($data)){
					$data = '';//'&nbsp;';
				}
				self::$cells_data[$k][$column] = $data;
			}
		}
	}
}