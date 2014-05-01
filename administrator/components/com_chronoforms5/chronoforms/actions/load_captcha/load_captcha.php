<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\LoadCaptcha;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class LoadCaptcha extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'Load Captcha';
	static $group = array('anti_spam' => 'Anti Spam');

	function execute(&$form, $action_id){
		$config =  $form->actions_config[$action_id];
		$config = new \GCore\Libs\Parameter($config);
		if((bool)$config->get('refresh_button', 0) === true){
			$form->form['Form']['content'] = str_replace('{captcha_img}', '<img src="'.r_(\GCore\C::get('GCORE_ROOT_URL').'index.php?ext=chronoforms&act=render&action=load_captcha&chronoform='.$form->form['Form']['title'].'&action_id='.$action_id.'&tvout=ajax').'" alt="" id="gcaptcha_'.$action_id.'" /><img src="'.\GCore\C::get('GCORE_FRONT_URL').'admin/extensions/chronoforms/actions/load_captcha/refresh.png" border="0" style="padding:0px 0px 15px 10px;" alt="refresh" onclick="document.getElementById(\'gcaptcha_'.$action_id.'\').src = \''.r_(\GCore\C::get('GCORE_ROOT_URL').'index.php?ext=chronoforms&act=render&tvout=ajax&action=load_captcha&action_id='.$action_id.'&chronoform=').$form->form['Form']['title'].'\' + \'&\' + Math.random();" />', $form->form['Form']['content']);
		}else{
			$form->form['Form']['content'] = str_replace('{captcha_img}', '<img src="'.r_(\GCore\C::get('GCORE_ROOT_URL').'index.php?ext=chronoforms&act=render&action=load_captcha&chronoform='.$form->form['Form']['title'].'&action_id='.$action_id.'&tvout=ajax').'" alt="" />', $form->form['Form']['content']);
		}
	}

	function render(&$form, $action_id){
		$config = !empty($form->actions_config[$action_id]) ? $form->actions_config[$action_id] : array();
		$config = new \GCore\Libs\Parameter($config);
		\GCore\Helpers\Captcha\Captcha::display($config->get('fonts', 0));
	}

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config load_captcha_action_config', 'load_captcha_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][fonts]', array('type' => 'dropdown', 'label' => l_('CF_TRUE_FONTS'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_TRUE_FONTS_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][refresh_button]', array('type' => 'dropdown', 'label' => l_('CF_REFRESH_BUTTON'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_REFRESH_BUTTON_DESC')));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}