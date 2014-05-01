<?php
/**
* COMPONENT FILE HEADER
**/
namespace GCore\Admin\Extensions\Chronoforms;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class Chronoforms extends \GCore\Libs\GController {
	var $models = array('\GCore\Admin\Extensions\Chronoforms\Models\Form');
	var $libs = array('\GCore\Libs\Request');
	var $helpers= array(
		'\GCore\Helpers\DataTable',
		'\GCore\Helpers\Assets',
		'\GCore\Helpers\Html',
		'\GCore\Admin\Extensions\Chronoforms\Helpers\DnaBuilder',
		'\GCore\Helpers\Toolbar',
		'\GCore\Helpers\Tasks',
		'\GCore\Helpers\Paginator',
		'\GCore\Helpers\Sorter'
	);

	function index(){
		$this->Form->order_by = 'Form.id';
		$this->_sortable();
		$this->_paginate();
		$forms = $this->Form->find('all');
		$this->set('forms', $forms);
		if($this->_validated() === false){
			$session = \GCore\Libs\Base::getSession();
			$domain = str_replace(array('http://', 'https://'), '', \GCore\Libs\Url::domain());
			$session->setFlash('error', "Your ChronoForms installation on <strong>".$domain."</strong> is NOT validated.");
		}
	}

	function toggle(){
		parent::_toggle();
		$this->redirect(r_('index.php?ext=chronoforms'));
	}

	//data reading
	function edit(){
		$id = $this->Request->data('id', null);
		$this->Form->id = $id;
		$form = $this->Form->load();
		if(!empty($form)){
			$this->data = $form;
			//$this->set('wizard_fields', $this->data['Form']['extras']['fields']);
		}
		//pr($this->data['Form']['extras']['DNA']);
		$this->set(array('form' => $form));
		//get fields types
		$fields_types = $fields_files = \GCore\Libs\Folder::getFiles(dirname(__FILE__).DS.'fields'.DS);
		$fields_types2 = $fields_files2 = array();
		foreach($fields_types as $k => $type){
			if(strpos($type, '.html') !== false OR strpos($type, 'multi.php') !== false){
				continue;
			}
			$fields_types2[$k] = str_replace(dirname(__FILE__).DS.'fields'.DS, '', $type);
			$fields_types2[$k] = str_replace('.php', '', $fields_types2[$k]);
			$fields_files2 = $fields_files[$k];
		}
		$this->set('fields_types', $fields_types2);
		$this->set('fields_files', $fields_files);

		$actions = \GCore\Libs\Folder::getFiles(dirname(__FILE__).DS.'actions'.DS);
		foreach($actions as $k => $action){
			$actions[$k] = str_replace(dirname(__FILE__).DS.'actions'.DS, '', $action);
		}
		$this->set('actions_list', $actions);

		if(empty($this->data['Form']['id']) AND !empty($this->data['setup'])){
			$this->data['Form']['extras']['DNA'] = array(
				'load' => array('js_8' => '', 'css_7' => '', 'load_captcha_6' => '', 'html_5' => ''),
				'submit' => array(
					'check_captcha_2' => array(
						'success' => array(),
						'fail' => array('event_loop_3' => '')
					),
					'file_upload_9' => array(
						'success' => array(),
						'fail' => array('event_loop_10' => '')
					),
					'handle_arrays_13' => '',
					'db_save_11' => '',
					'email_0' => '',
					'email_1' => '',
					'thanks_message_4' => '',
					'debugger_12' => '',
				)
			);
			$this->data['Form']['extras']['actions_config'][6]['fonts'] = 1;
			$this->data['Form']['extras']['actions_config'][2]['enabled'] = 0;
			$this->data['Form']['extras']['actions_config'][13]['enabled'] = 1;
		}
		parent::_settings('chronoforms');
		$this->set('chronoforms_settings', new \GCore\Libs\Parameter($this->data['Chronoforms']));
		
		if(!empty($this->data['Form']['extras']['fields'])){
			foreach($this->data['Form']['extras']['fields'] as $f_k => $f_info){
				if(strpos($f_k, '{N}') !== false){
					unset($this->data['Form']['extras']['fields'][$f_k]);
				}
			}
		}
	}
	
	static function extract_array_path($parsed = array(), &$path = array()){
		foreach($parsed as $k => $v){
			if(is_array($v)){
				$path[] = $k;
				self::extract_array_path($parsed[$k], $path);
			}else{
				$path[] = $k;
			}
		}
	}

