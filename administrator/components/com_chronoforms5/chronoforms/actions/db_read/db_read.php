<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\DbRead;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class DbRead extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'DB Read';
	static $group = array('data_management' => 'Data Management');

	var $defaults = array(
		'tablename' => '',
		'enabled' => 1,
		'model_id' => 'Data',
		'load_under_modelid' => 1,
		'multi_read' => 0,
		'ndb_enable' => 0,
		'ndb_driver' => 'mysql',
		'ndb_host' => 'localhost',
		'ndb_user' => '',
		'ndb_password' => '',
		'ndb_database' => '',
		'ndb_table_name' => '',
		'ndb_prefix' => 'jos_'
	);

	function execute(&$form, $action_id){
		$config =  $form->actions_config[$action_id];
		$config = new \GCore\Libs\Parameter($config);

		$model_id = $config->get('model_id', 'Data');
		$model_id = empty($model_id) ? 'Data' : $model_id;
		if($config->get('tablename', '')){
			\GCore\Libs\Model::generateModel($model_id, array('tablename' => $config->get('tablename', '')));
			$model_class = '\GCore\Models\\'.$model_id;
			//$data = $form->data;
			$find_type = 'first';
			if((bool)$config->get('multi_read', 0) === true){
				$find_type = 'all';
			}

			$find_params = array();
			$conditions = eval('?>'.$config->get('conditions', ''));
			$model_class::getInstance()->conditions = is_array($conditions) ? $conditions : array();

			if($config->get('fields', '')){
				$find_params['fields'] = array_map('trim', explode(',', $config->get('fields', '')));
			}
			if($config->get('order', '')){
				$find_params['order'] = array_map('trim', explode(',', $config->get('order', '')));
			}
			if($config->get('group', '')){
				$find_params['group'] = array_map('trim', explode(',', $config->get('group', '')));
			}
			
			$initial_queries = $model_class::getInstance()->dbo->log;
			//run query
			$rows = $model_class::getInstance()->find($find_type, $find_params);
			$form->debug[$action_id][self::$title]['Queries'] = array_values(array_diff($model_class::getInstance()->dbo->log, $initial_queries));
			$data = array();
			if((bool)$config->get('multi_read', 0) === true){
				foreach($rows as $k => $row){
					$data[$k] = $row[$model_id];
				}
			}else{
				$data = $rows[$model_id];
			}
			
			if((bool)$config->get('load_under_modelid', 0) === true){
				$form->data[$model_id] = $data;
			}else{
				$form->data = array_merge($form->data, $data);
			}
		}
		//pr($form->data);
	}

	public static function config(){
		$tables = \GCore\Libs\Database::getInstance()->getTablesList();
		array_unshift($tables, '');
		$tables = array_combine($tables, $tables);

		echo \GCore\Helpers\Html::formStart('action_config db_read_action_config', 'db_read_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][enabled]', array('type' => 'dropdown', 'label' => l_('CF_ENABLED'), 'options' => array(0 => l_('NO'), 1 => l_('YES'))));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][tablename]', array('type' => 'dropdown', 'label' => l_('CF_TABLENAME'), 'options' => $tables, 'sublabel' => l_('CF_DB_READ_TABLENAME_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][multi_read]', array('type' => 'dropdown', 'label' => l_('CF_DB_READ_MULTI'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_DB_READ_MULTI_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][load_under_modelid]', array('type' => 'dropdown', 'label' => l_('CF_DB_READ_UNDER_MODELID'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_DB_READ_UNDER_MODELID_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][model_id]', array('type' => 'text', 'label' => l_('CF_MODEL_ID'), 'sublabel' => l_('CF_DB_READ_MODEL_ID_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][fields]', array('type' => 'text', 'class' => 'L', 'label' => l_('CF_DB_READ_FIELDS'), 'sublabel' => l_('CF_DB_READ_FIELDS_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][order]', array('type' => 'text', 'class' => 'L', 'label' => l_('CF_DB_READ_ORDER'), 'sublabel' => l_('CF_DB_READ_ORDER_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][group]', array('type' => 'text', 'class' => 'L', 'label' => l_('CF_DB_READ_GROUP'), 'sublabel' => l_('CF_DB_READ_GROUP_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][conditions]', array('type' => 'textarea', 'rows' => 8, 'cols' => 70, 'label' => l_('CF_DB_READ_CONDITIONS'), 'sublabel' => l_('CF_DB_READ_CONDITIONS_DESC')));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}