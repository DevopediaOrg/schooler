<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Fields\Hidden;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class Hidden {
	static $title = 'Hidden Field';
	static $cat_id = 'basic';
	static $cat_title = 'Basic';
	static $settings = array(
		'tag' => 'input',
		'type' => 'hidden',
		'name' => 'hidden',
		'id' => 'hidden',
		'value' => '',
		'label' => 'Hidden Label',
	);

	static $configs = array(
		'name' => array('value' => 'hidden{N}', 'label' => 'Field Name', 'type' => 'text', 'class' => 'element_field_name L', 'sublabel' => 'No spaces or special characters.'),
		'id' => array('value' => 'hidden{N}', 'label' => 'Field ID', 'type' => 'text', 'class' => 'L'),
		'value' => array('value' => '', 'label' => 'Field Value', 'type' => 'text', 'class' => 'L'),
		'label' => array('value' => 'Hidden Label', 'label' => 'Label', 'type' => 'text', 'class' => 'L'),
		'params' => array('value' => '', 'label' => 'Extra params', 'type' => 'textarea', 'alt' => 'multiline', 'rows' => 5, 'cols' => 60, 'sublabel' => 'In Multiline format:param_name=param_value'),
	);

	public static function element($data = array()){
		echo \GCore\Helpers\Html::formSecStart('original_element', 'hidden_origin');
		echo \GCore\Helpers\Html::formLine(self::$settings['name'], array_merge(self::$settings, $data));
		echo \GCore\Helpers\Html::formSecEnd();
	}

	public static function config($data = array(), $k = '{N}'){
		echo \GCore\Helpers\Html::formStart('original_element_config single_element_config', 'hidden_origin_config');
		?>
		<ul class="nav nav-tabs">
			<li><a href="#general-<?php echo $k; ?>" data-g-toggle="tab"><?php echo l_('CF_GENERAL'); ?></a></li>
		</ul>
		<div class="tab-content">
			<div id="general-<?php echo $k; ?>" class="tab-pane">
			<?php
			echo \GCore\Helpers\Html::formSecStart();
			foreach(self::$configs as $name => $params){
				$params['value'] = isset($data[$name]) ? (($params['type'] == 'text') ? htmlspecialchars($data[$name]) : $data[$name]) : (isset($params['value']) ? $params['value'] : '');
				$params['values'] = isset($data[$name]) ? $data[$name] : (isset($params['values']) ? $params['values'] : '');
				echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.']['.$name.']', $params);
			}
			echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][type]', array('type' => 'hidden', 'value' => self::$settings['type']));
			echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][container_id]', array('type' => 'hidden', 'id' => 'container_id'.$k, 'value' => '0'));
			echo \GCore\Helpers\Html::formSecEnd();
			?>
			</div>
		</div>
		<?php
		echo \GCore\Helpers\Html::formEnd();
	}
}
?>