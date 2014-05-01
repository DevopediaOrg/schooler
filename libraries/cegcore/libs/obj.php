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
class Obj{
	
	function __construct(){
		
	}
	
	function get($k, $v = null){
		if(isset($this->$k)){
			return $this->$k;
		}else{
			return $v;
		}
	}
	
	function set($k, $v){
		$this->$k = $v;
	}
	
	function toString(){
		return json_encode($this);
	}
	
	function toArray(){
		return (array)$this;
	}
}