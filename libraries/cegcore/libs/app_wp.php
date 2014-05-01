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
class AppWp {
	var $path = '';
	var $url = '';
	var $site = GCORE_SITE;
	var $_vars = array();
	var $buffer = '';
	var $extension = '';
	var $controller = '';
	var $action = '';
	var $template = '';
	var $tvout = 'index';
	var $language = 'en-gb';
	var $direction = 'ltr';
	var $thread = 'gcore';
	var $reset = false;
	
	function __construct($site = GCORE_SITE, $thread = 'gcore'){
		$this->path = \GCore\C::get('GCORE_'.strtoupper($site).'_PATH');
		$this->url = \GCore\C::get('GCORE_'.strtoupper($site).'_URL');
		$this->language = Base::getConfig('site_language', 'en-gb');
		$this->site = $site;
		$this->thread = $thread;
	}
	
	public static function getInstance($site = GCORE_SITE, $thread = 'gcore'){
		static $instances;
		if(!isset($instances)){
			$instances = array();
		}
		if(empty($instances[$site][$thread])){
			$instances[$site][$thread] = new self($site, $thread);
			return $instances[$site][$thread];
		}else{
			return $instances[$site][$thread];
		}
	}
	
	function set($key, $value = null){
		if(is_array($key)){
			$this->_vars = array_merge($this->_vars, $key);
			return;
		}
		$this->_vars[$key] = $value;
	}
	
	function get($key, $default = null){
		if(isset($this->_vars[$key])){
			return $this->_vars[$key];
		}
		return $default;
	}
	
	function redirect($url){
		Env::redirect($url);
	}

	function getBuffer(){
		return $this->buffer;
	}
	
	function initialize(){
		
	}
	
	function route(){
		//Event::trigger('on_before_route');
		if($this->site != 'admin'){
			$params = array();
			Route::translate($params);
		}else{
			$params = array(
				'extension' => Request::data('ext', ''), 
				'controller' => Request::data('cont', ''), 
				'action' => Request::data('act', ''), 
			);
			if(empty($params['extension']) AND empty($params['controller'])){
				$params['controller'] = 'cpanel';
			}
		}
		$this->extension = !empty($params['extension']) ? $params['extension'] : '';
		$this->controller = !empty($params['controller']) ? $params['controller'] : '';
		$this->action = !empty($params['action']) ? $params['action'] : '';
		//set the active route data in the request
		Request::set('_Route.ext', $this->extension);
		Request::set('_Route.cont', $this->controller);
		Request::set('_Route.act', $this->action);
		foreach($params as $k => $var){
			if(strlen(Request::data($k)) == 0 AND !in_array($k, array('extension', 'controller', 'action', 'params'))){
				Request::set($k, $var);
				Request::set('_Route.'.$k, $var);
			}
		}
		if(!empty($params['params'])){
			$this->set($params['params']);
			Request::set('_Route.params', $params['params']);
		}
		//Event::trigger('on_after_route', $params);
	}
	
