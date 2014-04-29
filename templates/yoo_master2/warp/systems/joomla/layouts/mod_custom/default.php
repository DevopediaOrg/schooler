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

<?php if ($params->get('backgroundimage')) : ?><div style="background-image:url(<?php echo $params->get('backgroundimage');?>)"><?php endif;?>
	<?php echo $module->content;?>
<?php if ($params->get('backgroundimage')) : ?></div><?php endif;?>