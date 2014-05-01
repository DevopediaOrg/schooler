<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\Js;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class Js extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'Load JavaScript';
	static $setup = array('simple' => array('title' => 'JavaScript'));

	function execute(&$form, $action_id){
		$config = !empty($form->actions_config[$action_id]) ? $form->actions_config[$action_id] : array();
		$config = new \GCore\Libs\Parameter($config);
		$doc = \GCore\Libs\Document::getInstance();

		ob_start();
		eval('?>'.$config->get('files', ''));
		$files_lines = ob_get_clean();
		if(strlen(trim($files_lines)) > 0){
			$files = explode("\n", $files_lines);
			foreach($files as $file){
				//add file
				$doc->addJsFile($file);
			}
		}

		ob_start();
		eval('?>'.$config->get('content', ''));
		$output = ob_get_clean();

		//add code
		if(strlen(trim($output)) > 0){
			$doc->addJsCode($output);
		}

	}

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config js_action_config', 'js_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();

		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][content]', array('type' => 'textarea', 'label' => l_('CF_JS_CONTENT'), 'class' => 'XL', 'rows' => 10, 'sublabel' => l_('CF_JS_CONTENT_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][files]', array('type' => 'textarea', 'label' => l_('CF_JS_FILES'), 'class' => 'XL', 'rows' => 10, 'sublabel' => l_('CF_JS_FILES_DESC')));

		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}