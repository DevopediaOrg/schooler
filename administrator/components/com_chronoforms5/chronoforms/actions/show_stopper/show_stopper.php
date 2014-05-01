<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\ShowStopper;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class ShowStopper extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'Show Stopper';

	function execute(&$form, $action_id){
		$config = !empty($form->actions_config[$action_id]) ? $form->actions_config[$action_id] : array();
		$form->stop = true;
	}

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config show_stopper_action_config', 'show_stopper_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][dummy]', array('type' => 'hidden', /*'label' => l_('CF_EVENTLOOP_EVENT'), 'class' => 'M', 'sublabel' => l_('CF_EVENTLOOP_EVENT_DESC')*/));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}