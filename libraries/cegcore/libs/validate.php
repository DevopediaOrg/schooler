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
class Validate {

	public static function required($value){
		return !is_null($value);
	}
	
	public static function not_empty($value){
		if(is_array($value)){
			return (bool)count($value);
		}else{
			return (bool)strlen($value);
		}
	}
	
	public static function is_empty($value){
		if(isset($value)){
			if(is_array($value)){
				return !(bool)count($value);
			}else{
				return !(bool)strlen($value);
			}
		}
	}
	
	public static function no_spaces($value){
		if(strpos($value, ' ') === false){
			return true;
		}
		return false;
	}
	
	public static function match($value, $match){
		return ($value == $match);
	}
	
	public static function regex($value, $regex){
		return preg_match($regex, $value);
	}
	
	public static function alpha($value){
		return preg_match('/^[a-z ._-]+$/i', $value);
	}
	
	public static function alphanumeric($value){
		return preg_match('/^[a-z0-9 ._-]+$/i', $value);
	}
	
	public static function digit($value){
		return preg_match('/^[-+]?[0-9]+$/', $value);
	}
	
	public static function nodigit($value){
		return preg_match('/^[^0-9]+$/', $value);
	}
	
	public static function number($value){
		return preg_match('/^[-+]?\d*\.?\d+$/', $value);
	}
	
	public static function email($value){
		return preg_match('/^([a-zA-Z0-9_\.\-\+%])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/', $value);
	}
	
	public static function phone($value){
		return preg_match('/^\+{0,1}[0-9 \(\)\.\-]+$/', $value);
	}
	
	public static function phone_inter($value){
		return preg_match('/^\+{0,1}[0-9 \(\)\.\-]+$/', $value);
	}
	
	public static function url($value){
		return preg_match('/^(http|https|ftp)\:\/\/[a-z0-9\-\.]+\.[a-z]{2,3}(:[a-z0-9]*)?\/?([a-z0-9\-\._\?\,\'\/\\\+&amp;%\$#\=~])*$/i', $value);
	}	
}