<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Libs;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class GController extends Controller {

	function _settings($ext){
		$settings_model = new \GCore\Admin\Models\Extension();
		$settings = $settings_model->find('first', array('conditions' => array('name' => $ext)));
		$this->data[Str::camilize($ext)] = array();
		if(!empty($settings['Extension']['settings'])){
			$this->data[Str::camilize($ext)] = $settings['Extension']['settings'];
		}
	}

	function _save_settings($ext){
		$settings_model = new \GCore\Admin\Models\Extension();
		$extenion_name = Str::camilize($ext);
		//check data exist
		$settings = $settings_model->find('first', array('conditions' => array('name' => $ext)));
		if(!empty($this->data[$extenion_name])){
			if(!empty($settings['Extension']['settings'])){
				$this->data[$extenion_name] = array_merge($settings['Extension']['settings'], $this->data[$extenion_name]);
				return $settings_model->save(array('settings' => $this->data[$extenion_name]), array('conditions' => array('name' => $ext)));
			}else{
				return $settings_model->save(array('name' => $ext, 'enabled' => 1, 'settings' => $this->data[$extenion_name]));
			}
		}
		return false;
	}
	//simple update function for binary/lists/trio updates
	function _toggle(){
		$model_class = !empty($this->update_model) ? $this->update_model : null;
		if(empty($model_class)){
			$alias = $this->get_main_model();
			if(!empty($alias)){
				$model_class = $this->{$alias};
			}else{
				return;
			}
		}

		$id = Request::data('gcb', null);
		$field = Request::data('fld', null);
		$value = Request::data('val', null);
		$session = Base::getSession();

		$result = false;
		if(!is_null($field) AND !is_null($value) AND !is_null($id)){
			$model_class->id = $id;
			$result = $model_class->saveField($field, $value);
		}

		if($result !== false){
			$session->setFlash('success', l_('UPDATE_SUCCESS'));
		}else{
			$session->setFlash('error', l_('UPDATE_ERROR'));
		}
		return $result;
	}

	function _save(){
		$model_class = !empty($this->save_model) ? $this->save_model : null;
		if(empty($model_class)){
			$alias = $this->get_main_model();
			if(!empty($alias)){
				$model_class = $this->{$alias};
			}else{
				return;
			}
		}

		$session = Base::getSession();

		$result = $model_class->save($this->data, array('validate' => true));
		if($result !== false){
			$session->setFlash('success', l_('SAVE_SUCCESS'));
		}else{
			$session->setFlash('error', l_('SAVE_ERROR'));
		}
		return $result;
	}

	function _save_list(){
		$model_class = !empty($this->save_list_model) ? $this->save_list_model : null;
		if(empty($model_class)){
			$alias = $this->get_main_model();
			if(!empty($alias)){
				$model_class = $this->{$alias};
			}else{
				return;
			}
		}

		$gcbs = Request::data('gcb', array());
		$session = Base::getSession();

		$records = Request::data($model_class->alias, array());
		foreach($gcbs as $gcb){
			$result = $model_class->save($records[$gcb], array('conditions' => array($model_class->pkey => $gcb), 'validate' => false, 'callbacks' => false));
			if($result !== false){
				$session->setFlash('success', l_('SAVE_SUCCESS'));
			}else{
				$session->setFlash('error', l_('SAVE_ERROR'));
			}
		}
	}

	function _delete(){
		$model_class = !empty($this->delete_model) ? $this->delete_model : null;
		if(empty($model_class)){
			$alias = $this->get_main_model();
			if(!empty($alias)){
				$model_class = $this->{$alias};
			}else{
				return;
			}
		}

		$gcbs = Request::data('gcb', array());
		$session = Base::getSession();

		$result = $model_class->deleteAll(array($model_class->pkey => $gcbs));
		if($result === true){
			$session->setFlash('success', l_('DELETE_SUCCESS'));
		}elseif($result === false){
			$session->setFlash('error', (string)$result.l_('DELETE_ERROR'));
		}elseif(is_numeric($result)){
			$session->setFlash('success', (string)$result.' '.l_('ITEMS_DELETED'));
		}
		return $result;
	}
	//triggred when the order link is clicked
	/*
	function order(){
		$this->view = 'index';
		$this->index();
	}

	function index(){

	}
	*/
	function _sortable($orderfld = '', $orderdrc = 'ASC'){
		$model_class = !empty($this->sort_model) ? $this->sort_model : null;
		if(empty($model_class)){
			$alias = $this->get_main_model();
			if(!empty($alias)){
				$model_class = $this->{$alias};
			}else{
				return;
			}
		}
		$prefix = '';
		if(!empty($this->sort_prefix)){
			$prefix = '.'.$this->sort_prefix;
		}
		//check if we should process pagination
		if(in_array('\GCore\Helpers\Sorter', $this->helpers) OR in_array('\GCore\Helpers\Sorter', array_keys($this->helpers))){
			$session = Base::getSession();
			$k = array_search('\GCore\Helpers\Sorter', $this->helpers);
			if($k !== false){
				unset($this->helpers[$k]);
			}

			$field = Request::data('orderfld', $session->get(get_class($this).$prefix.'.'.$model_class->alias.'.orderfld', null));
			$drc = Request::data('orderdrc', $session->get(get_class($this).$prefix.'.'.$model_class->alias.'.orderdrc', 'ASC'));

			$this->helpers['\GCore\Helpers\Sorter']['direction'] = $drc;
			$this->helpers['\GCore\Helpers\Sorter']['active_field'] = $field;

			if(!empty($field)){
				$model_class->order_by = $field.' '.strtoupper($drc);
				$session->set(get_class($this).$prefix.'.'.$model_class->alias.'.orderfld', $field);
				$session->set(get_class($this).$prefix.'.'.$model_class->alias.'.orderdrc', $drc);
			}elseif(empty($field) AND !empty($orderfld)){
				$model_class->order_by = $orderfld.' '.strtoupper($orderdrc);
				$session->set(get_class($this).$prefix.'.'.$model_class->alias.'.orderfld', $orderfld);
				$session->set(get_class($this).$prefix.'.'.$model_class->alias.'.orderdrc', $orderdrc);
			}
		}
	}

	function _filter($columns = array()){
		$model_class = !empty($this->filter_model) ? $this->filter_model : null;
		if(empty($model_class)){
			$alias = $this->get_main_model();
			if(!empty($alias)){
				$model_class = $this->{$alias};
			}else{
				return;
			}
		}
		$prefix = '';
		if(!empty($this->filter_prefix)){
			$prefix = '.'.$this->filter_prefix;
		}

		$session = Base::getSession();
		$filters = Request::data('fltr', $session->get(get_class($this).$prefix.'.'.$model_class->alias.'.filters', array()));
		$conditions = array();
		if(!empty($filters)){
			foreach($columns as $k => $column){
				$fv = Arr::getVal($filters, explode('.', $column), null);
				if(strlen($fv) > 0){
					$conditions[$column] = $fv;
				}
			}
		}
		Request::set('fltr', $filters);
		//set model conditions based on filters
		$model_class->conditions = array_merge($conditions, $model_class->conditions);
		$session->set(get_class($this).$prefix.'.'.$model_class->alias.'.filters', $filters);
	}

	function _search($columns = array(), $sfld = 'srch', $type = 'like'){
		$model_class = !empty($this->search_model) ? $this->search_model : null;
		if(empty($model_class)){
			$alias = $this->get_main_model();
			if(!empty($alias)){
				$model_class = $this->{$alias};
			}else{
				return false;
			}
		}
		$prefix = '';
		if(!empty($this->search_prefix)){
			$prefix = '.'.$this->search_prefix;
		}

		if(empty($sfld) OR empty($columns)){
			return false;
		}
		$session = Base::getSession();
		$search_string = Request::data($sfld, $session->get(get_class($this).$prefix.'.'.$model_class->alias.'.search.'.$sfld, null));
		//check if we have any search fields
		if(empty($search_string)){
			$session->clear(get_class($this).$prefix.'.'.$model_class->alias.'.search.'.$sfld);
			return false;
		}
		$keywords = $search_string;
		if(is_string($search_string)){
			$must_pat = '/("|\')(.*?)("|\')/i';
			preg_match_all($must_pat, $search_string, $must_words);
			if(!empty($must_words[2])){
				$search_string_new = preg_replace($must_pat, '', $search_string);
				$keywords = array_filter(explode(' ', $search_string_new));
				$must_keywords = $must_words[2];
			}else{
				$keywords = explode(' ', $search_string);
			}
		}
		$conditions = array();
		//build the main model's conditions
		if($type == 'like'){
			foreach($keywords as $keyword){
				foreach($columns as $k => $column){
					$conditions['OR'][][$column.' LIKE'] = '%'.$keyword.'%';
				}
			}
			if(!empty($must_keywords)){
				foreach($must_keywords as $must_keyword){
					foreach($columns as $k => $column){
						$conditions['AND'][][$column.' LIKE'] = '%'.$must_keyword.'%';
					}
				}
			}
		}else if($type == 'match'){
			$columns = array_map(array($model_class->dbo, 'quoteName'), $columns);
			//$fixed_search_string = '+'.str_replace(' ', ' +', trim($search_string));
			//$conditions[] = ':MATCH ('.implode(',', $columns).') AGAINST ('.$model_class->dbo->quote($fixed_search_string).' IN BOOLEAN MODE)';
			$conditions[] = ':MATCH ('.implode(',', $columns).') AGAINST ('.$model_class->dbo->quote($search_string).' IN BOOLEAN MODE)';
		}
		//set search fields values
		Request::set($sfld, $search_string);
		//set model conditions based on filters
		$model_class->conditions = array_merge($conditions, $model_class->conditions);
		$session->set(get_class($this).$prefix.'.'.$model_class->alias.'.search.'.$sfld, $search_string);
	}

	function _paginate(){
		$model_class = !empty($this->paginate_model) ? $this->paginate_model : null;
		if(empty($model_class)){
			$alias = $this->get_main_model();
			if(!empty($alias)){
				$model_class = $this->{$alias};
			}else{
				return;
			}
		}
		$prefix = '';
		if(!empty($this->paginate_prefix)){
			$prefix = '.'.$this->paginate_prefix;
		}
		//check if we should process pagination
		if(!empty($model_class) AND in_array('\GCore\Helpers\Paginator', $this->helpers) OR in_array('\GCore\Helpers\Paginator', array_keys($this->helpers))){
			$session = Base::getSession();
			$k = array_search('\GCore\Helpers\Paginator', $this->helpers);
			if($k !== false){
				unset($this->helpers[$k]);
			}

			$page = Request::data('page', $session->get(get_class($this).$prefix.'.'.$model_class->alias.'.page', 1));
			$page = ($page < 1) ? 1 : $page;
			$limit = Request::data('limit', $session->get(get_class($this).$prefix.'.'.$model_class->alias.'.limit', Base::getConfig('list_limit', 30)));
			if($limit == 0 OR $limit > Base::getConfig('max_list_limit', 1000)){
				$limit = Base::getConfig('max_list_limit', 1000);
			}
			if(!empty($model_class->limit)){
				$limit = $model_class->limit;
			}
			if(!empty($model_class->page)){
				$page = $model_class->page;
			}
			$offset = ($page - 1) * (int)$limit;
			$total = $model_class->find('count', array('cache' => true));

			$bad_page = false;
			if($offset >= $total){
				//$page = ceil($total/$limit);
				$bad_page = true;
				$page = ceil($total/$limit);
				$offset = $limit * ($page - 1);
			}
			$page = ($page < 1) ? 1 : $page;
			$this->helpers['\GCore\Helpers\Paginator']['limit'] = $limit;
			$this->helpers['\GCore\Helpers\Paginator']['page'] = $page;
			$this->helpers['\GCore\Helpers\Paginator']['offset'] = $offset;

			if(!$bad_page){
				$session->set(get_class($this).$prefix.'.'.$model_class->alias.'.page', $page);
			}
			$session->set(get_class($this).$prefix.'.'.$model_class->alias.'.limit', $limit);

			$this->helpers['\GCore\Helpers\Paginator']['total'] = $total;
			//page (limit and offset) should be set after the count query
			$model_class->page = $page;
			$model_class->page_limit = $limit;
		}
	}

	function _tags_search(){
		$app = \GCore\Libs\App::getInstance();
		$app->tvout = 'ajax';
		$tag_term = Request::data('term');
		$tags_model = new \GCore\Admin\Models\Tag();
		$list = $tags_model->find('list', array('fields' => array('Tag.title'), 'conditions' => array('Tag.title LIKE' => '%'.$tag_term.'%')));
		return json_encode(array_values($list));
	}

	function _permissions_setup($title, $path){
		$id = \GCore\Admin\Models\Acl::getInstance()->field('id', array('aco' => $path, 'enabled' => 1));
		if(!empty($id)){
			$acl = \GCore\Admin\Models\Acl::getInstance()->load($id);
			echo \GCore\Libs\App::call('admin', '', 'acls', 'edit', array('path' => $acl));
		}else{
			echo \GCore\Libs\App::call('admin', '', 'acls', 'edit', array('path' => array('Acl' => array('aco' => $path, 'title' => $title, 'enabled' => 1))));
		}
	}

}