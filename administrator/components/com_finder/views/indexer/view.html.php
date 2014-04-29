<?php
/**
 * @package     Joomla.Administrator
 * @subpackage  com_finder
 *
 * @copyright   Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

/**
 * Indexer view class for Finder.
 *
 * @package     Joomla.Administrator
 * @subpackage  com_finder
 * @since       2.5
 */
class FinderViewIndexer extends JViewLegacy
{
	/**
	 * Method to display the view.
	 *
	 * @param   string  $tpl  A template file to load. [optional]
	 *
	 * @return  void
	 *
	 * @since   2.5
	 */
	public function display($tpl = null)
	{
		JHtml::_('behavior.framework');
		JHtml::_('stylesheet', 'com_finder/indexer.css', false, true, false);
		JHtml::_('script', 'com_finder/indexer.js', false, true);
		JHtml::_('jquery.framework');
		JHtml::_('script', 'system/progressbar.js', true, true);

		parent::display();
	}
}
