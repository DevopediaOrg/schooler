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
class Model {
	var $name;
	var $alias;
	var $tablename;
	var $table_fields = array();
	var $pkey;
	var $dbo = null;
	var $dbo_config = array();
	var $id = 0;
	var $ids = array();
	var $validate = array();
	var $errors = array();
	var $hasOne = array();
	var $belongsTo = array();
	var $hasMany = array();
	
	var $conditions = array();
	var $order_by = array();
	var $limit = null;
	var $offset = null;
	var $page = null;
	var $contain = array();
	var $recursive = 1;
	
	var $page_limit = 0;
	var $data = array();
	var $created = null;
	var $_alias_used = array();
	var $associated_models = array();
	static $__parents_models = array();
	var $_parents_models = array();
	var $_late_hasMany = array();
	var $chain_models = array();
	static $_chain_models = array();
	var $allowed_models = array();
	

	function __construct($settings = array()){
		if(empty($settings['dbo'])){
			$dbo = Database::getInstance($this->dbo_config);
		}else{
			$dbo = $settings['dbo'];
		}
		$this->dbo = &$dbo;
		if(empty($this->name)){
			$this->name = empty($settings['name']) ? Base::getClassName(get_class($this)) : $settings['name'];
		}
		if(empty($this->tablename) AND !empty($settings['tablename'])){
			$this->tablename = $settings['tablename'];
		}
		//set table name after replacing prefix
		$this->tablename = $this->dbo->_prefixTable($this->tablename);
		//set table fields if not set
		if(empty($this->table_fields)){
			$this->loadFields();
		}
		//set alias
		if(empty($this->alias)){
			$this->alias = $this->name;
		}
		//get primary key if not set
		if(empty($this->pkey)){
			$this->loadPKey();
		}
		//set default ordering
		if(empty($this->order_by) AND !empty($this->pkey)){
			//$this->order_by = array($this->alias.'.'.$this->pkey);
		}
		//set default page limit
		$this->page_limit = empty($this->page_limit) ? Base::getConfig('list_limit', 30) : $this->page_limit;
		/*if(!empty(self::$__parents_models)){
			$this->_parents_models = self::$__parents_models;
			self::$__parents_models = array();
		}*/
		if(!empty($settings['allowed_models'])){
			$this->allowed_models = $settings['allowed_models'];
		}
		if(!empty(self::$_chain_models)){
			$this->chain_models = self::$_chain_models;
			//$this->chain_models[] = $this->alias;
			self::$_chain_models = array();
		}else{
			$this->chain_models[] = $this->alias;
		}
		if(empty($settings['no_relations'])){
			foreach(array('hasOne', 'belongsTo', 'hasMany') as $type){
				$this->_bind_models($type);
			}
		}
		$this->initialize();
		//reset the parents models list
		$this->_parents_models = array();
	}
	
	public static function getInstance($settings = array()){
		static $instances;
		if(!isset($instances)){
			$instances = array();
		}
		$name = get_called_class();
		$key = md5(serialize($settings));
		if(empty($instances[$name.'.'.$key])){
			$instances[$name.'.'.$key] = new $name($settings);
			return $instances[$name.'.'.$key];
		}else{
			return $instances[$name.'.'.$key];
		}
	}
	
	function initialize(){
		
	}
	
	public static function generateModel($model_name, $model_settings = array()){
		$class_code = '
			namespace GCore\Models;
			if(!class_exists("GCore\Models\\'.$model_name.'", false)){
				class '.$model_name.' extends \GCore\Libs\Model {';
					foreach($model_settings as $setting => $value){
						if(is_object($value)){
							//$class_code .= 'var $'.$setting.' = '.unserialize(serialize($value)).';'."\n";
						}else{
							$class_code .= 'var $'.$setting.' = '.var_export($value, true).';'."\n";
						}
					}
				$class_code .= '
				}
			}
		';
		eval($class_code);
	}
	
	function setFields($fields = array()){
		$this->table_fields = $fields;
	}
	
	function loadPKey(){
		$cached = false;
		if(Base::getConfig('cache') >= 1 AND Base::getConfig('cache_dbinfo') >= 1){
			$cache = Cache::getInstance('db_tables_info', array('expiration' => Base::getConfig('dbinfo_cache_expiry', 43200)), 'file');
			$this->pkey = $cache->get($this->tablename.'.pkey');
			if($this->pkey !== false){
				$cached = true;
			}
		}
		if(!$cached){
			$this->pkey = $this->dbo->getTablePrimary($this->tablename);
		}
		if(!$cached AND Base::getConfig('cache') >= 1 AND Base::getConfig('cache_dbinfo') >= 1){
			$cache = Cache::getInstance('db_tables_info', array('expiration' => Base::getConfig('dbinfo_cache_expiry', 43200)), 'file');
			$cache->set($this->tablename.'.pkey', $this->pkey);
		}
	}
	
	function loadFields(){
		$cached = false;
		if(Base::getConfig('cache') >= 1 AND Base::getConfig('cache_dbinfo') >= 1){
			$cache = Cache::getInstance('db_tables_info', array('expiration' => Base::getConfig('dbinfo_cache_expiry', 43200)), 'file');
			$this->table_fields = $cache->get($this->tablename.'.columns');
			if(!empty($this->table_fields)){
				$cached = true;
			}
		}
		if(empty($this->table_fields)){
			$this->table_fields = $this->dbo->getTableColumns($this->tablename);
		}
		if(!$cached AND Base::getConfig('cache') >= 1 AND Base::getConfig('cache_dbinfo') >= 1){
			$cache = Cache::getInstance('db_tables_info', array('expiration' => Base::getConfig('dbinfo_cache_expiry', 43200)), 'file');
			$cache->set($this->tablename.'.columns', $this->table_fields);
		}
	}
	
	function load($id = null){
		$id = empty($id) ? $this->id : $id;
		$data = $this->find('first', array('conditions' => array($this->pkey => $id), 'recursive' => -1));
		if(!empty($data)){
			return $data;
		}
		return false;
	}
	
	private function _bind_models($type){
		if(!empty($this->{$type})){
			$this->{$type} = (array)$this->{$type};
			//fix models relations
			foreach($this->{$type} as $k => $model){
				//if this model should not be associated then continue
				if(!empty($this->allowed_models) AND !in_array($k, $this->allowed_models)){
					continue;
				}
				$this->_fix_relation($type, $k, $model);
			}
		}
	}
	
