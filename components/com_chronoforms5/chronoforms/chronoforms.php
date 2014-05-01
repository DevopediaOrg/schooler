<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Extensions\Chronoforms;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class Chronoforms extends \GCore\Libs\Controller {
	function _finalize(){
		$tvout = \GCore\Libs\Request::data('tvout', '');
		if($this->_validated($this->fparams) === false AND $tvout != 'ajax'){
			echo '<p class="chrono_credits"><a href="http://www.chronoengine.com" target="_blank">Powered by ChronoForms - ChronoEngine.com</a></p>';
		}
	}
	
	function _validated($params){
		if((bool)$params->get('validated', 0) === true){
			return true;
		}
		return false;
	}
	
	function index(){
		//get the form name
		$form_name = strlen($this->get('chronoform')) ? $this->get('chronoform') : \GCore\Libs\Request::data('_chronoform_name', \GCore\Libs\Request::data('chronoform'));
		$event = strlen($this->get('event')) ? $this->get('event') : (strlen(\GCore\Libs\Request::data('event')) ? \GCore\Libs\Request::data('event') : 'load');
		/*
		commented because of a conflict with connectivity actions loading
		$url_formname = \GCore\Libs\Request::get('chronoform');
		if($url_formname != $form_name){
			$event = 'load';
		}
		*/
		//load the form class
		$form = Libs\Form::getInstance($form_name);
		$form->process(array($event));
		$this->fparams = new \GCore\Libs\Parameter($form->_settings());
		//$this->set('form', $form);
	}
	
	function render(){
		$form_name = \GCore\Libs\Request::data('chronoform');
		if(!empty($form_name)){
			$form = Libs\Form::getInstance($form_name);
			$form->render_action(\GCore\Libs\Request::data('action'), \GCore\Libs\Request::data('action_id'));
		}else{
			Libs\Form::render_action(\GCore\Libs\Request::data('action'), \GCore\Libs\Request::data('action_id'));
		}
	}
	/*
	function __call($name, $arguments = array()){
		$this->view = 'index';
		$this->index();
	}
	*/
}
?>