<?php
/**
* COMPONENT FILE HEADER
**/
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or define("GCORE_SITE", "front");
jimport('cegcore.joomla_gcloader');
if(!class_exists('JoomlaGCLoader')){
	JError::raiseWarning(100, "Please download the CEGCore framework from www.chronoengine.com then install it using the 'Extensions Manager'");
	return;
}

$chronoforms5_setup = function(){
	$mainframe = \JFactory::getApplication();
	$chronoform = GCore\Libs\Request::data('chronoform', '');
	$event = GCore\Libs\Request::data('event', '');
	$params = $mainframe->getPageParameters('com_chronoforms5');
	$formname = $params->get('chronoform', '');
	if(!empty($formname)){
		if(!empty($event)){
			if($formname == $chronoform){
				return array('chronoform' => $params->get('chronoform'), 'event' => $event);
			}
		}
		return array('chronoform' => $params->get('chronoform'), 'event' => $params->get('event') ? $params->get('event') : 'load');
	}
	/*if(empty($chronoform)){
		$params = $mainframe->getPageParameters('com_chronoforms5');
		GCore\Libs\Request::set('chronoform', $params->get('chronoform'));
		if(empty($event)){
			GCore\Libs\Request::set('event', $params->get('event'));
		}
	}*/
};

$output = new JoomlaGCLoader('front', 'chronoforms5', 'chronoforms', $chronoforms5_setup);