	private function _fix_relation($type, $k, $model){
		//only model name provided
		if(is_string($model)){
			$alias = Base::getClassName($model);
		}else{
			$alias = $k;
		}
		//make sure we don't have an endless loop of properties
		/*if(in_array($alias, $this->_parents_models)){
			return;
		}*/
		/*foreach($this->_parents_models as $_p_model){
			if($_p_model->alias == $alias){
				$this->{$alias} = &$_p_model;
				return;
			}
		}*/
		if(in_array($alias, $this->chain_models)){
			return;
		}
		//fix any quick relations
		if(is_numeric($k)){
			$this->{$type}[$alias] = array('className' => $model);
			unset($this->{$type}[$k]);
		}elseif(!is_numeric($k) AND !is_array($model)){
			$this->{$type}[$alias] = array('className' => $model);
			unset($this->{$type}[$k]);
		}elseif(!is_numeric($k) AND is_array($model) AND !empty($model['className'])){
			//good to go
			$this->{$type}[$alias] = $model;
		}else{
			unset($this->{$type}[$k]);
		}
		$this->associated_models[$alias] = $type;
		//bind models
		//make sure we don't have an endless loop of properties
		$a = $this->{$type}[$alias]['className'];
		//$a::$__parents_models[] = $this;//array_merge($this->_parents_models, (array)$this->alias);
		$a::$_chain_models = $this->chain_models;
		$a::$_chain_models[] = $alias;
		//add associated model as property
		$this->{$alias} = new $a(array('allowed_models' => $this->allowed_models));
		$this->{$alias}->alias = $alias;
		//add foreign key value
		if(empty($this->{$type}[$alias]['foreignKey'])){
			if($type == 'hasOne' OR $type == 'hasMany'){
				$this->{$type}[$alias]['foreignKey'] = Str::uncamilize($this->name).'_'.$this->pkey;
			}else{
				$this->{$type}[$alias]['foreignKey'] = Str::uncamilize($this->{$alias}->name).'_'.$this->{$alias}->pkey;
			}
		}
	}
	
	function bindModels($type, $models){
		foreach($models as $k => $model){
			$this->_fix_relation($type, $k, $model);
		}
	}
	
	function unbindModel($type, $model){
		unset($this->{$type}[$model]);
		unset($this->{$model});
	}
	
	private function _prepare_tablename($tablename, $as = false, $quote = true){
		$tablename = $this->dbo->_prefixTable($tablename);
		if($quote){
			$tablename = $this->dbo->quoteName($tablename);
		}
		//add the alias
		if($as !== false){
			$alias = $this->dbo->quoteName($this->alias);
			$tablename .= ' AS '.$alias;
		}
		return $tablename;
	}
	
	private function _prepare_field($field, $as = false, $attach_alias = true, $quote = true){
		$original_field = $field = trim($field);
		if(strpos($field, ':') === 0){
			$field = substr($field, 1);
			$new_field = $field;
			goto _prepare_field_process_as;
		}
		if(strpos($field, '(') !== false){
			//there is a function used, extract the field name inside
			preg_match('/\(([^)]+)\)/', $field, $field_name);
			if(!empty($field_name[1])){
				$field = $field_name[1];
			}
		}
		//sepcial field name, treat differently
		if($field == '*'){
			$attach_alias = false;
			$quote = false;
		}
		
		$extracted_field = $field;
		if($attach_alias AND strpos($field, '.') === false){
			//no model name used, add this model name
			$field = $this->alias.'.'.$field;
		}elseif(!$attach_alias AND strpos($field, '.') !== false){
			$field = substr($field, strpos($field, '.') + 1);
		}
		$new_field = $field;
		//check if we have to quote the field name
		if($quote){
			$new_field = $this->dbo->quoteName(str_replace('.', $this->dbo->quoteName('.'), $field));
		}
		$new_field = str_replace($extracted_field, $new_field, $original_field);
		//add the alias
		_prepare_field_process_as:
		if($as !== false){
			$new_field .= ' AS ';
			if(!empty($as)){
				if(strpos($as, ':') === 0){
					$as = substr($as, 1);
					$new_field .= $as;
					return $new_field;
				}
				if(strpos($as, '.') === false){
					//no model name used, add this model name
					$as = $this->alias.'.'.$as;
				}
				$new_field .= $this->dbo->quoteName($as);
			}else{
				$new_field .= $this->dbo->quoteName($field);
			}
		}
		
		return $new_field;
	}
	
	private function _prepare_field_string($string = ''){
		if(strpos($string, ':') === 0){
			$string = substr($string, 1);
			return $string;
		}
		preg_match_all('/[a-zA-Z][a-zA-Z0-9_.]*/', $string, $fields_names);
		if(!empty($fields_names[0])){
			$fields_names = $fields_names[0];
			$reserved = $this->dbo->get_reserved_words();
			foreach($fields_names as $field_name){
				if(!in_array(strtoupper($field_name), $reserved)){
					$string = str_replace($field_name, $this->_prepare_field($field_name, false), $string);
				}
			}
		}
		return $string;
	}
	
	protected function _get_associated_values(&$fieldname, &$value, $newQuery = false, &$parent = null){
		//check if we have an alias and there is no function
		if(!is_numeric($fieldname) AND strpos($fieldname, '(') === false AND strpos($fieldname, '.') !== false){
			$chunks = explode('.', $fieldname);
			$alias = $chunks[0];
			if($alias != $this-> alias){
				//check if this alias is directly associated to the current model
				if(isset($this->associated_models[$alias]) AND $this->associated_models[$alias] == 'hasMany'){
					//retrieve the foreign keys in associated hasMany models
					$this_pkey_values = $this->{$alias}->find('list', array('fields' => array($alias.'.'.$this->hasMany[$alias]['foreignKey']), 'conditions' => array($fieldname => $value)));
					$fieldname = $this->alias.'.'.$this->pkey;
					$value = $this_pkey_values;
					return true;
				}elseif(isset($this->associated_models[$alias]) AND $this->associated_models[$alias] != 'hasMany'){
					//direct first level relationship, do nothing
					if($newQuery){
						$fields = $this->alias.'.'.$parent->{$parent->associated_models[$this->alias]}[$this->alias]['foreignKey'];//($this->associated_models[$alias] == 'hasOne') ? array($alias.'.'.$this->{$this->associated_models[$alias]}[$alias]['foreignKey']) : array($this->alias.'.'.$this->{$this->associated_models[$alias]}[$alias]['foreignKey']);
						$this_pkey_values = $this->find('list', array('fields' => $fields, 'conditions' => array($fieldname => $value)));
						$fieldname = $parent->alias.'.'.$parent->pkey;//$this->alias.'.'.$this->{$this->associated_models[$alias]}[$alias]['foreignKey'];
						$value = $this_pkey_values;
					}
					return true;
				}else{
					//check if its indirectly associated
					foreach($this->associated_models as $model_alias => $relation_type){
						if(isset($this->{$model_alias})){
							$found = $this->{$model_alias}->_get_associated_values($fieldname, $value, true, $this);
							if($found){
								return true;//$this->_get_associated_values($fieldname, $value);
							}
						}
					}
				}
			}
		}
		return false;
	}
	
