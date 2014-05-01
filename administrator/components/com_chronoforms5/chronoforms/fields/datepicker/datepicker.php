<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Fields\Datepicker;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class Datepicker {
	static $title = 'Datepicker Box';
	static $cat_id = 'basic';
	static $cat_title = 'Basic';
	static $settings = array(
		'tag' => 'input',
		'type' => 'text',
		'render_type' => 'datepicker',
		'name' => 'datepicker',
		'id' => 'datepicker',
		'value' => '',
		'label' => 'Datepicker Label',
		'sublabel' => '',
		'placeholder' => '',
		'class' => '',
		'title' => '',
		'style' => ''
	);

	static $configs = array(
		'render_type' => array('value' => 'datepicker', 'type' => 'hidden', 'class' => 'L'),
		'name' => array('value' => 'datepicker{N}', 'label' => 'Field Name', 'type' => 'text', 'class' => 'element_field_name L', 'sublabel' => 'No spaces or special characters.'),
		'id' => array('value' => 'datepicker{N}', 'label' => 'Field ID', 'type' => 'text', 'class' => 'L'),
		'value' => array('value' => '', 'label' => 'Field Value', 'type' => 'text', 'class' => 'L'),
		'label.text' => array('value' => 'Datepicker Label', 'label' => 'Label', 'type' => 'text', 'class' => 'L'),
		'label.position' => array('values' => 'left', 'label' => 'Label position', 'type' => 'dropdown', 'options' => array('left' => 'Left', 'top' => 'Top')),
		':data-gdatetimepicker-format' => array('values' => 'd-m-Y', 'label' => 'Format', 'type' => 'dropdown', 'options' => array(
			'd-m-Y' => 'd-m-Y',
			'd/m/Y' => 'd/m/Y',
			'd.m.Y' => 'd.m.Y',
			'm-d-Y' => 'm-d-Y',
			'm/d/Y' => 'm/d/Y',
			'Ymd' => 'Ymd',
			'Y-m-d' => 'Y-m-d',
		)),
		'sublabel' => array('value' => '', 'label' => 'Sub Label', 'type' => 'text', 'class' => 'L'),
		'placeholder' => array('value' => '', 'label' => 'Placeholder', 'type' => 'text', 'class' => 'L'),
		'class' => array('value' => '', 'label' => 'Class', 'type' => 'text', 'class' => 'L'),
		'title' => array('value' => '', 'label' => 'Title', 'type' => 'text', 'class' => 'L'),
		'style' => array('value' => '', 'label' => 'Style', 'type' => 'text', 'class' => 'L'),
		'params' => array('value' => '', 'label' => 'Extra params', 'type' => 'textarea', 'alt' => 'multiline', 'rows' => 5, 'cols' => 60, 'sublabel' => 'In Multiline format:param_name=param_value'),
		':data-load-state' => array('label' => 'Load state', 'type' => 'dropdown', 'options' => array('' => 'Visible & Enabled', 'hidden' => 'Hidden', 'hidden_parent' => 'Parent hidden', 'disabled' => 'Disabled')),
		':data-tooltip' => array('value' => '', 'label' => 'Tooltip', 'type' => 'textarea', 'rows' => 2, 'cols' => 60),
	);

	public static function element($data = array()){
		echo \GCore\Helpers\Html::formSecStart('original_element', 'datepicker_origin');
		echo \GCore\Helpers\Html::formLine(self::$settings['name'], array_merge(self::$settings, $data));
		echo \GCore\Helpers\Html::formSecEnd();
	}

	public static function config($data = array(), $k = '{N}'){
		echo \GCore\Helpers\Html::formStart('original_element_config single_element_config', 'datepicker_origin_config');
		?>
		<ul class="nav nav-tabs">
			<li><a href="#general-<?php echo $k; ?>" data-g-toggle="tab"><?php echo l_('CF_GENERAL'); ?></a></li>
			<li><a href="#validation-<?php echo $k; ?>" data-g-toggle="tab"><?php echo l_('CF_VALIDATION'); ?></a></li>
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
			echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][:data-gdatetimepicker]', array('type' => 'hidden', 'value' => '1'));
			echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][container_id]', array('type' => 'hidden', 'id' => 'container_id'.$k, 'value' => '0'));
			echo \GCore\Helpers\Html::formSecEnd();
			?>
			</div>
			<div id="validation-<?php echo $k; ?>" class="tab-pane">
			<?php
			echo \GCore\Helpers\Html::formSecStart();
			echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][validation][required]', array('type' => 'dropdown', 'label' => l_('CF_REQUIRED'), 'options' => array('' => l_('NO'), 1 => l_('YES'))));
			echo \GCore\Helpers\Html::formSecEnd();
			?>
			</div>
		</div>
		<?php
		echo \GCore\Helpers\Html::formEnd();
	}
}
?>