<?php
/**
 * @package     Joomla.Administrator
 * @subpackage  com_cache
 *
 * @copyright   Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

/**
 * HTML View class for the Cache component
 *
 * @package     Joomla.Administrator
 * @subpackage  com_cache
 * @since       1.6
 */
class CacheViewCache extends JViewLegacy
{
	protected $client;
	protected $data;
	protected $pagination;
	protected $state;

	public function display($tpl = null)
	{
		$this->data			= $this->get('Data');
		$this->client		= $this->get('Client');
		$this->pagination	= $this->get('Pagination');
		$this->state		= $this->get('State');

		// Check for errors.
		if (count($errors = $this->get('Errors')))
		{
			JError::raiseError(500, implode("\n", $errors));
			return false;
		}

		$this->addToolbar();
		$this->sidebar = JHtmlSidebar::render();
		parent::display($tpl);
	}

	/**
	 * Add the page title and toolbar.
	 *
	 * @since   1.6
	 */
	protected function addToolbar()
	{
		JToolbarHelper::title(JText::_('COM_CACHE_CLEAR_CACHE'), 'lightning clear');
		JToolbarHelper::custom('delete', 'delete.png', 'delete_f2.png', 'JTOOLBAR_DELETE', true);
		JToolbarHelper::divider();
		if (JFactory::getUser()->authorise('core.admin', 'com_cache'))
		{
			JToolbarHelper::preferences('com_cache');
		}
		JToolbarHelper::divider();
		JToolbarHelper::help('JHELP_SITE_MAINTENANCE_CLEAR_CACHE');

		JHtmlSidebar::setAction('index.php?option=com_cache');

		JHtmlSidebar::addFilter(
			// @todo We need an actual label here
			'',
			'filter_client_id',
			JHtml::_('select.options', CacheHelper::getClientOptions(), 'value', 'text', $this->state->get('clientId'))
		);
	}
}
