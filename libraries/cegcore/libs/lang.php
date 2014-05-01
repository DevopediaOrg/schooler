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
class Lang {
	static $lang = null;
	static $class = null;
	static $translations = array();
	static $loaded = array();

	public static function _($string = ""){
		//get translatation
		return isset(self::$translations[$string]) ? self::$translations[$string] : $string;
	}
	
	public static function date_time($timestamp){
		if(!empty($timestamp)){
			return isset(self::$translations['DATETIME_FORMAT']) ? date(self::$translations['DATETIME_FORMAT'], $timestamp) : date('d-m-Y H:i:s', $timestamp);
		}
	}
	
	public static function initialize(){
		if(empty(self::$lang)){
			$lang = str_replace('-', '_', Base::getConfig('site_language', 'en-gb'));
			$lang_class = '\GCore\Locales\\'.Str::camilize($lang).'\Lang';
			if(!class_exists($lang_class)){
				$lang_class = '\GCore\Locales\EnGb\Lang';
				$lang = 'en-gb';
			}
			
			if(Base::getConfig('detect_language', 0) == 1){
				$browser_language = $_SERVER['HTTP_ACCEPT_LANGUAGE'];
				$chunks = explode(',', $browser_language);
				if(!empty($chunks) AND strlen($chunks[0]) == 5){
					$lang = $chunks[0];//str_replace('-', '_', $chunks[0]);
					$cutsom_lang = '\GCore\Locales\\'.Str::camilize(str_replace('-', '_', strtolower($lang))).'\Lang';
					
					if(class_exists($cutsom_lang)){
						$lang_class = $cutsom_lang;
					}
				}
			}
			
			self::$lang = $lang;
			Base::setConfig('site_language', $lang);
			self::$class = $lang_class;
		}
		if(empty(self::$translations)){
			$lang_class = new \ReflectionClass(self::$class);
			self::$translations = $lang_class->getConstants();
		}
	}
	
	public static function load($path = ''){
		if(!empty($path) AND !in_array($path, self::$loaded)){
			$path = !empty($path) ? '\\'.trim($path, '\\') : '';
			$lang_class = '\GCore'.$path.'\Locales\EnGb\Lang';
			$cutsom_lang = '\GCore'.$path.'\Locales\\'.Str::camilize(str_replace('-', '_', strtolower(Base::getConfig('site_language', 'en-gb')))).'\Lang';
			if(class_exists($cutsom_lang)){
				if(class_exists($lang_class)){
					//load default language as well
					$lang_class_loaded = new \ReflectionClass($lang_class);
					self::$translations = array_merge((array)self::$translations, $lang_class_loaded->getConstants(), $lang_class_loaded->getStaticProperties());
					self::$loaded[] = $path;
				}
				$lang_class = $cutsom_lang;
			}
			if(!class_exists($lang_class)){
				return false;
			}
			$lang_class_loaded = new \ReflectionClass($lang_class);
			self::$translations = array_merge((array)self::$translations, $lang_class_loaded->getConstants(), $lang_class_loaded->getStaticProperties());
			self::$loaded[] = $path;
			return true;
		}
		return false;
	}
}