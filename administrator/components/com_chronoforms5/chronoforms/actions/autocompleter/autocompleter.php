<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\Autocompleter;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class Autocompleter extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'Autocompleter';
	static $group = array('utilities' => 'Utilities');

	function execute(&$form, $action_id){
		$config = !empty($form->actions_config[$action_id]) ? $form->actions_config[$action_id] : array();
		$config = new \GCore\Libs\Parameter($config);
		$doc = \GCore\Libs\Document::getInstance();

		$ajax_url = $config->get('results_event', '') ? r_(\GCore\C::get('GCORE_ROOT_URL').'index.php?ext=chronoforms&chronoform='.$form->form['Form']['title'].'&event='.$config->get('results_event', '').'&tvout=ajax') : $config->get('results_url', '');

		if((bool)$form->params->get('jquery', 1) === true){
			$doc->_('jquery');
		}
		$doc->_('autocompleter');
		$doc->__('autocompleter', $config->get('field_selector', '.auto_complete'), array('path' => $ajax_url, 'length' => $config->get('length', 2), 'multiple' => $config->get('multiple', 0)));
	}

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config autocompleter_action_config', 'autocompleter_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();

		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][field_selector]', array('type' => 'text', 'label' => l_('CF_AC_FIELD_SELECTOR'), 'class' => 'L', 'sublabel' => l_('CF_AC_FIELD_SELECTOR_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][results_url]', array('type' => 'text', 'label' => l_('CF_AC_RESULTS_URL'), 'class' => 'XXL', 'sublabel' => l_('CF_AC_RESULTS_URL_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][results_event]', array('type' => 'text', 'label' => l_('CF_AC_RESULTS_EVENT'), 'class' => 'L', 'sublabel' => l_('CF_AC_RESULTS_EVENT_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][length]', array('type' => 'text', 'label' => l_('CF_AC_LENGTH'), 'value' => '2', 'sublabel' => l_('CF_AC_LENGTH_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][multiple]', array('type' => 'dropdown', 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'label' => l_('CF_AC_MULTIPLE'), 'sublabel' => l_('CF_AC_MULTIPLE_DESC')));

		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}