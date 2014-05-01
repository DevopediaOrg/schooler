<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Editors;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class Editors extends \GCore\Libs\GController {
	var $libs = array('\GCore\Libs\Session');
	var $helpers= array(
		'\GCore\Helpers\DataTable', 
		'\GCore\Helpers\Assets', 
		'\GCore\Helpers\Html', 
		'\GCore\Helpers\Toolbar', 
		'\GCore\Helpers\Paginator', 
		'\GCore\Helpers\Sorter'
	);
	
	function index(){
		$this->view = 'settings';
		$this->settings();
	}
	
	function settings(){
		parent::_settings('editors');
	}
	
	function save_settings(){
		$result = parent::_save_settings('editors');
		if($result){
			$this->Session->setFlash('success', l_('SAVE_SUCCESS'));
		}else{
			$this->Session->setFlash('error', l_('SAVE_ERROR'));
		}
		$this->redirect('index.php?ext=editors&act=settings');
	}
}
?>