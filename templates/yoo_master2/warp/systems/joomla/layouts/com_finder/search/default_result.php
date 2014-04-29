<?php
/**
* @package   Warp Theme Framework
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
*/

defined('_JEXEC') or die;

if (!empty($this->query->highlight) && empty($this->result->mime) && $this->params->get('highlight_terms', 1) && JPluginHelper::isEnabled('system', 'highlight')) {
	$route = $this->result->route . '&highlight=' . base64_encode(json_encode($this->query->highlight));
} else {
	$route = $this->result->route;
}

$args = array(
    'permalink' => '',
    'image' => '',
    'image_alignment' => '',
    'image_alt' => '',
    'image_caption' => '',
    'title' => $this->result->title,
    'title_link' => '1',
    'author' => '',
    'author_url' => '',
    'date' => '',
    'datetime' => '',
    'category' => '',
    'category_url' => '',
    'hook_aftertitle' => '',
    'hook_beforearticle' => '',
    'hook_afterarticle' => '',
    'article' => ($this->params->get('show_description', 1)) ? JHtml::_('string.truncate', $this->result->description, $this->params->get('description_length', 255)) : '',
    'tags' => '',
    'edit' => '',
    'url' => JRoute::_($route),
    'more' => '',
    'previous' => '',
    'next' => ''
);

// Render template
echo $warp['template']->render('article', $args);