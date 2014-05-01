<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Helpers;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class Paginator extends \GCore\Libs\Helper{
	var $total = 0;
	var $limit = 0;
	var $offset = 0;
	var $url = '';
	var $page = 1;
	var $numbers = 5;
	var $start = 1;
	var $end = 5;
	//static $template = '';
	
	function initialize(){
		$this->limit = !empty($this->limit) ? $this->limit : \GCore\Libs\Base::getConfig('list_limit', 15);
		$this->page = $current_page = ($this->offset/$this->limit) + 1;
		$side = floor($this->numbers/2);
		$diff = 0;
		if($current_page - $side < 1){
			$this->start = 1;
			$diff = $side - $current_page;
		}else{
			$this->start = $current_page - $side;
		}
		$this->end = $current_page + $side + $diff;
		if($this->end > ceil($this->total/$this->limit)){
			$this->end = ceil($this->total/$this->limit);
		}
		$this->url = !empty($this->url) ? $this->url : \GCore\Libs\Url::current();
	}
	/*
	public static function bs(){
		self::$template = 'bs';
	}
	*/
	public function getPrevious($lang = array()){
		return $this->get_nav_link(self::l_('PAGINATOR_PREV', $lang), \GCore\Libs\Url::buildQuery($this->url, array('page' => ($this->page - 1))), 'previous', ($this->page == 1), $lang);
	}
	
	public function paginator_get_nav_link($title, $url, $type, $disabled = false, $lang = array()){
		$styles = array();
		switch($type){
			case 'previous':
			$class = 'previous button-previous';
			break;
			case 'first':
			$class = 'first button-first';
			break;
			case 'last':
			$class = 'last button-last';
			break;
			case 'next':
			$class = 'next button-next';
			break;
		}
		return \GCore\Helpers\Html::url($title, $url, array('class' => $class, 'style' => $styles));
	}
	
	public function getFirst($lang = array()){
		return $this->get_nav_link(self::l_('PAGINATOR_FIRST', $lang), \GCore\Libs\Url::buildQuery($this->url, array('page' => 1)), 'first', ($this->page == 1), $lang);
	}
	
	public function getLast($lang = array()){
		return $this->get_nav_link(self::l_('PAGINATOR_LAST', $lang), \GCore\Libs\Url::buildQuery($this->url, array('page' => ceil($this->total/$this->limit))), 'last', ($this->page == $this->end OR $this->end < 2), $lang);
	}
	
	public function getNext($lang = array()){
		return $this->get_nav_link(self::l_('PAGINATOR_NEXT', $lang), \GCore\Libs\Url::buildQuery($this->url, array('page' => ($this->page + 1))), 'next', ($this->page == $this->end OR $this->end < 2), $lang);
	}
	
	public function getNumbers($lang = array()){
		$list = array();
		for($i = $this->start; $i <= $this->end; $i++){
			$alt_class = '';
			$url = \GCore\Libs\Url::buildQuery($this->url, array('page' => ($i)));
			if($this->page == $i){
				$list[] = $this->get_number_link($url, $i, true);
			}else{
				$list[] = $this->get_number_link($url, $i, false);
			}
		}
		if(count($list) == 1){
			$list = array();
		}
		$full = $this->get_numbers_links($list);
		return $full;
	}
	
	public function paginator_get_number_link($url, $page, $active = false){
		$alt_class = '';
		if($active){
			$alt_class = ' button-disabled active-page-number';
		}
		return \GCore\Helpers\Html::url($page, $url, array('class' => 'page-number button-page-number'.$alt_class));
	}
	
	public function paginator_get_numbers_links($list){
		return \GCore\Helpers\Html::container('span', implode("\n", $list), array('class' => 'page-numbers'));
	}
	
	public function getNav($lang = array()){
		if($this->total <= $this->limit){
			return '';
		}
		$first = $this->getFirst($lang);
		$prev = $this->getPrevious($lang);
		$numbers = $this->getNumbers($lang);
		$next = $this->getNext($lang);
		$last = $this->getLast($lang);
		$full = $this->full_nav($first, $prev, $numbers, $next, $last);
		//add css file
		$doc = \GCore\Libs\Document::getInstance();
		$doc->addCssFile(\GCore\Helpers\Assets::css('paginator'));
		return $full;
	}
	
	function paginator_full_nav($first, $prev, $numbers, $next, $last){
		$full = \GCore\Helpers\Html::container('div', $first.$prev.$numbers.$next.$last, array('class' => 'gcore-datatable-paginator paging-full-numbers'));
		return $full;
	}
	
	public function getInfo($lang = array()){
		$text = sprintf(self::l_('PAGINATOR_INFO', $lang), ($this->total > 0 ? $this->offset + 1 : $this->offset), ($this->offset + $this->limit > $this->total) ? $this->total : $this->offset + $this->limit, $this->total);
		$full = \GCore\Helpers\Html::container('span', $text, array('class' => 'gcore-datatable-info'));
		return $full;
	}
	
	public function getList($lang = array()){
		$dropdown = \GCore\Helpers\Html::input('limit', array('type' => 'dropdown', 'values' => $this->limit, 'class' => 'SS', 'onchange' => "jQuery(this).closest('form').submit();", 'options' => array(5 => 5, 10 => 10, 15 => 15, 20 => 20, 30 => 30, 50 => 50, 100 => 100, \GCore\Libs\Base::getConfig('max_list_limit', 1000) => self::l_('PAGINATOR_ALL', $lang))));
		//$text = sprintf(self::l_('PAGINATOR_SHOW_X_ENTRIES', $lang), $dropdown);
		$full = \GCore\Helpers\Html::container('div', $dropdown, array('class' => 'gcore-datatable-list'));
		return $full;
	}
	
	public static function l_($id, $lang_list = array()){
		if(isset($lang_list[$id])){
			return $lang_list[$id];
		}else{
			return l_($id);
		}
	}
}