	function dispatch($content_only = false){
		Event::trigger('on_before_dispatch', $this);
		$session = Base::getSession();
		reset:
		//if no action set, set it to index
		if(strlen(trim($this->action)) == 0){
			$this->action = 'index';
		}
		//set admin path
		$site = '';
		if($this->site == 'admin'){
			$site = '\Admin';
		}
		//load the extension class
		$controller = !empty($this->controller) ? '\Controllers\\'.Str::camilize($this->controller) : '\\'.Str::camilize($this->extension);
		$extension = !empty($this->extension) ? '\Extensions\\'.Str::camilize($this->extension) : '';
		$classname = '\GCore'.$site.$extension.$controller;
		$this->tvout = strlen(Request::data('tvout', null)) > 0 ? Request::data('tvout') : $this->tvout;
		//set referer
		if(!$content_only){
			if(!($this->controller == 'users' AND ($this->action == 'login' OR $this->action == 'logout' OR $this->action == 'register')) AND (!empty($this->extension) OR !empty($this->controller)) AND $this->tvout == 'index'){
				//$session->set('_referer', Url::current());
			}else{
				//$session->set('_referer', 'index.php');
			}
		}
		
		$G_User = $session->get('user', array());
		//check permissions
		/*
		$J_User = \JFactory::getUser();
		if(empty($J_User->groups) OR empty($G_User['groups']) OR (array_values($J_User->groups) !== $G_User['groups']) OR empty($G_User['inheritance'])){
			$user_session = array();
			$user_session['id'] = $J_User->id;
			$user_session['name'] = $J_User->name;
			$user_session['username'] = $J_User->username;
			$user_session['email'] = $J_User->email;
			$user_session['last_login'] = $J_User->lastvisitDate;
			$user_session['logged_in'] = !$J_User->guest;
			$user_session['guest'] = $J_User->guest;
			$user_session['groups'] = empty($J_User->groups) ? array(1) : array_values($J_User->groups);
			$user_session['inheritance'] = array();
			if(!empty($J_User->groups)){
				//sort groups
				$groups = \GCore\Admin\Models\Group::getInstance()->find('all', array('order' => 'Group.parent_id ASC'));
				if(!empty($groups)){
					reloop:
					foreach($groups as $group){
						//if this group exists in the user's groups or its inheitance then add its parent_id
						if(in_array($group['Group']['id'], $user_session['groups']) OR in_array($group['Group']['id'], $user_session['inheritance'])){
							$user_session['inheritance'][] = $group['Group']['parent_id'];
						}
					}
					//find the number of occurances of each group in the inheritane
					$groups_counted = array_count_values($user_session['inheritance']);
					//if the count of root parent (0 parent_id) is less than the count of user's groups then not all pathes have been found, reloop
					if((count($user_session['groups']) AND !isset($groups_counted[0])) OR $groups_counted[0] < count($user_session['groups'])){
						goto reloop;
					}else{
						$user_session['inheritance'] = array_unique($user_session['inheritance']);
					}
				}
			}
			if($session->get('user', array()) !== $user_session){
				$session->clear('acos_permissions');
			}
			$session->set('user', array_merge($session->get('user', array()), $user_session));
		}
		//copy some config
		$mainframe = \JFactory::getApplication();
		//set timezone
		date_default_timezone_set($mainframe->getCfg('offset'));
		//site title
		\GCore\Libs\Base::setConfig('site_title', $mainframe->getCfg('sitename'));
		*/
		
		//$lang = \JFactory::getLanguage();
		//\GCore\Libs\Base::setConfig('site_language', $lang->getTag());
		/*if(!Authorize::authorized($classname, $this->action)){
			if($content_only){
				return;
			}
			$this->redirect(r_('index.php?cont=users&act=login'));
		}*/
		//if the extension class not found or the action function not found then load an error
		if(!class_exists($classname) OR (!in_array($this->action, get_class_methods($classname)) AND !in_array('__call', get_class_methods($classname))) OR substr($this->action, 0, 1) == '_'){
			$this->controller = 'errors';
			$this->action = 'e404';
			//reset the controller
			//$classname = '\GCore\Controllers\Errors';
			$this->buffer = 'Page not found';
			//\GCore\Libs\Env::e404();
			//we need the rendered content only
			if($content_only){
				return;
			}
		}
		//load language file
		if(!empty($extension)){
			Lang::load($site.$extension);
		}
		//set theme
		$doc = Document::getInstance($this->site, $this->thread);
		$doc->theme = 'bootstrap3';
		$theme = \GCore\Helpers\Theme::getInstance();
		//load class and run the action
		${$classname} = new $classname($this->site, $this->thread);
		ob_start();
		$continue = ${$classname}->_initialize();
		//check and read cache
		if(!empty(${$classname}->cache)){
			if(!is_array(${$classname}->cache)){
				${$classname}->cache = array();
			}
			if(empty(${$classname}->cache['time'])){
				${$classname}->cache['time'] = Base::getConfig('app_cache_expiry', 900);
			}
			if(empty(${$classname}->cache['title'])){
				${$classname}->cache['title'] = File::makeSafe($classname.'_'.$this->action);
			}else{
				${$classname}->cache['title'] = File::makeSafe(${$classname}->cache['title']);
			}
			if(empty(${$classname}->cache['key'])){
				${$classname}->cache['key'] = 'cached_view';
			}else{
				${$classname}->cache['key'] = 'cached_view_'.${$classname}->cache['key'];
			}
			$cache = Cache::getInstance(${$classname}->cache['title'], array('expiration' => ${$classname}->cache['time']));
			$cached_view = $cache->get(${$classname}->cache['key']);
			$cached = false;
			if(!empty($cached_view)){
				$cached = true;
				$continue = false;
				echo $cached_view;
			}
		}
		
		if($continue !== false){
			${$classname}->{$this->action}();
			if($this->reset === true){
				$this->reset = false;
				goto reset;
			}
			//initialize and render view
			$view = new View;
			$view->initialize(${$classname});
			$view->renderView($this->action);
		}
		
		//get the action output buffer
		$this->buffer = ob_get_clean();
		//check and save cache
		if(!empty(${$classname}->cache) AND !$cached){
			$cache = Cache::getInstance(${$classname}->cache['title'], array('expiration' => ${$classname}->cache['time']));
			$cache->set(${$classname}->cache['key'], $this->buffer);
		}
		//finalize
		ob_start();
		${$classname}->_finalize();
		$this->buffer .= ob_get_clean();

		if($this->tvout != 'ajax' AND $doc->theme == 'bootstrap3'){
			$this->buffer = '<div class="gbs3">'.$this->buffer.'</div>';
		}
		//Event::trigger('on_after_dispatch');
	}
	
