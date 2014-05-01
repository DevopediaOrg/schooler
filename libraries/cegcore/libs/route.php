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
class Route {

	public static function _($link = ''){
		//no routing for admin
		if(GCORE_SITE == 'admin'){
			return $link;
		}
		if(\GCore\C::get('GSITE_PLATFORM') != ''){
			return $link;
		}
		//if sef is disabled, return
		if((bool)Base::getConfig('sef_urls') === false){
			return $link;
		}
		$web_root = Url::root();
		//index.php, return
		if($link == 'index.php' OR empty($link) OR $link == $web_root){
			return $web_root;
		}
		//parse the link
		$link = str_replace($web_root, '', $link);
		$link_comps = parse_url($link);
		if(!empty($link_comps['host']) AND $link_comps['host'] != $_SERVER['SERVER_NAME']){
			//external URL, return as is
			return $link;
		}
		if(!empty($link_comps['query'])){
			parse_str($link_comps['query'], $vars);
			if(!empty($vars['ext'])){
				//run the router class
				$ext_router = '\GCore\Extensions\\'.Str::camilize($vars['ext']).'\\'.Str::camilize($vars['ext']).'Router';
				if(!class_exists($ext_router)){
					goto end;
				}
				//some url params should be processed
				if((bool)Base::getConfig('sef_rewrite') === true){
					$chunks = array();
				}else{
					$chunks = array('index.php');
				}
				$chunks['ext'] = $vars['ext'];
				unset($vars['ext']);
				if(method_exists($ext_router, '_')){
					$chunks = array_merge($chunks, (array)$ext_router::_($vars));
				}else if(!empty($ext_router::$params) AND !empty($vars)){
					foreach($ext_router::$params as $k => $param){
						//check if param index exists in the current path
						if(isset($vars[$param])){
							$chunks[] = $vars[$param];
							unset($vars[$param]);
						}else{
							//break on the first non existent param
							break;
						}
					}
				}
				$sef_link = implode('/', $chunks);
				if(!empty($vars)){
					$sef_link .= '?'.http_build_query($vars);
				}
				return $web_root.$sef_link;
			}elseif(empty($vars['ext']) AND !empty($vars['cont'])){
				//run the router class
				$cont_router = '\GCore\Controllers\\'.Str::camilize($vars['cont']).'Router';
				if(!class_exists($cont_router)){
					goto end;
				}
				//some url params should be processed
				if((bool)Base::getConfig('sef_rewrite') === true){
					$chunks = array();
				}else{
					$chunks = array('index.php');
				}
				if($vars['cont'] != 'pages'){
					$chunks['cont'] = $vars['cont'];
				}
				unset($vars['cont']);
				if(method_exists($cont_router, '_')){
					$chunks = array_merge($chunks, (array)$cont_router::_($vars));
				}else if(!empty($cont_router::$params) AND !empty($vars)){
					foreach($cont_router::$params as $k => $param){
						//check if param index exists in the current path
						if(isset($vars[$param])){
							$chunks[] = $vars[$param];
							unset($vars[$param]);
						}else{
							//break on the first non existent param
							break;
						}
					}
				}
				$sef_link = implode('/', $chunks);
				if(!empty($vars)){
					$sef_link .= '?'.http_build_query($vars);
				}
				return $web_root.$sef_link;
			}
		}
		end: return $web_root.$link;
	}
	
