<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Extensions\Chronoforms\Libs;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class Form {
	var $data;
	var $events_actions = array();
	var $errors = array();
	var $form_output = '';
	var $stop = false;
	var $goto = null;
	var $_val = false;
	var $files = array();
	var $debug = array();

	var $form = array();
	var $dna = array();
	var $actions_config = array();

	function __construct($formname = ''){
		if(!empty($formname)){
			$this->getForm($formname);
		}else{
			echo 'Form name can NOT be empty!';
		}
	}

	public static function getInstance($formname = '', $reset = false){
		static $instances;
		if(!isset($instances)){
			$instances = array();
		}
		if(empty($instances[trim($formname)]) OR $reset){
			$instances[trim($formname)] = new self($formname);
			return $instances[trim($formname)];
		}else{
			return $instances[trim($formname)];
		}
	}

	function getForm($formname){
		if(!empty($formname)){
			$this->form = \GCore\Admin\Extensions\Chronoforms\Models\Form::getInstance()->find('first', array(
				'conditions' => array('title' => $formname, 'published' => 1),
			));

			if(!empty($this->form)){
				$this->data = &\GCore\Libs\Request::raw();
				$this->dna = $this->form['Form']['extras']['DNA'];
				$this->actions_config = $this->form['Form']['extras']['actions_config'];
				$this->params = new \GCore\Libs\Parameter($this->form['Form']['params']);
				//$this->get_events_actions();
			}else{
				echo 'Form not found or is not published';
			}
		}else{
			echo 'Form name can NOT be empty!';
		}
	}

	function process($event_hops = array('load')){
		$event_dna = \GCore\Libs\Arr::getVal($this->dna, $event_hops);
		if(!empty($event_dna)){
			//ob_start();
			foreach($event_dna as $action => $action_events){
				if($this->stop === true){
					$this->stop = false;
					break;
				}
				list($action_id, $action_title) = $this->extract_action_info($action);

				//if(isset($this->actions_config[$action_id])){
					if(isset($this->actions_config[$action_id]['enabled']) AND (bool)$this->actions_config[$action_id]['enabled'] === false){
						continue;
					}
					ob_start();
					$this->runAction($action_title, $action_id, $action_events, $event_hops);
					$this->form_output .= ob_get_clean();
				//}
			}
			//$this->form_output = ob_get_clean();
			$this->display_errors();
			$this->display_output();
		}
		//$this->_val();
	}

	function runAction($action_title, $action_id, $action_events = array(), $event_hops = array()){
		$classname = '\GCore\Admin\Extensions\Chronoforms\Actions\\'.\GCore\Libs\Str::camilize($action_title)."\\".\GCore\Libs\Str::camilize($action_title);
		${$classname} = new $classname();
		${$classname}->execute($this, $action_id);
		if(!empty(${$classname}->events)){
			foreach(${$classname}->events as $event => $status){
				if((bool)$status === true){
					if(!empty($action_events[$event])){
						array_push($event_hops, $action_title.'_'.$action_id, $event);
						$this->process($event_hops);
					}
				}
			}
		}
	}

	function execute($action_title, $config = array()){
		$new_action_id = max(array_keys($this->actions_config)) + 1;
		$this->actions_config[$new_action_id] = $config;
		$classname = '\GCore\Admin\Extensions\Chronoforms\Actions\\'.\GCore\Libs\Str::camilize($action_title)."\\".\GCore\Libs\Str::camilize($action_title);
		${$classname} = new $classname();
		${$classname}->execute($this, $new_action_id);
	}

	function extract_action_info($action){
		$pcs = explode('_', $action);
		$action_id = $pcs[count($pcs) - 1];
		unset($pcs[count($pcs) - 1]);
		$action_title = implode('_', $pcs);
		return array($action_id, $action_title);
	}

	function render_action($action, $action_id = 0){
		$classname = '\GCore\Admin\Extensions\Chronoforms\Actions\\'.\GCore\Libs\Str::camilize($action).'\\'.\GCore\Libs\Str::camilize($action);
		if(method_exists($classname, 'render')){
			${$classname} = new $classname();
			${$classname}->render($this, $action_id);
		}
	}

	function display_output(){
		echo $this->translate($this->form_output);
		$this->form_output = '';
	}

	function display_errors(){
		if(!empty($this->errors)){
			$session = \GCore\Libs\Base::getSession();
			foreach($this->errors as $error){
				$session->setFlash('validation', $error);
			}
		}
		$this->errors = array();
		//echo \GCore\Libs\AppJ::getSystemMessages();
	}

	function translate($data = ''){
		$_f = function($e){
			$cs = explode('=', $e, 2);
			return array_map('trim', $cs);
		};
		$site_lang = \GCore\Libs\Str::camilize(str_replace('-', '_', strtolower(\GCore\Libs\Base::getConfig('site_language'))));
		if(!empty($this->form['Form']['extras']['locales'])){
			foreach($this->form['Form']['extras']['locales'] as $l => $lang_data){
				$tag = $lang_data['lang_tag'];
				$tag_cap = \GCore\Libs\Str::camilize($tag);
				if($tag_cap == $site_lang){
					$lines = explode("\n", $lang_data['strings']);
					$strings = array_map($_f, $lines);
					$texts =  \GCore\Libs\Arr::getVal($strings, array('[n]', 0));
					if(!empty($lang_data['strict'])){
						$texts = array_map(function($text){return '['.$text.']';}, $texts);
					}
					$locales =  \GCore\Libs\Arr::getVal($strings, array('[n]', 1));
					$data = str_replace($texts, $locales, $data);
				}
			}
		}
		return $data;
	}

	function _val(){
		if(true AND !$this->_val){
			$params = new \GCore\Libs\Parameter($this->_settings());
			if((bool)$params->get('validated', 0) !== true){
				$this->runAction('credits');
			}
			$this->_val = true;
		}
	}

	function data($key, $default = null){
		//check POST
		$value = \GCore\Libs\Arr::getVal($this->data, explode('.', $key), null);
		if(!is_null($value)){
			return $value;
		}
		//return default
		return $default;
	}

	public static function _settings(){
		static $settings;
		if(!empty($settings)){
			return $settings;
		}
		$settings_model = new \GCore\Admin\Models\Extension();
		$settings_data = $settings_model->find('first', array('conditions' => array('name' => 'chronoforms')));
		if(!empty($settings_data['Extension']['settings'])){
			$settings = $settings_data['Extension']['settings'];
			return $settings;
		}else{
			return array();
		}
	}

}