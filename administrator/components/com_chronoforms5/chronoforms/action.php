<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class Action{
	static $info = array('title' => '', 'content' => '');

	public static function admin_initialize($name){
		self::$info['title'] = static::$title;
		self::$info['content'] = l_('CF_'.strtoupper($name).'_INFO_CONTENT');
	}
}