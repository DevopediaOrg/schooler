<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\JoomlaPlugins;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class JoomlaPlugins extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'Joomla Plugins';
	//static $setup = array('simple' => array('title' => 'Permissions'));
	static $group = array('joomla' => 'Joomla');
	static $platforms = array('joomla');

	var $defaults = array(
		
	);

	function execute(&$form, $action_id){
		$config =  $form->actions_config[$action_id];
		$config = new \GCore\Libs\Parameter($config);
		
		$mainframe = \JFactory::getApplication();
		$contentParams = $mainframe->getParams('com_content');
		$dispatcher = \JDispatcher::getInstance();
		$type = 'content';
		\JPluginHelper::importPlugin($type);
		$context = '';
		$rowPlg = new \stdClass();
		$rowPlg->text = $form->form_output;
		$results = $mainframe->triggerEvent('onContentPrepare', array($context, &$rowPlg, &$contentParams, 0));
		$form->form_output = $rowPlg->text;
	}

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config joomla_plugins_action_config', 'joomla_plugins_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][dummy]', array('type' => 'hidden', /*'label' => l_('CF_EVENTLOOP_EVENT'), 'class' => 'M', 'sublabel' => l_('CF_EVENTLOOP_EVENT_DESC')*/));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}