	function save(){
		parent::_settings('chronoforms');
		$chronoforms_settings = new \GCore\Libs\Parameter($this->data['Chronoforms']);
		if($chronoforms_settings->get('wizard.safe_save', 1)){
			$s_form = array();
			//parse_str($this->data['serialized_form_data'], $s_form);
			$pairs = explode('&', $this->data['serialized_form_data']);
			$result = array();
			foreach($pairs as $pair){
				$dummy = array();
				parse_str($pair, $dummy);
				$path = array();
				self::extract_array_path($dummy, $path);
				$path = implode('.', $path);
				$new_path = explode('.', $path);
				$result = \GCore\Libs\Arr::setVal($result, $new_path, \GCore\Libs\Arr::getVal($dummy, $new_path));
			}
			$s_form = $result;
			$this->data = $s_form;
		}

		$result = parent::_save();
		if($result){
			if($this->Request->get('save_act') == 'apply'){
				$this->redirect(r_('index.php?ext=chronoforms&act=edit&id='.$this->Form->id));
			}else{
				$this->redirect(r_('index.php?ext=chronoforms'));
			}
		}else{
			$this->edit();
			$this->view = 'edit';
			$session = \GCore\Libs\Base::getSession();
			$session->setFlash('error', \GCore\Libs\Arr::flatten($this->Form->errors));
		}
	}

	function save_list(){
		parent::_save_list();
		$this->redirect(r_('index.php?ext=chronoforms'));
	}

	function delete(){
		parent::_delete();
		$this->redirect(r_('index.php?ext=chronoforms'));
	}

	function copy(){
		$session = \GCore\Libs\Base::getSession();
		if(empty($this->data['gcb'])){
			$session->setFlash('error', l_('CF_NO_FORMS_SELECTED'));
			$this->redirect(r_('index.php?ext=chronoforms'));
		}
		$forms = $this->Form->find('all', array('conditions' => array('id' => $this->data['gcb'])));
		if(!empty($forms)){
			foreach($forms as $form){
				if(isset($form['Form']['id'])){
					$form['Form']['id'] = null;
					//$form['Form']['published'] = 0;
					$this->Form->save($form);
				}
			}
		}
		$session->setFlash('success', l_('CF_FORMS_COPIED'));
		$this->redirect(r_('index.php?ext=chronoforms'));
	}

	function create_table(){
		if(!empty($this->data['columns'])){
			//save new table
			$rows = array();
			$pkey = '';
			foreach($this->data['columns'] as $k => $column){
				$pcs = array();
				if($column['enabled'] == 1 AND !empty($column['name']) AND !empty($column['type'])){
					$pcs[] = '`'.$column['name'].'`';
					$pcs[] = $column['type'].(!empty($column['length']) ? '('.$column['length'].')' : '');
					$pcs[] = !empty($column['null']) ? 'DEFAULT NULL' : 'NOT NULL';
					if(!empty($column['extra'])){
						$pcs[] = $column['extra'];
					}
					if(!empty($column['default']) AND empty($column['null'])){
						$pcs[] = "DEFAULT '".$column['default']."'";
					}
					$rows[] = implode(' ', $pcs);
					if(!empty($column['pkey'])){
						$pkey = $column['name'];
					}
				}
			}
			if(!empty($pkey)){
				$rows[] = 'PRIMARY KEY (`'.$pkey.'`)';
			}
			$rows = array('CREATE TABLE IF NOT EXISTS `'.$this->data['table_name'].'` (', implode(",\n", $rows));
			$rows[] = ') DEFAULT CHARSET=utf8;';
			$sql = implode("\n", $rows);
			//pr($sql);
			if($this->Form->dbo->exec($this->Form->dbo->_prefixTable($sql)) !== false){
				$session = \GCore\Libs\Base::getSession();
				$session->setFlash('success', 'The table has been created successfully.');
				$this->redirect(r_('index.php?ext=chronoforms'));
			}else{
				$session = \GCore\Libs\Base::getSession();
				$session->setFlash('error', 'Table creation failed.');
			}
		}else{
			if(empty($this->data['gcb'])){
				$session = \GCore\Libs\Base::getSession();
				$session->setFlash('error', l_('CF_NO_FORMS_SELECTED'));
				$this->redirect(r_('index.php?ext=chronoforms'));
			}
			$html = $this->Form->field('content', array('id' => $this->data['gcb'][0]));
			preg_match_all('/name=("|\')([^(>|"|\')]*?)("|\')/i', $html, $names);
			$names = !empty($names[2]) ? $names[2] : array();
			$names = array_unique($names);


			$form_name = $this->Form->field('title', array('id' => $this->data['gcb'][0]));
			$this->set('table_name', '#__chronoengine_chronoforms_datatable_'.$form_name);
			$basics = array(
				'id' => array('name' => 'id', 'enabled' => 1, 'type' => 'INT', 'length' => 11, 'pkey' => 1, 'default' => '', 'extra' => 'auto_increment', 'null' => 0),
				'uniq_id' => array('name' => 'uniq_id', 'enabled' => 1, 'type' => 'VARCHAR', 'length' => 50, 'pkey' => 0, 'default' => '', 'extra' => '', 'null' => 0),
				'user_id' => array('name' => 'user_id', 'enabled' => 1, 'type' => 'INT', 'length' => 11, 'pkey' => 0, 'default' => '', 'extra' => '', 'null' => 0),
				'created' => array('name' => 'created', 'enabled' => 1, 'type' => 'DATETIME', 'length' => '', 'pkey' => 0, 'default' => '0000-00-00 00:00:00', 'extra' => '', 'null' => 0),
				'modified' => array('name' => 'modified', 'enabled' => 1, 'type' => 'DATETIME', 'length' => '', 'pkey' => 0, 'default' => '', 'extra' => '', 'null' => 1),
			);

			$this->set('names', array_merge(array_keys($basics), $names));
			$this->data['columns'] = array_values($basics);
		}
	}

