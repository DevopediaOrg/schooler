<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Libs;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class View {
	var $controller = '';
	var $view = true;
	var $vars = array();
	var $data = array();

	function initialize(&$controller){
		if(!empty($controller->_vars)){
			$this->vars = $controller->_vars;
		}
		$this->controller = $controller->name;
		$this->view = $controller->view;
		$this->views_dir = isset($controller->views_dir) ? $controller->views_dir : 'views';
		$this->data = $controller->data;
		//set helpers properties
		if(!empty($controller->helpers)){
			$controller->helpers = (array)$controller->helpers;
			foreach($controller->helpers as $k => $helper){
				$config = array();
				if(is_string($k)){
					$config = $helper;
					$helper = $k;
				}
				$alias = Base::getClassName($helper);
				
				$this->$alias = new $helper();
				if(!empty($config)){
					foreach($config as $k => $v){
						$this->$alias->$k = $v;
					}
				}
				if(property_exists($this->$alias, 'view')){
					$this->$alias->view = &$this;
				}
				if(in_array('initialize', get_class_methods($helper))){
					$this->$alias->initialize();
				}
			}			
		}
	}
	
	function renderView($action){
		foreach($this->vars as $k => $val){
			$$k = $val;
		}
		if(strpos($this->views_dir, DS) !== false){
			$viewpath = $this->views_dir;
		}else{
			$viewpath = self::getViewsPath($this->controller, $this->views_dir);
			$viewpath = \GCore\C::fix_path($viewpath);
		}
		$action_file = '';
		if(is_string($this->view)){
			if(strpos($this->view, DS) !== false){
				$action_file = $this->view;
			}else{
				$action = $this->view;
			}
		}
		$action_file = empty($action_file) ? $viewpath.$action.'.php' : $action_file;
		if($this->view !== false AND file_exists($action_file)){
			//view file exists, load it
			ob_start();
			include($action_file);
			$contents = ob_get_clean();
			if(!empty($this->data)){
				$contents = Str::replacer($contents, Request::raw(), array('escape' => true));
				$contents = \GCore\Helpers\DataLoader::load($contents, Request::raw());
			}
			echo $contents;
		}
	}
	
	private static function getViewsPath($classname, $views_dir = 'views'){
		$dirs = explode('\\', $classname);
		$dirs = array_values(array_filter($dirs));
		$strings = array();
		foreach($dirs as $k => $dir){
			if($dir === 'GCore'){
				//root dir
				$strings[] = \GCore\C::get('GCORE_FRONT_PATH');
				continue;
			}
			if(empty($dirs[$k])){
				//empty value
				continue;
			}
			//otherwise, uncamilize the namespace name to get the directory name
			$strings[] = strtolower(preg_replace('/([a-z])([A-Z])/', '$1_$2', $dir));
		}
		if($strings[count($strings) - 1] == $strings[count($strings) - 2]){
			//main controller used
			$strings[count($strings) - 1] = $views_dir;
		}elseif($strings[count($strings) - 2] == 'controllers'){
			$strings[count($strings) - 2] = $views_dir;
		}
		return Str::fixSeparator(implode(DS, $strings), DS);
	}
	
	function renderModule($type){
		foreach($this->vars as $k => $val){
			$$k = $val;
		}
		$viewpath = self::getViewsPath($this->controller);
		if(is_string($this->view)){
			$type = $this->view;
		}
		if($this->view !== false AND file_exists($viewpath.$type.'.php')){
			//view file exists, load it
			ob_start();
			include($viewpath.$type.'.php');
			$contents = ob_get_clean();
			if(!empty($this->data)){
				$contents = Str::replacer($contents, Request::raw(), array('escape' => true));
				$contents = \GCore\Helpers\DataLoader::load($contents, Request::raw());
			}
			echo $contents;
		}
	}
	
	function renderShortCodes($content){
		//find any access codes
		preg_match_all('/{\[([^(\]\})]*?)\]}/i', $content, $access_codes);
		if(!empty($access_codes[1])){
			$codes = $access_codes[1];
			$replacers = $access_codes[0];
			foreach($codes as $k => $code){
				$chunks = parse_url($code);
				if(!empty($chunks['path'])){
					$extension = $chunks['path'];
					parse_str($chunks['query'], $vars);
					$controller = !empty($vars['cont']) ? $vars['cont'] : '';
					$action = !empty($vars['act']) ? $vars['act'] : '';
					$output = App::call('front', $extension, $controller, $action, $vars);
					$content = str_replace($replacers[$k], $output, $content);
				}
			}
		}
		return $content;
	}
}