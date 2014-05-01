<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Fields\Dropdown;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class Dropdown {
	static $title = 'Dropdown';
	static $cat_id = 'basic';
	static $cat_title = 'Basic';
	static $settings = array(
		'tag' => 'select',
		'type' => 'dropdown',
		'name' => 'dropdown',
		'id' => 'dropdown',
		'values' => '',
		'options' => array(0 => 'No', 1 => 'Yes'),
		'label' => 'Dropdown Label',
		'sublabel' => '',
		//'multiple' => '0',
		'empty' => '',
		'size' => '',
		'class' => '',
		'title' => '',
		'style' => ''
	);

	static $configs = array(
		'name' => array('value' => 'dropdown{N}', 'label' => 'Field Name', 'type' => 'text', 'class' => 'element_field_name L', 'sublabel' => 'No spaces or special characters.'),
		'id' => array('value' => 'dropdown{N}', 'label' => 'Field ID', 'type' => 'text', 'class' => 'L'),
		'options' => array('value' => "0=No\n1=Yes", 'label' => 'Options', 'type' => 'textarea', 'rows' => 5, 'alt' => 'options', 'class' => 'L', 'sublabel' => 'In Multiline format, value=Title'),
		'empty' => array('value' => '', 'label' => 'Empty Option', 'type' => 'text', 'class' => 'L'),
		'values' => array('value' => '', 'label' => 'Selected Values', 'type' => 'textarea', 'alt' => 'multiline', 'class' => 'L', 'sublabel' => 'In Multiline format'),
		'label.text' => array('value' => 'Dropdown Label', 'label' => 'Label', 'type' => 'text', 'class' => 'L'),
		'label.position' => array('values' => 'left', 'label' => 'Label position', 'type' => 'dropdown', 'options' => array('left' => 'Left', 'top' => 'Top')),
		'sublabel' => array('value' => '', 'label' => 'Sub Label', 'type' => 'text', 'class' => 'L'),
		'multiple' => array('value' => '', 'label' => 'Multiple', 'type' => 'dropdown', 'options' => array(0 => 'No', 1 => 'Yes')),
		'size' => array('value' => '', 'label' => 'Size', 'type' => 'text', 'class' => 'L'),
		'class' => array('value' => '', 'label' => 'Class', 'type' => 'text', 'class' => 'L'),
		'title' => array('value' => '', 'label' => 'Title', 'type' => 'text', 'class' => 'L'),
		'style' => array('value' => '', 'label' => 'Style', 'type' => 'text', 'class' => 'L'),
		'params' => array('value' => '', 'label' => 'Extra params', 'type' => 'textarea', 'alt' => 'multiline', 'rows' => 5, 'cols' => 60, 'sublabel' => 'In Multiline format:param_name=param_value'),
		':data-load-state' => array('label' => 'Load state', 'type' => 'dropdown', 'options' => array('' => 'Visible & Enabled', 'hidden' => 'Hidden', 'hidden_parent' => 'Parent hidden', 'disabled' => 'Disabled')),
		':data-tooltip' => array('value' => '', 'label' => 'Tooltip', 'type' => 'textarea', 'rows' => 2, 'cols' => 60),
	);

	public static function element($data = array()){
		echo \GCore\Helpers\Html::formSecStart('original_element', 'dropdown_origin');
		echo \GCore\Helpers\Html::formLine(self::$settings['name'], array_merge(self::$settings, $data));
		echo \GCore\Helpers\Html::formSecEnd();
	}

	public static function config($data = array(), $k = '{N}'){
		echo \GCore\Helpers\Html::formStart('original_element_config single_element_config', 'dropdown_origin_config');
		?>
		<ul class="nav nav-tabs">
			<li><a href="#general-<?php echo $k; ?>" data-g-toggle="tab"><?php echo l_('CF_GENERAL'); ?></a></li>
			<li><a href="#validation-<?php echo $k; ?>" data-g-toggle="tab"><?php echo l_('CF_VALIDATION'); ?></a></li>
			<li><a href="#dynamic-<?php echo $k; ?>" data-g-toggle="tab"><?php echo l_('CF_DYNAMIC_DATA'); ?></a></li>
			<li><a href="#events-<?php echo $k; ?>" data-g-toggle="tab"><?php echo l_('CF_EVENTS'); ?></a></li>
		</ul>
		<div class="tab-content">
			<div id="general-<?php echo $k; ?>" class="tab-pane">
			<?php
			echo \GCore\Helpers\Html::formSecStart();
			foreach(self::$configs as $name => $params){
				$value = \GCore\Libs\Arr::getVal($data, explode('.', $name));
				$field_name = implode('][', explode('.', $name));
				$params['value'] = $value ? (($params['type'] == 'text') ? htmlspecialchars($value, ENT_QUOTES) : $value) : (isset($params['value']) ? $params['value'] : '');
				$params['values'] = $value ? $value : (isset($params['values']) ? $params['values'] : '');
				echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.']['.$field_name.']', $params);
			}
			echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][type]', array('type' => 'hidden', 'value' => self::$settings['type']));
			echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][container_id]', array('type' => 'hidden', 'id' => 'container_id'.$k, 'value' => '0'));
			echo \GCore\Helpers\Html::formSecEnd();
			?>
			</div>
			<div id="validation-<?php echo $k; ?>" class="tab-pane">
			<?php
			echo \GCore\Helpers\Html::formSecStart();
			echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][validation][required]', array('type' => 'dropdown', 'label' => l_('CF_REQUIRED'), 'options' => array('' => l_('NO'), 1 => l_('YES'))));
			echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][validation][confirm]', array('type' => 'text', 'label' => l_('CF_VALIDATE_CONFIRM'), 'sublabel' => l_('CF_VALIDATE_CONFIRM_DESC')));
			echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][validation][custom]', array('type' => 'text', 'label' => l_('CF_VALIDATE_CUSTOM'), 'sublabel' => l_('CF_VALIDATE_CUSTOM_DESC')));
			echo \GCore\Helpers\Html::formSecEnd();
			?>
			</div>
			<div id="dynamic-<?php echo $k; ?>" class="tab-pane">
			<?php
			echo \GCore\Helpers\Html::formSecStart();
			echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][dynamic_data][enabled]', array('type' => 'dropdown', 'label' => l_('CF_ENABLED'), 'options' => array('' => l_('NO'), 1 => l_('YES'))));
			echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][dynamic_data][data_path]', array('type' => 'text', 'label' => l_('CF_DATA_PATH'), 'sublabel' => l_('CF_DATA_PATH_DESC')));
			echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][dynamic_data][value_key]', array('type' => 'text', 'label' => l_('CF_VALUE_KEY'), 'sublabel' => l_('CF_VALUE_KEY_DESC')));
			echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][dynamic_data][text_key]', array('type' => 'text', 'label' => l_('CF_TEXT_KEY'), 'sublabel' => l_('CF_TEXT_KEY_DESC')));
			echo \GCore\Helpers\Html::formSecEnd();
			?>
			</div>
			<div id="events-<?php echo $k; ?>" class="tab-pane">
			<?php
			echo \GCore\Helpers\Html::formSecStart();
			if(empty($data['events'])){
				$data['events'] = array(array());
			}
			foreach($data['events'] as $i => $event){
				echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][events][required]', array('type' => 'multi', 'layout' => 'wide',
					'inputs' => array(
						array('type' => 'custom', 'name' => 'Form[extras][fields]['.$k.'][events]['.$i.'][label]', 'code' => 'On'),
						array('type' => 'dropdown', 'name' => 'Form[extras][fields]['.$k.'][events]['.$i.'][operator]', 'options' => array('=' => '=', '!=' => '!=')),
						array('type' => 'text', 'name' => 'Form[extras][fields]['.$k.'][events]['.$i.'][state]', 'sublabel' => 'Value selected', 'class' => 'S'),
						array('type' => 'dropdown', 'name' => 'Form[extras][fields]['.$k.'][events]['.$i.'][action]', 'options' => array('' => '', 'enable' => 'enable', 'disable' => 'disable', 'show' => 'show', 'hide' => 'hide', 'show_parent' => 'show parent', 'hide_parent' => 'hide parent', 'set_options' => 'Set Options', 'set_dynamic_options' => 'Set Dynamic Options', 'function' => 'function'), 'sublabel' => 'Action', 'style' => 'width:auto;'),
						array('type' => 'text', 'name' => 'Form[extras][fields]['.$k.'][events]['.$i.'][target]', 'class' => 'S', 'sublabel' => 'field id, fn() or event'),
						array('type' => 'textarea', 'name' => 'Form[extras][fields]['.$k.'][events]['.$i.'][options]', 'class' => 'A', 'rows' => 3, 'sublabel' => 'Options list or ajax event'),
					)
				));
			}
			//echo \GCore\Helpers\Html::formLine('add_field_event', array('type' => 'button', 'value' => l_('CF_ADD_EVENT'), 'id' => 'add_field_event_'.$k, 'onclick' => 'addFieldEvent(this, \'add_field_event_'.$k.'\');'));
			echo \GCore\Helpers\Html::formLine('process_field_event', array('type' => 'multi', 'layout' => 'wide',
				'inputs' => array(
					array('type' => 'button', 'name' => 'add_field_event', 'class' => 'btn btn-success', 'value' => l_('CF_ADD_EVENT'), 'id' => 'add_field_event_'.$k, 'onclick' => 'addFieldEvent(this, \'add_field_event_'.$k.'\');'),
					array('type' => 'button', 'name' => 'remove_field_event', 'class' => 'btn btn-danger', 'value' => l_('CF_REMOVE_EVENT'), 'id' => 'remove_field_event_'.$k, 'onclick' => 'removeFieldEvent(this, \'remove_field_event_'.$k.'\');'),
				)
			));
			echo \GCore\Helpers\Html::formSecEnd();
			?>
			</div>
		</div>
		<?php
		echo \GCore\Helpers\Html::formEnd();
	}
}
?>