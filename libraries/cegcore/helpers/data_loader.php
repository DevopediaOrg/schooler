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
class DataLoader {
	static $used_names = array();
	static $allnames = array();
		
	public static function load($html, $data = array(), $skipped = array()){
		if(!empty($html)){
			//get all fields names			
			preg_match_all('/name=("|\')([^(>|"|\')]*?)("|\')/i', $html, $names);
			self::$allnames = $names[2];
			if(empty(self::$allnames)){
				goto end;
			}
			self::_text($html, $data, $skipped);
			self::_checks($html, $data, $skipped);
			self::_textarea($html, $data, $skipped);
			self::_select($html, $data, $skipped);
		}
		end: self::_reset();
		return $html;
	}
	
	private static function _reset(){
		self::$used_names = array();
	}
	
	private static function _text(&$html, $data, $skipped){
		$pattern = '/<input([^>]*?)type=("|\')(text|password|hidden|color|date|datetime|datetime-local|email|month|number|range|search|tel|time|url|week)("|\')([^>]*?)>/is';
		preg_match_all($pattern, $html, $matches);
		
		if(!empty($matches)){
			foreach($matches[0] as $field){
				$ghost_pat = '/alt=("|\')ghost("|\')/i';
				preg_match($ghost_pat, $field, $ghost_attr);
				if(!empty($ghost_attr[0])){
					continue;
				}
				
				$v_pat = '/ value=("|\')(.*?)(\1)/i';
				$n_pat = '/ name=("|\')(.*?)("|\')/i';
				preg_match($n_pat, $field, $name_attr);
				if(!empty($name_attr[2])){
					$name = self::_dotname($name_attr[2]);
					$value = \GCore\Libs\Arr::getVal($data, explode('.', $name));
					
					if(!in_array($name, $skipped) AND !is_null($value) AND !is_array($value)){
						$field_with_no_val = preg_replace($v_pat, '', $field);
						$value = htmlspecialchars(self::_escape_regex($value), ENT_QUOTES); //escape any special (") or regex chars ($)
						$updated_field = preg_replace($n_pat, ' name="${2}" value="'.$value.'"', $field_with_no_val);
						$pos = strpos($html, $field);
						$html = substr_replace($html, $updated_field, $pos, strlen($field));
					}
				}
			}
		}
	}
	
	private static function _checks(&$html, $data, $skipped){
		//checkboxes or radios fields
		$pattern = '/<input([^>]*?)type=("|\')(checkbox|radio)("|\')([^>]*?)>/is';
		preg_match_all($pattern, $html, $matches);
		
		if(!empty($matches)){
			foreach($matches[0] as $field){
				$ghost_pat = '/alt=("|\')ghost("|\')/i';
				preg_match($ghost_pat, $field, $ghost_attr);
				if(!empty($ghost_attr[0])){
					continue;
				}
				$v_pat = '/ value=("|\')(.*?)(\1)/i';
				$n_pat = '/ name=("|\')(.*?)("|\')/i';
				$chk_pat = '/checked=("|\')checked("|\')/i';
				preg_match($n_pat, $field, $name_attr);
				preg_match($v_pat, $field, $value_attr);
				
				//$_data_pat = '/_data=("|\')(.*?)("|\')/i';
				//preg_match($_data_pat, $field, $_data_attr);
				if(empty($name_attr[2])){
					continue;
				}
				$name = self::_dotname($name_attr[2], false, true);
				$value = \GCore\Libs\Arr::getVal($data, explode('.', $name), '__NOT_SET__');
				/*if(array_key_exists(2, $_data_attr)){
					$value = \GCore\Libs\Arr::getVal($data, explode('.', $_data_attr[2]), '__NOT_SET__');
				}*/
				
				if(!in_array($name, $skipped) AND $value != '__NOT_SET__'){
					$updated_field = $field;
					//multi values
					if(is_array($value)){
						if(isset($value_attr[2]) AND in_array($value_attr[2], $value)){
							$updated_field = preg_replace($n_pat, ' name="${2}" checked="checked"', $field);
						}else{
							//remove any default value set in the html code
							$updated_field = preg_replace($chk_pat, '', $field);
						}
					//single values
					}else{
						if(isset($value_attr[2]) AND $value_attr[2] == $value){
							$updated_field = preg_replace($n_pat, ' name="${2}" checked="checked"', $field);
						}else{
							//remove any default value set in the html code
							$updated_field = preg_replace($chk_pat, '', $field);
						}
						//single checkbox with no value attaribute, accepted value should be "on"
						if(!isset($value_attr[2]) AND $value == "on"){
							$updated_field = preg_replace($n_pat, ' name="${2}" checked="checked"', $field);
						}
					}
					/*if(array_key_exists(0, $_data_attr)){
						$updated_field = str_replace($_data_attr[0], '', $updated_field);
					}*/
					$html = str_replace($field, $updated_field, $html);
				}
			}
		}
	}
	
