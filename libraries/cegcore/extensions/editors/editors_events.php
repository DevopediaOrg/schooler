<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Extensions\Editors;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class EditorsEvents {
	static $settings;
	
	public static function on_editor_load(){
		self::$settings = \GCore\Libs\Base::getSettings('editors');
		if(self::$settings->get('active_editor', 'tinymce') == 'tinymce'){
			$doc = \GCore\Libs\Document::getInstance();
			//$doc->_('jquery');
			$doc->addJsFile(\GCore\C::get('GCORE_FRONT_URL').'extensions/editors/assets/tinymce/tinymce.min.js');
			return true;
		}else if(self::$settings->get('active_editor', 'tinymce') == 'ckeditor'){
			$doc = \GCore\Libs\Document::getInstance();
			$doc->_('jquery');
			$doc->addJsFile(\GCore\C::get('GCORE_FRONT_URL').'extensions/editors/assets/ckeditor/ckeditor.js');
			return true;
		}else if(self::$settings->get('active_editor', 'tinymce') == 'sceditor'){
			$doc = \GCore\Libs\Document::getInstance();
			$doc->_('jquery');
			$doc->addCssFile(\GCore\C::get('GCORE_FRONT_URL').'extensions/editors/assets/sceditor/themes/default.min.css');
			$doc->addCssFile(\GCore\C::get('GCORE_FRONT_URL').'extensions/editors/assets/sceditor/jquery.sceditor.default.min.css');
			$doc->addJsFile(\GCore\C::get('GCORE_FRONT_URL').'extensions/editors/assets/sceditor/jquery.sceditor.bbcode.min.js');
			return true;
		}
	}
	
	public static function on_editor_enable($id, $params = array()){
		if(self::$settings->get('active_editor', 'tinymce') == 'tinymce'){
			$doc = \GCore\Libs\Document::getInstance();
			//$params = array_merge(array('script_url' => \GCore\C::get('GCORE_FRONT_URL').'extensions/editors/assets/tinymce/tinymce.js'), $params);
			//$doc->addJsCode('jQuery(document).ready(function($){$("'.$id.'").tinymce('.stripslashes(json_encode($params)).');});');
			$params = array_merge(array('selector' => $id), $params);
			$doc->addJsCode('jQuery(document).ready(function($){ tinymce.init('.stripslashes(json_encode($params)).'); });');
			return true;
		}else if(self::$settings->get('active_editor', 'tinymce') == 'ckeditor'){
			$doc = \GCore\Libs\Document::getInstance();
			$doc->addJsCode('jQuery(document).ready(function($){CKEDITOR.replace("'.str_replace('#', '', $id).'", '.stripslashes(json_encode($params)).');});');
			return true;
		}else if(self::$settings->get('active_editor', 'tinymce') == 'sceditor'){
			$doc = \GCore\Libs\Document::getInstance();
			$doc->addJsCode('jQuery(document).ready(
				function($){
					$("'.$id.'").sceditor({
						plugins: "bbcode",
						emoticonsRoot: "'.\GCore\C::get('GCORE_FRONT_URL').'extensions/editors/assets/sceditor/",
						style: "'.\GCore\C::get('GCORE_FRONT_URL').'extensions/editors/assets/sceditor/jquery.sceditor.default.min.css"
					});
				}
			);');
			return true;
		}
	}
}
?>