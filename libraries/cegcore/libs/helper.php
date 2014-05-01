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
class Helper {
	var $view = null;

	function initialize(){
		
	}
	
	public function __call($name, $args){
		$class_name = get_called_class();
		$class_id = \GCore\Libs\Str::uncamilize(\GCore\Libs\Base::getClassName($class_name));
		$class_id .= '_';
		
		if(method_exists(\GCore\Helpers\Theme::getInstance(), $class_id.$name)){
			return call_user_func_array(array(\GCore\Helpers\Theme::getInstance(), $class_id.$name), $args);
		}
		if(method_exists($this, $class_id.$name)){
			return call_user_func_array(array($this, $class_id.$name), $args);
		}
	}
	
	public static function __callStatic($name, $args){
		$class_name = get_called_class();
		$class_id = \GCore\Libs\Str::uncamilize(\GCore\Libs\Base::getClassName($class_name));
		$class_id .= '_';
		
		if(method_exists(\GCore\Helpers\Theme::getInstance(), $class_id.$name)){
			return call_user_func_array(array(\GCore\Helpers\Theme::getInstance(), $class_id.$name), $args);
		}
		if(method_exists($class_name, $class_id.$name)){
			return call_user_func_array(array($class_name, $class_id.$name), $args);
		}
	}
}