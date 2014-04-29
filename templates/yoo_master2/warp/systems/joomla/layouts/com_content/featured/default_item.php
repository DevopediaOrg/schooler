<?php
/**
* @package   Warp Theme Framework
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
*/

// no direct access
defined('_JEXEC') or die;

// Create a shortcut for params.
$params  = &$this->item->params;
$images  = json_decode($this->item->images);
$canEdit = $this->item->params->get('access-edit');

// template args
$args = array(
	'permalink' => JRoute::_(ContentHelperRoute::getArticleRoute($this->item->slug, $this->item->catid), true, -1),
	'image' => isset($images->image_intro) ? htmlspecialchars($images->image_intro) : '',
	'image_alignment' => !isset($images->float_intro) || empty($images->float_intro) ? htmlspecialchars($params->get('float_intro')) : htmlspecialchars($images->float_intro),
	'image_alt' => isset($images->image_intro_alt) ? htmlspecialchars($images->image_intro_alt) : '',
	'image_caption' => isset($images->image_intro_caption) ? htmlspecialchars($images->image_intro_caption) : '',
	'title' => $params->get('show_title') ? $this->escape($this->item->title) : '',
	'title_link' => $params->get('link_titles'),
	'author' => '',
	'author_url' => !empty($this->item->contactid) && $params->get('link_author') == true ? JRoute::_('index.php?option=com_contact&view=contact&id='.$this->item->contactid) : '',
	'date' => $params->get('show_create_date') ? $this->item->created : '',
	'datetime' => substr($this->item->created, 0, 10),
	'category' => $params->get('show_category') ? $this->escape($this->item->category_title) : '',
	'category_url' => $params->get('link_category') ? JRoute::_(ContentHelperRoute::getCategoryRoute($this->item->catslug)) : '',
	'hook_aftertitle' => !$params->get('show_intro') ? $this->item->event->afterDisplayTitle : '',
	'hook_beforearticle' => $this->item->event->beforeDisplayContent,
	'hook_afterarticle' => $this->item->event->afterDisplayContent,
	'article' => $this->item->introtext,
	'tags' => '',
	'edit' => '',
	'url' => '',
	'more' => '',
	'previous' => '',
	'next' => ''
);

// set author
$author = $this->item->created_by_alias ?: $this->item->author;
$args['author'] = $params->get('show_author') && !empty($author) ? $author : '';

// set edit
$args['edit']  = $canEdit ? JHtml::_('icon.edit', $this->item, $params) : '';
$args['edit'] .= $params->get('show_print_icon') ? JHtml::_('icon.print_popup', $this->item, $params) : '';
$args['edit'] .= $params->get('show_email_icon') ? JHtml::_('icon.email', $this->item, $params) : '';

// set url
if ($params->get('access-view')) {
	$link = JRoute::_(ContentHelperRoute::getArticleRoute($this->item->slug, $this->item->catid));
} else {
	$menu = JFactory::getApplication()->getMenu();
	$active = $menu->getActive();
	$itemId = $active->id;
	$link1 = JRoute::_('index.php?option=com_users&view=login&Itemid=' . $itemId);
	$returnURL = JRoute::_(ContentHelperRoute::getArticleRoute($this->item->slug, $this->item->catid));
	$link = new JURI($link1);
	$link->setVar('return', base64_encode(urlencode($returnURL)));
}
$args['url'] = $link;

// set more
if ($params->get('show_readmore') && $this->item->readmore) {
	if (!$params->get('access-view')) {
		$args['more'] = JText::_('COM_CONTENT_REGISTER_TO_READ_MORE');
	} elseif ($readmore = $this->item->alternative_readmore) {
		$args['more'] = $readmore;
	} else {
		$args['more'] = JText::_('TPL_WARP_CONTINUE_READING');
	}
}

// render template
echo $warp['template']->render('article', $args);
