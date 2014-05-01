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
class Module {
	var $_vars = array();
	var $view = true;
	var $data = array();
	var $name = null;
	
	function __construct(){
		$this->name = get_class($this);
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
	
	public static function render($module, $container = false){
		$site = ($module['site'] == 'admin') ? '\Admin' : '';
		$mod_class = '\GCore'.$site.'\Modules\\'.\GCore\Libs\Str::camilize($module['type']).'\\'.\GCore\Libs\Str::camilize($module['type']);
		$mod_params = new \GCore\Libs\Parameter($module['params']);
		ob_start();
		$class = new $mod_class();
		$class->display($module);
		//initialize and render view
		$view = new \GCore\Libs\View;
		$view->initialize($class);
		$view->renderModule($module['type']);		
		$output = ob_get_clean();
		//check the returned output settings
		if($container === false){
			//do nothing, we are returning plain output
		}elseif($container === true){
			$output = \GCore\Helpers\Html::container('div', $output, array('class' => 'module-body'));		
			if((bool)$mod_params->get('show_title') === true){
				$output = \GCore\Helpers\Html::container('h3', $module['title'], array('class' => 'module-title'))."\n".$output;
			}
			$output = \GCore\Helpers\Html::container('div', $output, array('class' => 'module'.(strlen($mod_params->get('class_sfx', '')) > 0 ? ' '.$mod_params->get('class_sfx', '') : '')));
		}elseif(is_callable($container)){
			//some function provided: callback/lambada/anonymous
			$output = $container($output, $module);
		}
		return $output;
	}
}