<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Models;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class Form extends \GCore\Libs\GModel {
	var $tablename = '#__chronoengine_chronoforms';
	static $tabs = array();
	static $sliders = array();

	function initialize(){
		$this->validate = array(
			'title' => array(
				'required' => true,
				'not_empty' => true,
				'message' => l_('CF_FORM_TITLE_REQUIRED')
			),
		);
	}

	function beforeSave(&$data, &$params, $mode){
		foreach($data['extras']['actions_config'] as $f_k => $f_info){
			if(strpos($f_k, '{N}') !== false){
				unset($data['extras']['actions_config'][$f_k]);
			}
		}
		if(!empty($data['extras']['fields']) AND $data['form_type'] == '1'){
			foreach($data['extras']['fields'] as $f_k => $f_info){
				if(strpos($f_k, '{N}') !== false){
					unset($data['extras']['fields'][$f_k]);
				}
			}
			//$data['wizardcode'] = serialize($data['fields_config']);
			if(!empty($data['extras']['fields'])){
				ob_start();
				\GCore\Helpers\Html::active_set('div');//!empty($data['params']['html_helper_set']) ? $data['params']['html_helper_set'] : 'div');
				/*if(!empty($data['params']['theme']) AND $data['params']['theme'] != 'bootstrap3'){
					$doc = \GCore\Libs\Document::getInstance();
					$doc->theme = $data['params']['theme'];
				}*/
				$theme = !empty($data['params']['theme']) ? $data['params']['theme'] : '';
				$doc = \GCore\Libs\Document::getInstance();
				$doc->theme = $theme;
				//echo \GCore\Helpers\Html::formSecStart();

				$containers_ids = array();
				$containers_configs = array();
				foreach($data['extras']['fields'] as $k => $field){
					if($field['type'] == 'multi' AND isset($field['inputs'])){
						foreach($field['inputs'] as $sub_id => $input){
							$field['inputs'][$sub_id] = $this->fix_field_data($field['inputs'][$sub_id]);
						}
					}else{
						$field = $this->fix_field_data($field);
					}
					if($field['type'] == 'container'){
						//if this container is also a root container then close existing ones
						if($field['container_id'] == 0){
							//close all open containers
							foreach($containers_ids as $containers_id){
								$container_id = array_pop($containers_ids);
								echo $this->build_container_code($containers_configs[$container_id], 'end', $k);
							}
						}else{
							check_parent_container:
							if(!empty($containers_ids)){
								$last_container_id = array_pop($containers_ids);
								if($field['container_id'] == $last_container_id){
									//do nothing, we should add the field as regular
									array_push($containers_ids, $last_container_id);
								}else{
									//one container has just ended, because the element belongs to a differnt one, close it
									echo $this->build_container_code($containers_configs[$last_container_id], 'end', $k);
									goto check_parent_container;
								}
							}
						}
						echo $this->build_container_code($field, 'start', $k);
						array_push($containers_ids, $k);
						$containers_configs[$k] = $field;
					}else{
						if(isset($field['container_id'])){
							if($field['container_id'] == 0){
								//close all open containers
								foreach(array_keys($containers_ids) as $c_k){
									$container_id = array_pop($containers_ids);
									echo $this->build_container_code($containers_configs[$container_id], 'end', $k);
								}
							}else{
								check_container:
								if(!empty($containers_ids)){
									$last_container_id = array_pop($containers_ids);
									if($field['container_id'] == $last_container_id){
										//do nothing, we should add the field as regular
										array_push($containers_ids, $last_container_id);
									}else{
										//one container has just ended, because the element belongs to a differnt one, close it
										echo $this->build_container_code($containers_configs[$last_container_id], 'end', $k);
										goto check_container;
									}
								}
							}
						}

						if($field['type'] == 'hidden'){
							echo \GCore\Helpers\Html::input($field['name'], $field);
						}else{
							if(!empty($field['dynamic_data']['enabled']) AND !empty($field['dynamic_data']['data_path']) AND !empty($field['dynamic_data']['value_key']) AND !empty($field['dynamic_data']['text_key'])){
								echo '<?php';
								echo "\n";
								echo '$keys = \GCore\Libs\Arr::getVal(\GCore\Libs\Arr::getVal($form->data, explode(".", "'.$field['dynamic_data']['data_path'].'")), explode(".", "[n].'.$field['dynamic_data']['value_key'].'"));';
								echo "\n";
								echo '$values = \GCore\Libs\Arr::getVal(\GCore\Libs\Arr::getVal($form->data, explode(".", "'.$field['dynamic_data']['data_path'].'")), explode(".", "[n].'.$field['dynamic_data']['text_key'].'"));';
								echo "\n";
								echo '$options = array_combine($keys, $values);';
								$front_field = $field;
								unset($front_field['validation'], $front_field['events'], $front_field['dynamic_data']);
								echo "\n";
								echo '$field = '.var_export($front_field, true).';';
								echo "\n";
								echo '$field["options"] = $options;';
								echo "\n";
								echo 'echo \GCore\Helpers\Html::formLine($field["name"], $field);';
								echo "\n";
								echo '?>';
							}else{
								/*if(isset($field['label'])){
									$position = isset($field['label_pos']) ? $field['label_pos'] : 'left';
									$field['label'] = array('text' => $field['label'], 'position' => $position);
								}*/
								echo \GCore\Helpers\Html::formLine($field['name'], $field);
							}
						}
					}
				}
				//close any empty containers with no fields after them
				while($container_id = array_pop($containers_ids)){
					echo $this->build_container_code($containers_configs[$container_id], 'end', $container_id);
				}
				//echo \GCore\Helpers\Html::formSecEnd();
				//echo \GCore\Helpers\Html::formEnd();
				$data['content'] = ob_get_clean();
			}else{
				$data['content'] = '';
			}
		}
		foreach($data['extras']['actions_config'] as $k => $act_info){
			if(!empty($act_info['__action_title__'])){
				$action_title = $act_info['__action_title__'];
				$classname = '\GCore\Admin\Extensions\Chronoforms\Actions\\'.\GCore\Libs\Str::camilize($action_title)."\\".\GCore\Libs\Str::camilize($action_title);
				if(method_exists($classname, 'on_form_save')){
					${$classname} = new $classname();
					${$classname}->on_form_save($data, $k);
				}
			}
		}
		if(!empty(self::$tabs)){
			foreach(self::$tabs as $container_id => $tabs){
				$tabs_bar = '';
				foreach($tabs as $tab_id => $tab_title){
					$tab_class = empty($tabs_bar) ? ' class="active"' : '';
					$tabs_bar .= '<li'.$tab_class.'><a href="#'.$tab_id.'" data-g-toggle="tab">'.$tab_title.'</a></li>';
				}
				$data['content'] = str_replace('__TABS_TITLES__'.$container_id.'__', $tabs_bar, $data['content']);
			}
		}
		parent::beforeSave($data, $params, $mode);
	}

	function fix_field_data($field = array()){
		if(isset($field['options'])){
			$options = array();
			if(!empty($field['options'])){
				$lines = explode("\n", $field['options']);
				foreach($lines as $line){
					$opts = explode("=", $line);
					$options[trim($opts[0])] = isset($opts[1]) ? trim($opts[1]) : trim($opts[0]);
				}
			}
			$field['options'] = $options;
		}
		if(isset($field['values'])){
			$values = array();
			if(!empty($field['values'])){
				$values = explode("\n", $field['values']);
			}
			$field['values'] = $values;
		}
		if(isset($field['params'])){
			$params = array();
			if(!empty($field['params'])){
				$lines = explode("\n", $field['params']);
				foreach($lines as $line){
					$opts = explode("=", $line);
					$field[':'.trim($opts[0])] = isset($opts[1]) ? trim($opts[1]) : trim($opts[0]);
				}
			}
		}
		if(!empty($field['validation'])){
			$field_validations = array();
			foreach($field['validation'] as $rule => $value){
				if(!empty($value)){
					if(is_numeric($value)){
						$field_validations[] = $rule;
					}else{
						$field_validations[] = $rule.':'.$value;
					}
				}
			}
			$validation_class = '';
			if(!empty($field_validations)){
				$validation_class = " validate['".implode("','", $field_validations)."']";
			}
			if(isset($field['class'])){
				$field['class'] .= $validation_class;
			}else{
				$field['class'] = $validation_class;
			}
		}
		return $field;
	}

	function build_container_code($field = array(), $tag = 'start', $id){
		if($tag == 'start'){
			switch($field['container_type']){
				case '':
					return '';
				case 'div':
					return '<div class="'.$field['class'].'" id="'.$field['id'].'">';
				case 'custom':
					return $field['start_code'];
				case 'column':
					return '<div class="'.$field['class'].'" id="'.$field['id'].'" style="float:left; width:'.$field['size']['width'].'%">';
				case 'multi_column':
					return '<div class="'.$field['class'].'" id="'.$field['id'].'" style="overflow:auto;">';
				case 'page':
					return '';
				case 'fieldset':
					return '<fieldset class="'.$field['class'].'" id="'.$field['id'].'">
					<legend>'.$field['title'].'</legend>';
				case 'panel':
					return '<div class="panel panel-default '.$field['class'].'" id="'.$field['id'].'">
					<div class="panel-heading">'.$field['title'].'</div>
					<div class="panel-body">';
				case 'tabs_area':
					return '<div class="'.$field['class'].'" id="'.$field['id'].'">
					<ul class="nav nav-tabs">'.'__TABS_TITLES__'.$id.'__'.'</ul>
					<div class="tab-content">';
				case 'pills_area':
					return '<div class="'.$field['class'].'" id="'.$field['id'].'">
					<ul class="nav nav-pills">'.'__TABS_TITLES__'.$id.'__'.'</ul>
					<div class="tab-content">';
				case 'tab':
					$class = 'tab-pane';
					if(empty(self::$tabs[$field['container_id']])){
						$class = 'tab-pane active';
					}
					self::$tabs[$field['container_id']][$field['id']] = $field['title'];
					return '<div id="'.$field['id'].'" class="'.$class.'">';
				case 'sliders_area':
					self::$sliders[$id]['id'] = $field['id'];
					return '<div class="panel-group '.$field['class'].'" id="'.$field['id'].'">';
				case 'slider':
					$class = ' collapse';
					if(empty(self::$sliders[$field['container_id']]['class'])){
						$class = ' in';
						self::$sliders[$field['container_id']]['class'] = 'collapse';
					}
					return '<div class="panel panel-default '.$field['class'].'" id="'.$field['id'].'">
					<div class="panel-heading"><h4 class="panel-title"><a data-g-toggle="collapse" data-g-parent="#'.self::$sliders[$field['container_id']]['id'].'" href="#slider-'.$id.'">'.$field['title'].'</a></h4></div>
					<div id="slider-'.$id.'" class="panel-collapse'.$class.'">
					<div class="panel-body">';
			}
		}else{
			switch($field['container_type']){
				case '':
					return '';
				case 'div':
					return '</div>';
				case 'custom':
					return $field['end_code'];
				case 'column':
					return '</div>';
				case 'multi_column':
					return '</div><div style="clear:both;"></div>';
				case 'page':
					return '<!--_CHRONOFORMS_PAGE_BREAK_-->';
				case 'fieldset':
					return '</fieldset>';
				case 'panel':
					return '</div></div>';
				case 'tabs_area':
					return '</div></div>';
				case 'pills_area':
					return '</div></div>';
				case 'tab':
					return '</div>';
				case 'sliders_area':
					return '</div>';
				case 'slider':
					return '</div></div></div>';
			}
		}
	}
}