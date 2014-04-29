<?php
/**
 * @package     Joomla.Administrator
 * @subpackage  com_menus
 *
 * @copyright   Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

/**
 * Base controller class for Menu Manager.
 *
 * @package     Joomla.Administrator
 * @subpackage  com_menus
 * @since       1.6
 */
class MenusController extends JControllerLegacy
{
	/**
	 * Method to display a view.
	 *
	 * @param   boolean         $cachable    If true, the view output will be cached
	 * @param   array|boolean   $urlparams   An array of safe url parameters and their variable types, for valid values see {@link JFilterInput::clean()}.
	 *
	 * @return  JController     This object to support chaining.
	 * @since   1.5
	 */
	public function display($cachable = false, $urlparams = false)
	{
		require_once JPATH_COMPONENT.'/helpers/menus.php';

		$view   = $this->input->get('view', 'menus');
		$layout = $this->input->get('layout', 'default');
		$id     = $this->input->getInt('id');

		parent::display();

		return $this;
	}
}
