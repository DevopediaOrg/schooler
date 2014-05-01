<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Helpers;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class Toolbar extends \GCore\Libs\Helper{
	static $buttons = array();
	static $form_id = 'admin_form';
	static $title = '';
	static $button_group = 1;
	//static $template = '';
	/*
	public static function bs(){
		self::$template = 'bs';
	}
	*/
	public static function addButton($id, $link, $text = '', $image = '', $type = 'submit', $alert = ''){
		self::$buttons[$id] = array(
			'link' => $link,
			'text' => $text,
			'image' => $image,
			'type' => $type,
			'group' => self::getGroup(),
			'alert' => empty($alert) ? l_('SELECTION_REQUIRED') : $alert,
		);
	}
	
	public static function renderButton($id, $link, $text = '', $image = '', $type = 'submit', $alert = ''){
		?>
		<?php ob_start(); ?>
			jQuery(document).ready(function($) {
				<?php if(!empty($image)): ?>
					jQuery("#toolbar-button-<?php echo $id; ?>").css('background', 'url("<?php echo $image; ?>") no-repeat top center #F6F6F6');
				<?php endif; ?>
				jQuery("#toolbar-button-<?php echo $id; ?>").on('click',
					function(){
						<?php if($type == 'link'): ?>
							window.location.href = '<?php echo $link; ?>';
							return false;
						<?php elseif($type == 'submit'):; ?>
							jQuery('#<?php echo self::getFormID(); ?>').attr('action', '<?php echo $link; ?>');
							jQuery('#<?php echo self::getFormID(); ?>').submit();
						<?php elseif($type == 'submit_selectors'):; ?>
							if(jQuery('#<?php echo self::getFormID(); ?> input.gc_selector:checked').length > 0){
								jQuery('#<?php echo self::getFormID(); ?>').attr('action', '<?php echo $link; ?>');
								jQuery('#<?php echo self::getFormID(); ?>').submit();
							}else{
								alert("<?php echo $alert; ?>");
								return false;
							}
						<?php elseif($type == 'false'):; ?>
							return false;
						<?php else: ?>
							jQuery('#<?php echo self::getFormID(); ?>').attr('action', '<?php echo $link; ?>');
							<?php echo $type; ?>();
						<?php endif; ?>
					}
				);
			});
		<?php
			$buffer = ob_get_clean();
			self::loadFiles();
			$doc = \GCore\Libs\Document::getInstance();
			$doc->addJsCode($buffer);
			return '<button id="toolbar-button-'.$id.'" class="toolbar-button">'.$text.'</button>';
		?>
		<?php
	}
	
	public static function toolbar_renderBar($clearBuffer = true){
		$return = '';
		if(!empty(self::$buttons)){
			foreach(self::$buttons as $id => $button){
				$return .= self::renderButton($id, $button['link'], $button['text'], $button['image'], $button['type'], $button['alert']);
			}
			if($clearBuffer){
				self::$buttons = array();
			}
		}
		return $return;
	}
	
	public static function toolbar_renderTitle(){
		$title = self::getTitle();
		if(!empty($title)){
			return '<h1 class="page_title">'.$title.'</h1>';
		}
	}
	
	public static function loadFiles(){
		$doc = \GCore\Libs\Document::getInstance();
		$doc->_('jquery');
		$doc->addJsFile(\GCore\Helpers\Assets::js('toolbar', ''));
		$doc->addCssFile(\GCore\Helpers\Assets::css('toolbar', ''));
	}
	
	public static function getGroup(){
		return self::$button_group;
	}
	
	public static function setGroup($str = ''){
		self::$button_group = $str;
	}
	
	public static function getButtons(){
		return self::$buttons;
	}
	
	public static function getFormID(){
		return self::$form_id;
	}
	
	public static function getTitle(){
		return self::$title;
	}
	
	public static function setTitle($str = ''){
		self::$title = $str;
	}
	
	public static function setFormID($form_id = 'admin_form'){
		self::$form_id = $form_id;
	}
	
	public static function selectAll(){
		return '<input type="checkbox" name="select_all" value="" onClick="toggleSelectors(this.checked, \''.self::$form_id.'\');" />';
	}
	
	public static function selector($val = '{id}'){
		return '<input type="checkbox" name="gcb[]" value="'.$val.'" onClick="toggleRowActive(this, false);" id="gcb-'.$val.'" class="gc_selector" />';
	}
}