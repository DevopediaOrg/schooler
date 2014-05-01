<?php
/**
* COMPONENT FILE HEADER
**/
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or define("GCORE_SITE", "admin");
jimport('cegcore.joomla_gcloader');
if(!class_exists('JoomlaGCLoader')){
	JError::raiseWarning(100, "Please download the CEGCore framework from www.chronoengine.com then install it using the 'Extensions Manager'");
	return;
}
$output = new JoomlaGCLoader('admin', 'chronoforms5', 'chronoforms');