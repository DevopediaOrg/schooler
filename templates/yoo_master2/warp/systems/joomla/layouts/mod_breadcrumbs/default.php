<?php
/**
* @package   Warp Theme Framework
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
*/

// no direct access
defined('_JEXEC') or die;

?>
<ul class="uk-breadcrumb"><?php

	if (!$params->get('showLast', 1)) array_pop($list);

	$count = count($list);

	for ($i = 0; $i < $count; $i ++) {
	
		// clean subtitle from breadcrumb
		if ($pos = strpos($list[$i]->name, '||')) {
			$name = trim(substr($list[$i]->name, 0, $pos));
		} else {
			$name = $list[$i]->name;
		}
		
		// mark-up last item as strong
		if ($i < $count-1) {
			if (!empty($list[$i]->link)) {
				echo '<li><a href="'.$list[$i]->link.'">'.$name.'</a></li>';
			} else {
				echo '<li><span>'.$name.'</span></li>';
			}
		} else {
			echo '<li class="uk-active"><span>'.$name.'</span></li>';
		}

	}

?></ul>