	function processConditions($conditions, $op = 'AND', $attach_alias = true){
		$operators = array('AND', 'OR', 'NOT');
		$parts = array();
		$conditions = (array)$conditions;
		foreach($conditions as $k => $v){
			$k = trim($k);
			//check the key type
			if(in_array($k, $operators)){
				//this is a logical operator
				if(!is_array($v)){
					$v = (array)$v;
				}
				if($v === array_values($v) AND is_array($v[0])){
					$inner_op_parts = array();
					//e.g: 'OR' => array(array('title' => 'x'), array('title' => 'y'))
					foreach($v as $same_field_condition){
						$inner_op_parts[] = '('.$this->processConditions($same_field_condition, $k, $attach_alias).')';
					}
					$parts[] = '('.implode(" $k ", $inner_op_parts).')';
				}else{
					$parts[] = '('.$this->processConditions($v, $k, $attach_alias).')';
				}
			}else{
				$this->_get_associated_values($k, $v);
				if(is_array($v)){
					//IN operation
					if(empty($v)){
						$v = array(null);
					}
					$parts[] = $this->_prepare_field($k, false, $attach_alias).' IN ('.implode(', ', array_map(array($this->dbo, 'quote'), $v)).')';
				}else{
					if(is_numeric($k)){
						//custom query part
						//escape fields names
						$parts[] = $this->_prepare_field_string($v);
					}elseif(strpos($k, ' ') !== false){
						//this is a field name with an operator
						$k_chunks = explode(' ', $k);
						$field_name = $k_chunks[0];
						$k = str_replace($field_name, $this->_prepare_field($field_name, false, $attach_alias), $k);
						$parts[] = $k.' '.$this->dbo->quote($v);
					}else{
						//this is a plain field name
						$parts[] = $this->_prepare_field($k, false, $attach_alias).' = '.$this->dbo->quote($v);
					}
				}
			}
		}
		if($op == 'NOT'){
			return 'NOT ('.implode(' ', $parts).')';
		}else{
			return implode(" $op ", $parts);
		}
	}
	
	function processOrder($orders){
		$orders = (array)$orders;
		$parts = array();		
		foreach($orders as $order){
			$parts[] = $this->_prepare_field_string($order);
		}		
		if(!empty($parts)){
			return ' ORDER BY '.implode(', ', $parts);
		}
	}
	
	function processGroup($groups){
		$groups = (array)$groups;
		$parts = array();
		foreach($groups as $group){
			$parts[] = $this->_prepare_field_string($group);
		}
		return ' GROUP BY '.implode(', ', $parts);
	}
	
	function processLimit($limit){
		if(!empty($limit) AND is_numeric($limit)){
			return ' LIMIT '.$limit;
		}
		return '';
	}
	
	function processOffset($offset){
		if(!empty($offset) AND is_numeric($offset)){
			return ' OFFSET '.$offset;
		}
		return '';
	}
	
	function processPage($page){
		$return = '';
		if(!empty($page) AND is_numeric($page)){
			$return .= ' LIMIT '.$this->page_limit;
			if(($page - 1) * $this->page_limit){
				$return .= ' OFFSET '.(($page - 1) * $this->page_limit);
			}
		}
		return $return;
	}
	
	function processJoins($joins = array()){
		if(!empty($joins) AND is_array($joins)){
			$parts = array();
			//loop through every join rule
			foreach($joins as $join){
				if(!empty($join) AND is_array($join)){
					if(empty($join['type'])){
						$join['type'] = 'left';
					}
					if(!empty($join['table']) AND !empty($join['alias']) AND !empty($join['conditions'])){
						$_class_name = $join['className'];
						$className = new $_class_name(array('no_relations' => true));
						$className->alias = $join['alias'];
						$parts[] = strtoupper($join['type']).' JOIN '.$className->_prepare_tablename($join['table'], true).' ON '.$this->processConditions($join['conditions']);
					}
				}
			}
			return implode(' ', $parts);
		}
		return false;
	}
	
	function processJoinsFields($joins = array()){
		if(!empty($joins) AND is_array($joins)){
			$joins_fields = array();
			//loop through every join rule
			foreach($joins as $join){
				$fields = array();
				if(!empty($join) AND is_array($join)){
					if(!empty($join['table']) AND !empty($join['alias']) AND !empty($join['conditions'])){
						$_class_name = $join['className'];
						$className = new $_class_name(array('no_relations' => true));
						$className->alias = $join['alias'];
						if(empty($join['fields'])){
							$join['fields'] = array();
						}
						$fields = $className->processFields($join['fields']);
					}
				}
				$joins_fields = array_merge($joins_fields, $fields);
			}
			return $joins_fields;
		}
		return array();
	}
	
	function findModelFields($alias){
		if($this->alias == $alias){
			//return $this->table_fields;
			$alias_fields = $this->table_fields;
			foreach($alias_fields as $k => $alias_field){
				$alias_fields[$k] = $alias.'.'.$alias_field;
			}
			return $alias_fields;
		}else if(in_array($alias, array_keys($this->associated_models))){
			$alias_fields = $this->{$alias}->table_fields;
			foreach($alias_fields as $k => $alias_field){
				$alias_fields[$k] = $alias.'.'.$alias_field;
			}
			return $alias_fields;
		}else{
			foreach(array_keys($this->associated_models) as $associated_model){
				$deep_fields = $this->{$associated_model}->findModelFields($alias);
				if(!empty($deep_fields)){
					return $deep_fields;
				}
			}
		}
		return array();
	}
	
	function processFields($fields = array()){
		$returns = array();
		$fields = (array)$fields;
		if(empty($fields)){
			$fields = $this->table_fields;
		}else{
			//check if we have a * field and extract its model's fields
			if(in_array('*', array_values($fields))){
				$index = array_search('*', $fields, true);
				unset($fields[$index]);
				$fields = array_merge($this->table_fields, $fields);
			}else{
				foreach(array_values($fields) as $field){
					if(substr($field, -2, 2) == '.*'){
						$index = array_search($field, $fields, true);
						$model_fields = $this->findModelFields(str_replace('.*', '', $field));
						unset($fields[$index]);
						$fields = array_merge($fields, $model_fields);
					}
				}
			}
			/*
			if(in_array('*', array_values($fields))){
				$index = array_search('*', $fields, true);
				unset($fields[$index]);
				$fields = array_merge($this->table_fields, $fields);
			}elseif(in_array($this->alias.'.*', array_values($fields))){
				$index = array_search($this->alias.'.*', $fields, true);
				unset($fields[$index]);
				$fields = array_merge($this->table_fields, $fields);
			}
			foreach($this->associated_models as $alias => $type){
				if(in_array($alias.'.*', array_values($fields))){
					$index = array_search($alias.'.*', $fields, true);
					unset($fields[$index]);
					$alias_fields = $this->{$alias}->table_fields;
					foreach($alias_fields as $k => $alias_field){
						$alias_fields[$k] = $alias.'.'.$alias_field;
					}
					$fields = array_merge($fields, $alias_fields);
				}
			}
			*/
		}
		foreach($fields as $k => $field){
			if(!empty($field)){
				if(!is_numeric($k)){
					//we have an alias set
					$returns[] = $this->_prepare_field($k, $field);
				}else{
					//no alias, pass the field name only
					$returns[] = $this->_prepare_field($field, '');
				}
			}
		}
		return $returns;
	}
	
