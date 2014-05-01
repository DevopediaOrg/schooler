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
class Tasks {
	static $tasks = array();
	
	public function addTask($id, $text, $href, $image = ''){
		self::$tasks[$id] = array(
			'text' => $text,
			'href' => $href,
			'image' => $image,
		);
	}
	
	public function getTasks(){
		return self::$tasks;
	}
}