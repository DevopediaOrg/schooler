<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\DbSave;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class DbSave extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'DB Save';
	static $setup = array('simple' => array('title' => 'Data Save'));
	static $group = array('data_management' => 'Data Management');

	var $defaults = array(
		'tablename' => '',
		'enabled' => 1,
		'model_id' => 'Data',
		'save_under_modelid' => 0,
		'multi_save' => 0,
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
			$data = $form->data;
			if((bool)$config->get('save_under_modelid', 0) === true){
				$data = $form->data[$model_id];
			}
			$user = \GCore\Libs\Base::getUser();
			$data['user_id'] = $user['id'];

			$initial_queries = $model_class::getInstance()->dbo->log;
			if((bool)$config->get('multi_save', 0) === true){
				$model_class::getInstance()->saveAll($data);
			}else{
				$model_class::getInstance()->save($data);
			}
			$form->debug[$action_id][self::$title]['Queries'] = array_values(array_diff($model_class::getInstance()->dbo->log, $initial_queries));
		}
	}

	public static function config(){
		$tables = \GCore\Libs\Database::getInstance()->getTablesList();
		array_unshift($tables, '');
		$tables = array_combine($tables, $tables);

		echo \GCore\Helpers\Html::formStart('action_config db_save_action_config', 'db_save_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][enabled]', array('type' => 'dropdown', 'label' => l_('CF_ENABLED'), 'options' => array(0 => l_('NO'), 1 => l_('YES'))));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][tablename]', array('type' => 'dropdown', 'label' => l_('CF_TABLENAME'), 'options' => $tables, 'sublabel' => l_('CF_TABLENAME_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][save_under_modelid]', array('type' => 'dropdown', 'label' => l_('CF_SAVE_UNDER_MODELID'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_SAVE_UNDER_MODELID_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][multi_save]', array('type' => 'dropdown', 'label' => l_('CF_MULTI_SAVE'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_MULTI_SAVE_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][model_id]', array('type' => 'text', 'label' => l_('CF_MODEL_ID'), 'sublabel' => l_('CF_MODEL_ID_DESC')));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}