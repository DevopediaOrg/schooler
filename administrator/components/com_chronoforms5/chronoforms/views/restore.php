<?php
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
?>
<div class="chrono-page-container">
<div class="container" style="width:100%;">
<?php
	$doc = \GCore\Libs\Document::getInstance();
	$doc->_('datatable');
	$doc->_('jquery');
	//$doc->_('jquery-ui');
	$doc->_('bootstrap');
	$doc->_('forms');
	//$this->Toolbar->setTitle(l_('CF_RESTORE_FORMS_TITLE'));
	$this->Toolbar->addButton('add', r_('index.php?ext=chronoforms&act=restore'), l_('CF_RESTORE'), $this->Assets->image('confirm', 'toolbar/'));
	$this->Toolbar->addButton('cancel', r_('index.php?ext=chronoforms'), l_('CF_CANCEL'), $this->Assets->image('cancel', 'toolbar/'), 'link');
?>
<div class="row" style="margin-top:20px;">
	<div class="col-md-6">
		<h3><?php echo l_('CF_RESTORE_FORMS_TITLE'); ?></h3>
	</div>
	<div class="col-md-6 pull-right text-right">
		<?php
			echo $this->Toolbar->renderBar();
		?>
	</div>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-body">
			<form action="<?php echo r_('index.php?ext=chronoforms&act=restore'); ?>" method="post" name="admin_form" id="admin_form" enctype="multipart/form-data">
				<?php echo $this->Html->formStart(); ?>
				<?php echo $this->Html->formSecStart(); ?>
				<?php echo $this->Html->formLine('cfbackup', array('type' => 'file', 'label' => l_('CF_SELECT_RESTORE_FILE'), 'sublabel' => l_('CF_SELECT_RESTORE_FILE_DESC'))); ?>
				<?php echo $this->Html->formLine('cfbackupv4', array('type' => 'file', 'label' => l_('CF_SELECT_RESTORE_FILE_V4'), 'sublabel' => l_('CF_SELECT_RESTORE_FILE_V4_DESC'))); ?>
				<?php echo $this->Html->formSecEnd(); ?>
				<?php echo $this->Html->formEnd(); ?>
			</form>
		</div>
	</div>
</div>
</div>
</div>