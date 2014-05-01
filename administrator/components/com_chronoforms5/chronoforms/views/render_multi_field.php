<?php
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
?>
<?php if(!empty($fields)): ?>
<?php $this->Html->active_set('div'); ?>
<?php echo $this->Html->formSecStart('original_element'); ?>
<?php
	$inputs = array();
	foreach($fields as $k => $field){
		$class = '\GCore\Admin\Extensions\Chronoforms\Fields\\'.\GCore\Libs\Str::camilize($field).'\\'.\GCore\Libs\Str::camilize($field);
		$settings = $class::$settings;
		//unset($settings['label']);
		$inputs[] = $settings;
	}
?>
<?php echo $this->Html->formLine('__wizard_multi'.rand(), array('type' => 'multi', 'label' => '', 'layout' => 'wide', 'inputs' => $inputs)); ?>
<?php echo $this->Html->formSecEnd(); ?>
<div class="original_element_config">
<?php
	$sub_fields_count = $fields_count;
	foreach($fields as $k => $field){
		$class = '\GCore\Admin\Extensions\Chronoforms\Fields\\'.\GCore\Libs\Str::camilize($field).'\\'.\GCore\Libs\Str::camilize($field);
		ob_start();
		$class::config(array(), $sub_fields_count);
		$con = ob_get_clean();
		$con = str_replace('{N}', $sub_fields_count, $con);
		$con = str_replace('Form[extras][fields]['.$sub_fields_count.']', 'Form[extras][fields]['.$fields_count.'][inputs]['.$field.$sub_fields_count.']', $con);
		echo '<div class="panel panel-default">';
		echo '<div class="well well-sm">'.$field.$sub_fields_count.'</div>';
		echo $con;
		echo '</div>';
		$sub_fields_count++;
	}
?>
<?php //echo $this->Html->input('multi_field', array('type' => 'hidden', 'value' => 1)); ?>
<?php echo $this->Html->input('Form[extras][fields]['.$fields_count.'][type]', array('type' => 'hidden', 'value' => 'multi')); ?>
<?php echo $this->Html->input('Form[extras][fields]['.$fields_count.'][id]', array('type' => 'hidden', 'value' => 'multi-'.$fields_count)); ?>
<?php echo $this->Html->input('Form[extras][fields]['.$fields_count.'][layout]', array('type' => 'hidden', 'value' => 'wide')); ?>
<?php echo $this->Html->input('Form[extras][fields]['.$fields_count.'][name]', array('type' => 'hidden', 'value' => 'multi')); ?>
<?php echo $this->Html->input('Form[extras][fields]['.$fields_count.'][container_id]', array('type' => 'hidden', 'id' => 'container_id'.$fields_count, 'value' => '0')); ?>
</div>
<?php endif; ?>