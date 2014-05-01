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
class GModel extends Model {
	var $cache = true;
	var $params_fields = array('params', 'rules', 'pages');
	
	function find($type = 'all', $params = array()){
		$cached = false;
		parent::initializeFind($type, $params);
		if(!empty($this->cache) AND !empty($params['cache']) AND Base::getConfig('cache') >= 1 AND Base::getConfig('cache_query') >= 1){
			$cache = Cache::getInstance($this->tablename.'.queries', array('expiration' => Base::getConfig('query_cache_expiry', 3600)));
			$data = $cache->get($type.'.'.md5(serialize($params)));
			if(!empty($data)){
				$cached = true;
			}
		}
		if(empty($data)){
			$data = parent::find($type, $params);
		}
		if(!empty($this->cache) AND !empty($params['cache']) AND !$cached AND Base::getConfig('cache') >= 1 AND Base::getConfig('cache_query') >= 1){
			$cache = Cache::getInstance($this->tablename.'.queries', array('expiration' => Base::getConfig('query_cache_expiry', 3600)));
			$cache->set($type.'.'.md5(serialize($params)), $data);
		}
		return $data;
	}
	
	function save($data = array(), $params = array()){
		if(!empty($this->cache) AND Base::getConfig('cache') >= 1 AND Base::getConfig('cache_query') >= 1 AND (!isset($params['reset_cache']) OR $params['reset_cache'] !== false)){
			$cache = Cache::getInstance($this->tablename.'.queries');
			$cache->destroy();			
		}
		return parent::save($data, $params);
	}
	
	function deleteAll($conditions, $params = array()){
		if(!empty($this->cache) AND Base::getConfig('cache') >= 1 AND Base::getConfig('cache_query') >= 1){
			$cache = Cache::getInstance($this->tablename.'.queries');
			$cache->destroy();
		}
		return parent::deleteAll($conditions, $params);
	}
	
	function initializeSave(&$data, &$params){
		if(isset($data[$this->alias]['tags']) AND !empty($this->hasMany['TagItem']['save_on_save'])){
			$tags = array_filter(explode(',', $data[$this->alias]['tags']));
			$tags_ids = $this->TagItem->Tag->find('list', array('fields' => array('Tag.id', 'Tag.title'), 'conditions' => array('Tag.title' => $tags)));
			$new_tags = array_diff($tags, $tags_ids);
			foreach($new_tags as $new_tag){
				$this->TagItem->Tag->save(array('title' => $new_tag, 'alias' => ''));
				$tags_ids[$this->TagItem->Tag->id] = $new_tag;
			}
			if(!empty($tags_ids)){
				foreach(array_keys($tags_ids) as $k => $tag_id){
					$data['TagItem'][$k]['tag_id'] = $tag_id;
					$data['TagItem'][$k]['model'] = get_class($this);
				}
			}else{
				$data['TagItem'] = array();
			}
		}
	}

	function beforeSave(&$data, &$params, $mode){
		foreach($this->params_fields as $params_field){
			if(isset($data[$params_field]) AND is_array($data[$params_field])){
				$p_obj = new Parameter($data[$params_field]);
				$data[$params_field] = $p_obj->toString();
			}
		}
		if(isset($data['extras']) AND is_array($data['extras'])){
			$base_string = new Base64($data['extras']);
			$data['extras'] = $base_string->encode();
		}
		if(array_key_exists('alias', $data) AND empty($data['alias']) AND !empty($data['title'])){
			$count = 1;
			$test = $alias = Str::slug($data['title']);
			redo:
			$exists = $this->find('first', array('fields' => array($this->pkey), 'conditions' => array('alias' => $test)));
			if(!empty($exists)){
				$count++;
				$test = $alias.$count;
				goto redo;
			}
			$data['alias'] = $test;
		}
	}
	
	function _get_params_fields(){
		foreach(array_keys($this->associated_models) as $associated_model){
			if(isset($this->{$associated_model}->params_fields)){
				$this->{$associated_model}->_get_params_fields();
			}
			if(!empty($this->{$associated_model}->params_fields)){
				$this->params_fields = array_merge($this->params_fields, $this->{$associated_model}->params_fields);
			}
		}
	}
	
