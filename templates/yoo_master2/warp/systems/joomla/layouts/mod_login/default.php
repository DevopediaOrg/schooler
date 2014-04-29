<?php
/**
* @package   Warp Theme Framework
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
*/

// no direct access
defined('_JEXEC') or die;

JHtml::_('behavior.keepalive');

?>

<form class="uk-form" action="<?php echo JRoute::_('index.php', true, $params->get('usesecure')); ?>" method="post">

	<?php if ($params->get('pretext')) : ?>
	<div class="uk-form-row">
		<?php echo $params->get('pretext'); ?>
	</div>
	<?php endif; ?>

	<div class="uk-form-row">
		<input class="uk-width-1-1" type="text" name="username" size="18" placeholder="<?php echo JText::_('MOD_LOGIN_VALUE_USERNAME') ?>">
	</div>

	<div class="uk-form-row">
		<input class="uk-width-1-1" type="password" name="password" size="18" placeholder="<?php echo JText::_('JGLOBAL_PASSWORD') ?>">
	</div>

	<?php if (count($twofactormethods) > 1): ?>
	<div class="uk-form-row">
		<input class="uk-width-1-1" type="text" name="secretkey" tabindex="0" size="18" placeholder="<?php echo JText::_('JGLOBAL_SECRETKEY') ?>" />
	</div>
	<?php endif; ?>

	<?php if (JPluginHelper::isEnabled('system', 'remember')) : ?>
	<div class="uk-form-row">
		<?php $number = rand(); ?>
		<label for="modlgn-remember-<?php echo $number; ?>"><?php echo JText::_('MOD_LOGIN_REMEMBER_ME') ?></label>
		<input id="modlgn-remember-<?php echo $number; ?>" type="checkbox" name="remember" value="yes" checked>
	</div>
	<?php endif; ?>
	
	<div class="uk-form-row">
		<button class="uk-button uk-button-primary" value="<?php echo JText::_('JLOGIN') ?>" name="Submit" type="submit"><?php echo JText::_('JLOGIN') ?></button>
	</div>

	<ul class="uk-list uk-margin-bottom-remove">
		<li><a href="<?php echo JRoute::_('index.php?option=com_users&view=reset'); ?>"><?php echo JText::_('MOD_LOGIN_FORGOT_YOUR_PASSWORD'); ?></a></li>
		<li><a href="<?php echo JRoute::_('index.php?option=com_users&view=remind'); ?>"><?php echo JText::_('MOD_LOGIN_FORGOT_YOUR_USERNAME'); ?></a></li>
		<?php $usersConfig = JComponentHelper::getParams('com_users'); ?>
		<?php if ($usersConfig->get('allowUserRegistration')) : ?>
		<li><a href="<?php echo JRoute::_('index.php?option=com_users&view=registration'); ?>"><?php echo JText::_('MOD_LOGIN_REGISTER'); ?></a></li>
		<?php endif; ?>
	</ul>
	
	<?php if($params->get('posttext')) : ?>
	<div class="uk-form-row">
		<?php echo $params->get('posttext'); ?>
	</div>
	<?php endif; ?>
	
	<input type="hidden" name="option" value="com_users">
	<input type="hidden" name="task" value="user.login">
	<input type="hidden" name="return" value="<?php echo $return; ?>">
	<?php echo JHtml::_('form.token'); ?>
</form>