	private static function _textarea(&$html, $data, $skipped){
		//textarea fields
		$pattern = '/<textarea([^>]*?)>(.*?)<\/textarea>/is';
		preg_match_all($pattern, $html, $matches);
		$updated_field = '';
		
		if(!empty($matches)){
			foreach($matches[0] as $field){
				$ghost_pat = '/alt=("|\')ghost("|\')/i';
				preg_match($ghost_pat, $field, $ghost_attr);
				if(!empty($ghost_attr[0])){
					continue;
				}
				$v_pat = '/ value=("|\')(.*?)("|\')/i';
				$n_pat = '/ name=("|\')(.*?)("|\')/i';
				preg_match($n_pat, $field, $name_attr);
				
				$name = self::_dotname($name_attr[2]);
				$value = \GCore\Libs\Arr::getVal($data, explode('.', $name));
				
				if(!in_array($name, $skipped) AND !is_null($value)){
					$ta_pat = '/(<textarea(.*?)>)(.*?)(<\/textarea>)/is';
					$value = htmlspecialchars(self::_escape_regex($value), ENT_QUOTES); //escape any special (") or regex chars ($)
					
					$updated_field = preg_replace($ta_pat, '${1}'.$value.'${4}', $field);
					$html = str_replace($field, $updated_field, $html);
				}
			}
		}
	}
	
	private static function _select(&$html, $data, $skipped){
		//select boxes
		$pattern = '/<select(.*?)select>/is';
		preg_match_all($pattern, $html, $matches);

		if(!empty($matches)){
			foreach($matches[0] as $field){
				$ghost_pat = '/alt=("|\')ghost("|\')/i';
				preg_match($ghost_pat, $field, $ghost_attr);
				if(!empty($ghost_attr[0])){
					continue;
				}
				$updated_field = $field;
				$sel_pat = '/<select([^>]*?)>/is';
				preg_match_all($sel_pat, $field, $sel_matches);
				$extracted_options = preg_replace(array('/'.preg_quote($sel_matches[0][0]).'/is', '/<\/select>/i'), array('', ''), $field);

				$n_pat = '/ name=("|\')(.*?)("|\')/i';
				$v_pat = '/ value=("|\')(.*?)(\1)/i';
				$opt_pat = '/<option(.*?)<\/option>/is';
				$slct_pat = '/selected=("|\')selected("|\')/i';
				preg_match($n_pat, $sel_matches[0][0], $name_attr);
				$name = self::_dotname($name_attr[2], true);
				$value = \GCore\Libs\Arr::getVal($data, explode('.', $name));
				
				if(!in_array($name, $skipped) AND !is_null($value)){
					preg_match_all($opt_pat, $extracted_options, $matched_options);
					foreach($matched_options[0] as $matched_option){
						preg_match($v_pat, $matched_option, $matched_option_value);
						$updated_option = $matched_option;
						if(isset($matched_option_value[2]) AND (in_array($matched_option_value[2], (array)$value) OR in_array(htmlspecialchars_decode($matched_option_value[2], ENT_QUOTES), (array)$value))){
							$updated_option = preg_replace('/<option/i', '<option selected="selected"', $matched_option);
						}elseif(isset($matched_option_value[2]) AND !in_array($matched_option_value[2], (array)$value) AND !in_array(htmlspecialchars_decode($matched_option_value[2], ENT_QUOTES), (array)$value)){
							//remove any preset selected
							$updated_option = preg_replace($slct_pat, '', $matched_option);
						}else{
							//option value doesn't match posted value, do nothing
							//$updated_option = preg_replace('/<option(.*?)>/is', '<option value="'.$matched_option_value[2].'">', $matched_option);
						}
						$updated_field = str_replace($matched_option, $updated_option, $updated_field);
					}
					//$html = str_replace($field, $updated_field, $html);
					$pos = strpos($html, $field);
					$html = substr_replace($html, $updated_field, $pos, strlen($field));
				}
			}
		}
	}
	
	private static function _escape_regex($value){
		return str_replace(array('\\', '$'), array('\\\\', '\$'), $value);
	}
	
	private static function _dotname($name, $set_index = true, $multi = false){
		/*if(in_array($name, self::$used_names)){
			$new_name = str_replace('[]', '['.count(array_keys(self::$used_names, $name)).']', $name);
		}else{
			$new_name = str_replace('[]', '[0]', $name);
		}*/
		//check if the array field is present more than 1 time, if its then replace unindexed names (any field including chekcboxes), if its 1 time only then skip and load array (multi select)
		if($set_index AND count(array_keys(self::$allnames, $name)) > 1){
			if(in_array($name, self::$used_names)){
				$new_name = str_replace('[]', '['.count(array_keys(self::$used_names, $name)).']', $name);
			}else{
				$new_name = str_replace('[]', '[0]', $name);
			}
		}elseif($multi){
			$new_name = str_replace('[]', '[n]', $name);
		}else{
			$new_name = str_replace('[]', '', $name);
		}
		self::$used_names[] = $name;
		$chunks = array();
		$paths = explode('[', $new_name);
		foreach($paths as $k => $path){
			if($paths[$k] === 'n]'){
				$paths[$k] = '[n]';
				continue;
			}
			$paths[$k] = trim($path, "] ");
			if($paths[$k] === ""){
				unset($paths[$k]);
			}
		}
		//array_walk($paths, create_function('&$val', '$val = trim($val, "] ");'));
		//array_walk($paths, create_function('&$val', 'if($val == "n"){$val = "[n]";}'));
		return implode(".", $paths);
	}
}
?>