<?php
	/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
	defined("GCORE_SITE") or die;
	$doc = \GCore\Libs\Document::getInstance();
	$doc->_('jquery');
	$doc->_('jquery-ui');
	$doc->addCssFile('modules/tasks/assets/css/tasks.css');
	$tasks = $this->Tasks->getTasks();
?>
<?php if(!empty($tasks)): ?>
	<div id="ccms_actions" style="padding-top:15px;">
	<?php foreach($tasks as $id => $info): ?>
		<p>
			<?php echo $this->Html->url('<span>'.$info['text'].'</span>', $info['href'], array('class' => 'cmms_actions')); ?>
			<?php
				if(!empty($info['image'])){
					echo $this->Html->image($info['image'], array('alt' => $info['text']));
				}else{
					echo '&nbsp;';
				}
			?>
		</p>
	<?php endforeach; ?>
	</div>
<?php endif; ?>