	function _find_hasOne(&$params){
		if(!empty($this->hasOne)){
			foreach($this->hasOne as $alias => $model_info){
				if(in_array($alias, $params['_alias_used']) OR !isset($this->{$alias})){
					continue;
				}
				//check contained models list
				if(empty($params['contain'])){
					break;
				}else if(!in_array('*', $params['contain']) AND !in_array($alias, $params['contain'], true)){
					continue;
				}else{
					$current_contained_key = array_search($alias, $params['contain']);
					if(!empty($current_contained_key)){
						unset($params['contain'][$current_contained_key]);
					}
				}
				$params['_alias_used'][] = $alias;
				//if the model class is loaded, inject new join
				$className = &$this->{$alias};
				$new_join = array(
					'table' => $className->tablename,
					'alias' => $alias,
					'type' => !empty($model_info['type']) ? $model_info['type'] : 'left',
				);
				
				$new_join['className'] = $model_info['className'];
				
				$foreignKey = $model_info['foreignKey'];
				$new_join['conditions'] = !empty($model_info['join_conditions']) ? $model_info['join_conditions'] : array($this->alias.'.'.$this->pkey.' = '.$className->alias.'.'.$foreignKey);
				if(!empty($model_info['conditions'])){
					$params['conditions'] = !isset($params['conditions']) ? array() : $params['conditions'];
					$params['conditions'] = array_merge((array)$params['conditions'], (array)$model_info['conditions']);
				}
				if(!empty($model_info['fields'])){
					$new_join['fields'] = $model_info['fields'];
				}
				if(!empty($model_info['order'])){
					$params['order'] = !isset($params['order']) ? array() : $params['order'];
					$params['order'] = array_merge((array)$params['order'], (array)$model_info['order']);
				}
				
				$params['group'] = !isset($params['group']) ? array() : $params['group'];
				if((bool)array_search($this->alias, $this->chain_models) === false){
					$params['group'] = array_merge(array($this->alias.'.'.$this->pkey), (array)$params['group']);
				}				
				
				$params['joins'][] = $new_join;
				$className->processRelations('find', array('hasOne', 'belongsTo'), $params);
				$this->_late_hasMany[] = $alias;
			}
		}
	}
	
	function _find_belongsTo(&$params){
		if(!empty($this->belongsTo)){
			foreach($this->belongsTo as $alias => $model_info){
				if(in_array($alias, $params['_alias_used']) OR !isset($this->{$alias})){
					continue;
				}
				//check contained models list
				if(empty($params['contain'])){
					break;
				}else if(!in_array('*', $params['contain']) AND !in_array($alias, $params['contain'], true)){
					continue;
				}else{
					$current_contained_key = array_search($alias, $params['contain']);
					if(!empty($current_contained_key)){
						unset($params['contain'][$current_contained_key]);
					}
				}
				$params['_alias_used'][] = $alias;
				//if the model class is loaded, inject new join
				$className = &$this->{$alias};
				$new_join = array(
					'table' => $className->tablename,
					'alias' => $alias,
					'type' => !empty($model_info['type']) ? $model_info['type'] : 'left',
				);
				
				$new_join['className'] = $model_info['className'];
				
				$foreignKey = $model_info['foreignKey'];
				$new_join['conditions'] = !empty($model_info['join_conditions']) ? $model_info['join_conditions'] : array($this->alias.'.'.$foreignKey.' = '.$className->alias.'.'.$className->pkey);
				if(!empty($model_info['conditions'])){
					$params['conditions'] = !isset($params['conditions']) ? array() : $params['conditions'];
					$params['conditions'] = array_merge((array)$params['conditions'], (array)$model_info['conditions']);
				}
				if(!empty($model_info['fields'])){
					$new_join['fields'] = $model_info['fields'];
				}
				if(!empty($model_info['order'])){
					$params['order'] = !isset($params['order']) ? array() : $params['order'];
					$params['order'] = array_merge((array)$params['order'], (array)$model_info['order']);
				}
				$params['joins'][] = $new_join;
				$className->processRelations('find', array('hasOne', 'belongsTo'), $params);
				$this->_late_hasMany[] = $alias;
			}
		}
	}
	
	function _find_hasMany(&$data, $params = array()){
		if(!empty($this->hasMany)){
			foreach($this->hasMany as $alias => $model_info){
				if(in_array($alias, $params['_alias_used']) OR !isset($this->{$alias})){
					continue;
				}
				//check contained models list
				if(empty($params['contain'])){
					break;
				}else if(!in_array('*', $params['contain']) AND !in_array($alias, $params['contain'], true)){
					continue;
				}else{
					$current_contained_key = array_search($alias, $params['contain']);
					if(!empty($current_contained_key)){
						unset($params['contain'][$current_contained_key]);
					}
				}
				$params['_alias_used'][] = $alias;
				//if the model class is loaded, inject new join
				$className = &$this->{$alias};					
				$foreignKey = $model_info['foreignKey'];
				//build the find
				$f_params = array();
				$f_params['conditions'] = !empty($model_info['conditions']) ? (array)$model_info['conditions'] : array();
				$f_params['fields'] = !empty($model_info['fields']) ? (array)$model_info['fields'] : array();
				$f_params['order'] = !empty($model_info['order']) ? (array)$model_info['order'] : array();
				if(!empty($model_info['limit'])){
					$f_params['limit'] = (int)$model_info['limit'];
				}
				if(!empty($model_info['offset'])){
					$f_params['offset'] = (int)$model_info['offset'];
				}
				if(!empty($model_info['group'])){
					$f_params['group'] = $model_info['group'];
				}
				//extract the primary values of the data array
				$main_model_p_values = Arr::getVal($data, array('[n]', $this->alias, $this->pkey));
				$f_params['conditions'] = array_merge(array($className->alias.'.'.$foreignKey => $main_model_p_values), (array)$f_params['conditions']);
				$f_params['contain'] = $params['contain'];
				//find all associated records
				$records = $className->find('all', $f_params);
				//loop through main model data and inject associated records
				foreach($data as $k => $row){
					//get primary key value of this row
					$p_value =  Arr::getVal($row, array($this->alias, $this->pkey));
					foreach($records as $rk => $record){
						//get the foreign key value of associated record and compare to primary value of this row
						$f_value = Arr::getVal($record, array($className->alias, $foreignKey));
						if($f_value == $p_value){
							//inject the record of he associated record
							foreach($record as $sub_model => $sub_model_data){
								if(empty($data[$k][$sub_model]) OR !is_array($data[$k][$sub_model])){
									$data[$k][$sub_model] = array();
								}
								if(is_array($sub_model_data) AND $sub_model_data === array_values($sub_model_data)){
									$data[$k][$sub_model] = array_merge($data[$k][$sub_model], $sub_model_data);
								}else{
									$data[$k][$sub_model][] = $sub_model_data;
								}
							}
						}
					}
				}
			}
		}
	}
	
