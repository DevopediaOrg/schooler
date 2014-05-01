<?php
/**
* CHRONOFORMS version 4.0
* Copyright (c) 2006 - 2011 Chrono_Man, ChronoEngine.com. All rights reserved.
* Author: Chrono_Man (ChronoEngine.com)
* @license		GNU/GPL
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\CsvExport;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class CsvExport extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'CSV Export';
	static $group = array('data_management' => 'Data Management');
	//var $events = array('success' => 0, 'fail' => 0);

	var $defaults = array(
		'tablename' => '',
		'include' => '',
		'exclude' => '',
		'save_path' => '',
		'file_name' => '',
		'delimiter' => '',
		'enclosure' => '',
		'download_mime_type' => '',
		'download_export' => '',
		'download_nosave' => '',
		'where' => '',
		'data_path' => '',
		'titles' => '',
		'post_file_name' => '',
		'order_by' => '',
		'columns' => '',
	);

	function execute(&$form, $action_id){
		$config =  $form->actions_config[$action_id];
		$config = new \GCore\Libs\Parameter($config);

		if(!$config->get('enabled')){
			return;
		}
		$tablename = $config->get('tablename', '');
		if(!empty($tablename)){
			\GCore\Libs\Model::generateModel('ListData', array('tablename' => $tablename));
			$list_model = '\GCore\Models\ListData';

			if($config->get('columns', '')){
				$columns = array_map('trim', explode("\n", $config->get('columns', '')));
			}else{
				$columns = $list_model::getInstance()->dbo->getTableColumns($tablename);
			}

			if($config->get('titles', '')){
				$titles = array_map('trim', explode("\n", $config->get('titles', '')));
			}else{
				$titles = $columns;
			}

			if($config->get('order_by', '')){
				$order_by = array_map('trim', explode(',', $config->get('order_by', '')));
			}else{
				$order_by = $list_model::getInstance()->pkey;
			}

			$file_name = 'csv_export_'.$tablename.'_'.date('YmdHi').'.csv';
			$rows = $list_model::getInstance()->find('all', array('fields' => $columns, 'order' => $order_by));
		}else{
			if(!$config->get('data_path', '')){
				return;
			}
			$rows = \GCore\Libs\Arr::getVal($form->data, explode('.', $config->get('data_path', '')), array());
			$file_name = 'csv_export_'.date('YmdHi').'.csv';
		}

		header('Content-type: text/csv');
		header('Content-Disposition: attachment; filename='.$file_name);
		header('Pragma: no-cache');
		header('Expires: 0');

		$data = array($titles);

		if(!empty($rows)){
			foreach($rows as $row){
				$data[] = $row['ListData'];
			}
		}
		@ob_end_clean();
		self::outputCSV($data);
		exit;
	}

	public static function outputCSV($data){
		$outstream = fopen('php://output', 'w');
		array_walk($data, array('self', 'insert_data'), $outstream);
		fclose($outstream);
	}

	public static function insert_data(&$vals, $key, $filehandler){
		fputcsv($filehandler, $vals); // add parameters if you want
	}

	public static function config(){
		$tables = \GCore\Libs\Database::getInstance()->getTablesList();
		array_unshift($tables, '');
		$tables = array_combine($tables, $tables);

		echo \GCore\Helpers\Html::formStart('action_config csv_export_action_config', 'csv_export_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][enabled]', array('type' => 'dropdown', 'label' => l_('CF_ENABLED'), 'options' => array(0 => l_('NO'), 1 => l_('YES'))));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][tablename]', array('type' => 'dropdown', 'label' => l_('CF_CSV_TABLENAME'), 'options' => $tables, 'sublabel' => l_('CF_CSV_TABLENAME_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][data_path]', array('type' => 'text', 'class' => 'M', 'label' => l_('CF_CSV_DATA_PATH'), 'sublabel' => l_('CF_CSV_DATA_PATH_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][columns]', array('type' => 'text', 'class' => 'XL', 'label' => l_('CF_CSV_COLUMNS'), 'sublabel' => l_('CF_CSV_COLUMNS_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][titles]', array('type' => 'text', 'class' => 'XL', 'label' => l_('CF_CSV_TITLES'), 'sublabel' => l_('CF_CSV_TITLES_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][order_by]', array('type' => 'text', 'class' => 'XL', 'label' => l_('CF_CSV_ORDER_BY'), 'sublabel' => l_('CF_CSV_ORDER_BY_DESC')));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}

}
?>