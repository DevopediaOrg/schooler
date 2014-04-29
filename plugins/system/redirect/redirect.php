<?php
/**
 * @package     Joomla.Plugin
 * @subpackage  System.redirect
 *
 * @copyright   Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('JPATH_BASE') or die;

/**
 * Plugin class for redirect handling.
 *
 * @package     Joomla.Plugin
 * @subpackage  System.redirect
 * @since       1.6
 */
class PlgSystemRedirect extends JPlugin
{
	/**
	 * Constructor.
	 *
	 * @param   object  &$subject  The object to observe
	 * @param   array   $config    An optional associative array of configuration settings.
	 *
	 * @since   1.6
	 */
	public function __construct(&$subject, $config)
	{
		parent::__construct($subject, $config);

		// Set the error handler for E_ERROR to be the class handleError method.
		JError::setErrorHandling(E_ERROR, 'callback', array('PlgSystemRedirect', 'handleError'));
		set_exception_handler(array('PlgSystemRedirect', 'handleError'));
	}

	/**
	 * Method to handle an error condition.
	 *
	 * @param   Exception  &$error  The Exception object to be handled.
	 *
	 * @return  void
	 *
	 * @since   1.6
	 */
	public static function handleError(&$error)
	{
		// Get the application object.
		$app = JFactory::getApplication();

		// Make sure the error is a 404 and we are not in the administrator.
		if (!$app->isAdmin() and ($error->getCode() == 404))
		{
			// Get the full current URI.
			$uri = JUri::getInstance();
			$current = rawurldecode($uri->toString(array('scheme', 'host', 'port', 'path', 'query', 'fragment')));

			// Attempt to ignore idiots.
			if ((strpos($current, 'mosConfig_') !== false) || (strpos($current, '=http://') !== false))
			{
				// Render the error page.
				JError::customErrorPage($error);
			}

			// See if the current url exists in the database as a redirect.
			$db = JFactory::getDbo();
			$query = $db->getQuery(true)
				->select($db->quoteName('new_url'))
				->select($db->quoteName('published'))
				->from($db->quoteName('#__redirect_links'))
				->where($db->quoteName('old_url') . ' = ' . $db->quote($current));
			$db->setQuery($query, 0, 1);
			$link = $db->loadObject();

			// If a redirect exists and is published, permanently redirect.
			if ($link and ($link->published == 1))
			{
				$app->redirect($link->new_url, true);
			}
			else
			{
				$referer = empty($_SERVER['HTTP_REFERER']) ? '' : $_SERVER['HTTP_REFERER'];

				$query = $db->getQuery(true)
					->select($db->quoteName('id'))
					->from($db->quoteName('#__redirect_links'))
					->where($db->quoteName('old_url') . ' = ' . $db->quote($current));
				$db->setQuery($query);
				$res = $db->loadResult();
				if (!$res)
				{

					// If not, add the new url to the database.
					$columns = array(
						$db->quoteName('old_url'),
						$db->quoteName('new_url'),
						$db->quoteName('referer'),
						$db->quoteName('comment'),
						$db->quoteName('hits'),
						$db->quoteName('published'),
						$db->quoteName('created_date')
					);
					$query->clear()
						->insert($db->quoteName('#__redirect_links'), false)
						->columns($columns)
						->values(
							$db->quote($current) . ', ' . $db->quote('') .
								' ,' . $db->quote($referer) . ', ' . $db->quote('') . ',1,0, ' .
								$db->quote(JFactory::getDate()->toSql())
						);

					$db->setQuery($query);
					$db->execute();
				}
				else
				{
					// Existing error url, increase hit counter.
					$query->clear()
						->update($db->quoteName('#__redirect_links'))
						->set($db->quoteName('hits') . ' = ' . $db->quote('hits') . ' + 1')
						->where('id = ' . (int) $res);
					$db->setQuery($query);
					$db->execute();
				}

				// Render the error page.
				JError::customErrorPage($error);
			}
		}
		else
		{
			// Render the error page.
			JError::customErrorPage($error);
		}
	}
}