	function processRelations($calltype = 'find', $types, &$params = array(), $o_params = array()){
		//find and fix any setup relations
		foreach($types as $type){
			if(!empty($this->{$type})){
				//$this->_fix_relation_type($type);
				$fn = '_'.$calltype.'_'.$type;
				switch($calltype){
					case 'find':
						$this->$fn($params, $o_params);
					break;
					case 'save':
						$this->$fn($params);
					break;
					case 'delete':
						$ids = $this->get_ids_of_conditions($params);
						$this->$fn($ids);
					break;
				}
			}
		}
	}
	
	function get_ids_of_conditions($conditions){
		static $results;
		if(!isset($results)){
			$results = array();
		}
		$data_key = md5(serialize($conditions));
		if(array_key_exists($data_key, $results)){
			return $results[$data_key];
		}else{
			$data = $this->find('all', array(
				'fields' => $this->alias.'.'.$this->pkey,
				'conditions' => $conditions,
				'recursive' => -1,
			));
			if(!empty($data)){
				$results[$data_key] = Arr::getVal($data, array('[n]', $this->alias, $this->pkey));
			}else{
				$results[$data_key] = array();
			}
			return $results[$data_key];
		}
	}
	
	function initializeFind($type, &$params){
		if(!empty($params['initialized'])){
			return;
		}
		if(!isset($params['_alias_used'])){
			$params['_alias_used'] = array();
		}
		$params['_alias_used'][] = $this->alias;
		//reset fields for count type
		if($type == 'count'){
			$params['fields'] = array('COUNT(*)' => 'count');
			$params['page'] = $this->page = 0;
		}
		//fix fields list
		if(empty($params['fields'])){
			$params['fields'] = !empty($params['fields']) ? $params['fields'] : array();
		}
		//fix recursive
		$un_recursive = 0;
		if(isset($params['recursive']) AND ($params['recursive'] == -1)){
			$un_recursive = 1;
		}else if(isset($this->recursive) AND ($this->recursive == -1)){
			$un_recursive = 1;
		}
		$params['recursive'] = $un_recursive ? -1 : 1;
		//fix conditions
		$params['conditions'] = empty($params['conditions']) ? array() : $params['conditions'];
		$params['conditions'] = array_merge($this->conditions, $params['conditions']);
		//fix order
		$params['order'] = empty($params['order']) ? array() : (array)$params['order'];
		if(!empty($this->order_by)){
			$params['order'] = array_merge((array)$params['order'], (array)$this->order_by);
		}
		$params['page'] = !empty($params['page']) ? $params['page'] : $this->page;
		$params['limit'] = !empty($params['limit']) ? $params['limit'] : $this->limit;
		$params['offset'] = !empty($params['offset']) ? $params['offset'] : $this->offset;
		
		if(!empty($this->contain)){
			$params['contain'] = empty($params['contain']) ? $this->contain : array_merge($this->contain, (array)$params['contain']);
		}else{
			$params['contain'] = empty($params['contain']) ? array('*') : (array)$params['contain'];
		}
		$params['initialized'] = true;
	}
	
	function beforeFind($type, &$params){
		
	}
	
	function find($type = 'all', $params = array()){
		$this->initializeFind($type, $params);		
		$this->beforeFind($type, $params);
		$sql = 'SELECT ';
		//get the fields list of this model		
		$fields = $this->processFields($params['fields']);
		//check relationships and modify $params
		if($params['recursive'] != -1){
			$this->processRelations('find', array('hasOne', 'belongsTo'), $params);
			if($type == 'count'){
				$this->_late_hasMany = array();
			}
			foreach($this->_late_hasMany as $alias){
				$this->{$alias}->beforeFind($type, $params);
			}
		}
		//check if there are joins to get their fields, we will not load any joins fields if we have a fields list, you must ensure that the necessary fields from joins tables are loaded.
		if(empty($params['fields']) AND !empty($params['joins'])){
			$joins_fields = $this->processJoinsFields($params['joins']);
			$fields = array_merge($fields, $joins_fields);
		}
		
		//build select fields list
		$sql .= implode(', ', $fields);
		$sql .= ' FROM '.$this->_prepare_tablename($this->tablename, true);
		
		$sql_extensions = array();
		//get joins if any set
		if(!empty($params['joins'])){
			$sql_extensions['joins'] = ' '.$this->processJoins($params['joins']);
		}
		//get conditions if there are any
		if(!empty($params['conditions'])){
			$sql_extensions['where'] = ' WHERE '.$this->processConditions($params['conditions']);
		}
		//get having if there are any
		if(!empty($params['having'])){
			$sql_extensions['having'] = ' HAVING '.$this->processConditions($params['having']);
		}
		//get group if its set
		if(!empty($params['group'])){
			$sql_extensions['group'] = $this->processGroup($params['group']);
		}
		
		//get order if its set		
		$sql_extensions['order'] = $this->processOrder(array_unique($params['order']));
		//get limit if its set
		$sql_extensions['limit'] = $this->processLimit($params['limit']);
		//get offset if its set
		$sql_extensions['offset'] = $this->processOffset($params['offset']);
		//get page if its set
		$sql_extensions['page'] = $this->processPage($params['page']);
		if(!empty($sql_extensions['page'])){
			unset($sql_extensions['limit']);
			unset($sql_extensions['offset']);
		}
		
		$this->fixTypeSql($type, $sql_extensions);
		//append the extensions to the main SQL
		$sql .= implode('', $sql_extensions);
		//run the query and return the results
		$qdata = $this->dbo->loadAssocList($sql);
		//fix dots in aliases
		$qdata = $this->fix_columns_aliases($qdata);		
		//check relationships and modify $params
		if($params['recursive'] != -1 AND !empty($qdata) AND is_array($qdata) AND $type != 'count' AND !empty($params['contain'])){
			$this->processRelations('find', array('hasMany'), $qdata, $params);
			foreach($this->_late_hasMany as $alias){
				$this->{$alias}->processRelations('find', array('hasMany'), $qdata, $params);
			}
		}		
		//process the afterFind callback
		$this->afterFind($type, $qdata);
		//do some find types specific final processing
		$qdata = $this->process_find_type($type, $qdata, $params);
		//finalize
		$this->finalizeFind($type, $qdata);
		//return data
		return $qdata;
	}
	
