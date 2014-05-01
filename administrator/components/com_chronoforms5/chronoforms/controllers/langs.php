<?php
/**
* COMPONENT FILE HEADER
**/
namespace GCore\Admin\Extensions\Chronoforms\Controllers;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class Langs extends \GCore\Libs\GController {
	function index(){
		$path = \GCore\C::get('GCORE_ADMIN_PATH').'extensions'.DS.'chronoforms'.DS;
		$files = \GCore\Libs\Folder::getFiles($path, true);
		$strings = array();
		//function to prepare strings
		$prepare = function($str){
			/*$path = \GCore\C::get('GCORE_FRONT_PATH');
			if(strpos($str, $path) !== false AND strpos($str, $path) == 0){
				return '//'.str_replace($path, '', $str);
			}*/
			$val = !empty(\GCore\Libs\Lang::$translations[$str]) ? \GCore\Libs\Lang::$translations[$str] : '';
			return 'const '.trim($str).' = "'.str_replace("\n", '\n', $val).'";';
		};
		foreach($files as $file){
			if(substr($file, -4, 4) == '.php'){// AND strpos($file, DS.'extensions'.DS) === TRUE){
				//$strings[] = $file;
				$file_code = file_get_contents($file);
				preg_match_all('/l_\(("|\')([^(\))]*?)("|\')\)/i', $file_code, $langs);
				if(!empty($langs[2])){
					$strings = array_merge($strings, $langs[2]);
				}
			}
		}
		$strings = array_unique($strings);
		$strings = array_map($prepare, $strings);
		echo '<textarea rows="20" cols="80">'.implode("\n", $strings).'</textarea>';
	}
}
?>