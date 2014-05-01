<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\ClientValidation;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class ClientValidation extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'JS - Client Validation';
	static $group = array('validation' => 'Validation');

	function execute(&$form, $action_id){
		$config =  $form->actions_config[$action_id];

		$rules = array();
		$messages = array();

		foreach($config['rules'] as $rule => $data){
			if(!empty($data)){
				$fields = explode("\n", $data);
				foreach($fields as $field){
					$fch = explode(':', $field);
					$rules[trim($fch[0])][$rule] = true;
					if(isset($fch[1])){
						$rules[trim($fch[0])][$rule] = trim($fch[1]);
						if($fch[1] == ''){
							unset($rules[trim($fch[0])][$rule]);
						}
					}
				}
			}
		}
		//pr($rules);

		if(!empty($rules)){
			$doc = \GCore\Libs\Document::getInstance();
			if((bool)$form->params->get('jquery', 1) === true){
				$doc->_('jquery');
			}
			
			$js_code = '
			jQuery(document).ready(function($){
			';
			foreach($rules as $fld => $ls){
				$validations = 'validate["'.implode('","', array_keys($ls)).'"]';
				$js_code .= '$("#chronoform-'.$form->form['Form']['title'].'").find(":input[name=\''.$fld.'\']").addClass(\''.$validations.'\');';
			}
			$js_code .= '
				$("#chronoform-'.$form->form['Form']['title'].'").gvalidate({});
			});
			';
			
			
			//$doc->_('jquery.validate');
			
			/*$js_code = '
jQuery(document).ready(function($){
	$("#chronoform-'.$form->form['Form']['title'].'").validate({
		errorClass: "gform-error",
		validClass: "gform-valid",
		errorPlacement: function(error, element){
			error.appendTo(element.closest(".gform-input-container"));
		},
		highlight: function(element, errorClass, validClass){
			$(element).closest(".gform-line-td").addClass("gform-line-td-error");
		},
		unhighlight: function(element, errorClass, validClass){
			$(element).closest(".gform-line-td").removeClass("gform-line-td-error");
		},
		rules: {'."\n";
		foreach($rules as $fld => $ls){
			$compound_rules = array();
			$compound_rules[] = "			".'"'.$fld.'" : {';
			$single_rules = array();
			foreach($ls as $l => $v){
				$single_rules[] = '				'.$l.' : '.(string)$v;
			}
			$compound_rules[] = implode(",\n", $single_rules);
			$compound_rules[] = '			}';
			$js_code .= implode("\n", $compound_rules).",\n";
		}
		$js_code .= '		}
	});
});
			';*/

			$doc->addJsCode($js_code);
		}
	}

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config client_validation_action_config', 'client_validation_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][rules][required]', array('type' => 'textarea', 'label' => l_('CF_REQUIRED'), 'rows' => 5, 'cols' => 60, 'sublabel' => l_('CF_VALIDATION_FORMAT_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][rules][minlength]', array('type' => 'textarea', 'label' => l_('CF_MINLENGTH'), 'rows' => 5, 'cols' => 60, 'sublabel' => ''));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][rules][maxlength]', array('type' => 'textarea', 'label' => l_('CF_MAXLENGTH'), 'rows' => 5, 'cols' => 60, 'sublabel' => ''));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][rules][rangelength]', array('type' => 'textarea', 'label' => l_('CF_RANGELENGTH'), 'rows' => 5, 'cols' => 60, 'sublabel' => ''));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][rules][min]', array('type' => 'textarea', 'label' => l_('CF_MIN'), 'rows' => 5, 'cols' => 60, 'sublabel' => ''));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][rules][max]', array('type' => 'textarea', 'label' => l_('CF_MAX'), 'rows' => 5, 'cols' => 60, 'sublabel' => ''));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][rules][range]', array('type' => 'textarea', 'label' => l_('CF_RANGE'), 'rows' => 5, 'cols' => 60, 'sublabel' => ''));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][rules][email]', array('type' => 'textarea', 'label' => l_('CF_EMAIL'), 'rows' => 5, 'cols' => 60, 'sublabel' => ''));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][rules][url]', array('type' => 'textarea', 'label' => l_('CF_URL'), 'rows' => 5, 'cols' => 60, 'sublabel' => ''));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][rules][number]', array('type' => 'textarea', 'label' => l_('CF_NUMBER'), 'rows' => 5, 'cols' => 60, 'sublabel' => ''));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][rules][date]', array('type' => 'textarea', 'label' => l_('CF_DATE'), 'rows' => 5, 'cols' => 60, 'sublabel' => ''));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][rules][digits]', array('type' => 'textarea', 'label' => l_('CF_DIGITS'), 'rows' => 5, 'cols' => 60, 'sublabel' => ''));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][rules][equalTo]', array('type' => 'textarea', 'label' => l_('CF_EQUALTO'), 'rows' => 5, 'cols' => 60, 'sublabel' => ''));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}