	function afterFind($type, &$qdata){
		
	}
	
	function finalizeFind($type, &$qdata){
		//reset the used aliases counter for the next find
		$this->_alias_used = array();
	}
	
	function fixTypeSql($type, &$sql){
		switch ($type){
			case 'count':
				if(isset($sql['order'])){
					unset($sql['order']);
				}
				if(isset($sql['limit'])){
					unset($sql['limit']);
				}
				if(isset($sql['offset'])){
					unset($sql['offset']);
				}
			break;
			case 'first':
				$sql['limit'] = $this->processLimit(array('limit' => 1));
			break;
		}
	}
	
	function fix_columns_aliases($data){
		foreach($data as $k => $assoc){
			$data[$k] = $this->_extract_model_data($assoc);
		}
		return $data;
	}
	
	function process_find_type($type = 'all', $data = array(), $params = array()){
		switch ($type){
			case 'all':
				//$data = $this->fix_columns_aliases($data);
			break;
			case 'list':
				$new = array();
				//$data = $this->fix_columns_aliases($data);
				foreach($data as $k => $assoc){
					$assoc = array_values($assoc[$this->alias]);
					$count = count($assoc);
					if($count == 1){
						$new[$assoc[0]] = $assoc[0];
					}elseif($count > 1){
						$new[$assoc[0]] = $assoc[1];
					}
				}
				$data = $new;
			break;
			case 'first':
				//$data = $this->fix_columns_aliases($data);
				$data = !empty($data) ? array_shift($data) : array();
			break;
			case 'threaded':
				//$data = $this->fix_columns_aliases($data);
				if(!empty($data) AND !empty($this->parent_id)){
					$data = $this->build_threaded_list($data);
					break;
				}
			break;
			case 'flat':
				//$data = $this->fix_columns_aliases($data);
				if(!empty($data) AND !empty($this->parent_id)){
					$data = $this->build_flat_list($data);
					break;
				}
			break;
			case 'count':
				//$data = $this->fix_columns_aliases($data);
				if(empty($params['group'])){
					$data = !empty($data) ? array_shift($data) : array();
					if(!empty($data)){
						$data = $data[$this->alias]['count'];
						break;
					}
				}else{
					$data = count($data);
					break;
				}
				$data = 0;
			break;
		}
		return $data;
	}
	
	function build_threaded_list(array &$elements, $parentId = 0){
		$branch = array();
		foreach($elements as $k => $element){
			if($element[$this->alias][$this->parent_id] == $parentId){
				$children = $this->build_threaded_list($elements, $element[$this->alias][$this->pkey]);
				if($children){
					$element[$this->alias]['children'] = $children;
				}
				$branch[$k] = $element;
				unset($elements[$k]);
			}
		}
		return $branch;
	}
	
	function build_flat_list(array &$elements, $parentId = 0){
		$branch = array();
		foreach($elements as $k => $element){
			if($element[$this->alias][$this->parent_id] == $parentId){
				$branch[] = $element;
				$children = $this->build_flat_list($elements, $element[$this->alias][$this->pkey]);
				if($children){
					$branch = array_merge($branch, $children);
				}
			}
		}
		return $branch;
	}
	
	private function _extract_model_data($assoc){
		if(!empty($assoc)){
			$new_assoc = array();
			$models = array();
			foreach($assoc as $k => $v){
				if(strpos($k, '.') !== false){
					$k_chunks = explode('.', $k);
					$model_name = $k_chunks[0];
					$field_name = $k_chunks[1];
					$new_assoc[$model_name][$field_name] = $v;
				}else{
					$new_assoc[$k] = $v;
				}
			}
			return $new_assoc;
		}
		return $assoc;
	}
	
	function delete($id = null, $params = array()){
		if(!empty($id)){
			return $this->deleteAll(array($this->pkey => $id), $params);
		}
		return false;
	}
	
	function beforeDelete(&$conditions, $params = array()){
		
	}
	
	function deleteAll($conditions, $params = array()){
		if(!empty($conditions)){
			if(!array_key_exists('callbacks', $params) OR ($params['callbacks'] !== false)){
				$continue = $this->beforeDelete($conditions, $params);
				if($continue === false){
					return null;
				}
			}
			//check relationships
			$deleted_ids = array();
			if(!isset($params['recursive']) OR $params['recursive'] != -1){
				$this->processRelations('delete', array('hasOne', 'belongsTo', 'hasMany'), $conditions);
			}
			//create main query
			$sql = 'DELETE FROM '.$this->_prepare_tablename($this->tablename).' WHERE '.$this->processConditions($conditions, 'AND', false);
			//close
			$sql = $this->dbo->_close($sql);
			//run query
			$result = $this->dbo->exec($sql);
			$this->dbo->_log($sql);
			if($result === false){
				return false;
			}
			$this->afterDelete($conditions);
			return $result;
		}
		return false;
	}
	
	function afterDelete($conditions = array()){
		
	}
	
	private function _delete_hasOne($ids){
		if(!empty($this->hasOne)){
			foreach($this->hasOne as $alias => $model_info){
				if(!empty($model_info['delete_on_delete']) AND (bool)$model_info['delete_on_delete'] === true AND isset($this->{$alias})){
					//if no ids provided and no conditions then don't run this empty delete statement
					if(empty($model_info['conditions']) AND empty($ids)){
						continue;
					}
					//if the model class is loaded, inject new join
					$className = &$this->{$alias};
					$foreignKey = $model_info['foreignKey'];
					$delete_conditions = empty($model_info['conditions']) ? array($foreignKey => $ids) : array_merge(array($foreignKey => $ids), $model_info['conditions']);
					$className->deleteAll($delete_conditions);
				}
			}
		}
	}
	
	private function _delete_belongsTo($ids){
		if(!empty($this->belongsTo)){
			foreach($this->belongsTo as $alias => $model_info){
				if(isset($this->{$alias})){
					//if the model class is loaded, inject new join
					$className = &$this->{$alias};
					$foreignKey = $model_info['foreignKey'];
					//check counter Cache
					if(!empty($model_info['counterCache']) AND !empty($ids)){
						$counter_field = $model_info['counterCache'];
						$parents = $this->find('list', array('recursive' => -1, 'fields' => array($this->pkey, $foreignKey), 'conditions' => array($this->pkey => $ids)));
						$parents = array_values(array_unique(array_filter($parents)));
						foreach($parents as $parent){
							$className->id = $parent;
							$className->updateField($counter_field, '- 1');
						}
					}
				}
			}
		}
	}
	
