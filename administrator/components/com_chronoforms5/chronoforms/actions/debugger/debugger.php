<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\Debugger;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class Debugger extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'Debugger';
	static $setup = array('simple' => array('title' => 'Debug'));
	var $defaults = array(
		'enabled' => 1,
	);

	function execute(&$form, $action_id){
		$config = !empty($form->actions_config[$action_id]) ? $form->actions_config[$action_id] : array();
		$config = new \GCore\Libs\Parameter($config);
		if(!$config->get('enabled')){
			return;
		}

		echo '<div class="panel panel-warning"><div class="panel-heading">Data Array</div><div class="panel-body">';
		pr($form->data);
		pr($form->files);
		echo '</div></div>';
		echo '<div class="panel panel-danger"><div class="panel-heading">Errors</div><div class="panel-body">';
		pr($form->errors);
		echo '</div></div>';
		echo '<div class="panel panel-primary"><div class="panel-heading">Debug Info</div><div class="panel-body">';
		pr($form->debug);
		echo '</div></div>';
	}

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config css_action_config', 'css_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][enabled]', array('type' => 'dropdown', 'label' => l_('CF_ENABLED'), 'options' => array(0 => l_('NO'), 1 => l_('YES'))));

		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}