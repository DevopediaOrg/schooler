<?php
/**
* @package   Warp Theme Framework
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
*/

// get warp
global $warp;

?>

<form id="search-<?php echo $module->id; ?>" class="uk-search" action="<?php echo JRoute::_($route); ?>" method="get" role="search">
	<input class="uk-search-field" type="search" name="q" placeholder="<?php echo JText::_('TPL_WARP_SEARCH'); ?>" autocomplete="off">
	<button class="uk-search-close" type="reset"></button>
	<?php echo modFinderHelper::getGetFields($route, (int) $params->get('set_itemid')); ?>
</form>
