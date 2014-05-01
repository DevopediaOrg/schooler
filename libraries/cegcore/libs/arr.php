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
class Arr {
	//normalizes a multi dimensional array into 1 dimension
	public static function normalize($array = array()){
		$return = array();
		foreach($array as $k => $v){
			if(is_array($v)){
				$return = array_merge(self::normalize($v), $return);
			}else{
				$return[] = $v;
			}
		}
		return $return;
	}
	//extract the value at the supplied path from the supplied data array
	public static function getVal($array, $indexes = array(), $default = NULL){
		if(empty($indexes)){
			return $array;
		}
		if(count($indexes) == 1){
			if(is_array($array) AND isset($array[$indexes[0]])){
				return $array[$indexes[0]];
			}else{
				//return $default;
			}
		}
		$index = array_shift($indexes);
		if($index == '[n]' AND is_array($array)){
			//indexed numeric loop
			$data_array = array();
			foreach($array as $k => $v){
				$data_array[$k] = self::getVal($array[$k], $indexes, $default);
			}
			return $data_array;
		}else{
			if(isset($array[$index])){
				return self::getVal($array[$index], $indexes, $default);
			}else{
				return $default;
			}
		}
	}
	//set some array value at the given path and return the modified array back
	public static function setVal($array, $indexes, $value){
		eval('$array["'.implode('"]["', $indexes).'"] = $value;');
		return $array;
	}
	//flatten multi dimensional array
	public static function flatten($array, $preserve_keys = 0, &$out = array()){
		foreach($array as $key => $child){
			if(is_array($child)){
				$out = self::flatten($child, $preserve_keys, $out);
			}elseif($preserve_keys + is_string($key) > 1){
				$out[$key] = $child;
			}else{
				$out[] = $child;
			}
		}
		return $out;
	}
	//search array for the given value
	public static function searchVal($array, $indexes, $values = array()){
		$values = (array)$values;
		if(count($indexes) == 1){
			if(is_array($array) AND isset($array[$indexes[0]]) AND in_array($array[$indexes[0]], $values)){
				return $array;
			}else{
				return array();
			}
		}
		$index = array_shift($indexes);
		if($index == "[n]" AND is_array($array)){
			//indexed numeric loop
			$data_array = array();
			foreach($array as $k => $v){
				$data_array[$k] = self::searchVal($array[$k], $indexes, $values);
			}
			return array_filter($data_array);
		}else{
			if(isset($array[$index])){
				return self::searchVal($array[$index], $indexes, $values);
			}else{
				return array();
			}
		}
	}
	
	public static function multisort($array, $path = '', $flag = SORT_ASC){
		$temp = array();
		foreach($array as $k => $item){
			$temp[$k] = self::getVal($item, explode('.', $path), null);
		}
		array_multisort($temp, $flag, $array);
		return $array;
	}
	
	//private static function 
	/*public static function __search($array, $params = array('value' => '')){
		$results = array();
		if(is_array($array)){
			$value = $params['value'];
			if(isset($params['key'])){
				$key = $params['key'];
				if(isset($array[$key]) AND $array[$key] == $value){
					$results[] = $array;
				}
			}else{
				foreach($array as $k => $v){
					if($v == $value){
						$results[] = $array;
					}
				}
			}			

			foreach($array as $subarray){
				$results = array_merge($results, self::search($subarray, $params));
			}
		}
		return $results;
	}*/
}