	function backup(){
		if(empty($this->data['gcb'])){
			$session = \GCore\Libs\Base::getSession();
			$session->setFlash('error', l_('CF_NO_FORMS_SELECTED'));
			$this->redirect(r_('index.php?ext=chronoforms'));
		}
		$forms = $this->Form->find('all', array('conditions' => array('id' => $this->data['gcb'])));
		$output = base64_encode(serialize($forms));

		//download the file
		if(ereg('Opera(/| )([0-9].[0-9]{1,2})', $_SERVER['HTTP_USER_AGENT'])){
			$UserBrowser = 'Opera';
		}elseif(ereg('MSIE ([0-9].[0-9]{1,2})', $_SERVER['HTTP_USER_AGENT'])){
			$UserBrowser = 'IE';
		}else{
			$UserBrowser = '';
		}
		$mime_type = ($UserBrowser == 'IE' || $UserBrowser == 'Opera') ? 'application/octetstream' : 'application/octet-stream';
		@ob_end_clean();
		ob_start();

		header('Content-Type: ' . $mime_type);
		header('Expires: ' . gmdate('D, d M Y H:i:s') . ' GMT');

		if ($UserBrowser == 'IE') {
			header('Content-Disposition: inline; filename="' . 'CFV5_FormsBackup_ON_'.\GCore\Libs\Url::domain().'_'.date('d_M_Y_H:i:s').'.cf5bak"');
			header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
			header('Pragma: public');
		}
		else {
			header('Content-Disposition: attachment; filename="' . 'CFV5_FormsBackup_ON_'.\GCore\Libs\Url::domain().'_'.date('d_M_Y_H:i:s').'.cf5bak"');
			header('Pragma: no-cache');
		}
		print $output;
		exit();
	}

