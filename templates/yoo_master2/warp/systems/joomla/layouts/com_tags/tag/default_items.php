<?php
/**
* @package   Warp Theme Framework
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
*/

defined('_JEXEC') or die;

JHtml::addIncludePath(JPATH_COMPONENT.'/helpers');
JHtml::_('behavior.tooltip');
JHtml::_('behavior.framework');

?>

<?php if ($this->params->get('show_headings') || $this->params->get('filter_field') || $this->params->get('show_pagination_limit')) : ?>

<form class="uk-form uk-margin-bottom uk-clearfix" action="<?php echo htmlspecialchars(JUri::getInstance()->toString()); ?>" method="post" name="adminForm" id="adminForm">

	<?php if ($this->params->get('filter_field')) :?>
		<div class="uk-float-left">
			<input type="text" name="filter-search" id="filter-search" value="<?php echo $this->escape($this->state->get('list.filter')); ?>" onchange="document.adminForm.submit();" title="<?php echo JText::_('COM_TAGS_FILTER_SEARCH_DESC'); ?>" placeholder="<?php echo JText::_('COM_TAGS_TITLE_FILTER_LABEL'); ?>" />
		</div>
	<?php endif; ?>
	<?php if ($this->params->get('show_pagination_limit')) : ?>
		<div class="uk-float-right">
			<label for="limit">
				<?php echo JText::_('JGLOBAL_DISPLAY_NUM'); ?>
			</label>
			<?php echo $this->pagination->getLimitBox(); ?>
		</div>
	<?php endif; ?>

	<input type="hidden" name="filter_order" value="" />
	<input type="hidden" name="filter_order_Dir" value="" />
	<input type="hidden" name="limitstart" value="" />
	<input type="hidden" name="task" value="" />

</form>

<?php endif; ?>

<?php

if (!$this->items) {

	echo '<p>'.JText::_('COM_TAGS_NO_ITEMS').'</p>';

} else {

	foreach ($this->items as $item) {

        $images = json_decode($item->core_images);

		$args = array(
            'permalink' => '',
            'image' => $this->params->get('tag_list_show_item_image', 1) == 1 && isset($images->image_intro) ? htmlspecialchars($images->image_intro) : '',
            'image_alignment' => isset($images->float_intro) ? htmlspecialchars($images->float_intro) : '',
            'image_alt' => isset($images->image_intro_alt) ? htmlspecialchars($images->image_intro_alt) : '',
            'image_caption' => isset($images->image_intro_caption) ? htmlspecialchars($images->image_intro_caption) : '',
            'title' => $this->escape($item->core_title),
            'title_link' => '1',
            'author' => $item->author,
            'author_url' => '',
            'date' => $item->core_created_time,
            'datetime' => substr($item->core_created_time, 0,10),
            'category' => '',
            'category_url' => '',
            'hook_aftertitle' => '',
            'hook_beforearticle' => '',
            'hook_afterarticle' => '',
            'article' => ($this->params->get('tag_list_show_item_description', 1)) ? JHtml::_('string.truncate', $item->core_body, $this->params->get('tag_list_item_maximum_characters')) : '',
            'tags' => '',
            'edit' => '',
            'url' => ($item->core_state != 0) ? JRoute::_(TagsHelperRoute::getItemRoute($item->content_item_id, $item->core_alias, $item->core_catid, $item->core_language, $item->type_alias, $item->router)) : '',
            'more' => '',
            'previous' => '',
            'next' => ''
        );

		// Render template
		echo $warp['template']->render('article', $args);

	}

	if ($this->params->get('show_pagination')) {
		echo $this->pagination->getPagesLinks();
	}

}
