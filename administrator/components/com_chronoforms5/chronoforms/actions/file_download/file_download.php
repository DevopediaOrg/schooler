<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\FileDownload;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class FileDownload extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'File Download';
	static $group = array('utilities' => 'Utilities');
	var $defaults = array(
		//'path' => '',
	);

	function execute(&$form, $action_id){
		$config = !empty($form->actions_config[$action_id]) ? $form->actions_config[$action_id] : array();
		$config = new \GCore\Libs\Parameter($config);
		
		$file_path = $config->get('path');
		if(file_exists($file_path)){
			\GCore\Libs\Download::send($file_path);
		}
	}

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config curl_action_config', 'curl_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();

		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][path]', array('type' => 'text', 'label' => l_('CF_FILE_DOWNLOAD_PATH'), 'value' => \GCore\C::ext_path('chronoforms', 'front'), 'class' => 'XXL', 'sublabel' => l_('CF_FILE_DOWNLOAD_PATH_DESC')));
		
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}