	function restore(){
		$files = $_FILES;
		$v5 = 'cfbackup';
		if(is_array($files) AND !empty($files[$v5]['size'])){
			$session = \GCore\Libs\Base::getSession();

			if(!\GCore\Libs\Upload::valid($files[$v5])){
				$session->setFlash('error', l_('CF_FORMS_RESTORE_ERROR'));
				return false;
			}
			if(!\GCore\Libs\Upload::not_empty($files[$v5])){
				$session->setFlash('error', l_('CF_FORMS_RESTORE_ERROR'));
				return false;
			}
			if(!\GCore\Libs\Upload::check_type($files[$v5], array('cf5bak'))){
				$session->setFlash('error', l_('CF_FORMS_RESTORE_ERROR'));
				return false;
			}

			$path = \GCore\C::get('GCORE_FRONT_PATH').DS.'cache';
			$uploaded_file = \GCore\Libs\Upload::save($files[$v5]['tmp_name'], $path.DS.$files[$v5]['name']);

			if(!$uploaded_file){
				$session->setFlash('error', l_('CF_FORMS_RESTORE_ERROR'));
			}else{
				$data = file_get_contents($path.DS.$files[$v5]['name']);
				\GCore\Libs\File::delete($path.DS.$files[$v5]['name']);
				$forms = unserialize(base64_decode(trim($data)));
				if(!empty($forms)){
					foreach($forms as $form){
						if(isset($form['Form']['id'])){
							$form['Form']['id'] = null;
							$form['Form']['published'] = 0;
							$this->Form->save($form);
						}
					}
				}
				$session->setFlash('success', l_('CF_FORMS_RESTORED'));
				$this->redirect(r_('index.php?ext=chronoforms'));
			}
		}

		$v4 = 'cfbackupv4';
		if(is_array($files) AND !empty($files[$v4]['size'])){
			$session = \GCore\Libs\Base::getSession();

			if(!\GCore\Libs\Upload::valid($files[$v4])){
				$session->setFlash('error', l_('CF_FORMS_RESTORE_ERROR'));
				return false;
			}
			if(!\GCore\Libs\Upload::not_empty($files[$v4])){
				$session->setFlash('error', l_('CF_FORMS_RESTORE_ERROR'));
				return false;
			}
			if(!\GCore\Libs\Upload::check_type($files[$v4], array('cf4bak'))){
				$session->setFlash('error', l_('CF_FORMS_RESTORE_ERROR'));
				return false;
			}

			$path = \GCore\C::get('GCORE_FRONT_PATH').DS.'cache';
			$uploaded_file = \GCore\Libs\Upload::save($files[$v4]['tmp_name'], $path.DS.$files[$v4]['name']);

			if(!$uploaded_file){
				$session->setFlash('error', l_('CF_FORMS_RESTORE_ERROR'));
			}else{
				$data = file_get_contents($path.DS.$files[$v4]['name']);
				$data = self::_load_v4_form($data);
				\GCore\Libs\File::delete($path.DS.$files[$v4]['name']);
				//pr($data);die();
				//$forms = $data;
				if(!empty($data)){
					foreach($data as $group){
						$form = array();
						$form['Form']['id'] = null;
						$form['Form']['published'] = 1;
						$form['Form']['extras']['actions_config'] = array();
						$form['Form']['title'] = $group['title'];
						$form['Form']['extras']['fields'] = $group['fields'];
						$this->Form->save($form);
					}
				}
				$session->setFlash('success', l_('CF_FORMS_RESTORED'));
				$this->redirect(r_('index.php?ext=chronoforms'));
			}
		}
	}

	public static function _load_v4_form($data){
		$data = trim($data);
		$forms_data = explode("\n", $data);
		$return_forms = array();
		if(!empty($data) AND !empty($forms_data)){
			//loop through each form backup line
			foreach($forms_data as $form_data){
				$form_data = str_replace(array('<__FORM_START__>', '<__FORM_END__>'), '', $form_data);
				//get form row data
				$form_row_data = explode('<__FORM_ROW_END__>', $form_data);
				//get actions data string with tags
				$form_actions_data = $form_row_data[1];
				//get form pure row code
				$form_row_data = str_replace('<__FORM_ROW_START__>', '', $form_row_data[0]);
				//decrypt the code and save it
				$form_row_data = unserialize(base64_decode($form_row_data));
				eval('?>'.'<?php $fields = '.$form_row_data['wizardcode'].'; ?>');
				//$fields = $form_row_data['wizardcode'];
				$form_fields = array();

				$count = 1;
				if(is_array($fields)){
					foreach($fields as $fid => $field){
						$field_params = array();
						$id = str_replace('field_', '', $fid);
						$omit1 = $field['tag'].'_'.$field['type'].'_'.$id.'_'.$field['tag'].'_';
						$omit2 = $field['tag'].'_'.$field['type'].'_'.$id.'_';
						foreach($field as $k => $v){
							if(strpos($k, $omit1) !== false){
								$field_params[str_replace($omit1, '', $k)] = $v;
								continue;
							}
							if(strpos($k, $omit2) !== false){
								$field_params[str_replace($omit2, '', $k)] = $v;
								continue;
							}
							$field_params[$k] = $v;
						}
						$field_params['label']['text'] = isset($field_params['label_text']) ? $field_params['label_text'] : '';
						$field_params['label']['position'] = !empty($field_params['label_over']) ? 'top' : 'left';
						$field_params['sublabel'] = !empty($field_params['instructions']) ? $field_params['instructions'] : '';
						$field_params['id'] = !empty($field_params['id']) ? $field_params['id'] : $field_params['type'].$count;
						if($field['type'] == 'container'){
							$field_params['label'] = $field_params['label']['text'];
						}
						if(!empty($field_params['validations'])){
							$validations = explode(',', $field_params['validations']);
							foreach($validations as $validation){
								$field_params['validation'][$validation] = 1;
							}
						}
						$form_fields[$count] = $field_params;
						$count++;
					}
				}
				$return_forms[] = array('fields' => $form_fields, 'title' => $form_row_data['name']);
			}
		}
		return $return_forms;
	}
	
