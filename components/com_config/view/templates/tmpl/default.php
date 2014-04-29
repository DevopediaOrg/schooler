<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_config
 *
 * @copyright   Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

JHtml::_('behavior.formvalidation');
JHtml::_('behavior.keepalive');
$user = JFactory::getUser();

?>
<script type="text/javascript">
	Joomla.submitbutton = function(task)
	{
		if (task == 'config.cancel' || document.formvalidator.isValid(document.id('templates-form')))
		{
			Joomla.submitform(task, document.getElementById('templates-form'));
		}
	}
</script>

<form action="<?php echo JRoute::_('index.php?option=com_config'); ?>" method="post" name="adminForm" id="templates-form" class="form-validate">

	<div class="row-fluid">

		<!-- Begin Content -->
		<div class="span12">

			<div class="btn-toolbar">
				<div class="btn-group">
					<button type="button" class="btn btn-primary" onclick="Joomla.submitbutton('config.save.templates.apply')">
						<i class="icon-ok"></i> <?php echo JText::_('JSAVE') ?>
					</button>
				</div>
				<div class="btn-group">
					<button type="button" class="btn" onclick="Joomla.submitbutton('config.cancel')">
						<i class="icon-cancel"></i> <?php echo JText::_('JCANCEL') ?>
					</button>
				</div>
			</div>

	<hr class="hr-condensed" />

	<div id="page-site" class="tab-pane active">
				<div class="row-fluid">
					<div class="span6">
						<?php // Get the menu parameters that are automatically set but may be modified.
					echo $this->loadTemplate('options'); ?>

					</div>
				</div>
	</div>

	<input type="hidden" name="task" value="" />
	<?php echo JHtml::_('form.token'); ?>

	</div>
		<!-- End Content -->
	</div>

</form>
