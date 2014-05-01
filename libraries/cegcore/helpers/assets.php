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
class Assets {
	public static function image($name, $path = ""){
		if(strpos($name, ".") === false AND strtolower(substr($name, -4, 4)) != '.png'){
			$name .= ".png";
		}
		return \GCore\C::get('GCORE_FRONT_URL')."assets/images/".$path.$name;
	}
	
	public static function css($name, $path = ""){
		if(strtolower(substr($name, -4, 4)) != '.css'){
			$name .= ".css";
		}
		return \GCore\C::get('GCORE_FRONT_URL')."assets/css/".$path.$name;
	}
	
	public static function js($name, $path = ""){
		if(strtolower(substr($name, -3, 3)) != '.js'){
			$name .= ".js";
		}
		return \GCore\C::get('GCORE_FRONT_URL')."assets/js/".$path.$name;
	}
}