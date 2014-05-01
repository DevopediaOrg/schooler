<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\CustomCode;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class CustomCode extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'Custom Code';

	function execute(&$form, $action_id){
		$config =  $form->actions_config[$action_id];
		$config = new \GCore\Libs\Parameter($config);
		$content = $config->get('content', '');
		ob_start();
		eval('?>'.$content);
		$output = ob_get_clean();
		echo \GCore\Libs\Str::replacer($output, $form->data);
	}

	public static function config($configs = array(), $extra_config = array()){
		echo \GCore\Helpers\Html::formStart('action_config custom_code_action_config', 'custom_code_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][content]', array('type' => 'textarea', 'label' => l_('CF_CONTENT'), 'rows' => 15, 'cols' => 70, 'sublabel' => l_('CF_CONTENT_CUSTOM_CODE_DESC')));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}