	function install_action(){
		if(isset($_FILES['upload'])){
			$upload = $_FILES['upload'];
			if(\GCore\Libs\Upload::valid($upload) AND \GCore\Libs\Upload::not_empty($upload) AND \GCore\Libs\Upload::check_type($upload, 'zip')){
				$target = \GCore\C::get('GCORE_FRONT_PATH').'cache'.DS.rand().$upload['name'];
				$result = \GCore\Libs\Upload::save($upload['tmp_name'], $target);
				if(empty($result)){
					$this->Session->setFlash('error', l_('CF_ACTION_UPLOAD_ERROR'));
					$this->redirect(r_('index.php?ext=chronoforms&act=install_action'));
				}
				//file upload, let's extract it
				$zip = new \ZipArchive();
				$handler = $zip->open($target);
				if($handler === true){
					$extract_path = \GCore\C::ext_path('chronoforms', 'admin').'actions'.DS;
					$zip->extractTo($extract_path);
					$zip->close();
					unlink($target);
					
					$session->setFlash('success', l_('CF_ACTION_INSTALL_SUCCESS'));
					$this->redirect(r_('index.php?ext=chronoforms'));
				}else{
					$this->Session->setFlash('error', l_('CF_ACTION_EXTRACT_ERROR'));
					$this->redirect(r_('index.php?ext=chronoforms&act=install_action'));
				}
			}else{
				$this->Session->setFlash('error', l_('CF_ACTION_FILE_ERROR'));
				$this->redirect(r_('index.php?ext=chronoforms&act=install_action'));
			}
		}
	}

	function demos(){
		$session = \GCore\Libs\Base::getSession();
		$demos_file = \GCore\C::ext_path('chronoforms', 'admin').DS.'demos'.DS.'demos.cf5bak';

		if(!$demos_file){
			$session->setFlash('error', l_('CF_FORMS_RESTORE_ERROR'));
		}else{
			$data = file_get_contents($demos_file);
			//\GCore\Libs\File::delete($path.DS.$files['cfbackup']['name']);
			$forms = unserialize(base64_decode(trim($data)));
			if(!empty($forms)){
				foreach($forms as $form){
					if(isset($form['Form']['id'])){
						$form['Form']['id'] = null;
						//$form['Form']['published'] = 0;
						$this->Form->save($form);
					}
				}
			}
			$session->setFlash('success', l_('CF_FORMS_RESTORED'));
			$this->redirect(r_('index.php?ext=chronoforms'));
		}
	}

	function delete_cache(){
		$path = \GCore\C::get('GCORE_FRONT_PATH').'cache'.DS;
		$files = \GCore\Libs\Folder::getFiles($path);
		$count = 0;
		foreach($files as $k => $file){
			if(basename($file) != 'index.html' AND basename($file) != 'demos.cf5bak'){
				$result = \GCore\Libs\File::delete($file);
				if($result){
					$count++;
				}
			}
		}
		$session = \GCore\Libs\Base::getSession();
		$session->setFlash('info', $count.' '.l_('CACHE_FILES_DELETED'));
		$this->redirect(r_('index.php?ext=chronoforms'));
	}

