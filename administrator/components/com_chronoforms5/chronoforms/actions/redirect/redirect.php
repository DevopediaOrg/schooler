<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\Redirect;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class Redirect extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'Redirect';
	static $group = array('utilities' => 'Utilities');

	function execute(&$form, $action_id){
		$config = !empty($form->actions_config[$action_id]) ? $form->actions_config[$action_id] : array();
		$config = new \GCore\Libs\Parameter($config);
		
		$r_params = array();
		if(strlen(trim($config->get('extra_params', '')))){
			$extras = \GCore\Libs\Str::list_to_array($config->get('extra_params', ''));
			foreach($extras as $k => $v){
				$r_params[$k] = $form->data($v);
			}
		}
		$url = \GCore\Libs\Url::buildQuery($config->get('url', ''), $r_params);

		if(strlen($config->get('url', ''))){
			\GCore\Libs\Env::redirect($url);
		}
	}

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config redirect_action_config', 'redirect_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();

		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][url]', array('type' => 'text', 'label' => l_('CF_REDIRECT_URL'), 'class' => 'XL', 'sublabel' => l_('CF_REDIRECT_URL_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][extra_params]', array('type' => 'textarea', 'label' => l_('CF_REDIRECT_EXTRA_PARAMS'), 'rows' => 5, 'cols' => 60, 'sublabel' => l_('CF_REDIRECT_EXTRA_PARAMS_DESC')));
		
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}