	public static function translate(&$route_vars = array()){
		$route_vars = array(
			'extension' => '', 
			'controller' => '', 
			'action' => ''
		);
		$route_comps = parse_url(str_replace(Url::root(), '', Url::current()));
		if(empty($route_comps['path']) AND empty($route_comps['query'])){
			//show the home page
			$route_vars = self::page();
			return;
		}
		$path = !empty($route_comps['path']) ? $route_comps['path'] : '';
		$path_chunks = array_filter(explode('/', $path));
		//remove indeix.php from the path
		if(!empty($path_chunks) AND strtolower($path_chunks[0]) == 'index.php'){
			array_shift($path_chunks);
		}
		
		//if there is no path, show the home page (index.php)
		if(empty($path_chunks)){
			//no path provided, try to find the extension data
			$route_vars = array(
				'extension' => Request::data('ext', ''), 
				'controller' => Request::data('cont', ''), 
				'action' => Request::data('act', ''), 
			);
			if(empty($route_vars['extension'])){
				if(empty($route_vars['controller'])){
					//no ext/cont provided, load default home page
					$route_vars = self::page();
				}elseif($route_vars['controller'] == 'pages'){
					$route_vars = self::page(Request::get('_Route.index', null));
				}
			}
			return;
		}
		if((bool)Base::getConfig('sef_urls', 0) === false){
			//SEF disabled, no matching path found, will display 404 error
			return;
		}
		//we have a path, it may be a page alias OR an extension name
		$branches = $path_chunks;
		$alias = array_shift($path_chunks);
		//check a page with a matching alias
		if(!empty($alias)){
			//check pages aliases
			$tests = array();
			while(!empty($branches)){
				$tests[] = implode('/', $branches);
				array_pop($branches);
			}
			$route_vars = self::page($tests);
			$path_chunks = array_diff($path_chunks, explode('/', Request::data('_Route.page.alias', '')));
			if(!empty($route_vars)){
				//matching page alias found
				//check if the page belongs to an extension and if the extension has a router ?
				if(!empty($route_vars['extension'])){
					$route_vars = array_merge($route_vars, self::set_params($route_vars['extension'], $path_chunks));
				}elseif(empty($route_vars['extension']) AND !empty($route_vars['controller'])){
					$route_vars = array_merge($route_vars, self::set_params($route_vars['controller'], $path_chunks, 'controller'));
				}
				return;
			}
		}
		//check if this is a valid extension name
		if(class_exists('\GCore\Extensions\\'.Str::camilize($alias).'\\'.Str::camilize($alias))){
			$route_vars['extension'] = $alias;
			Request::set('_Route.index', $alias);
			$route_vars['controller'] = Request::data('cont', '');
			$route_vars['action'] = Request::data('act', '');
			//check if the extension has a router ?
			$route_vars = array_merge($route_vars, self::set_params($alias, $path_chunks));
			return;
		}
		//check if this is a valid core controller name
		if(class_exists('\GCore\Controllers\\'.Str::camilize($alias))){
			$route_vars['controller'] = $alias;
			Request::set('_Route.index', $alias);
			$route_vars['action'] = Request::data('act', '');
			//check if the extension has a router ?
			$route_vars = array_merge($route_vars, self::set_params($alias, $path_chunks, 'controller'));
			return;
		}
	}
	
	public static function set_params($extension, $path_chunks = array(), $type = 'extension'){
		$route_vars = array();
		if($type == 'extension'){
			$ext_router = '\GCore\Extensions\\'.Str::camilize($extension).'\\'.Str::camilize($extension).'Router';
		}else{
			$ext_router = '\GCore\Controllers\\'.Str::camilize($extension).'Router';
		}
		if(class_exists($ext_router)){
			//some url params should be processed
			if(method_exists($ext_router, 'translate')){
				$route_vars = (array)$ext_router::translate($path_chunks);
			}else if(!empty($ext_router::$params) AND !empty($path_chunks)){
				foreach($ext_router::$params as $k => $param){
					//check if param index exists in the current path
					if(array_key_exists($k, $path_chunks)){
						if(strlen(Request::data($param)) != 0){
							//param has been already set through a page param for example
							continue;
						}
						//Request::set($param, $path_chunks[$k]);
						if($param == 'cont'){
							$route_vars['controller'] = $path_chunks[$k];
							continue;
						}
						if($param == 'act'){
							$route_vars['action'] = $path_chunks[$k];
							continue;
						}
						$route_vars[$param] = $path_chunks[$k];
						//Request::set('_Route.'.$param, $path_chunks[$k]);
					}else{
						//break on the first non existent param
						break;
					}
				}
			}			
		}
		return $route_vars;
	}
	
	public static function page($alias = ''){
		$page = \GCore\Controllers\Pages::_find($alias);
		if(!empty($page)){
			Request::set('_Route.page', $page['Page']);
			//set page title
			if((bool)Base::getConfig('append_page_title', 1) === true){
				$doc = Document::getInstance();
				$doc->setTitle($page['Page']['title']);
			}
			//pass more page params
			Request::set('_Route.index', $page['Page']['id']);
			if($page['Page']['default'] == 1){
				Request::set('_Route.default', 1);
			}
			$params = array(
				'extension' => $page['Page']['extension'], 
				'controller' => $page['Page']['controller'], 
				'action' => $page['Page']['action'],
				'params' => $page['Page']['params']
			);
			if(!empty($page['Page']['params'])){
				foreach($page['Page']['params'] as $k => $v){
					$params[$k] = $v;
				}
			}
			return $params;
		}
		return array();
	}
}