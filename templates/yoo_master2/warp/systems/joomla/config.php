<?php
/**
* @package   Warp Theme Framework
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
*/

return array(

    'helper' => array(
       'system'  => 'Warp\Joomla\Helper\SystemHelper',
       'option'  => 'Warp\Joomla\Helper\OptionHelper',
       'widgets' => 'Warp\Joomla\Helper\WidgetsHelper'
    ),

    'path' => array(
        'config'  => array(__DIR__.'/config'),
        'layouts' => array(__DIR__.'/layouts')
    ),

    'menu' => array(
        'pre' => 'Warp\Joomla\Menu\Pre'
    )

);
