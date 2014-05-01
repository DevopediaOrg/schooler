<?php
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
?>
<?php
	$doc = \GCore\Libs\Document::getInstance();
	
	$buttons = $this->Toolbar->getButtons();
	if(!empty($buttons)){
		$this->Toolbar->loadFiles();
	}
	
	$form_id = $this->Toolbar->getFormID();
?>
<?php
	echo $this->Toolbar->renderTitle();
?>
<?php if(!empty($buttons) AND !empty($form_id)): ?>
	<?php echo $this->Toolbar->renderBar(); ?>
<?php endif; ?>