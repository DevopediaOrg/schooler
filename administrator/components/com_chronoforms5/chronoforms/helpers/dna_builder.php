<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Helpers;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class DnaBuilder {
	var $config = true;

	function get_actions($dna = array()){
		$actions = array();
		if(!empty($dna)){
			foreach($dna as $event => $info){
				if(empty($info) OR !is_array($info)){
					continue;
				}
				foreach($info as $action => $events){
					$pcs = explode('_', $action);
					$id = $pcs[count($pcs) - 1];
					unset($pcs[count($pcs) - 1]);
					$name = implode('_', $pcs);
					$actions['_'.$id] = $name;
					$actions = array_merge($actions, $this->get_actions($events));
				}
			}
		}
		return $actions;
	}

	function build($dna = array(), $root, $configs = array()){
		$actions_output = array();
		if(!empty($dna)){
			foreach($dna as $action => $events){
				$actions_output[] = $this->build_action_display($action, $events, $root, $configs);
			}
		}
		$output = implode("\n", $actions_output);
		return $output;
	}

	function build_action_display($action, $events, $root, $configs){
		$actions_output = array();

		$pcs = explode('_', $action);
		$id = $pcs[count($pcs) - 1];
		unset($pcs[count($pcs) - 1]);
		$name = implode('_', $pcs);

		$action_class = '\GCore\Admin\Extensions\Chronoforms\Actions\\'.\GCore\Libs\Str::camilize($name).'\\'.\GCore\Libs\Str::camilize($name);
		if(class_exists($action_class) AND isset($action_class::$title)){
			$action_class = new $action_class();
			/*
			$actions_output[] = $action_label = \GCore\Helpers\Html::container('label', $action_class::$title.'<font style="color:#f00"> ('.$id.')</font>', array(
				'class' => 'action_label'
			));
			if(!empty($configs[$id]['action_label'])){
				$actions_output[] = \GCore\Helpers\Html::container('label', '<font style="color:#888"> - '.$configs[$id]['action_label'].'</font>', array(
					'class' => 'action_label'
				));
			}
			*/
			$icons_code = '<span class="edit_icon action_icon label label-primary" title="Edit">Edit</span><span class="drag_icon action_icon label label-warning" title="Drag">Drag</span><span class="delete_icon action_icon label label-danger" title="Delete">Delete</span>';
			$action_icons = \GCore\Helpers\Html::container('div', $icons_code, array(
				'id' => 'action_icons_'.$id,
				'class' => 'action_icons pull-right'
			));
			$action_title = '<div class="pull-left"><span class="form_action_label label label-primary">'.$action_class::$title.'</span><span style="" class="label label-info action_icon_number">'.$id.'</span></div>';

			$actions_output[] = \GCore\Helpers\Html::container('div', $action_title.$action_icons.'<div class="clearfix"></div>', array(
				'class' => 'panel-heading'
			));

			$action_dna = '<input type="hidden" name="'.$root.'['.$action.']" alt="ghost" class="events_dna" value="">';

			$action_events = array();
			if(!empty($events)){
				foreach($events as $event => $info){
					$event_dna = '<input type="hidden" name="'.$root.'['.$action.']['.$event.']" alt="ghost" class="events_dna" value="">';
					if($event == 'success' OR (isset($action_class->events_status[$event]) AND $action_class->events_status[$event] == 'success')){
						$e_cl = 'good_event alert alert-success';
						$label_class = 'form_event_label label label-success';
					}else if($event == 'fail' OR (isset($action_class->events_status[$event]) AND $action_class->events_status[$event] == 'fail')){
						$e_cl = 'bad_event alert alert-danger';
						$label_class = 'form_event_label label label-danger';
					}else{
						$e_cl = 'normal_event alert alert-info';
						$label_class = 'form_event_label label label-info';
					}
					$event_label = \GCore\Helpers\Html::container('label', 'On '.trim($event), array(
						'class' => $label_class
					));
					$event_container = \GCore\Helpers\Html::container('div', $event_label.$event_dna.$this->build($info, $root.'['.$action.']['.$event.']'), array(
						'id' => 'cfactionevent_'.$name.'_'.$id.'_'.$event,
						'class' => 'form_event '.$e_cl
					));
					$action_events[] = $event_container;
				}
			}

			ob_start();
			$action_class::config();
			$action_config = ob_get_clean();
			$action_config = str_replace('{N}', $id, $action_config);

			$body_contents = $action_dna.implode("\n", $action_events).$action_config;
			if(empty($this->config)){
				$body_contents = $action_dna.implode("\n", $action_events);
			}
			$actions_output[] = \GCore\Helpers\Html::container('div', $body_contents, array(
				'class' => 'panel-body'
			));

			//$actions_output[] = $action_clear = '<div class="clear">&nbsp;</div>';

			$container = \GCore\Helpers\Html::container('div', implode("\n", $actions_output), array(
				'id' => 'cfaction_'.$name.'_element_'.$id,
				'class' => 'cfaction_'.$name.'_element_view wizard_element form_action panel panel-default',
				'item_id' => $name,
			));
			return $container;
		}
		return '';
	}
}
?>