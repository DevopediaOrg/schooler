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
class Database {
	
	public static function _setOptions($options = array()){
		if(empty($options)){
			$options['user'] = Base::getConfig('db_user');
			$options['pass'] = Base::getConfig('db_pass');
			$options['name'] = Base::getConfig('db_name');
			$options['host'] = Base::getConfig('db_host');
			$options['type'] = Base::getConfig('db_type');
			$options['prefix'] = Base::getConfig('db_prefix');
		}
		return $options;
	}
	
	public static function getInstance($options = array()){
		static $instances;
		if(!isset($instances)){
			$instances = array();
		}
		$options = self::_setOptions($options);
		
		ksort($options);
		$id = md5(serialize($options));
		if(empty($instances[$id])){
			$instances[$id] = \GCore\Libs\DatabaseObject::getInstance($options);
			if(!empty($instances[$id])){
				$instances[$id]->connected = true;
				$instances[$id]->_initialize($options);
			}
			return $instances[$id];
		}else{
			return $instances[$id];
		}
	}
}