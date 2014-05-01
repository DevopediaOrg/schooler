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
	//$this->Toolbar->setTitle('Validate your ChronoForms install');
	$this->Toolbar->addButton('add', r_('index.php?ext=chronoforms&act=validateinstall'), 'Validate', $this->Assets->image('confirm', 'toolbar/'));
	$this->Toolbar->addButton('cancel', r_('index.php?ext=chronoforms'), l_('CF_CANCEL'), $this->Assets->image('cancel', 'toolbar/'), 'link');
?>
<div class="row" style="margin-top:20px;">
	<div class="col-md-6">
		<h3><?php echo l_('Validate your ChronoForms install'); ?></h3>
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
			<form action="<?php echo r_('index.php?ext=chronoforms&act=validateinstall'); ?>" method="post" name="admin_form" id="admin_form">
				<?php echo $this->Html->formStart(); ?>
				<?php echo $this->Html->formSecStart(); ?>
				<?php echo $this->Html->formLine('domain', array('type' => 'custom', 'label' => 'Domain', 'code' => $domain, 'sublabel' => 'The domain name, this domain MUST match the domain name used to generate the key on ChronoEngine.com')); ?>
				<?php echo $this->Html->formLine('domain_name', array('type' => 'hidden', 'value' => $domain)); ?>
				<?php echo $this->Html->formLine('license_key', array('type' => 'text', 'label' => 'Validation Key', 'class' => 'L', 'sublabel' => 'The short validation key which you should generate using your sale# on www.chronoengine.com')); ?>
				<?php echo $this->Html->formLine('pid', array('type' => 'dropdown', 'label' => 'Product', 'class' => 'L', 'options' => array(
					14 => 'ChronoForms 3 validation keys subscription', 
					4 => 'ChronoForms 5 validation keys subscription', 
					6 => 'ChronoForms Ultimate subscription',
					18 => 'ChronoForms PayPal actions Ultimate subscription',
					7 => 'ChronoForms Authorize.net actions Ultimate subscription',
				), 'sublabel' => 'Your subscription type')); ?>
				<?php echo $this->Html->formLine('instantcode', array('type' => 'text', 'label' => 'Instant Code', 'class' => 'XXL', 'sublabel' => 'In some situations you may need to provide the instant code, you do not need to enter this code unless you had instructions to do so.')); ?>
				<?php echo $this->Html->formSecEnd(); ?>
				<?php echo $this->Html->formEnd(); ?>
			</form>
		</div>
	</div>
</div>
</div>
</div>