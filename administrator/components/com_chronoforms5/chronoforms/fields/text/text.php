<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Fields\Text;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class Text {
	static $title = 'Text Box';
	static $cat_id = 'basic';
	static $cat_title = 'Basic';
	static $settings = array(
		'tag' => 'input',
		'type' => 'text',
		'name' => 'text',
		'id' => 'text',
		'value' => '',
		'label' => 'Text Label',
		'sublabel' => '',
		'placeholder' => '',
		'maxlength' => '',
		'size' => '',
		'class' => '',
		'title' => '',
		'style' => ''
	);

	static $configs = array(
		'name' => array('value' => 'text{N}', 'label' => 'Field Name', 'type' => 'text', 'class' => 'element_field_name L', 'sublabel' => 'No spaces or special characters.'),
		'id' => array('value' => 'text{N}', 'label' => 'Field ID', 'type' => 'text', 'class' => 'L'),
		'value' => array('value' => '', 'label' => 'Field Value', 'type' => 'text', 'class' => 'L'),
		'label.text' => array('value' => 'Text Label', 'label' => 'Label', 'type' => 'text', 'class' => 'L'),
		'label.position' => array('values' => 'left', 'label' => 'Label position', 'type' => 'dropdown', 'options' => array('left' => 'Left', 'top' => 'Top')),
		'sublabel' => array('value' => '', 'label' => 'Sub Label', 'type' => 'text', 'class' => 'L'),
		'placeholder' => array('value' => '', 'label' => 'Placeholder', 'type' => 'text', 'class' => 'L'),
		'maxlength' => array('value' => '', 'label' => 'Max Length', 'type' => 'text', 'class' => 'L'),
		'size' => array('value' => '', 'label' => 'Size', 'type' => 'text', 'class' => 'L'),
		'class' => array('value' => '', 'label' => 'Class', 'type' => 'text', 'class' => 'L'),
		'title' => array('value' => '', 'label' => 'Title', 'type' => 'text', 'class' => 'L'),
		'style' => array('value' => '', 'label' => 'Style', 'type' => 'text', 'class' => 'L'),
		':data-inputmask' => array('values' => '', 'label' => 'Mask', 'type' => 'dropdown', 'options' => array(
			'' => ' - ',
			"'alias' : 'dd/mm/yyyy'" => 'dd/mm/yyyy',
			"'alias' : 'mm/dd/yyyy'" => 'mm/dd/yyyy',
			"'alias' : 'yyyy/mm/dd'" => 'yyyy/mm/dd',
			"'alias' : 'dd.mm.yyyy'" => 'dd.mm.yyyy',
			"'alias' : 'dd-mm-yyyy'" => 'dd-mm-yyyy',
			"'alias' : 'mm.dd.yyyy'" => 'mm.dd.yyyy',
			"'alias' : 'mm-dd-yyyy'" => 'mm-dd-yyyy',
			"'alias' : 'yyyy.mm.dd'" => 'yyyy.mm.dd',
			"'alias' : 'yyyy-mm-dd'" => 'yyyy-mm-dd',
			"'alias' : 'datetime'" => 'datetime : dd/mm/yyyy hh:mm',
			"'alias' : 'datetime12'" => 'datetime12 : dd/mm/yyyy hh:mm xm',
			"'alias' : 'hh:mm t'" => 'hh:mm t',
			"'alias' : 'h:s t'" => 'h:s t',
			"'alias' : 'hh:mm:ss'" => 'hh:mm:ss',
			"'alias' : 'hh:mm'" => 'hh:mm',
			"'alias' : 'mm/yyyy'" => 'mm/yyyy',
			"'alias' : 'decimal'" => 'Decimal',
			"'alias' : 'integer'" => 'Integer',
			"'mask' : '+9(999)999-9999'" => 'Phone : +p(ppp)ppp-pppp',
			"'alias' : 'url'" => 'URL',
			"'alias' : 'ip'" => 'IP address',
		)),
		'params' => array('value' => '', 'label' => 'Extra params', 'type' => 'textarea', 'alt' => 'multiline', 'rows' => 5, 'cols' => 60, 'sublabel' => 'In Multiline format:param_name=param_value'),
		':data-load-state' => array('label' => 'Load state', 'type' => 'dropdown', 'options' => array('' => 'Visible & Enabled', 'hidden' => 'Hidden', 'hidden_parent' => 'Parent hidden', 'disabled' => 'Disabled')),
		':data-tooltip' => array('value' => '', 'label' => 'Tooltip', 'type' => 'textarea', 'rows' => 2, 'cols' => 60),
	);

	public static function element($data = array()){
		echo \GCore\Helpers\Html::formSecStart('original_element', 'text_origin');
		echo \GCore\Helpers\Html::formLine(self::$settings['name'], array_merge(self::$settings, $data));
		echo \GCore\Helpers\Html::formSecEnd();
	}

	public static function config($data = array(), $k = '{N}'){
		echo \GCore\Helpers\Html::formStart('original_element_config single_element_config', 'text_origin_config');
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
			echo \GCore\Helpers\Html::input('Form[extras][fields]['.$k.'][container_id]', array('type' => 'hidden', 'id' => 'container_id'.$k, 'value' => '0'));
			echo \GCore\Helpers\Html::formSecEnd();
			?>
			</div>
			<div id="validation-<?php echo $k; ?>" class="tab-pane">
			<?php
			echo \GCore\Helpers\Html::formSecStart();
			echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][validation][required]', array('type' => 'dropdown', 'label' => l_('CF_REQUIRED'), 'options' => array('' => l_('NO'), 1 => l_('YES'))));
			echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][validation][alpha]', array('type' => 'dropdown', 'label' => l_('CF_ALPHA'), 'options' => array('' => l_('NO'), 1 => l_('YES'))));
			echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][validation][alphanum]', array('type' => 'dropdown', 'label' => l_('CF_ALPHA_NUMERIC'), 'options' => array('' => l_('NO'), 1 => l_('YES'))));
			echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][validation][digit]', array('type' => 'dropdown', 'label' => l_('CF_DIGIT'), 'options' => array('' => l_('NO'), 1 => l_('YES'))));
			echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][validation][nodigit]', array('type' => 'dropdown', 'label' => l_('CF_NO_DIGIT'), 'options' => array('' => l_('NO'), 1 => l_('YES'))));
			echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][validation][number]', array('type' => 'dropdown', 'label' => l_('CF_NUMBER'), 'options' => array('' => l_('NO'), 1 => l_('YES'))));
			echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][validation][email]', array('type' => 'dropdown', 'label' => l_('CF_EMAIL'), 'options' => array('' => l_('NO'), 1 => l_('YES'))));
			echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][validation][phone]', array('type' => 'dropdown', 'label' => l_('CF_PHONE'), 'options' => array('' => l_('NO'), 1 => l_('YES'))));
			echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][validation][phone_inter]', array('type' => 'dropdown', 'label' => l_('CF_INT_PHONE'), 'options' => array('' => l_('NO'), 1 => l_('YES'))));
			echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][validation][url]', array('type' => 'dropdown', 'label' => l_('CF_URL'), 'options' => array('' => l_('NO'), 1 => l_('YES'))));
			echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][validation][confirm]', array('type' => 'text', 'label' => l_('CF_VALIDATE_CONFIRM'), 'sublabel' => l_('CF_VALIDATE_CONFIRM_DESC')));
			echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][validation][custom]', array('type' => 'text', 'label' => l_('CF_VALIDATE_CUSTOM'), 'sublabel' => l_('CF_VALIDATE_CUSTOM_DESC')));
			//echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][validation][minlength]', array('type' => 'text', 'label' => l_('CF_MINLENGTH')));
			//echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][validation][maxlength]', array('type' => 'text', 'label' => l_('CF_MAXLENGTH')));
			//echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][validation][rangelength]', array('type' => 'text', 'label' => l_('CF_RANGELENGTH')));
			//echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][validation][min]', array('type' => 'text', 'label' => l_('CF_MIN')));
			//echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][validation][max]', array('type' => 'text', 'label' => l_('CF_MAX')));
			//echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][validation][range]', array('type' => 'text', 'label' => l_('CF_RANGE')));
			//echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][validation][date]', array('type' => 'dropdown', 'label' => l_('CF_DATE'), 'options' => array('' => l_('NO'), 1 => l_('YES'))));
			//echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][validation][digits]', array('type' => 'dropdown', 'label' => l_('CF_DIGITS'), 'options' => array('' => l_('NO'), 1 => l_('YES'))));
			//echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][validation][equalTo]', array('type' => 'text', 'label' => l_('CF_EQUALTO')));
			//echo \GCore\Helpers\Html::formLine('Form[extras][fields]['.$k.'][validation][creditcard]', array('type' => 'text', 'label' => l_('CF_CREDITCARD')));
			echo \GCore\Helpers\Html::formSecEnd();
			?>
			</div>
		</div>
		<?php
		echo \GCore\Helpers\Html::formEnd();
	}
}
?>