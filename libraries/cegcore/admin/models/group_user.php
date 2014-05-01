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
class GroupUser extends \GCore\Libs\GModel {
	var $tablename = '#__user_usergroup_map';
	
	var $belongsTo = array(
		'Group' => array(
			'className' => '\GCore\Admin\Models\Group',
			'foreignKey' => 'group_id',
		),
	);
}