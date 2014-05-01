<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\CheckSecurityQuestion;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class CheckSecurityQuestion extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'Check Security Question';
	//static $setup = array('simple' => array('title' => 'Captcha'));
	static $group = array('anti_spam' => 'Anti Spam');

	var $events = array('success' => 0, 'fail' => 0);

	var $defaults = array(
		'error' => "You have entered a wrong security question's answer.",
	);

	function execute(&$form, $action_id){
		$config =  $form->actions_config[$action_id];
		$config = new \GCore\Libs\Parameter($config);
		
		if(isset($form->data['chrono_security_answer'])){
			$session = \GCore\Libs\Base::getSession();
			$session_key = $config->get('session_key', '');
			if(empty($session_key)){
				$session_key = $form->form['Form']['title'];
			}
			$sessionvar = $session->get("chrono_security_answers_".$session_key, array());
			
			$chrono_security_answer = strtolower(trim($form->data['chrono_security_answer']));
			if(!in_array($chrono_security_answer, $sessionvar)){
				$this->events['fail'] = 1;
				$form->errors['chrono_security_answer'] = $config->get('error', "You have entered a wrong security question's answer.");
				$form->data['chrono_security_answer'] = '';
				$form->debug[$action_id][self::$title][] = "Failed the answer check!";
			}else{
				$this->events['success'] = 1;
				$form->data['chrono_security_answer'] = '';
				$form->debug[$action_id][self::$title][] = "Passed the answer check!";
			}		
		}else{
			$this->events['fail'] = 1;
			$form->errors['chrono_security_answer'] = $config->get('error', "You have entered a wrong security question's answer.");
			$form->debug[$action_id][self::$title][] = "Couldn't find the answer field value in the \$_POST array!";
		}
	}

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config check_captcha_action_config', 'check_captcha_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][error]', array('type' => 'text', 'label' => l_('CF_ERROR'), 'class' => 'XL', 'sublabel' => l_('CF_SEC_Q_ERROR_DESC')));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}