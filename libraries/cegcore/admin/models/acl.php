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
class Acl extends \GCore\Libs\GModel {
	var $tablename = '#__chronoengine_acls';
	
	function initialize(){
		$this->validate = array(
			'title' => array(
				'required' => true,
				'not_empty' => true,
				'message' => l_('ACO_TITLE_REQUIRED')
			),
			'aco' => array(
				'required' => true,
				'not_empty' => true,
				'message' => l_('ACO_RESOURCE_REQUIRED')
			),
		);
	}
}