	function list_data(){
		if(empty($this->data['table'])){
			$session = \GCore\Libs\Base::getSession();
			$session->setFlash('error', l_('CF_NO_TABLES_SELECTED'));
			$this->redirect(r_('index.php?ext=chronoforms'));
		}
		$id = $this->Request->data('form_id', null);
		$this->Form->id = $id;
		$form = $this->Form->load();
		
		\GCore\Libs\Model::generateModel('ListData', array('tablename' => $this->data['table']));
		$list_model = '\GCore\Models\ListData';

		$this->sort_model = $list_model::getInstance();
		$this->_sortable();
		$this->paginate_model = $list_model::getInstance();
		$this->_paginate();
		$rows = $list_model::getInstance()->find('all');
		$this->set('rows', $rows);
		$this->set('form', $form);
	}

	function show_data(){
		if(empty($this->data['table'])){
			$session = \GCore\Libs\Base::getSession();
			$session->setFlash('error', l_('CF_NO_TABLES_SELECTED'));
			$this->redirect(r_('index.php?ext=chronoforms'));
		}
		\GCore\Libs\Model::generateModel('ListData', array('tablename' => $this->data['table']));
		$list_model = '\GCore\Models\ListData';

		$fields = $list_model::getInstance()->dbo->getTableColumns($this->data['table']);
		$this->set('fields', $fields);

		$id = $this->Request->data('id', null);
		$list_model::getInstance()->id = $id;
		$row = $list_model::getInstance()->load();
		$this->set('row', $row);
	}

	function delete_data(){
		if(empty($this->data['table'])){
			$session = \GCore\Libs\Base::getSession();
			$session->setFlash('error', l_('CF_NO_TABLES_SELECTED'));
			$this->redirect(r_('index.php?ext=chronoforms'));
		}
		\GCore\Libs\Model::generateModel('ListData', array('tablename' => $this->data['table']));
		$list_model = '\GCore\Models\ListData';
		$this->delete_model = $list_model::getInstance();
		parent::_delete();
		$this->redirect(r_('index.php?ext=chronoforms&act=list_data&table='.$this->data['table']));
	}

	function backup_data(){
		if(empty($this->data['table'])){
			$session = \GCore\Libs\Base::getSession();
			$session->setFlash('error', l_('CF_NO_TABLES_SELECTED'));
			$this->redirect(r_('index.php?ext=chronoforms'));
		}

		$form = new \stdClass();
		$form->actions_config[0] = array('tablename' => $this->data['table'], 'enabled' => 1);
		$exporter = new \GCore\Admin\Extensions\Chronoforms\Actions\CsvExport\CsvExport();
		$exporter->execute($form, 0);
	}

	function page_settings(){

	}

	function render_field(){
		if(!empty($this->data['Form']['extras']['fields'])){
			$config = array_values($this->data['Form']['extras']['fields']);
			//$multi_field = isset($this->data['multi_field']) ? 1 : 0;
			//$this->set('multi_field', $multi_field);
			$this->set('fdata', $config[0]);
		}
	}

	function render_multi_field(){
		$this->set('fields', $this->data['fields']);
		$this->set('fields_count', $this->data['fields_count']);
	}
	
	function render_field_config(){
		if(!empty($this->data['form_id']) AND !empty($this->data['field_id'])){
			$k = $this->data['field_id'];
			$this->Form->id = $this->data['form_id'];
			$this->data = $this->Form->load();
			$wizard_field = $this->data['Form']['extras']['fields'][$k];
			$type = isset($wizard_field['render_type']) ? $wizard_field['render_type'] : $wizard_field['type'];
			$class = '\GCore\Admin\Extensions\Chronoforms\Fields\\'.\GCore\Libs\Str::camilize($type).'\\'.\GCore\Libs\Str::camilize($type);
			ob_start();
			$class::config($wizard_field, $k);
			$element_config = ob_get_clean();
			$contents = str_replace('{N}', $k, $element_config);
			$contents =  \GCore\Libs\Str::replacer($contents, \GCore\Libs\Request::raw(), array('escape' => true));
			$contents = \GCore\Helpers\DataLoader::load($contents, \GCore\Libs\Request::raw());
			echo $contents;
		}
	}

	function _validated(){
		parent::_settings('chronoforms');
		if(isset($this->data['Chronoforms']['validated']) AND (int)$this->data['Chronoforms']['validated'] == 1){
			return true;
		}
		return false;
	}

	function settings(){
		parent::_settings('chronoforms');
	}

	function save_settings(){
		$result = parent::_save_settings('chronoforms');
		$session = \GCore\Libs\Base::getSession();
		if($result){
			$session->setFlash('success', l_('SAVE_SUCCESS'));
		}else{
			$session->setFlash('error', l_('SAVE_ERROR'));
		}
		$this->redirect(r_('index.php?ext=chronoforms&act=settings'));
	}