	private function _delete_hasMany($ids){
		if(!empty($this->hasMany)){
			foreach($this->hasMany as $alias => $model_info){
				if(!empty($model_info['delete_on_delete']) AND (bool)$model_info['delete_on_delete'] === true AND isset($this->{$alias})){
					//if no ids provided and no conditions then don't run this empty delete statement
					if(empty($model_info['conditions']) AND empty($ids)){
						continue;
					}
					//if the model class is loaded, inject new join
					$className = &$this->{$alias};
					$foreignKey = $model_info['foreignKey'];
					$delete_conditions = empty($model_info['conditions']) ? array($foreignKey => $ids) : array_merge(array($foreignKey => $ids), $model_info['conditions']);
					$className->deleteAll($delete_conditions);
				}
			}
		}
	}
	
	function saveAll($data = array()){
		if(!empty($data) AND is_array($data) AND array_values($data) === $data){
			//numerically indexed list of records
			$this->ids = array();
			foreach($data as $k => $record){
				$this->save($record);
				$this->ids[] = $this->id;
			}
			return true;
		}
		return false;
	}
	
	function updateAll($data = array(), $conditions = array(), $params = array()){
		if(!empty($data) AND !empty($conditions)){
			return $this->save($data, array_merge($params, array(
				'conditions' => $conditions
			)));
		}
		return false;
	}
	
	function field($fieldname, $conditions = array()){
		if(!empty($fieldname)){
			$fieldname = strpos($fieldname, '.') !== false ? $fieldname : $this->alias.'.'.$fieldname;
			$data = $this->find('first', array('fields' => array($fieldname), 'conditions' => $conditions, 'recursive' => -1));
			$result = Arr::getVal($data, explode('.', $fieldname));
			if(!empty($result)){
				return $result;
			}
			return false;
		}
		return false;
	}
	
	function saveField($fieldname, $fieldvalue){
		if(!empty($fieldname) AND !empty($this->pkey) AND !empty($this->id) AND in_array($fieldname, $this->table_fields)){
			return $this->save(array(
				$this->pkey => $this->id, 
				$fieldname => $fieldvalue
			), array('whitelist' => array($this->pkey, $fieldname), 'modified' => false, 'validate' => false, 'callbacks' => false));
		}
		return false;
	}
	
	function updateField($fieldname, $updateValue = '+ 1', $params = array()){
		if(!empty($fieldname) AND !empty($this->id)){
			return $this->updateAll(array($fieldname => $this->dbo->quoteName($fieldname).' '.$updateValue), array($this->pkey => $this->id), array_merge(array('modified' => false, 'cleanlist' => array($fieldname), 'validate' => false, 'callbacks' => false), $params));
		}
		return false;
	}
	
	function validate($data = array(), $mode = 'create'){
		$data = empty($data) ? $this->data : $data;
		$return = true;
		if(!empty($data) AND !empty($this->validate)){
			foreach($this->validate as $fld => $rules){
				foreach($rules as $rule => $params){
					if($rule == 'message'){
						continue;
					}
					if(!empty($params['on']) AND $params['on'] != $mode){
						continue;
					}
					if($rule == 'function'){
						$valid = $this->{$params['name']}();
						goto check_valid;
					}
					//check other rules
					$value = Arr::getVal($data, array($fld));
					if(!empty($params[$rule])){
						//rule with extra param, example: regex
						$arg = $params[$rule];
						if(!empty($params['data'])){
							$arg = Arr::getVal($data, array($params[$rule]));
						}
						$valid = Validate::$rule($value, $arg);
					}else{
						$valid = Validate::$rule($value);
					}
					check_valid:
					if(!$valid){
						$this->errors[$fld][] = !empty($params['message']) ? $params['message'] : (!empty($rules['message']) ? $rules['message'] : '');
						$return = false;
					}
				}
				if(array_key_exists($fld, $this->errors)){
					$this->errors[$fld] = array_unique($this->errors[$fld]);
				}
			}
		}
		$this->errors = array_filter($this->errors);
		return $return;
	}
	
	function initializeSave(&$data, &$params){
		
	}
	
