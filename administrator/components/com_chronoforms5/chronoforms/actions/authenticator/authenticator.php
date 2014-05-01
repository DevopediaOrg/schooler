<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\Authenticator;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class Authenticator extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'Authenticator';
	static $setup = array('simple' => array('title' => 'Permissions'));
	static $group = array('security' => 'Security');
	static $platforms = array('' , 'joomla');

	var $events = array('success' => 0, 'fail' => 0);

	var $defaults = array(
		'enabled' => 0,
		'access' => array(),
	);

	function execute(&$form, $action_id){
		$config =  $form->actions_config[$action_id];
		$config = new \GCore\Libs\Parameter($config);
		$owner_id = $config->get('owner_id_index', '') ? \GCore\Libs\Request::data($config->get('owner_id_index', ''), null) : null;
		if(\GCore\Libs\Authorize::check_rules($config->get('access', array()), array(), $owner_id)){
			$this->events['success'] = 1;
			return true;
		}else{
			$this->events['fail'] = 1;
			return false;
		}
	}

	public static function config(){
		//permissions groups
		$groups = \GCore\Admin\Models\Group::getInstance()->find('flat');
		$rules = array();
		foreach($groups as $k => $group){
			$rules[$group['Group']['id']] = $group['Group']['title'];
		}
		$rules['owner'] = 'Owner';

		echo \GCore\Helpers\Html::formStart('action_config authenticator_action_config', 'authenticator_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][owner_id_index]', array('type' => 'text', 'label' => l_('CF_OWNER_ID_INDEX'), 'default' => '', 'sublabel' => l_('CF_OWNER_ID_INDEX_DESC')));
		foreach($rules as $g_id => $g_name){
			echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][access]['.$g_id.']', array('type' => 'dropdown', 'label' => $g_name, 'class' => 'M', 'options' => array(0 => l_('INHERITED'), '' => l_('NOT_SET'), 1 => l_('ALLOWED'), -1 => l_('DENIED'))));
		}
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}