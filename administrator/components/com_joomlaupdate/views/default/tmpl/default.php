<?php
/**
 * @package     Joomla.Administrator
 * @subpackage  com_joomlaupdate
 *
 * @copyright   Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

$ftpFieldsDisplay = $this->ftp['enabled'] ? '' : 'style = "display: none"';

?>

<form action="index.php" method="post" id="adminForm">

<?php if (is_null($this->updateInfo['object'])) : ?>

<fieldset>
	<legend>
		<?php echo JText::_('COM_JOOMLAUPDATE_VIEW_DEFAULT_NOUPDATES') ?>
	</legend>
	<p>
		<?php echo JText::sprintf('COM_JOOMLAUPDATE_VIEW_DEFAULT_NOUPDATESNOTICE', JVERSION); ?>
	</p>
</fieldset>

<?php else: ?>

<fieldset>
	<legend>
		<?php echo JText::_('COM_JOOMLAUPDATE_VIEW_DEFAULT_UPDATEFOUND') ?>
	</legend>

	<table class="table table-striped">
		<tbody>
			<tr>
				<td>
					<?php echo JText::_('COM_JOOMLAUPDATE_VIEW_DEFAULT_INSTALLED') ?>
				</td>
				<td>
					<?php echo $this->updateInfo['installed'] ?>
				</td>
			</tr>
			<tr>
				<td>
					<?php echo JText::_('COM_JOOMLAUPDATE_VIEW_DEFAULT_LATEST') ?>
				</td>
				<td>
					<?php echo $this->updateInfo['latest'] ?>
				</td>
			</tr>
			<tr>
				<td>
					<?php echo JText::_('COM_JOOMLAUPDATE_VIEW_DEFAULT_PACKAGE') ?>
				</td>
				<td>
					<a href="<?php echo $this->updateInfo['object']->downloadurl->_data ?>">
						<?php echo $this->updateInfo['object']->downloadurl->_data ?>
					</a>
				</td>
			</tr>
			<tr>
				<td>
					<?php echo JText::_('COM_JOOMLAUPDATE_VIEW_DEFAULT_METHOD') ?>
				</td>
				<td>
					<?php echo $this->methodSelect ?>
				</td>
			</tr>
			<tr id="row_ftp_hostname" <?php echo $ftpFieldsDisplay ?>>
				<td>
					<?php echo JText::_('COM_JOOMLAUPDATE_VIEW_DEFAULT_FTP_HOSTNAME') ?>
				</td>
				<td>
					<input type="text" name="ftp_host" value="<?php echo $this->ftp['host'] ?>" />
				</td>
			</tr>
			<tr id="row_ftp_port" <?php echo $ftpFieldsDisplay ?>>
				<td>
					<?php echo JText::_('COM_JOOMLAUPDATE_VIEW_DEFAULT_FTP_PORT') ?>
				</td>
				<td>
					<input type="text" name="ftp_port" value="<?php echo $this->ftp['port'] ?>" />
				</td>
			</tr>
			<tr id="row_ftp_username" <?php echo $ftpFieldsDisplay ?>>
				<td>
					<?php echo JText::_('COM_JOOMLAUPDATE_VIEW_DEFAULT_FTP_USERNAME') ?>
				</td>
				<td>
					<input type="text" name="ftp_user" value="<?php echo $this->ftp['username'] ?>" />
				</td>
			</tr>
			<tr id="row_ftp_password" <?php echo $ftpFieldsDisplay ?>>
				<td>
					<?php echo JText::_('COM_JOOMLAUPDATE_VIEW_DEFAULT_FTP_PASSWORD') ?>
				</td>
				<td>
					<input type="text" name="ftp_pass" value="<?php echo $this->ftp['password'] ?>" />
				</td>
			</tr>
			<tr id="row_ftp_directory" <?php echo $ftpFieldsDisplay ?>>
				<td>
					<?php echo JText::_('COM_JOOMLAUPDATE_VIEW_DEFAULT_FTP_DIRECTORY') ?>
				</td>
				<td>
					<input type="text" name="ftp_root" value="<?php echo $this->ftp['directory'] ?>" />
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td>
					&nbsp;
				</td>
				<td>
					<button class="submit" type="submit">
						<?php echo JText::_('COM_JOOMLAUPDATE_VIEW_DEFAULT_INSTALLUPDATE') ?>
					</button>
				</td>
			</tr>
		</tfoot>
	</table>
</fieldset>

<?php endif; ?>

<?php echo JHtml::_('form.token'); ?>
<input type="hidden" name="task" value="update.download" />
<input type="hidden" name="option" value="com_joomlaupdate" />
</form>

<div class="download_message" style="display: none">
	<p></p>
	<p class="nowarning"> <?php echo JText::_('COM_JOOMLAUPDATE_VIEW_DEFAULT_DOWNLOAD_IN_PROGRESS'); ?></p>
	<div class="joomlaupdate_spinner"></div>
</div>
