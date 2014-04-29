<?php
/**
* @package   Warp Theme Framework
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
*/

// no direct access
defined('_JEXEC') or die;

JHtml::addIncludePath(JPATH_COMPONENT . '/helpers');
$params = &$this->params;

foreach ($this->items as $item) {

	// template args
	$args = array(
		'permalink' => '',
		'image' => '',
		'image_alignment' => '',
		'image_alt' => '',
		'image_caption' => '',
		'title' => $this->escape($item->title),
		'title_link' => $params->get('link_titles'),
		'author' => $params->get('show_author') ? ($item->created_by_alias ? $item->created_by_alias : $item->author) : '',
		'author_url' => !empty($item->contactid) && $params->get('link_author') == true ? JRoute::_('index.php?option=com_contact&view=contact&id='.$item->contactid) : '',
		'date' => $params->get('show_create_date') ? $item->created : '',
		'datetime' => substr($item->created, 0, 10),
		'category' => $params->get('show_category') ? $this->escape($item->category_title) : '',
		'category_url' => $params->get('link_category') ? JRoute::_(ContentHelperRoute::getCategoryRoute($item->catslug)) : '',
		'hook_aftertitle' => '',
		'hook_beforearticle' => '',
		'hook_afterarticle' => '',
		'article' => $params->get('show_intro') ? JHtml::_('string.truncate', $item->introtext, $params->get('introtext_limit')) : '',
		'tags' => '',
		'edit' => '',
		'url' => JRoute::_(ContentHelperRoute::getArticleRoute($item->slug, $item->catslug)),
		'more' => '',
		'previous' => '',
		'next' => ''
	);

	if ($params->get('show_readmore') && $item->readmore) {
		$args['more'] = $item->alternative_readmore ?: JText::_('TPL_WARP_CONTINUE_READING');
	}

	// render template
	echo $warp['template']->render('article', $args);
}

echo $this->pagination->getPagesLinks();