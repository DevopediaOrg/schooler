<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\Css;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class Css extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'Load CSS';
	static $setup = array('simple' => array('title' => 'CSS'));

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
				$doc->addCssFile($file);
			}
		}

		ob_start();
		eval('?>'.$config->get('content', ''));
		$output = ob_get_clean();

		//add code
		if(strlen(trim($output)) > 0){
			$doc->addCssCode($output);
		}

	}

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config css_action_config', 'css_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();

		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][content]', array('type' => 'textarea', 'label' => l_('CF_CSS_CONTENT'), 'class' => 'XL', 'rows' => 10, 'sublabel' => l_('CF_CSS_CONTENT_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][files]', array('type' => 'textarea', 'label' => l_('CF_CSS_FILES'), 'class' => 'XL', 'rows' => 10, 'sublabel' => l_('CF_CSS_FILES_DESC')));

		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}