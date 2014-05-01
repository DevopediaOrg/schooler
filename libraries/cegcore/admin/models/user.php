<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Models;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class User extends \GCore\Libs\GModel {
	var $tablename = '#__users';
	var $default_items = array(1);
	
	function initialize(){
		$this->validate = array(
			'name' => array(
				'required' => true,
				'not_empty' => true,
				'alpha' => true,
				'message' => l_('USER_NAME_REQUIRED_ALPHA_ONLY')
			),
			'username' => array(
				'required' => array('on' => 'create'),
				'no_spaces' => array('on' => 'create'),
				'not_empty' => array('on' => 'create'),
				'function' => array('name' => 'check_username', 'message' => l_('USER_USERNAME_TAKEN')),
				'message' => l_('USER_USERNAME_REQUIRED_NO_SPACES')
			),
			'email' => array(
				'required' => true,
				'no_spaces' => true,
				'not_empty' => true,
				'email' => true,
				'function' => array('name' => 'check_email', 'message' => l_('USER_EMAIL_USED')),
				'message' => l_('USER_VALID_EMAIL_REQUIRED')
			),
			'password' => array(
				'required' => array('on' => 'create'),
				'not_empty' => array('on' => 'create'),
				'match' => array('match' => 'password_confirm', 'data' => true, 'message' => l_('USER_PASSWORDS_MUST_MATCH')),
				'message' => l_('USER_PASSWORD_REQUIRED')
			),
		);
	}
	
	var $hasMany = array(
		'GroupUser' => array(
			'className' => '\GCore\Admin\Models\GroupUser',
			'foreignKey' => 'user_id',
			'delete_non_existent' => true,
			'save_on_save' => true,
			'delete_on_delete' => true,
		),
	);
	
	function check_username(){
		if(!empty($this->data['username'])){
			$exists = $this->field('id', array('username' => $this->data['username'], 'id <>' => $this->data['id']));
			if(!empty($exists)){
				return false;
			}
		}
		return true;
	}
	
	function check_email(){
		if(!empty($this->data['email'])){
			$exists = $this->field('id', array('email' => $this->data['email'], 'id <>' => $this->data['id']));
			if(!empty($exists)){
				return false;
			}
		}
		return true;
	}
	
	function beforeSave(&$data, &$params, $mode){
		parent::beforeSave($data, $params, $mode);
		if($mode == 'update' AND empty($data['password']) AND array_key_exists('password', $data)){
			unset($data['password']);
		}
		if(!empty($data['password'])){
			$data['password'] = \GCore\Libs\Authenticate::hash_password($data['password']);
		}
		if($mode == 'update' AND !empty($data['id']) AND (int)$data['id'] == 1){
			$user = \GCore\Libs\Base::getUser();
			if($user['id'] != 1){
				$session = \GCore\Libs\Base::getSession();
				$session->setFlash('error', l_('USERS_CANT_UPDATE_SITE_OWNER'));
				return false;
			}
		}
	}
	
	function beforeDelete(&$conditions, $params = array()){
		parent::beforeDelete($conditions, $params);
		
		$ids = $this->get_ids_of_conditions($conditions);
		if(count(array_intersect($this->default_items, $ids)) > 0){
			$session = \GCore\Libs\Base::getSession();
			$session->setFlash('error', l_('USERS_CANT_DELETE_SITE_OWNER'));
			return false;
		}
	}
}