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
class Event {
	static $extensions = null;
	
	protected static function get_extensions(){
		if(is_null(self::$extensions)){
			self::$extensions = \GCore\Admin\Models\Extension::getInstance()->find('list', array(
				'cache' => true, 
				'fields' => array('id', 'name'), 
				//'conditions' => array('addon_id <>' => 0, 'enabled' => 1),
				'conditions' => array('enabled' => 1),
				'order' => array('ordering ASC')
			));
		}
		if(!in_array('editors', self::$extensions) AND file_exists(\GCore\C::get('GCORE_FRONT_PATH').'extensions'.DS.'editors'.DS)){
			self::$extensions[] = 'editors';
		}
		return self::$extensions;
	}
	
	public static function trigger(){
		$args = func_get_args();
		if(!empty($args)){
			$event = array_shift($args);
			$extensions = self::get_extensions();
			$prefix = '\GCore';
			$site = '';
			if(GCORE_SITE == 'admin'){
				$site = '\Admin';
				$prefix = '\GCore\Admin';
			}
			$return = array();
			foreach($extensions as $extension){
				if(is_callable(array($prefix.'\Extensions\\'.Str::camilize($extension).'\\'.Str::camilize($extension).'Events', $event))){
					Lang::load($site.'\Extensions\\'.Str::camilize($extension));
					$return[] = call_user_func_array(array($prefix.'\Extensions\\'.Str::camilize($extension).'\\'.Str::camilize($extension).'Events', $event), self::get_references($args));
				}
			}
			return $return;
		}
		return null;
	}
	
	protected static function get_references($vals){
		$refs = array();
		foreach($vals as $k => $val){
			$refs[$k] = &$vals[$k];
		}
		return $refs;
	}
}