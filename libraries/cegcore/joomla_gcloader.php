<?php
/**
* COMPONENT FILE HEADER
**/
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
//basic checks
$success = array();
$fails = array();
if(version_compare(PHP_VERSION, '5.3.0') >= 0){
	$success[] = "PHP 5.3.0 or later found.";
}else{
	$fails[] = "Your PHP version is outdated: ".PHP_VERSION;
}
if(phpversion('pdo') !== false AND in_array('mysql', PDO::getAvailableDrivers())){
	$success[] = "PDO Extension is available and enabled and it has MySQL support.";
}else{
	//$fails[] = "PDO Extension is NOT available, disabled or may not have MySQL support.";
}
if(!empty($fails)){
	JError::raiseWarning(100, "Your PHP version should be 5.3 or later, you must have the PDO extension and PDO MYSQL extension enabled in your PHP config.");
}
//end basic checks
if(empty($fails)){
	function r_($url, $xhtml = false, $absolute = false, $ssl = null){
		$alters = array(
			'chronomigrator' => 'com_chronomigrator',
			'chronoforms' => 'com_chronoforms5',
			'chronoconnectivity' => 'com_chronoconnectivity5',
			'chronoforums' => 'com_chronoforums',
		);
		foreach($alters as $k => $v){
			$url = str_replace('ext='.$k, 'option='.$v, $url);
		}
		if(GCORE_SITE == 'front'){
			if(!$absolute){
				return JRoute::_($url, $xhtml, $ssl);
			}else{
				return JRoute::_($url, $xhtml, -1); //dirty hack to get the full absolute url, fix later and create the full absolute url: \JURI::getInstance()->toString(array('scheme', 'host', 'port')));
			}
		}else{
			return $url;
		}
	}

	class JoomlaGCLoader{
		function __construct($area, $joption, $extension, $setup = null, $cont_vars = array()){
			require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'gcloader.php');

			if(phpversion('pdo') !== false AND in_array('mysql', PDO::getAvailableDrivers())){
				//good, we use PDO
				\GCore\Libs\Base::setConfig('db_adapter', 'joomla');
			}else{
				\GCore\Libs\Base::setConfig('db_adapter', 'joomla');
			}

			\GCore\C::set('EXTENSIONS_PATHS', array(
				dirname(__FILE__).DS.'admin'.DS.'extensions'.DS => JPATH_SITE.DS.'administrator'.DS.'components'.DS,
				dirname(__FILE__).DS.'extensions'.DS => JPATH_SITE.DS.'components'.DS
			));
			\GCore\C::set('EXTENSIONS_URLS', array(
				\JFactory::getURI()->root().'libraries/cegcore/admin/extensions/' => \JFactory::getURI()->root().'administrator/components/',
				\JFactory::getURI()->root().'libraries/cegcore/extensions/' => \JFactory::getURI()->root().'components/',
			));
			\GCore\C::set('EXTENSIONS_NAMES', array(
				'chronomigrator' => 'com_chronomigrator',
				'chronoforms' => 'com_chronoforms5',
				'chronoconnectivity' => 'com_chronoconnectivity5',
				'chronoforums' => 'com_chronoforums',
				$extension => 'com_'.$joption,
			));

			//GCore\Libs\Url::$root_ext = array('components', 'com_'.$joption);
			\GCore\Bootstrap::initialize('joomla', array('component' => 'com_'.$joption, 'ext' => $extension));

			$tvout = strlen(\GCore\Libs\Request::data('tvout', null)) > 0 ? \GCore\Libs\Request::data('tvout') : '';
			$controller = \GCore\Libs\Request::data('cont', '');
			$action = \GCore\Libs\Request::data('act', '');

			if(is_callable($setup)){
				$return_vars = $setup();
				if(!empty($return_vars)){
					$cont_vars = array_merge($cont_vars, $return_vars);
				}
			}
			if(isset($cont_vars['controller'])){
				$controller = $cont_vars['controller'];
			}
			if(isset($cont_vars['action'])){
				$action = $cont_vars['action'];
			}
			$cont_vars['_app_thread'] = 'gcore';
			ob_start();
			echo \GCore\Libs\AppJ::call($area, $extension, $controller, $action, $cont_vars);
			$output = ob_get_clean();

			$output = \GCore\C::fix_urls($output);

			if($tvout == 'ajax'){
				echo $output;
				$mainframe = \JFactory::getApplication();
				$mainframe->close();
			}else{
				ob_start();
				$toolbar = \GCore\Helpers\Module::render(array('type' => 'toolbar', 'site' => 'admin', 'params' => ''));
				$messages = \GCore\Libs\AppJ::getSystemMessages();;
				echo \GCore\Libs\AppJ::getHeader();
				echo $toolbar;
				echo '<div style="clear:both;"></div>';
				echo $messages;
				//echo \GCore\Libs\AppJ::getHeader();
				$system_output = ob_get_clean();
				$system_output = \GCore\C::fix_urls($system_output);
				echo $system_output;
				echo $output;
			}
		}
	}
}