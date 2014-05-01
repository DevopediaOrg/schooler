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
class Controller {
	var $name = '';
	var $_vars = array();
	var $path = '';
	var $url = '';
	var $view = true;
	var $views_dir = 'views';
	var $data = array();
	var $site = '';
	var $thread = '';
	
	function __construct($site = GCORE_SITE, $thread = 'gcore'){
		$app = \GCore\Bootstrap::getApp($site, $thread);
		$this->site = $site;
		$this->thread = $thread;
		$this->_vars = $app->_vars;
		$this->data = &Request::raw();//&$_POST;
		//$this->data = array_merge($_GET, $this->data);
		$this->path = $app->path;
		$this->url = $app->url;
		$this->name = get_class($this);
		$this->action = $app->action;
		//set models properties
		if(!empty($this->models)){
			$this->models = (array)$this->models;
			foreach($this->models as $model){
				$alias = Base::getClassName($model);
				$this->$alias = new $model();
			}			
		}
		//set libs properties
		if(!empty($this->libs)){
			$this->libs = (array)$this->libs;
			foreach($this->libs as $lib){
				$alias = Base::getClassName($lib);
				if(in_array('getInstance', get_class_methods($lib))){
					$this->$alias = $lib::getInstance();
				}else{
					$this->$alias = new $lib();
				}
			}			
		}
	}
	
	function _initialize(){
		
	}
	
	function _finalize(){
		
	}
	
	function set($key, $value = null){
		if(is_array($key)){
			$this->_vars = array_merge($this->_vars, $key);
			return;
		}
		$this->_vars[$key] = $value;
	}
	
	function get($key, $default = null){
		if(isset($this->_vars[$key])){
			return $this->_vars[$key];
		}
		return $default;
	}
	
	function redirect($url){
		Env::redirect($url);
	}
	
	function get_main_model(){
		if(!empty($this->models)){
			return Base::getClassName($this->models[0]);
		}
		return null;
	}
	
}