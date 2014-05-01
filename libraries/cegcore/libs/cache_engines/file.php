<?php
namespace GCore\Libs\CacheEngines;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class File extends \GCore\Libs\Cache{
	var $dir = null;
	var $expiration = 0;
	var $domain = 'gcore';
	
	function __construct($domain = 'gcore', $params = array('dir' => '', 'expiration' => 0)){
		$this->dir = empty($params['dir']) ? \GCore\C::get('GCORE_FRONT_PATH').'cache'.DS : $params['dir'];
		$this->expiration = !empty($params['expiration']) ? $params['expiration'] : \GCore\Libs\Base::getConfig('app_cache_expiry', 900);
		$this->domain = $domain;
	}

	private function _file_name(){
		return $this->dir.$this->domain.'.cache.php';
	}

	public function get($key){
		if(!is_dir($this->dir) OR !is_writable($this->dir)){
			return false;
		}
		$cache_path = $this->_file_name();
		
		if(!file_exists($cache_path)){
			return false;
		}
		if(filemtime($cache_path) < (time() - $this->expiration)){
			$this->destroy();
			return false;
		}
		
		$cache = $this->_removeFix(file_get_contents($cache_path));
		if($cache !== false){
			$cache = unserialize($cache);
			$data = array_key_exists($key, $cache) ? $cache[$key] : false;
		}else{
			return false;
		}		
		return $data;
	}

	public function set($key, $data){
		if(!is_dir($this->dir) OR !is_writable($this->dir)){
			return false;
		}
		$cache_path = $this->_file_name();
		//check if the namespace cache file exists but expired ?
		if(file_exists($cache_path) AND (filemtime($cache_path) < (time() - $this->expiration))){
			$this->destroy();
		}
		
		$cache = array();
		$cached_data = false;
		if(file_exists($cache_path)){
			$cached_data = $this->_removeFix(file_get_contents($cache_path));
		}
		if($cached_data !== false){
			$cache = unserialize($cached_data);
			if(is_null($data) AND array_key_exists($key, $cache)){
				unset($cache[$key]);
			}else{
				$cache[$key] = $data;
			}
		}else{
			$cache[$key] = $data;
		}
		if(file_put_contents($cache_path, $this->_addFix(serialize($cache)), LOCK_EX) === false){
			return false;
		}
		@chmod($cache_path, 0644);
		return true;
	}

	public function clear($key){
		return $this->set($key, null);
	}
	
	public function destroy(){
		$cache_path = $this->_file_name();
		if(file_exists($cache_path)){
			return unlink($cache_path);
			//return true;
		}
	}
	
	protected function _addFix($content){
		return '<?php die(); ?>'.$content;
	}
	
	protected function _removeFix($content){
		return substr_replace($content, '', 0, 15);
	}
}
?>