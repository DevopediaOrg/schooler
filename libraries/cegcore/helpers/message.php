<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Helpers;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class Message extends \GCore\Libs\Helper{
	var $view;

	function initialize(){

	}

	public static function render($types = array()){
		if(!empty($types)){
			//add the system css file
			$doc = \GCore\Libs\Document::getInstance();
			$doc->addCssFile('system_messages');
			$system_messages = array();
			foreach($types as $type => $messages){
				$list = array();
				$messages = \GCore\Libs\Arr::normalize($messages);
				foreach($messages as $message){
					$list[] = \GCore\Helpers\Html::container('li', $message, array());
				}
				$ul = \GCore\Helpers\Html::container('ul', implode("\n", $list), array());
				$system_messages[] = self::wrap($ul, $type);
			}
			$system_messages_container = \GCore\Helpers\Html::container('div', implode("\n", $system_messages), array('class' => 'system-message-container'));
			return $system_messages_container;
		}
		return '';
	}

	public static function message_wrap($ul, $type){
		$type_container = \GCore\Helpers\Html::container('dd', $ul, array('class' => $type.' message'));
		$header = '';//\GCore\Helpers\Html::container('dt', \GCore\Libs\Lang::_(strtoupper($type)), array('class' => $type));
		return \GCore\Helpers\Html::container('dl', $header.$type_container, array('class' => 'system-message'));
	}
}