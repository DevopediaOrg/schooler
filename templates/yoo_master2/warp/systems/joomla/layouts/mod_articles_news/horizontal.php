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

<?php if (count($list) > 0) : ?>
	<ul class="uk-grid" data-uk-grid-match data-uk-grid-margin>
		<?php for ($i = 0, $n = count($list); $i < $n; $i ++) : ?>
		<?php $item = $list[$i]; ?>
		<li class="uk-width-medium-1-<?php echo $count ?>">
			<?php require JModuleHelper::getLayoutPath('mod_articles_news', '_item'); ?>
		</li>
		<?php endfor; ?>
	</ul>
<?php endif;