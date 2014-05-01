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
class Group extends \GCore\Libs\GModel {
	var $tablename = '#__usergroups';
	var $parent_id = 'parent_id';
	var $order_by = array('lft');
	
	function initialize(){
		$this->validate = array(
			'title' => array(
				'required' => true,
				'not_empty' => true,
				'message' => l_('GROUP_TITLE_REQUIRED')
			),
		);
	}
	
	function afterSave(){
		parent::afterSave();
		$this->save_tree_node($this->data);
	}
	
	function beforeDelete(&$conditions, $params = array()){
		$this->delete_tree_nodes($conditions);
		return false;
	}
}