	function afterFind($type, &$data){
		if(!empty($data) AND is_array($data)){
			$fresh_models = false;
			$_items = array_values($data);
			if($data === $_items AND !empty($_items[0][$this->alias])){
				//this is a modeled data array
				$fresh_models = true;
				$this->_get_params_fields();
			}
			$models_list = array_merge(array($this->alias), array_keys($this->hasOne), array_keys($this->belongsTo));
			foreach($data as $k => $record){
				if($fresh_models){
					$models_list = array_keys($record);
				}
				foreach($models_list as $model){
					if(!empty($data[$k][$model])){
						if(isset($data[$k][$model]['extras'])){
							$extras = new Base64($data[$k][$model]['extras']);
							$data[$k][$model]['extras'] = $extras->decode();
						}
						foreach($this->params_fields as $params_field){
							if(isset($data[$k][$model][$params_field])){
								$params = new Parameter($data[$k][$model][$params_field]);
								$data[$k][$model][$params_field] = $params->toArray();
							}
						}
						if(!in_array($model, array('TagItem', 'Tag')) AND !empty($this->hasMany['TagItem']) AND isset($data[$k]['Tag'])){
							$tags = !is_null(Arr::getVal($data[$k]['Tag'], array('[n]', 'title'))) ? Arr::getVal($data[$k]['Tag'], array('[n]', 'title')) : array();
							$data[$k][$model]['tags'] = implode(',', $tags);
						}
					}
				}
			}
		}
	}
	
	function save_tree_node($data, $single = false){
		$data = array($this->pkey => $data[$this->pkey], 'parent_id' => $data['parent_id']);
		//root node
		$data['depth'] = 0;
		$data['path'] = '.'.$data[$this->pkey].'.';
		$data['parent_path'] = '';
		$old_path = '';
		if(!empty($data[$this->pkey])){
			$old_path = $this->field('path', array($this->pkey => $data[$this->pkey]));
		}
		//calculate node depth and path
		if(!empty($data['parent_id'])){
			//child node, find parent and calculate depth and path
			$parent = $this->find('first', array(
				'conditions' => array('id' => $data['parent_id']),
				'fields' => array('id', 'depth', 'path'),
			));
			if(!empty($parent)){
				$data['path'] = '.'.implode('.', array_filter(array_merge(explode('.', $parent[$this->alias]['path']), (array)$data[$this->pkey]))).'.';
				$data['depth'] = count(explode('.', $data['path'])) - 3;
				$data['parent_path'] = $parent[$this->alias]['path'];
			}
		}
		//this is an old node and might had some children, fix their pathes
		if(!empty($data[$this->pkey]) AND $old_path AND !$single){
			//find if node has children, if so then update them too
			$moving_root = '.'.$data[$this->pkey].'.';
			$moving_nodes = $this->find('all', array(
				'conditions' => array('path LIKE' => '%'.$moving_root.'%'),
				'fields' => array('id', 'depth', 'path'),
				'order' => array('path'),
			));
			if(!empty($moving_nodes)){
				//$old_path = $moving_nodes[0][$this->alias]['path'];
				foreach($moving_nodes as $k => $node){
					$new_node_data = $node[$this->alias];
					$new_node_data['path'] = str_replace($old_path, $data['path'], $new_node_data['path']);
					$new_node_data['depth'] = count(explode('.', $new_node_data['path'])) - 3;
					if($new_node_data[$this->pkey] == $data[$this->pkey]){
						$new_node_data['parent_path'] = $data['parent_path'];
					}else{
						$new_node_data['parent_path'] = str_replace($new_node_data[$this->pkey].'.', '', $new_node_data['path']);
					}
					$this->save($new_node_data, array('validate' => false, 'callbacks' => false));
				}
			}
		}else{
			//new node, just insert its new path
			$this->save($data, array('validate' => false, 'callbacks' => false));
		}
		//fix the insert/update id to point to the parent node id
		if(!empty($data[$this->pkey])){
			$this->id = $data[$this->pkey];
		}
	}
	
	function build_tree(){
		$nodes = $this->find('all', array(
			'fields' => array('id', 'depth', 'path', 'parent_id'),
			'order' => array('parent_id'),
		));
		$pathes = array();
		if(!empty($nodes)){
			foreach($nodes as $k => $node){
				$new_node_data = $node[$this->alias];
				if(!isset($pathes[$new_node_data['parent_id']])){
					$pathes[$new_node_data[$this->pkey]] = '.'.$new_node_data[$this->pkey].'.';
				}else{
					$pathes[$new_node_data[$this->pkey]] = '.'.implode('.', array_filter(array_merge(explode('.', $pathes[$new_node_data['parent_id']]), (array)$new_node_data[$this->pkey]))).'.';
				}
				
				$new_node_data['path'] = $pathes[$new_node_data[$this->pkey]];
				$new_node_data['depth'] = count(explode('.', $new_node_data['path'])) - 3;
				$this->save($new_node_data, array('validate' => false, 'callbacks' => false));
			}
		}
	}
	
	function delete_tree_nodes($conditions){
		$roots = $this->find('all', array(
			'fields' => array('id', 'depth', 'path', 'parent_id'),
			'conditions' => $conditions,
		));
		if(!empty($roots)){
			foreach($roots as $k => $root){
				$path = $root[$this->alias]['path'];
				$this->deleteAll(array('path LIKE' => '%'.$path.'%'), array('callbacks' => false));
			}
		}
	}
}