<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\CheckCaptcha;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class CheckCaptcha extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'Check Captcha';
	static $setup = array('simple' => array('title' => 'Captcha'));
	static $group = array('anti_spam' => 'Anti Spam');

	var $events = array('success' => 0, 'fail' => 0);

	var $defaults = array(
		'enabled' => 1,
		'error' => 'You have entered a wrong verification code!',
	);

	function execute(&$form, $action_id){
		$config =  $form->actions_config[$action_id];
		$config = new \GCore\Libs\Parameter($config);
		if((bool)$config->get('enabled', 0) === false){
			return;
		}
		$result = \GCore\Helpers\Captcha\Captcha::check();
		if($result){
			$this->events['success'] = 1;
		}else{
			$this->events['fail'] = 1;
			$form->errors[] = $config->get('error', 'You have entered a wrong verification code!');
		}
	}

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config check_captcha_action_config', 'check_captcha_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][enabled]', array('type' => 'dropdown', 'label' => l_('CF_ENABLED'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_CHECK_CAPTCHA_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][error]', array('type' => 'text', 'label' => l_('CF_ERROR'), 'class' => 'XL', 'sublabel' => l_('CF_CAPTCHA_ERROR_DESC')));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}