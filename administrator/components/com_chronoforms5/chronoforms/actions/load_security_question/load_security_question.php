<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\LoadSecurityQuestion;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class LoadSecurityQuestion extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'Load Security Question';
	static $group = array('anti_spam' => 'Anti Spam');

	function execute(&$form, $action_id){
		$config =  $form->actions_config[$action_id];
		$config = new \GCore\Libs\Parameter($config);
		$session = \GCore\Libs\Base::getSession();
		
		//extract questions
		$q_as = explode("\n", $config->get('questions', ''));
		$rand = rand(0, count($q_as) - 1);
		$choosen = explode("=", $q_as[$rand]);
		
		$answers = explode(',', trim($choosen[1]));
		foreach($answers as $k => $answer){
			$answers[$k] = strtolower($answer);
		}
		
		$session_key = $config->get('session_key', '');
		if(empty($session_key)){
			$session_key = $form->form['Form']['title'];
		}
		
		$session->set('chrono_security_answers_'.$session_key, $answers);
		
		$form->form['Form']['content'] = str_replace('{chrono_security_question}', trim($choosen[0]), $form->form['Form']['content']);
	}

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config load_captcha_action_config', 'load_captcha_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][questions]', array('type' => 'textarea', 'label' => l_('CF_SEC_Q_QUESTIONS'), 'rows' => 10, 'cols' => 70, 'sublabel' => l_('CF_SEC_Q_QUESTIONS_DESC')));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}