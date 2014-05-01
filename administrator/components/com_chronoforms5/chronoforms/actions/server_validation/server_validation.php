<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\ServerValidation;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class ServerValidation extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'Server Validation';
	static $group = array('validation' => 'Validation');

	var $events = array('success' => 0, 'fail' => 0);

	function execute(&$form, $action_id){
		$config =  $form->actions_config[$action_id];
		$failed = false;
		foreach($config['rules'] as $rule => $data){
			if(!empty($data)){
				$fields = explode("\n", $data);
				foreach($fields as $field){
					$fch = explode(':', $field);
					if(count($fch) > 1){
						$valid = \GCore\Libs\Validate::$rule($form->data($fch[0]));
						if(!$valid){
							$failed = true;
							$form->errors[] = $fch[1];
						}
					}
				}
			}
		}
		if($failed){
			$this->events['fail'] = 1;
		}else{
			$this->events['success'] = 1;
		}
	}

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config server_validation_action_config', 'server_validation_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][rules][not_empty]', array('type' => 'textarea', 'label' => l_('CF_NOT_EMPTY'), 'rows' => 5, 'cols' => 60, 'sublabel' => l_('CF_NOT_EMPTY_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][rules][is_empty]', array('type' => 'textarea', 'label' => l_('CF_EMPTY'), 'rows' => 5, 'cols' => 60, 'sublabel' => ''));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][rules][no_spaces]', array('type' => 'textarea', 'label' => l_('CF_NO_SPACES'), 'rows' => 5, 'cols' => 60, 'sublabel' => ''));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][rules][alpha]', array('type' => 'textarea', 'label' => l_('CF_ALPHA'), 'rows' => 5, 'cols' => 60, 'sublabel' => ''));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][rules][alphanumeric]', array('type' => 'textarea', 'label' => l_('CF_ALPHA_NUMERIC'), 'rows' => 5, 'cols' => 60, 'sublabel' => ''));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][rules][digit]', array('type' => 'textarea', 'label' => l_('CF_DIGIT'), 'rows' => 5, 'cols' => 60, 'sublabel' => ''));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][rules][nodigit]', array('type' => 'textarea', 'label' => l_('CF_NO_DIGIT'), 'rows' => 5, 'cols' => 60, 'sublabel' => ''));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][rules][number]', array('type' => 'textarea', 'label' => l_('CF_NUMBER'), 'rows' => 5, 'cols' => 60, 'sublabel' => ''));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][rules][email]', array('type' => 'textarea', 'label' => l_('CF_EMAIL'), 'rows' => 5, 'cols' => 60, 'sublabel' => ''));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][rules][phone]', array('type' => 'textarea', 'label' => l_('CF_PHONE'), 'rows' => 5, 'cols' => 60, 'sublabel' => ''));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][rules][phone_inter]', array('type' => 'textarea', 'label' => l_('CF_INT_PHONE'), 'rows' => 5, 'cols' => 60, 'sublabel' => ''));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][rules][url]', array('type' => 'textarea', 'label' => l_('CF_URL'), 'rows' => 5, 'cols' => 60, 'sublabel' => ''));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}