	function validateinstall(){
		$domain = str_replace(array('http://', 'https://'), '', \GCore\Libs\Url::domain());
		$this->set('domain', $domain);
		if(!empty($this->data['license_key'])){
			$session = \GCore\Libs\Base::getSession();
			$fields = '';
			
			$update_fld = 'validated';
			if($this->data['pid'] == 18){
				$update_fld = 'validated_paypal';
			}
			if($this->data['pid'] == 7){
				$update_fld = 'validated_authorize';
			}
			//$postfields = array();
			unset($this->data['option']);
			unset($this->data['act']);
			foreach($this->data as $key => $value){
				$fields .= "$key=".urlencode($value)."&";
			}

			$target_url = 'http://www.chronoengine.com/index.php?option=com_chronocontact&task=extra&chronoformname=validateLicense';
			$output = '-';
			if(ini_get('allow_url_fopen')){
				$output = file_get_contents($target_url.'&'.rtrim($fields, "& "));
			}else if(function_exists('curl_version')){
				$ch = curl_init();
				curl_setopt($ch, CURLOPT_URL, $target_url);
				curl_setopt($ch, CURLOPT_HEADER, 0);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
				curl_setopt($ch, CURLOPT_TIMEOUT, 10);
				curl_setopt($ch, CURLOPT_POSTFIELDS, rtrim($fields, "& "));
				$output = curl_exec($ch);
				curl_close($ch);
			}
			if($output == '-'){
				$session->setFlash('error', 'Validation error, Could not connect to the remote server, your host does not have neither the CURL nor the allow_url_fopen.');
				$this->redirect(r_('index.php?ext=chronoforms'));
			}
			$validstatus = $output;

			if($validstatus == 'valid'){
				parent::_settings('chronoforms');
				$this->data['Chronoforms'][$update_fld] = 1;
				$result = parent::_save_settings('chronoforms');
				if($result){
					$session->setFlash('success', 'Validated successflly.');
					$this->redirect(r_('index.php?ext=chronoforms'));
				}else{
					$session->setFlash('error', 'Validation error.');
				}
			}else if($validstatus == 'invalid'){
				parent::_settings('chronoforms');
				$this->data['Chronoforms'][$update_fld] = 0;
				$result = parent::_save_settings('chronoforms');
				$session->setFlash('error', 'Validation error, you have provided incorrect data.');
				$this->redirect(r_('index.php?ext=chronoforms'));
			}else{
				if(!empty($this->data['instantcode'])){
					$step1 = base64_decode(trim($this->data['instantcode']));
					$step2 = str_replace(substr(md5(str_replace('www.', '', strtolower($matches[2]))), 0, 7), '', $step1);
					$step3 = str_replace(substr(md5(str_replace('www.', '', strtolower($matches[2]))), - strlen(md5(str_replace('www.', '', strtolower($matches[2])))) + 7), '', $step2);
					$step4 = str_replace(substr($this->data['license_key'], 0, 10), '', $step3);
					$step5 = str_replace(substr($this->data['license_key'], - strlen($this->data['license_key']) + 10), '', $step4);
					//echo (int)$step5;return;
					//if((((int)$step5 + (24 * 60 * 60)) > strtotime(date('d-m-Y H:i:s')))||(((int)$step5 - (24 * 60 * 60)) < strtotime(date('d-m-Y H:i:s')))){
					if(((int)$step5 < (strtotime("now") + (24 * 60 * 60))) AND ((int)$step5 > (strtotime("now") - (24 * 60 * 60)))){
						parent::_settings('chronoforms');
						$this->data['Chronoforms'][$update_fld] = 1;
						$result = parent::_save_settings('chronoforms');
						if($result){
							$session->setFlash('success', 'Validated successflly.');
							$this->redirect(r_('index.php?ext=chronoforms'));
						}else{
							$session->setFlash('error', 'Validation error.');
						}
					}else{
						$session->setFlash('error', 'Validation error, Invalid instant code provided.');
						$this->redirect(r_('index.php?ext=chronoforms'));
					}
				}else{
					$session->setFlash('error', 'Validation error, please try again using the Instant Code, or please contact us on www.chronoengine.com');
					$this->redirect(r_('index.php?ext=chronoforms'));
				}
			}
		}
	}
}
?>