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
class DatabaseObject {
	var $db_user = null;
	var $db_pass = null;
	var $db_name = null;
	var $db_host = null;
	var $db_type = null;
	var $db_prefix = null;
	var $log = array();
	var $connected = false;
	var $descriptions = array();
	var $adapter = null;
	
	public static function getInstance($options = array()){
		if(!empty($options)){
			$db_adapter_class = '\GCore\Libs\DatabaseAdapters\\'.Str::camilize(Base::getConfig('db_adapter', 'pdo'));
			$new_object = new $db_adapter_class($options);
			return $new_object;
		}else{
			return false;
		}
	}
	
	function get_reserved_words(){
		return array('LIKE', 'ASC', 'DESC', 'OR', 'AND');
	}
	
	function _initialize($options){
		$this->db_prefix = $options['prefix'];
		$this->db_user = $options['user'];
		$this->db_pass = $options['pass'];
		$this->db_name = $options['name'];
		$this->db_host = $options['host'];
		$this->db_type = $options['type'];
	}
	
	function prefix($tablename = ''){
		if(empty($tablename)){
			return $this->db_prefix;
		}else{
			return $this->db_prefix.$tablename;
		}
	}
	
	function _prefixTable($sql){
		return str_replace('#__', $this->db_prefix, $sql);
	}
	
	function _close($sql){
		return $sql.";";
	}
	
	function _log($sql, $params = array()){
		foreach($params as $k => $v){
			$sql = preg_replace('/:'.$k.'( |,|;|\))/', "'".$v."'$1", $sql);
		}
		$this->log[] = $sql;
	}
	
	function quoteName($string, $q = '`'){
		return $q.trim($string, $q).$q;
	}
	
	function getTablesList(){
		return array();
	}
	
	function getTableInfo($tablename){
		if(isset($this->descriptions[$tablename])){
			$result = $this->descriptions[$tablename];
		}else{
			$this->descriptions[$tablename] = $result = $this->_getTableInfo($tablename);
		}
		return $result;
	}
	
	function getTableColumns($tablename){
		$columns = array();
		if(isset($this->descriptions[$tablename])){
			$result = $this->descriptions[$tablename];
		}else{
			$this->descriptions[$tablename] = $result = $this->_getTableInfo($tablename);
		}
		foreach($result as $r){
			$columns[] = $r['Field'];
		}
		return $columns;
	}
		
	function getTablePrimary($tablename){
		if(isset($this->descriptions[$tablename])){
			$result = $this->descriptions[$tablename];
		}else{
			$this->descriptions[$tablename] = $result = $this->_getTableInfo($tablename);
		}
		foreach($result as $r){
			if($r['Key'] == 'PRI'){
				return $r['Field'];
			}
		}
		return null;
	}
	
	//end dependent stuff
	
	function run($sql, $params = array(), $driver_options = array()){
		return 0;
	}
	
	function load($sql, $params = array(), $driver_options = array()){
		return false;
	}
	
	function loadObject($sql, $params = array()){
		return array();
	}
	
	function loadObjectList($sql, $params = array()){
		return array();
	}
	
	function loadAssoc($sql, $params = array()){
		return array();
	}
	
	function loadAssocList($sql, $params = array()){
		return array();
	}
	
	function checkDriver($d){
		return false;
	}	
	
	function query($statement){
		return false;
	}
	
	function quote($v){
		return $v;
	}
	
	function exec($sql){
		return false;
	}
	
	function execute_query($sql, $params = array(), $driver_options = array()){
		return false;
	}
	
	function lastInsertId(){
		return null;
	}
	
	function split_sql($sql){
		return array($sql);
	}
}