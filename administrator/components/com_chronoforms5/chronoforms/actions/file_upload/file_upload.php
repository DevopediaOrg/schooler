<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\FileUpload;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class FileUpload extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'Files Upload';
	static $setup = array('simple' => array('title' => 'Uploads'));
	var $events = array('success' => 0, 'fail' => 0);

	var $defaults = array(
		'files' => '',
		'array_fields' => '',
		'upload_path' => '',
		'forced_file_name' => '',
		'max_size' => '100',
		'min_size' => '0',
		'enabled' => 1,
		'safe_file_name' => 1,
		'max_error' => 'Sorry, Your uploaded file size exceeds the allowed limit.',
		'min_error' => 'Sorry, Your uploaded file size is less than the minimum limit.',
		'type_error' => 'Sorry, Your uploaded file type is not allowed.',
		'extensions_separator' => '-',
	);

	function execute(&$form, $action_id){
		$config =  $form->actions_config[$action_id];
		$this->config = $config = new \GCore\Libs\Parameter($config);
		if((bool)$config->get('enabled', 0) === false){
			return;
		}
		$upload_path = $config->get('upload_path', '');
		if(!empty($upload_path)){
			$upload_path = str_replace(array("/", "\\"), DS, $upload_path);
			if(substr($upload_path, -1) == DS){
				$upload_path = substr_replace($upload_path, '', -1);
			}
			$upload_path = $upload_path.DS;
			$config->set('upload_path', $upload_path);
		}else{
			$upload_path = \GCore\C::ext_path('chronoforms', 'front').'uploads'.DS.$form->form['Form']['title'].DS;
		}
		$this->upload_path = $upload_path;
		//check path is correct
		if(!is_dir($this->upload_path) OR !is_writable(realpath($this->upload_path))){
			//$form->errors[] = "Unable to write to upload directory.";
			//$this->events['fail'] = 1;
			//return;
		}
		if(!file_exists($this->upload_path.DS.'index.html')){
			if(!\GCore\Libs\Folder::create($this->upload_path)){
				$form->errors[] = "Couldn't create upload directory: ".$this->upload_path;
				$this->events['fail'] = 1;
				return;
			}
			$dummy_c = '<html><body bgcolor="#ffffff"></body></html>';
			if(!\GCore\Libs\File::write($this->upload_path.DS.'index.html', $dummy_c)){
				$form->errors[] = "Couldn't create upload directory index file.";
				$this->events['fail'] = 1;
				return;
			}
		}
		$files_array = explode("\n", trim($config->get('files', '')));
		//get array fields
		$array_fields = array();
		if(trim($config->get('array_fields', ''))){
			$array_fields = explode(',', trim($config->get('array_fields', '')));
		}

		foreach($files_array as $file_string){
			if(strpos($file_string, ':') !== false){
				$file_data = explode(':', trim($file_string));
				$file_extensions = explode($config->get('extensions_separator', '-'), $file_data[1]);
				//convert all extensions to lower case
				foreach($file_extensions as $k => $file_extension){
					$file_extensions[$k] = strtolower($file_extension);
				}
				//get the posted file details
				$field_name = $file_data[0];
				if(empty($_FILES[$field_name])){
					continue;
				}
				$file_post = $_FILES[$field_name];
				if(in_array($field_name, $array_fields) AND !empty($file_post['name']) AND ($file_post['name'] === array_values($file_post['name']))){
					foreach($file_post['name'] as $k => $v){
						$uploaded_file_data = $this->processUpload($form, array('name' => $file_post['name'][$k], 'tmp_name' => $file_post['tmp_name'][$k], 'error' => $file_post['error'][$k], 'size' => $file_post['size'][$k]), $file_data[0], $file_extensions);
						if(is_array($uploaded_file_data)){
							$form->files[$field_name][] = $uploaded_file_data;
							$form->data[$field_name][] = $uploaded_file_data['name'];
						}elseif($uploaded_file_data === false){
							return false;
						}
					}
				}else{
					$uploaded_file_data = $this->processUpload($form, $file_post, $field_name, $file_extensions);
					if(is_array($uploaded_file_data)){
						$form->files[$field_name] = $uploaded_file_data;
						$form->data[$field_name] = $uploaded_file_data['name'];
					}elseif($uploaded_file_data === false){
						return false;
					}
				}
			}
		}
	}

	function processUpload(&$form, $file_post = array(), $field_name, $file_extensions){
		//check valid file
		if(!\GCore\Libs\Upload::valid($file_post)){
			return false;
		}
		//check not empty file upload
		if(!\GCore\Libs\Upload::not_empty($file_post)){
			return false;
		}
		//check errors
		if(!isset($file_post['tmp_name']) OR !is_uploaded_file($file_post['tmp_name'])){
			if(!empty($file_post['error']) AND $file_post['error'] !== UPLOAD_ERR_OK){
				$form->debug[$action_id][self::$title][] = 'PHP returned this error for file upload by : '.$field_name.', PHP error is: '.$file_post['error'];
				$form->errors[$field_name] = $file_post['error'];
			}
			$this->events['fail'] = 1;
			return false;
		}else{
			$form->debug[$action_id][self::$title][] = 'Upload routine started for file upload by : '.$field_name;
		}
		if((bool)$this->config->get('safe_file_name', 1) === true){
			$file_name = \GCore\Libs\File::makeSafe($file_post['name']);
		}else{
			$file_name = utf8_decode($file_post['name']);
		}
		$real_file_name = $file_name;
		$file_tmp_name = $file_post['tmp_name'];
		$file_info = pathinfo($file_name);
		//mask the file name
		if(strlen($this->config->get('forced_file_name', '')) > 0){
			$file_name = str_replace('FILE_NAME', $file_name, $this->config->get('forced_file_name', ''));
		}else{
			$file_name = date('YmdHis').'_'.$file_name;
		}
		//check the file size
		if($file_tmp_name){
			//check max size
			if($file_post['error'] === UPLOAD_ERR_INI_SIZE){
				$form->debug[$action_id][self::$title][] = 'File : '.$field_name.' size is over the max PHP configured limit.';
				$form->errors[$field_name] = $this->config->get('max_error', 'Sorry, Your uploaded file size ('.($file_post["size"] / 1024).' KB) exceeds the allowed limit.');
				$this->events['fail'] = 1;
				return false;
			}elseif(($file_post["size"] / 1024) > (int)$this->config->get('max_size', 100)){
				$form->debug[$action_id][self::$title][] = 'File : '.$field_name.' size is over the max limit.';
				$form->errors[$field_name] = $this->config->get('max_error', 'Sorry, Your uploaded file size ('.($file_post["size"] / 1024).' KB) exceeds the allowed limit.');
				$this->events['fail'] = 1;
				return false;
			}elseif(($file_post["size"] / 1024) < (int)$this->config->get('min_size', 0)){
				$form->debug[$action_id][self::$title][] = 'File : '.$field_name.' size is less than the minimum limit.';
				$form->errors[$field_name] = $this->config->get('min_error', 'Sorry, Your uploaded file size ('.($file_post["size"] / 1024).' KB) is less than the minimum limit.');
				$this->events['fail'] = 1;
				return false;
			}elseif(!in_array(strtolower($file_info['extension']), $file_extensions)){
				$form->debug[$action_id][self::$title][] = 'File : '.$field_name.' extension is not allowed.';
				$form->errors[$field_name] = $this->config->get('type_error', 'Sorry, Your uploaded file type is not allowed.');
				$this->events['fail'] = 1;
				return false;
			}else{
				$uploaded_file = \GCore\Libs\Upload::save($file_tmp_name, $this->upload_path.$file_name);
				if($uploaded_file){
					$uploaded_file_data = array();
					$uploaded_file_data = array('name' => $file_name, 'original_name' => $real_file_name, 'path' => $this->upload_path.$file_name, 'size' => $file_post["size"]);
					//Try to generate an auto file link
					$site_link = \GCore\C::get('GCORE_FRONT_URL');
					if(substr($site_link, -1) == "/"){
						$site_link = substr_replace($site_link, '', -1);
					}
					$uploaded_file_data['link'] = str_replace(array(\GCore\C::get('GCORE_FRONT_PATH'), DS), array($site_link, "/"), $this->upload_path.$file_name);
					//$form->data[$field_name] = $file_name;
					$form->debug[$action_id][self::$title][] = $this->upload_path.$file_name.' has been uploaded successfully.';
					$this->events['success'] = 1;
					return $uploaded_file_data;
				}else{
					$form->debug[$action_id][self::$title][] = $this->upload_path.$file_name.' could not be uploaded!!';
					$this->events['fail'] = 1;
					return false;
				}
			}
		}
	}

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config file_upload_action_config', 'file_upload_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][enabled]', array('type' => 'dropdown', 'label' => l_('CF_ENABLED'), 'options' => array(0 => l_('NO'), 1 => l_('YES'))));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][files]', array('type' => 'textarea', 'label' => l_('CF_FILES_CONFIG'), 'rows' => 5, 'cols' => 60, 'sublabel' => l_('CF_FILES_CONFIG_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][upload_path]', array('type' => 'text', 'label' => l_('CF_UPLOAD_PATH'), 'class' => 'XL', 'sublabel' => l_('CF_UPLOAD_PATH_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][max_size]', array('type' => 'text', 'label' => l_('CF_MAX_FILE_SIZE'), 'sublabel' => l_('CF_MAX_FILE_SIZE_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][min_size]', array('type' => 'text', 'label' => l_('CF_MIN_FILE_SIZE'), 'sublabel' => l_('CF_MIN_FILE_SIZE_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][max_error]', array('type' => 'text', 'label' => l_('CF_MAX_SIZE_ERROR'), 'class' => 'XL', 'sublabel' => l_('CF_MAX_SIZE_ERROR_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][min_error]', array('type' => 'text', 'label' => l_('CF_MIN_SIZE_ERROR'), 'class' => 'XL', 'sublabel' => l_('CF_MIN_SIZE_ERROR_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][type_error]', array('type' => 'text', 'label' => l_('CF_FILE_TYPE_ERROR'), 'class' => 'XL', 'sublabel' => l_('CF_FILE_TYPE_ERROR_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][extensions_separator]', array('type' => 'text', 'label' => l_('CF_FILE_UPLOAD_EXT_SEPARATOR'), 'class' => 'S', 'sublabel' => l_('CF_FILE_UPLOAD_EXT_SEPARATOR_DESC')));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}