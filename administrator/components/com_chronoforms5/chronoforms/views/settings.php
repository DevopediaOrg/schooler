<?php
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
?>
<div class="chrono-page-container">
<div class="container" style="width:100%;">
<?php
	$doc = \GCore\Libs\Document::getInstance();
	$doc->_('jquery');
	//$doc->_('jquery-ui');
	$doc->_('bootstrap');
	$doc->_('forms');

	//$this->Toolbar->setTitle(l_('CF_SETTINGS'));
	$this->Toolbar->addButton('save', r_('index.php?ext=chronoforms&act=save_settings'), l_('SAVE'), $this->Assets->image('save', 'toolbar/'));
	$this->Toolbar->addButton('cancel', r_('index.php?ext=chronoforms'), l_('CF_CANCEL'), $this->Assets->image('cancel', 'toolbar/'), 'link');
?>
<div class="row" style="margin-top:20px;">
	<div class="col-md-6">
		<h3><?php echo l_('CF_SETTINGS'); ?></h3>
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
			<form action="<?php echo r_('index.php?ext=chronoforms&act=save_settings'); ?>" method="post" name="admin_form" id="admin_form">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#emails" data-g-toggle="tab"><?php echo l_('CF_EMAILS'); ?></a></li>
					<li><a href="#wizard" data-g-toggle="tab"><?php echo l_('CF_WIZARD'); ?></a></li>
				</ul>
				<div class="tab-content">
					<div id="emails" class="tab-pane active">
						<?php echo $this->Html->formStart(); ?>
						<?php echo $this->Html->formSecStart(); ?>
						<?php echo $this->Html->formLine('Chronoforms[mail][mail_from_name]', array('type' => 'text', 'label' => l_('CF_MAIL_FROM_NAME'), 'sublabel' => l_('CF_MAIL_FROM_NAME_DESC'), 'class' => 'L')); ?>
						<?php echo $this->Html->formLine('Chronoforms[mail][mail_from_email]', array('type' => 'text', 'label' => l_('CF_MAIL_FROM_EMAIL'), 'sublabel' => l_('CF_MAIL_FROM_EMAIL_DESC'), 'class' => 'L')); ?>
						<?php echo $this->Html->formLine('Chronoforms[mail][mail_reply_name]', array('type' => 'text', 'label' => l_('CF_MAIL_REPLY_NAME'), 'sublabel' => l_('CF_MAIL_REPLY_NAME_DESC'), 'class' => 'L')); ?>
						<?php echo $this->Html->formLine('Chronoforms[mail][mail_reply_email]', array('type' => 'text', 'label' => l_('CF_MAIL_REPLY_EMAIL'), 'sublabel' => l_('CF_MAIL_REPLY_EMAIL_DESC'), 'class' => 'L')); ?>
						<?php echo $this->Html->formLine('Chronoforms[mail][smtp]', array('type' => 'dropdown', 'label' => l_('CF_ENABLE_SMTP'), 'options' => array(0 => l_('NO'), 1 => l_('YES')))); ?>
						<?php echo $this->Html->formLine('Chronoforms[mail][smtp_secure]', array('type' => 'text', 'label' => l_('CF_SMTP_SECURE'), 'sublabel' => l_('CF_SMTP_SECURE_DESC'))); ?>
						<?php echo $this->Html->formLine('Chronoforms[mail][smtp_host]', array('type' => 'text', 'class' => 'L', 'label' => l_('CF_SMTP_HOST'))); ?>
						<?php echo $this->Html->formLine('Chronoforms[mail][smtp_port]', array('type' => 'text', 'label' => l_('CF_SMTP_PORT'))); ?>
						<?php echo $this->Html->formLine('Chronoforms[mail][smtp_username]', array('type' => 'text', 'class' => 'L', 'label' => l_('CF_SMTP_USERNAME'))); ?>
						<?php echo $this->Html->formLine('Chronoforms[mail][smtp_password]', array('type' => 'text', 'class' => 'L', 'label' => l_('CF_SMTP_PASSWORD'))); ?>
						<?php echo $this->Html->formSecEnd(); ?>
						<?php echo $this->Html->formEnd(); ?>
					</div>
					<div id="wizard" class="tab-pane">
						<?php echo $this->Html->formStart(); ?>
						<?php echo $this->Html->formSecStart(); ?>
						<?php echo $this->Html->formLine('Chronoforms[wizard][safe_save]', array('type' => 'dropdown', 'label' => l_('CF_WIZARD_SAFE_SAVE'), 'values' => 1, 'sublabel' => l_('CF_WIZARD_SAFE_SAVE_DESC'), 'options' => array(0 => l_('NO'), 1 => l_('YES')))); ?>
						<?php echo $this->Html->formLine('Chronoforms[wizard][safe_loading_fields_count]', array('type' => 'text', 'label' => l_('CF_WIZARD_SAFE_LOADING_FIELDS_COUNT'), 'value' => 20, 'sublabel' => l_('CF_WIZARD_SAFE_LOADING_FIELDS_COUNT_DESC'))); ?>
						<?php echo $this->Html->formSecEnd(); ?>
						<?php echo $this->Html->formEnd(); ?>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</div>
</div>