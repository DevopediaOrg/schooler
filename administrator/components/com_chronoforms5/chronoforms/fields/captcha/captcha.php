<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Fields\Captcha;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class Captcha {
	static $title = 'Captcha';
	static $cat_id = 'basic';
	static $cat_title = 'Basic';
	static $settings = array(
		'tag' => 'input',
		'type' => 'multi',
		'name' => 'captcha',
		'id' => 'captcha',
		'label' => 'Captcha',
		'sublabel' => '',
		'class' => '',
		'title' => '',
		'layout' => 'wide',
		'inputs' => array(
			'field' => array(
				'type' => 'text',
				'name' => 'captcha',
				'id' => 'captcha',
				'sublabel' => '',
			),
			'image' => array(
				'type' => 'custom',
				'name' => 'captcha',
				'code' => '{captcha_img}'
			),
		)
	);

	static $configs = array(
		'label.text' => array('value' => 'Captcha', 'label' => 'Label', 'type' => 'text', 'class' => 'L', 'alt' => 'ghost'),
		'label.position' => array('values' => 'left', 'label' => 'Label position', 'type' => 'dropdown', 'options' => array('left' => 'Left', 'top' => 'Top')),
		'inputs.field.sublabel' => array('value' => '', 'label' => 'Sub Label', 'type' => 'text', 'class' => 'L'),
		'inputs.field.placeholder' => array('value' => '', 'label' => 'Placeholder', 'type' => 'text', 'class' => 'L'),
		'inputs.field.maxlength' => array('value' => '', 'label' => 'Max Length', 'type' => 'text', 'class' => 'L'),
		'inputs.field.size' => array('value' => '', 'label' => 'Size', 'type' => 'text', 'class' => 'L'),
		'inputs.field.class' => array('value' => '', 'label' => 'Class', 'type' => 'text', 'class' => 'L'),
		'inputs.field.title' => array('value' => '', 'label' => 'Title', 'type' => 'text', 'class' => 'L'),
		'inputs.field.style' => array('value' => '', 'label' => 'Style', 'type' => 'text', 'class' => 'L'),
		'inputs.field.params' => array('value' => '', 'label' => 'Extra params', 'type' => 'textarea', 'alt' => 'multiline', 'rows' => 5, 'cols' => 60, 'sublabel' => 'In Multiline format:param_name=param_value'),
	);

	public static function element($data = array()){
		echo \GCore\Helpers\Html::formSecStart('original_element', 'captcha_origin');
		echo \GCore\Helpers\Html::formLine(self::$settings['name'], array_merge(self::$settings, $data));
		echo \GCore\Helpers\Html::formSecEnd();
	}

	public static function config($data = array(), $k = '{N}'){
		echo \GCore\Helpers\Html::formStart('original_element_config single_element_config', 'captcha_origin_config');
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
			echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][inputs][field][type]', array('type' => 'hidden', 'alt' => 'ghost', 'value' => 'text'));
			echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][inputs][field][name]', array('type' => 'hidden', 'alt' => 'ghost', 'value' => 'captcha'));
			echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][inputs][image][type]', array('type' => 'hidden', 'alt' => 'ghost', 'value' => 'custom'));
			echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][inputs][image][name]', array('type' => 'hidden', 'alt' => 'ghost', 'value' => 'captcha'));
			echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][inputs][image][code]', array('type' => 'hidden', 'alt' => 'ghost', 'value' => '{captcha_img}'));
			echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][layout]', array('type' => 'hidden', 'alt' => 'ghost', 'value' => self::$settings['layout']));
			echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][name]', array('type' => 'hidden', 'alt' => 'ghost', 'value' => 'captcha'));
			echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][render_type]', array('type' => 'hidden', 'alt' => 'ghost', 'value' => 'captcha'));
			echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][type]', array('type' => 'hidden', 'alt' => 'ghost', 'value' => self::$settings['type']));
			echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][container_id]', array('type' => 'hidden', 'id' => 'container_id'.$k, 'value' => '0'));
			echo \GCore\Helpers\Html::formSecEnd();
			?>
			</div>
			<div id="validation-<?php echo $k; ?>" class="tab-pane">
			<?php
			echo \GCore\Helpers\Html::formSecStart();
			echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][inputs][field][validation][required]', array('type' => 'dropdown', 'label' => l_('CF_REQUIRED'), 'options' => array('' => l_('NO'), 1 => l_('YES'))));
			echo \GCore\Helpers\Html::formSecEnd();
			?>
			</div>
		</div>
		<?php
		echo \GCore\Helpers\Html::formEnd();
	}
}
?>