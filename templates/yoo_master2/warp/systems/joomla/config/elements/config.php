<?php
/**
* @package   Warp Theme Framework
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
*/

// no direct access
defined('_JEXEC') or die('Restricted access');

jimport('joomla.html.html');
jimport('joomla.form.formfield');

class JFormFieldConfig extends JFormField
{
	protected $type = 'Config';

	protected function getInput()
    {
		// copy callback
		$this->copyAjaxCallback();

  		// Load jQuery
		JHtml::_('jquery.framework');

		// get warp
        $warp = require(JPATH_ROOT.'/templates/'.$this->form->getValue('template').'/warp.php');
        $warp['system']->document->addScript($warp['path']->url('warp:vendor/jquery/jquery-mustache.js'));
        $warp['system']->document->addScript($warp['path']->url('warp:vendor/jquery/jquery-cookie.js'));
        $warp['system']->document->addScript($warp['path']->url('warp:vendor/jquery/jquery-less.js'));
        $warp['system']->document->addScript($warp['path']->url('warp:vendor/jquery/jquery-rtl.js'));
        $warp['system']->document->addScript($warp['path']->url('warp:vendor/spectrum/spectrum.js'));
		$warp['system']->document->addScript($warp['path']->url('warp:vendor/uikit/js/uikit.js'));
        $warp['system']->document->addScript($warp['path']->url('warp:vendor/less/less.js'));
		$warp['system']->document->addScript($warp['path']->url('config:js/config.js'));
		$warp['system']->document->addScript($warp['path']->url('config:js/admin.js'));
		$warp['system']->document->addCustomTag(sprintf('<link rel="stylesheet" href="%s">', $warp['path']->url('warp:vendor/spectrum/spectrum.css')));
		$warp['system']->document->addCustomTag(sprintf('<link rel="stylesheet" href="%s">', $warp['path']->url('config:css/uikit.warp_bs_fix.min.css')));
		$warp['system']->document->addCustomTag(sprintf('<link rel="stylesheet" href="%s">', $warp['path']->url('warp:vendor/uikit/css/uikit.warp.min.css')));
		$warp['system']->document->addCustomTag(sprintf('<link rel="stylesheet" href="%s">', $warp['path']->url('config:css/config.css')));
        $warp['system']->document->addCustomTag(sprintf('<link rel="stylesheet" href="%s">', $warp['path']->url('config:css/admin.css')));

		// render config
		return $warp['template']->render('config:layouts/config');
	}

	protected function copyAjaxCallback()
    {
		$source = __DIR__.'/warp-ajax.php';
		$target = JPATH_ROOT.'/administrator/templates/system/warp-ajax.php';

		if (!file_exists($target) || md5_file($source) != md5_file($target)) {
			JFile::copy($source, $target);
		}
	}
}