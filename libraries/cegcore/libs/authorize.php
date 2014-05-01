<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Libs;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class Authorize {
	static $lookups = array();
	
	function __construct(){
		
	}
	
	public static function authorized($path, $action = 'access', $owner_id = null, $user_id = null){
		$user = Base::getUser();
		//owner admin access
		if((int)$user['id'] === 1){
			return true;
		}
		//login/logout can be always accessed
		if(($path == '\GCore\Admin\Controllers\Users' OR $path == '\GCore\Controllers\Users') AND ($action == 'login' OR $action == 'logout')){
			return true;
		}
		
		$groups = Authenticate::get_user_groups($user_id);
		if(!empty($owner_id) AND $owner_id == $user['id']){
			$groups[] = 'owner';
		}
		$return = false;
		//build search branches based on current loaded class
		if(is_array($path)){
			$tests = $path;
		}else{
			$branches = explode("\\", $path);
			$tests = array();
			for($i = 0; $i = count($branches) - 1; $i++){
				$tests[] = implode("\\", $branches);
				array_pop($branches);
			}
		}
		//check cache
		$cache = (bool)Base::getConfig('cache_permissions');
		if($cache === true){
			$session = Base::getSession();
			$cached_permissions = $session->get('acos_permissions', array());
			if(in_array('owner', $groups)){
				$cache_key = md5(serialize($tests).$action.$owner_id);
			}else{
				$cache_key = md5(serialize($tests).$action);
			}
			if(array_key_exists($cache_key, $cached_permissions)){
				$return = $cached_permissions[$cache_key];
				goto end;
			}
		}
		
		$paths_key = md5(serialize($tests));
		if(!isset(self::$lookups[$paths_key])){
			$Acl_model = new \GCore\Admin\Models\Acl();
			$acls = $Acl_model->find('all', array(
				'conditions' => array('aco' => $tests, 'enabled' => 1),
				'order' => array('aco DESC')
			));
			self::$lookups[$paths_key] = $acls;
		}else{
			$acls = self::$lookups[$paths_key];
		}
		
		
		if(empty($acls)){
			//no ACL results found matching this ACO
			$return = false;
			goto end;
		}
		foreach($acls as $k => $acl){
			$p_action = $action;
			if(!empty($acl['Acl']['rules'][$p_action])){
				//main action rules found, goto permissions check
			}elseif(!empty($acl['Acl']['rules']['access'])){
				//main action not found, but access action found, let's use it
				$p_action = 'access';
			}else{
				//neither the main action nor the default one found under this path, or maybe no permissions set, go to the next one.
				continue;
			}
			//check groups action's rules
			$result = self::check_rules($acl['Acl']['rules'][$p_action], $groups);
			if(!is_null($result)){
				$return = $result;
				goto end;
			}
			//looks like all permissions in this path are not set or inheriting, go to next path
			continue;			
		}
		//we looped all pathes with no matches, return denied
		$return = false;
		end:
		//store into cache
		if($cache === true){
			$session = Base::getSession();
			$cached_permissions = $session->get('acos_permissions', array());
			if(in_array('owner', $groups)){
				$cache_key = md5(serialize($tests).$action.$owner_id);
			}else{
				$cache_key = md5(serialize($tests).$action);
			}
			$cached_permissions[$cache_key] = $return;
			$session->set('acos_permissions', $cached_permissions);
		}else{
			$session = Base::getSession();
			$session->set('acos_permissions', array());
		}
		return $return;
	}
	
	public static function check_rules($rules, $groups = array(), $owner_id = null, $user_id = null){
		$user = Base::getUser();
		if(empty($groups)){
			$groups = Authenticate::get_user_groups($user_id);
		}
		if(!empty($owner_id) AND $owner_id == $user['id']){
			$groups[] = 'owner';
		}
		if(!is_array($rules)){
			$rules = (array)$rules;
		}
		//check if any denied groups match user's groups
		$denied = array_keys($rules, -1);
		if(count(array_intersect($denied, $groups)) > 0){
			//one or more of the user's groups is denied, return false
			return false;
		}
		//check if any allowed groups match user's groups
		$allowed = array_keys($rules, 1);
		if(count(array_intersect($allowed, $groups)) > 0){
			//one or more of the user's groups is denied, return false
			return true;
		}
		//check if any not set groups match user's groups
		$not_set = array_keys($rules, '');
		if(count(array_intersect($not_set, $groups)) > 0){
			//one or more of the user's groups is denied, return false
			return 0;
		}
		return null;
	}
	
}