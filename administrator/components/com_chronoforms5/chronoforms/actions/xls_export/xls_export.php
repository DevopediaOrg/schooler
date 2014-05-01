<?php
/**
* CHRONOFORMS version 4.0
* Copyright (c) 2006 - 2011 Chrono_Man, ChronoEngine.com. All rights reserved.
* Author: Chrono_Man (ChronoEngine.com)
* @license		GNU/GPL
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\XlsExport;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class XlsExport extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'XLS Export';
	static $group = array('data_management' => 'Data Management');
	var $defaults = array(
		'enabled' => 1,
		'data_path' => '',
		'list_fields' => '',
		'list_headers' => '',
		'before_headers' => '',
		'add_bom' => 0,
		'save_file' => 0,
		'post_file_name' => '',
		'file_name' => 'cf_export.xls',
		'save_path' => '',
	);

	function execute(&$form, $action_id){
		$config =  $form->actions_config[$action_id];
		$config = new \GCore\Libs\Parameter($config);

		if(!$config->get('enabled')){
			return;
		}

		$data_path = trim($config->get('data_path', ''));
		$data = \GCore\Libs\Arr::getVal($form->data, explode('.', $data_path));

		if(!empty($data) AND is_array($data)){
			$data = array_values($data);
			$first_data_record = $data[0];
			$list_fields = strlen(trim($config->get('list_fields', ''))) ? explode(',', trim($config->get('list_fields', ''))) : array_keys($first_data_record);
			$list_headers = strlen(trim($config->get('list_headers', ''))) ? explode(',', trim($config->get('list_headers', ''))) : array_keys($first_data_record);

			$table_rows = '';
			if(strlen(trim($config->get('before_headers', '')))){
				$table_rows .= '<tr bgcolor="#fff">'."\n";
				$table_rows .= '<td>'.\GCore\Libs\Arr::getVal($form->data, explode('.', trim($config->get('before_headers', '')))).'</td>'."\n";
				$table_rows .= '</tr>'."\n";
			}
			//add headers
			$table_rows .= '<tr bgcolor="#999999">'."\n";
			foreach($list_headers as $k => $v){
				$table_rows .= '<td style="color:white">'.$v.'</td>'."\n";
			}
			$table_rows .= '</tr>'."\n";
			//add data rows
			foreach($data as $record){
				$table_rows .= '<tr>'."\n";
				foreach($record as $k => $v){
					if(!in_array($k, $list_fields)){
						continue;
					}
					$table_rows .= '<td valign="top" style="mso-number-format:\@">'.$v.'</td>'."\n";
				}
				$table_rows .= '</tr>'."\n";
			}
			//finalize table
			$excel_table = "<table border='1'>".$table_rows."</table>";
			if($config->get('save_file', 0) == 1){
				$save_path = $config->get('save_path', '') ? $config->get('save_path', '') : \GCore\C::ext_path('chronoforms', 'front').'exports'.DS.$form->form['Form']['title'].DS;
				if (!file_exists($save_path.'index.html')){
					if(!mkdir($save_path, 0755, true)){
						$form->debug[$action_id][self::$title] = "Couldn't create save folder: {$save_path}";
						return;
					}
					file_put_contents($save_path.'index.html', '');
				}
				if((bool)$config->get('add_bom', 0) === true){
					$excel_table = "\xEF\xBB\xBF".$excel_table;
				}
				$file_name = $config->get('file_name', 'cf_export.xls');
				$saved = file_put_contents($save_path.$file_name, $excel_table);
				if(empty($saved)){
					$form->debug[$action_id][self::$title] = "Couldn't create XLS file";
					return;
				}
				if(strlen($config->get('post_file_name', '')) > 0){
					$post_file_name = $config->get('post_file_name', '');
					$form->data[$post_file_name] = $file_name;
					$form->files[$post_file_name] = array('name' => $file_name, 'path' => $save_path.$file_name, 'size' => filesize($save_path.$file_name));
					//$form->files[$post_file_name]['link'] = $save_url.$file_name;
				}
			}else{
				//set headers
				header("Pragma: public");
				header("Expires: 0");
				header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
				header("Content-Type: application/force-download");
				header("Content-Type: application/octet-stream");
				header("Content-Type: application/download");;
				header("Content-Disposition: attachment;filename=".$config->get('file_name', 'cf_export.xls'));
				header("Content-Transfer-Encoding: binary");
				header('Content-Encoding: UTF-8');
				//output data
				@ob_end_clean();
				if((bool)$config->get('add_bom', 0) === true){
					echo "\xEF\xBB\xBF";
				}
				echo $excel_table;
				exit;
			}

		}
	}

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config csv_export_action_config', 'csv_export_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][enabled]', array('type' => 'dropdown', 'label' => l_('CF_ENABLED'), 'options' => array(0 => l_('NO'), 1 => l_('YES'))));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][data_path]', array('type' => 'text', 'class' => 'M', 'label' => l_('CF_XLS_DATA_PATH'), 'sublabel' => l_('CF_XLS_DATA_PATH_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][list_fields]', array('type' => 'text', 'class' => 'XL', 'label' => l_('CF_XLS_LIST_FIELDS'), 'sublabel' => l_('CF_XLS_LIST_FIELDS_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][list_headers]', array('type' => 'text', 'class' => 'XL', 'label' => l_('CF_XLS_LIST_HEADERS'), 'sublabel' => l_('CF_XLS_LIST_HEADERS_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][file_name]', array('type' => 'text', 'class' => 'XL', 'label' => l_('CF_XLS_FILE_NAME'), 'sublabel' => l_('CF_XLS_FILE_NAME_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][post_file_name]', array('type' => 'text', 'class' => 'XL', 'label' => l_('CF_XLS_POST_FILE_NAME'), 'sublabel' => l_('CF_XLS_POST_FILE_NAME_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][before_headers]', array('type' => 'text', 'class' => 'XL', 'label' => l_('CF_XLS_BEFORE_HEADERS'), 'sublabel' => l_('CF_XLS_BEFORE_HEADERS_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][save_file]', array('type' => 'dropdown', 'label' => l_('CF_XLS_SAVE_FILE'), 'sublabel' => l_('CF_XLS_SAVE_FILE_DESC'), 'options' => array(0 => l_('NO'), 1 => l_('YES'))));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][save_path]', array('type' => 'text', 'class' => 'XL', 'label' => l_('CF_XLS_SAVE_PATH'), 'sublabel' => l_('CF_XLS_SAVE_PATH_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][add_bom]', array('type' => 'dropdown', 'label' => l_('CF_XLS_ADD_BOM'), 'sublabel' => l_('CF_XLS_ADD_BOM_DESC'), 'options' => array(0 => l_('NO'), 1 => l_('YES'))));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}

}
?>