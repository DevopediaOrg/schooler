<?php
/**
* @package   Warp Theme Framework
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
*/

// no direct access
defined('_JEXEC') or die('Restricted access');

// get template data/path
$app   = JFactory::getApplication();
$templ = $app->input->get('template');
$task  = $app->input->get('callback');
$warp  = JPATH_ROOT."/templates/{$templ}/warp.php";

if ($templ && $task && file_exists($warp)) {

	// trigger callback
	$warp = require($warp);
	$warp['system']->ajaxCallback($task);

}