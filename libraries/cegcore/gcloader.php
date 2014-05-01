<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/

//global namespace for the global helper function pr()
namespace {
	/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
	defined("GCORE_SITE") or die;
	//multi purpose function
	if(!function_exists('pr')){
		function pr($array = array(), $return = false){
			if(is_array($array)){
				array_walk_recursive($array, function(&$v){
					if(is_string($v)){
						$v = htmlspecialchars($v);
					}
				});
			}else if(is_string($array)){
				$array = htmlspecialchars($array);
			}
			if($return){
				return '<pre style="word-wrap:break-word; white-space:pre-wrap;">'.print_r($array, $return).'</pre>';
			}else{
				echo '<pre style="word-wrap:break-word; white-space:pre-wrap;">';
				print_r($array, $return);
				echo '</pre>';
			}
		}
	}
	//multi purpose function
	function prf($array = array(), $file = ''){
		$file = empty($file) ? dirname(__FILE__).DIRECTORY_SEPARATOR.'tmp'.DIRECTORY_SEPARATOR.'debug.html' : $file;
		//add time
		file_put_contents($file, pr(date("d-m-Y H:i:s", time()), true)."\n\n", FILE_APPEND);
		file_put_contents($file, pr($array, true)."\n\n", FILE_APPEND);
	}

	function l_($text){
		return \GCore\Libs\Lang::_($text);
	}
	if(!function_exists('r_')){
		function r_($url){
			return \GCore\Libs\Route::_($url);
		}
	}

	if(get_magic_quotes_gpc()){
		function stripslashes_gpc(&$value){
			$value = stripslashes($value);
		}
		array_walk_recursive($_GET, 'stripslashes_gpc');
		array_walk_recursive($_POST, 'stripslashes_gpc');
		array_walk_recursive($_COOKIE, 'stripslashes_gpc');
		array_walk_recursive($_REQUEST, 'stripslashes_gpc');
	}
}
//GCore namespace for the loader
namespace GCore{
	if(!defined('DS')){
		define('DS', DIRECTORY_SEPARATOR);
	}

	class C {
		static $GCORE_FRONT_PATH = '';
		static $GCORE_FRONT_URL = '';
		static $GCORE_ADMIN_PATH = '';
		static $GCORE_ADMIN_URL = '';
		static $GSITE_PATH = '';
		static $GSITE_URL = '';
		static $GSITE_PLATFORM = '';
		static $GCORE_ROOT_URL = '';
		static $EXTENSIONS_PATHS = array();
		static $EXTENSIONS_URLS = array();
		static $EXTENSIONS_NAMES = array();

		public static function get($key, $default = null){
			if(isset(self::$$key)){
				return self::$$key;
			}else{
				return $default;
			}
		}

		public static function set($key, $value){
			if(isset(self::$$key)){
				self::$$key = $value;
			}
		}

		public static function ext_path($ext, $area = 'admin'){
			$path = '';
			if($area == 'admin'){
				$path .= self::get('GCORE_ADMIN_PATH');
			}else{
				$path .= self::get('GCORE_FRONT_PATH');
			}
			$path .= 'extensions'.DS.$ext.DS;
			$path = self::fix_path($path);
			return $path;
		}

		public static function ext_url($ext, $area = 'admin'){
			$path = '';
			if($area == 'admin'){
				$path .= self::get('GCORE_ADMIN_URL');
			}else{
				$path .= self::get('GCORE_FRONT_URL');
			}
			$path .= 'extensions/'.$ext.'/';
			$path = self::fix_urls($path);
			return $path;
		}

		public static function fix_path($path){
			$extensions_paths = self::get('EXTENSIONS_PATHS', array());
			$extensions_names = self::get('EXTENSIONS_NAMES', array());
			if(!empty($extensions_paths) AND !empty($extensions_names)){
				foreach($extensions_paths as $int_path => $ext_path){
					foreach($extensions_names as $int_name => $ext_name){
						$path = str_replace($int_path.$int_name, $ext_path.$ext_name.DS.$int_name, $path);
					}
				}
			}
			return $path;
		}

		public static function fix_urls($output){
			$extensions_urls = self::get('EXTENSIONS_URLS', array());
			$extensions_names = self::get('EXTENSIONS_NAMES', array());
			if(!empty($extensions_urls) AND !empty($extensions_names)){
				foreach($extensions_urls as $int_url => $ext_url){
					foreach($extensions_names as $int_name => $ext_name){
						$output = str_replace($int_url.$int_name, $ext_url.$ext_name.'/'.$int_name, $output);
					}
				}
			}
			return $output;
		}
	}

	class Loader {
		static $classname = "";
		static $filepath = "";
		static $memory_usage = 0;
		static $start_time = 0;

		static public function register($name){
			if(empty(self::$start_time)){
				self::$start_time = microtime(true);
				self::$memory_usage = memory_get_usage();
			}
			if(strlen(trim($name)) > 0){
				$dirs = explode("\\", $name);
				$dirs = array_values(array_filter($dirs));
				//if the class doesn't belong to the GCore then don't try to auto load it
				if($dirs[0] !== "GCore"){
					return false;
				}
				//build the include file path
				$strings = array();
				foreach($dirs as $k => $dir){
					if($dir === "GCore"){
						//root dir
						$strings[] = dirname(__FILE__);
						continue;
					}
					if($k == (count($dirs) - 1)){
						//last dir (file name)
						$strings[] = strtolower(preg_replace('/([a-z])([A-Z])/', '$1_$2', $dir)).".php";
						continue;
					}
					if(empty($dirs[$k])){
						//empty value
						continue;
					}
					//otherwise, uncamilize the namespace name to get the directory name
					$strings[] = strtolower(preg_replace('/([a-z])([A-Z])/', '$1_$2', $dir));
				}
				//load the file if exists
				$file = implode(DIRECTORY_SEPARATOR, $strings);
				//self::$filepath = $file;
				//$gcore_file = $file;
				//$file = str_replace('__GCORE__', dirname(__FILE__), $gcore_file);
				$file = \GCore\C::fix_path($file);
				//pr($file);
				if(file_exists($file) AND substr($file, -4, 4) == ".php"){
					require_once($file);
					if(class_exists($name)){
						return true;
					}else{
						self::$filepath = $file;
						self::$classname = $name;
					}
				}
				/*if(Libs\Base::getConfig('debug', 0)){
					self::debug();
				}*/
			}
		}

		static public function debug(){
			if(!empty(self::$classname))
			echo nl2br("\nClass name: \"".self::$classname."\" could NOT be found, additionally, the file below does NOT exist: \n".self::$filepath);
		}
	}
	spl_autoload_register(__NAMESPACE__ .'\Loader::register');
}