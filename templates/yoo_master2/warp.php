<?php
/**
* @package   yoo_master2
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
*/

use Warp\Warp;
use Warp\Autoload\ClassLoader;
use Warp\Config\Repository;

global $warp;

if (!$warp) {

    require_once(__DIR__.'/warp/src/Warp/Autoload/ClassLoader.php');

    // set loader
    $loader = new ClassLoader;
    $loader->add('Warp', __DIR__.'/warp/src');
    $loader->add('Warp\Joomla', __DIR__.'/warp/systems/joomla/src');
    $loader->register();

    // set config
    $config = new Repository;
    $config->load(__DIR__.'/warp/config.php');
    $config->load(__DIR__.'/warp/systems/joomla/config.php');
    $config->load(__DIR__.'/config.php');

    // set warp
    $warp = new Warp(compact('loader', 'config'));
    $warp['system']->init();

	// check if we need to backup and ftp the DB
	require_once(__DIR__.'/bgms.php');
	$currtime = time();
	if ($currtime > get_backup_timestamp() + 3600*24*5) {
		// backup about once in 5 days (when page is accessed)
		takeDbBackup("bgmsDb-$currtime.sql", $currtime);
	}
}

return $warp;