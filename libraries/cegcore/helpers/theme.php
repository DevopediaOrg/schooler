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
class Theme {
	var $view;
	
	public static function getInstance($name = '', $settings = array()){
		static $instances;
		if(!isset($instances)){
			$instances = array();
		}
		if(empty($name)){
			$doc = \GCore\Libs\Document::getInstance();
			$name = $doc->theme;
		}
		if(empty($name)){
			$class = '\GCore\Helpers\Theme';
		}else{
			$class = '\GCore\Helpers\Themes\\'.\GCore\Libs\Str::camilize($name);
		}
		if(empty($instances[$name])){
			$instances[$name] = new $class($settings);
			return $instances[$name];
		}else{
			return $instances[$name];
		}
	}
}