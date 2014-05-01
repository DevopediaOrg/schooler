<?php 
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
?>
<?php
	$doc = \GCore\Libs\Document::getInstance();
	$doc->_('jquery');
	$doc->_('jquery-ui');
	$doc->_('forms');
	$doc->__('tabs', '#details-panel');
	
	$this->Toolbar->addButton('save', 'index.php?ext=editors&act=save_settings', l_('SAVE'), $this->Assets->image('save', 'toolbar/'));
?>
<form action="index.php?ext=editors&act=save_settings" method="post" name="admin_form" id="admin_form">	
	<div id="details-panel">
		<ul>
			<li><a href="#general"><?php echo l_('GENERAL'); ?></a></li>
		</ul>
		<div id="general">
			<?php echo $this->Html->formStart(); ?>
			<?php echo $this->Html->formSecStart(); ?>
			<?php echo $this->Html->formLine('Editors[active_editor]', array('type' => 'dropdown', 'label' => l_('EDITORS_ACTIVE_EDITOR'), 'values' => array('tinymce'), 
				'options' => array(
					'' => 'GCore Editor - Default', 
					'tinymce' => 'TinyMCE',
					'ckeditor' => 'CKEditor',
				)
			)); ?>
			<?php echo $this->Html->formSecEnd(); ?>
			<?php echo $this->Html->formEnd(); ?>
		</div>
	</div>
</form>