	function beforeSave(&$data, &$params, $mode){
		
	}
	/*
	params:
		new: force create new
		conditions: conditions for updating
		cleanlist: escaped/quoted fields values, don't quote again
		whitelist: limit save or update to those fields only
		blacklist: don't save or update the fields here
		callbacks: if false then it will disable the callbacks: beforeSave, afterSave..etc
	*/
	function save($data = array(), $params = array()){
		$insert = false;
		$update = false;
		$this->initializeSave($data, $params);
		//check the data format
		$models_data = array();
		if($data !== array_values($data) AND !empty($data[$this->alias]) AND is_array($data[$this->alias])){
			$models_data = $data;
			$data = $data[$this->alias];
		}
		$this->data = $data;
		//check new or update record
		if((!empty($this->pkey) AND !empty($data[$this->pkey]) AND empty($params['new'])) OR (!empty($params['conditions']) AND is_array($params['conditions']))){
			$mode = 'update';
		}else{
			$mode = 'create';
		}
		//if validation is not disabled then validate the data
		if(!empty($params['validate']) AND !empty($this->validate)){
			if(!$this->validate($data, $mode)){
				return false;
			}
		}
		//process the beforeSave()
		if(!array_key_exists('callbacks', $params) OR ($params['callbacks'] !== false)){
			$keep_on = $this->beforeSave($data, $params, $mode);
			if($keep_on === false){
				return $keep_on;
			}
		}
		//set the query type
		if($mode == 'update'){
			$tablename = $this->_prepare_tablename($this->tablename, true);
			$sql = 'UPDATE '.$tablename.' ';
			$update = true;
			if(empty($data['modified']) AND (!isset($params['modified']) OR $params['modified'] !== false)){
				$data['modified'] = date('Y-m-d H:i:s', time());
				if(!empty($params['whitelist'])){
					$params['whitelist'][] = 'modified';
				}
			}
		}else{
			$tablename = $this->_prepare_tablename($this->tablename, false);
			$sql = 'INSERT INTO '.$tablename.' ';
			$insert = true;
			if(empty($data['created']) AND (!isset($params['created']) OR $params['created'] !== false)){
				$data['created'] = date('Y-m-d H:i:s', time());
				if(!empty($params['whitelist'])){
					$params['whitelist'][] = 'created';
				}
			}
		}
		//get the fields to use in the query
		if(empty($params['cleanlist'])){
			$cleanlist = array();
		}else{
			$cleanlist = (array)$params['cleanlist'];
		}
		$query_fields = array();
		foreach($data as $k => $v){
			if(!in_array($k, $this->table_fields)){
				unset($data[$k]);
				continue;
			}
			//check if we have a black fields list to check
			if(!empty($params['blacklist']) AND is_array($params['blacklist'])){
				if(in_array($k, $params['blacklist'])){
					unset($data[$k]);
					continue;
				}
			}
			//check if we have a white fields list to check
			if(!empty($params['whitelist']) AND is_array($params['whitelist'])){
				if(!in_array($k, $params['whitelist'])){
					unset($data[$k]);
					continue;
				}
			}
			
			$query_fields[] = $k;
		}
		//if there are no eligible fields, exit
		if(empty($query_fields)){
			return false;
		}
		//quote columns names for security
		$query_fields_q = array_map(array($this->dbo, 'quoteName'), $query_fields);
		//build the fields section in an insert query
		if($insert){
			$sql .= '('.implode(', ', $query_fields_q).')';
			$sql .= ' values ';
			$sql .= '(:'.implode(', :', $query_fields).')';
			$this->id = !empty($data[$this->pkey]) ? $data[$this->pkey] : $this->id;
		}
		//build the fields section in an update query
		if($update){
			$sql .= 'SET ';
			$chunks = array();
			foreach($query_fields as $k => $query_field){
				if($query_field != $this->pkey){
					//check if we have a clean fields list to check
					if(in_array($query_field, $cleanlist)){
						$chunks[] = $query_fields_q[$k].' = '.$data[$query_field];
						unset($data[$query_field]);
					}else{
						$chunks[] = $query_fields_q[$k].' = :'.$query_field;
					}
				}
			}
			$sql .= implode(', ', $chunks);
			
			if(!empty($params['conditions']) AND is_array($params['conditions'])){
				$sql .= ' WHERE '.$this->processConditions($params['conditions']);
			}else{
				$sql .= ' WHERE '.$this->dbo->quoteName($this->pkey).' = :'.$this->pkey;
				$this->id = $data[$this->pkey];
			}
		}
		//close
		$sql = $this->dbo->_close($sql);
		//replace table prefix
		//$sql = $this->dbo->_prefixTable($sql);
		//run query
		//$query = $this->dbo->prepare($sql);
		if(!$this->dbo->execute_query($sql, $data)){
			return false;
		}
		$this->dbo->_log($sql, $data);
		if($insert){
			$last_insert = $this->dbo->lastInsertId();
			$this->id = !empty($last_insert) ? $last_insert : $this->id;
			$this->created = true;
		}else{
			$this->created = false;
		}
		$this->data[$this->pkey] = $this->id;
		//check relationships
		if(!isset($params['recursive']) OR $params['recursive'] != -1){
			$this->processRelations('save', array('hasOne', 'belongsTo', 'hasMany'), $models_data);
		}
		//after save
		if(!array_key_exists('callbacks', $params) OR ($params['callbacks'] !== false)){
			$this->afterSave();
		}
		return true;
	}
	
	function afterSave(){
		
	}
	
	private function _save_hasOne($data){
		if(!empty($this->hasOne)){
			foreach($this->hasOne as $alias => $model_info){
				if(!empty($model_info['save_on_save']) AND (bool)$model_info['save_on_save'] === true AND isset($this->{$alias})){
					//if the model class is loaded, inject new join
					$className = &$this->{$alias};
					$foreignKey = $model_info['foreignKey'];
					//if there is no data for this model and force save is disabled then don't try to save
					if(empty($data[$alias]) AND isset($model_info['force_save']) AND (bool)$model_info['force_save'] === false){
						continue;
					}
					//check if this is a new record or an existing one
					if($this->created === true){
						//new record, save a new associated record
						$data[$alias][$foreignKey] = $this->id;
						//if the pkey is the same as fkey then make sure it doesn't make an UPDATE statement
						$save_params = array();
						if($className->pkey == $foreignKey){
							$save_params = array('new' => true);
						}
						$className->save($data[$alias], $save_params);
					}else{
						//update existing associated record
						if(!empty($data[$alias])){
							//unset the associated record pkey if its set, we should run the update based on the foreign key value only
							if(!empty($data[$alias][$className->pkey])){
								unset($data[$alias][$className->pkey]);
							}
							$className->updateAll($data[$alias], array($foreignKey => $this->id));
						}
					}
				}
			}
		}
	}
	
	private function _save_belongsTo($data){
		if(!empty($this->belongsTo)){
			foreach($this->belongsTo as $alias => $model_info){
				if(isset($this->{$alias})){
					//if the model class is loaded, inject new join
					$className = &$this->{$alias};
					$foreignKey = $model_info['foreignKey'];
					if($this->created === true){
						//check counter Cache
						if(!empty($model_info['counterCache'])){
							$counter_field = $model_info['counterCache'];
							$className->updateAll(array($counter_field => $this->dbo->quoteName($counter_field).' + 1'), array($className->pkey => $this->data[$foreignKey]), array('cleanlist' => array($counter_field), 'modified' => false));
						}
					}
				}
			}
		}
	}
	
	private function _save_hasMany($data){
		if(!empty($this->hasMany)){
			foreach($this->hasMany as $alias => $model_info){
				if(!empty($model_info['save_on_save']) AND (bool)$model_info['save_on_save'] === true AND isset($this->{$alias})){
					//if the model class is loaded, inject new join
					$className = &$this->{$alias};
					$foreignKey = $model_info['foreignKey'];
					//check if this is a new record or an existing one
					if($this->created === true){
						//new record, update and save associated data
						if(!empty($data) AND !empty($data[$alias])){
							foreach($data[$alias] as $k => $_d){
								$data[$alias][$k][$foreignKey] = $this->id;
							}
							$className->saveAll($data[$alias]);
						}
					}else{
						//update existing associated record
						if(!empty($data) AND isset($data[$alias])){
							//delete non existent records based on p key values
							if(!empty($model_info['delete_non_existent']) AND (bool)$model_info['delete_non_existent'] === true){
								$existing_keys = Arr::getVal($data, array($alias, '[n]', $className->pkey));
								$delete_conditions = empty($model_info['conditions']) ? array($foreignKey => $this->id, 'NOT' => array($className->pkey => $existing_keys)) : array_merge(array($foreignKey => $this->id, 'NOT' => array($className->pkey => $existing_keys)), $model_info['conditions']);
								$className->deleteAll($delete_conditions);
							}
							if(!empty($data[$alias])){
								//fix any foreign key issues and save
								foreach($data[$alias] as $k => $_d){
									$data[$alias][$k][$foreignKey] = $this->id;
								}
								$className->saveAll($data[$alias]);
							}
						}
					}
				}
			}
		}
	}
	
}