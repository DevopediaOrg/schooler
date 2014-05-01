<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\SubmitLimit;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class SubmitLimit extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'Submit Limit';
	static $group = array('security' => 'Security');
	var $events = array('fail' => 0);

	var $defaults = array(
		'limit' => 20,
		'message' => '',
	);

	function execute(&$form, $action_id){
		$config =  $form->actions_config[$action_id];
		$config = new \GCore\Libs\Parameter($config);

		$session = \GCore\Libs\Base::getSession();
		$limit = (int)$config->get('limit', 20);
		$form_title = $form->form['Form']['title'];
		//limit exists
		$last_submit = $session->get($form_title.'.submit_limit.limit', 0);
		//form has been submitted this session
		if(!empty($last_submit)){
			if($last_submit + $limit > time()){
				$this->events['fail'] = 1;
				if($config->get('message', '')){
					$session->setFlash('error', $config->get('message', ''));
				}
				return;
			}
		}
		$session->set($form_title.'.submit_limit.limit', time());

		//$this->events['good_submit'] = 1;
		return;
	}

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config submit_limit_action_config', 'submit_limit_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][limit]', array('type' => 'text', 'class' => 'S', 'label' => l_('CF_SUBMIT_LIMIT_LIMIT'), 'sublabel' => l_('CF_SUBMIT_LIMIT_LIMIT_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][message]', array('type' => 'text', 'class' => 'XXL', 'label' => l_('CF_SUBMIT_LIMIT_MSG'), 'sublabel' => l_('CF_SUBMIT_LIMIT_MSG_DESC')));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}