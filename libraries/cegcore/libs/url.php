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
class Url {
	static $root = '';
	static $root_ext = array();

	public static function current(){
		$pageURL = self::domain();
		if(isset($_SERVER['PHP_SELF']) AND isset($_SERVER['REQUEST_URI'])){
			//APACHE			
			$pageURL .= $_SERVER['REQUEST_URI'];
		}else{
			//IIS
			$pageURL .= $_SERVER['SCRIPT_NAME'];
			if(!empty($_SERVER['QUERY_STRING'])){
				$pageURL .= '?'.$_SERVER['QUERY_STRING'];
			}
		}
		return $pageURL;
	}
	
	public static function domain(){
		$dURL = (isset($_SERVER['HTTPS']) AND ($_SERVER['HTTPS'] == 'on')) ? 'https://' : 'http://';
		$dURL .= !empty($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : $_SERVER['SERVER_NAME'];
		if ($_SERVER['SERVER_PORT'] != '80'){
			$dURL .= ':'.$_SERVER['SERVER_PORT'];
		}
		
		return $dURL;
	}
	
	public static function referer(){
		return !empty($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : '';
	}
	
	public static function root($absolute = false){
		if(!empty(self::$root) AND !$absolute){
			return self::$root;
		}
		if(isset($_SERVER['SCRIPT_NAME'])){
			$slices = explode(DS, str_replace(array('/', '\\'), DS, $_SERVER['SCRIPT_NAME']));
			$slices = array_unique($slices);
			$chunks = array(self::domain());
			foreach($slices as $slice){
				if(empty($slice) OR in_array($slice, array('index.php', 'admin'))){
					continue;
				}
				$chunks[] = $slice;
			}
			if($absolute === true){
				return implode('/', $chunks).'/';
			}
			if(!empty(self::$root_ext)){
				$chunks = array_merge($chunks, self::$root_ext);
				goto end1;
			}
			$file = str_replace(array('/', '\\'), DS, __FILE__);
			$fs = explode(DS, $file);
			$script_filename = str_replace(array('/', '\\'), DS, $_SERVER['SCRIPT_FILENAME']);
			$dirs = explode(DS, $script_filename);
			foreach($fs as $f){
				if(in_array($f, $dirs) || in_array($f, array('libs', 'url.php'))){
					continue;
				}
				$chunks[] = $f;
			}
			end1:
			return self::$root = implode('/', $chunks).'/';
		}
		$file = str_replace(array('/', '\\'), DS, __FILE__);
		$doc_root = str_replace(array('/', '\\'), DS, $_SERVER['DOCUMENT_ROOT']);
		$fs = explode(DS, $file);
		$dirs = explode(DS, $doc_root);
		$chunks = array(self::domain());
		foreach($fs as $f){
			if(in_array($f, $dirs) || in_array($f, array('libs', 'url.php'))){
				continue;
			}
			$chunks[] = $f;
		}
		if(substr($chunks[count($chunks) - 1], 0, -1) != '/'){
			$chunks[count($chunks) - 1] .= '/';
		}
		return self::$root = implode('/', $chunks);
	}
	
	public static function abs_to_url($path){
		return str_replace(array(\GCore\C::get('GCORE_FRONT_PATH'), DS), array(\GCore\C::get('GCORE_FRONT_URL'), '/'), $path);
	}
	
	public static function url_to_abs($url){
		return str_replace(array(\GCore\C::get('GCORE_FRONT_URL'), '/'), array(\GCore\C::get('GCORE_FRONT_PATH'), DS), $url);
	}
	
	public static function buildQuery($path, $params = array()){
		if(empty($params)){
			return $path;
		}
		$url_params = array();
		if(strpos($path, '?') !== false){
			$path_pcs = explode('?', $path);
			$path_comps = parse_url($path);
			$query = $path_comps['query'];
			parse_str($query, $fragments);
			$fragments = array_merge($fragments, $params);
			return $path_pcs[0].'?'.http_build_query($fragments);
		}else{
			return $path.'?'.http_build_query($params);
		}
	}
}