	function render(){
		//Event::trigger('on_before_render');
		$this->template = 'joomla';
		$params = new Parameter(array());
		//get template view from the request
		$this->tvout = strlen(Request::data('tvout', null)) > 0 ? Request::data('tvout') : $this->tvout;
		//render the active template
		$doc = Document::getInstance($this->site, $this->thread);
		$template = Template::getInstance($doc, $this->template, $this->tvout, $params);
		$this->buffer = $template->render();
		//Event::trigger('on_after_render');
	}
	
	public static function getSystemMessages(){
		$session = Base::getSession();
		$types = $session->getFlash();
		return \GCore\Helpers\Message::render($types);
	}
	
	public static function getHeader(){
		$doc = \GCore\Libs\Document::getInstance();
		static $used;
		if(!isset($used)){
			$used = array();
		}
		$chunks = array();
		
		$chunks[] = '
		<script type="text/javascript">
		if("undefined"==typeof window.jQuery){}else{
			var gcore_jQuery_bak = window.jQuery;
			var gcore_$_bak = window.$;
		}
		if("undefined"==typeof gcore_jQuery){}else{
			window.jQuery = gcore_jQuery;
			window.$ = gcore_$;
		}
		</script>
		';
		//add css files list
		foreach($doc->cssfiles as $k => $cssfile){
			if(empty($used['cssfiles'][$k])){
				$used['cssfiles'][$k] = true;
				$chunks[] = \GCore\Helpers\Html::_concat($cssfile, array_keys($cssfile), '<link ', '>');
			}
		}
		//add css code list
		foreach($doc->csscodes as $media => $codes){
			$chunks[] = \GCore\Helpers\Html::container('style', implode("\n", $codes), array('type' => 'text/css', 'media' => $media));
			foreach($doc->csscodes[$media] as $k => $code){
				unset($doc->csscodes[$media][$k]);
			}
		}
		//add js files list
		foreach($doc->jsfiles as$k => $jsfile){
			/*if(strpos($jsfile['src'], 'jquery.js') !== false){
				$document = \JFactory::getDocument();
				$document->addScript($jsfile['src']);
				continue;
			}*/
			if(empty($used['jsfiles'][$k])){
				$used['jsfiles'][$k] = true;
				$chunks[] = \GCore\Helpers\Html::_concat($jsfile, array_keys($jsfile), '<script ', '></script>');
			}
		}
		//add js code list
		foreach($doc->jscodes as $type => $codes){
			$chunks[] = \GCore\Helpers\Html::container('script', implode("\n", $codes), array('type' => $type));
			foreach($doc->jscodes[$type] as $k => $code){
				unset($doc->jscodes[$type][$k]);
			}
		}
		
		foreach($doc->headertags as $k => $code){
			$chunks[] = $code;
			unset($doc->headertags[$k]);
		}
		
		$chunks[] = '
		<script type="text/javascript">
		if("undefined"==typeof gcore_jQuery){
			var gcore_jQuery = window.jQuery;
			var gcore_$ = window.$;
		}
		if("undefined"==typeof gcore_jQuery_bak){}else{
			window.jQuery = gcore_jQuery_bak;
			window.$ = gcore_$_bak;
		}
		</script>
		';
		
		return implode("\n", array_filter($chunks));
	}
	
	function output(){
		echo $this->buffer;
		if(Base::getConfig('debug', 0)){
			\GCore\Loader::debug();
		}
	}
	
	public static function call($site, $extension, $controller = '', $action = '', $params = array()){
		if(!empty($params['_app_thread'])){
			$thread = $params['_app_thread'];
		}else{
			$thread = 'x_core_'.rand();
		}
		$x_app = self::getInstance($site, $thread);
		$x_app->extension = $extension;
		$x_app->controller = $controller;
		$x_app->action = $action;
		$x_app->set($params);
		$x_app->dispatch(true);
		$tvout = strlen(\GCore\Libs\Request::data('tvout', null)) > 0 ? \GCore\Libs\Request::data('tvout') : '';
		if($tvout != 'ajax'){
			//$doc = \GCore\Libs\Document::getInstance();
			//$doc->addCssFile('joomla_fixes');
		}
		return $x_app->buffer;
	}
}