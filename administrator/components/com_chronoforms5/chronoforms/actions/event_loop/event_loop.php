<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\EventLoop;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class EventLoop extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'Event Loop';
	var $defaults = array(
		'event' => 'load',
	);

	function execute(&$form, $action_id){
		$config = !empty($form->actions_config[$action_id]) ? $form->actions_config[$action_id] : array();
		$config = new \GCore\Libs\Parameter($config);
		
		$event = explode('---', $config->get('event', 'load'));
		if(empty($event)){
			$event = array('load');	
		}
		$form->process($event);

		if((bool)$config->get('break_sequence', 1) === true){
			$form->stop = true;
		}
	}

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config event_loop_action_config', 'event_loop_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][event]', array('type' => 'text', 'label' => l_('CF_EVENTLOOP_EVENT'), 'value' => 'load', 'class' => 'M', 'sublabel' => l_('CF_EVENTLOOP_EVENT_DESC')));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}