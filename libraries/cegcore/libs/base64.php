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
class Base64{
	var $encoded_data = '';
	var $decoded_data = array();
	
	function __construct($data = ''){
		if(is_string($data)){
			$this->encoded_data = $data;
		}else if(is_array($data)){
			$this->decoded_data = $data;
		}
	}
	
	function get($k, $v = null){
		if(isset($this->decoded_data[$k])){
			return $this->decoded_data[$k];
		}else{
			return $v;
		}
	}
	
	function decode(){
		return $this->decoded_data = unserialize(base64_decode($this->encoded_data));
	}
	
	function set($k, $v){
		$this->decoded_data[$k] = $v;
	}
	
	function encode(){
		return $this->encoded_data = base64_encode(serialize($this->decoded_data));
	}
}