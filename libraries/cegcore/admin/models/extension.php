<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Models;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class Extension extends \GCore\Libs\GModel {
	var $tablename = '#__chronoengine_extensions';
	var $cache = true;
	
	function beforeSave(&$data, &$params, $mode){
		parent::beforeSave($data, $params, $mode);
		if(isset($data['settings']) AND is_array($data['settings'])){
			$data['settings'] = json_encode($data['settings']);
		}
	}
	
	function afterFind($type, &$data){
		parent::afterFind($type, $data);
		if(!empty($data) AND is_array($data)){
			foreach($data as $k => $record){
				if(isset($data[$k][$this->alias]['settings'])){
					$data[$k][$this->alias]['settings'] = json_decode($data[$k][$this->alias]['settings'], true);
				}
			}
		}
	}
}