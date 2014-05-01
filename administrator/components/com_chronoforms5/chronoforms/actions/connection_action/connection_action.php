<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\ConnectionAction;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class ConnectionAction extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'Connection Action';
	static $group = array('z_external' => 'External Apps');

	function execute(&$form, $action_id){
		$config =  $form->actions_config[$action_id];
		$config = new \GCore\Libs\Parameter($config);
		$ccname = $config->get('ccname', '');
		$action = $config->get('action', '');
		\GCore\Libs\App::call(GCORE_SITE, 'chronoconnectivity', 'lists', $action, array('ccname' => $ccname));
	}

	public static function config($configs = array(), $extra_config = array()){
		echo \GCore\Helpers\Html::formStart('action_config connection_action_action_config', 'connection_action_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][ccname]', array('type' => 'text', 'label' => l_('CF_CONNECTION_NAME'), 'sublabel' => l_('CF_CONNECTION_NAME_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][action]', array('type' => 'text', 'label' => l_('CF_CONNECTION_ACTION'), 'sublabel' => l_('CF_CONNECTION_ACTION_DESC')));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}