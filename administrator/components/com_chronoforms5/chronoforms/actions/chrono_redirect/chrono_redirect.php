<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\ChronoRedirect;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class ChronoRedirect extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'Chrono Redirect';
	static $group = array('z_external' => 'External Apps');

	function execute(&$form, $action_id){
		$config = $form->actions_config[$action_id];
		$config = new \GCore\Libs\Parameter($config);
		
		$app = \JFactory::getApplication();
		$session = \JFactory::getSession();
		$url_id = \JRequest::getVar('url_id');
		if(!empty($url_id)){
			$session_key = 'chrono_redirect_'.$url_id;
			$session->set($session_key, 1);
			$target_url = $session->get($session_key.'_return');
			if(!empty($target_url)){
				$app->redirect($target_url);
			}
		}
	}

	public static function config($configs = array(), $extra_config = array()){
		echo \GCore\Helpers\Html::formStart('action_config connection_action_action_config', 'connection_action_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		//echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][ccname]', array('type' => 'text', 'label' => l_('CF_CONNECTION_NAME'), 'sublabel' => l_('CF_CONNECTION_NAME_DESC')));
		//echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][action]', array('type' => 'text', 'label' => l_('CF_CONNECTION_ACTION'), 'sublabel' => l_('CF_CONNECTION_ACTION_DESC')));
		echo \GCore\Helpers\Html::input('Form[extras][actions_config][{N}][action]', array('type' => 'hidden'));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}