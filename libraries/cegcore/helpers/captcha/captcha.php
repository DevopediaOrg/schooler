<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Helpers\Captcha;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class Captcha {

	public static function check($field = 'captcha', $key = 'gcore_captcha'){
		$posvar = \GCore\Libs\Request::data($field, null);
		if(!empty($posvar)){
			$session = \GCore\Libs\Base::getSession();
			$sessionvar = $session->get($key);
			$postvar = strtolower($posvar);
			if(md5($postvar) != $sessionvar){
				\GCore\Libs\Request::set($field, '');
				return false;
			}else{
				$session->clear($key);
				\GCore\Libs\Request::set($field, '');
				return true;
			}
		}else{
			return false;
		}
	}

	public static function display($type = 0, $key = 'gcore_captcha'){
		@error_reporting(0);
		$alphanum  = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789abcdefghijkmnpqrstuvwxyz';
		$front_chars = substr(str_shuffle($alphanum), 0, 5);
		$back_chars = substr(str_shuffle($alphanum), 0, 7);
		
		$session = \GCore\Libs\Base::getSession();
		$session->set($key, md5(strtolower($front_chars)));
		
		header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); 
		header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); 
		header('Cache-Control: no-store, no-cache, must-revalidate'); 
		header('Cache-Control: post-check=0, pre-check=0', false); 
		header('Pragma: no-cache');
		header('Content-type: image/png');
		
		switch($type){
			case 1:
				$font = dirname(__FILE__).DIRECTORY_SEPARATOR.'default.ttf';
				$image_size = imagettfbbox(20, 0, $font, 'X');
				$image_size = 5*(abs($image_size[2] - $image_size[0])+7);
				$im = imagecreatetruecolor($image_size, 40);
				// Create some colors
				$white = imagecolorallocate($im, 255, 255, 255);
				$grey = imagecolorallocate($im, 128, 128, 128);
				$greylight = imagecolorallocate($im, 199, 199, 199);
				$black = imagecolorallocate($im, 0, 0, 0);
				//create the background image rect
				imagefilledrectangle($im, 0, 0, $image_size -1, 39, $white);
				
				// The text to draw
				$chars = array();
				$chars2 = array();
				for($i = 0; $i < strlen($front_chars); $i++){
					$chars[] = $front_chars[$i];
				}
				for($i = 0; $i < strlen($back_chars); $i++){
					$chars2[] = $back_chars[$i];
				}
				
				// Add some shadow to the text
				//imagettftext($im, 20, 0, 11, 21, $grey, $font, $front_chars);
				
				$back_char_size = 20;
				$back_char_angle = 0;
				$back_char_x = 10;
				$back_char_y = 25;
				$bbox2 = array();
				$bbox2[0] = 0;
				$bbox2[2] = 0;
				foreach($chars2 as $char2){
					$back_char_angle = rand(-20, 20);
					$back_char_size = rand(15, 20);
					$back_char_y = rand(0, 40);
					imagettftext($im, $back_char_size, $back_char_angle, $back_char_x, $back_char_y, $greylight, $font, $char2);
					$bbox2 = imagettfbbox($back_char_size, $back_char_angle, $font, $char2);
					$back_char_x = $back_char_x + abs($bbox2[2] - $bbox2[0]) + 3;
				}
				
				$front_char_size = 20;
				$front_char_angle = 0;
				$front_char_x = 10;
				$front_char_y = 25;
				$bbox = array();
				$bbox[0] = 0;
				$bbox[2] = 0;
				// Add the text
				foreach($chars as $char){
					$front_char_angle = rand(-20, 20);
					//$front_char_size = rand(15, 20);
					imagettftext($im, $front_char_size, $front_char_angle, $front_char_x, $front_char_y, $black, $font, $char);
					$bbox = imagettfbbox($front_char_size, $front_char_angle, $font, $char);
					$front_char_x = $front_char_x + abs($bbox[2] - $bbox[0]) + 3;
				}
				
				// Using imagepng() results in clearer text compared with imagejpeg()
				imagepng($im);
				imagedestroy($im);
			break;

			case 0:
			default:
				$image = imagecreatefrompng(dirname(__FILE__).DIRECTORY_SEPARATOR.'background.png');
				$greylight = imagecolorallocate($image, 199, 199, 199);
				$black = imagecolorallocate($image, 0, 0, 0); 
				imagestring ($image, 5, 8, 14,  $back_chars, $greylight); 
				imagestring ($image, 5, 5, 11,  $front_chars, $black); 
				
				imagepng($image);
				imagedestroy($image);
			break;
		}
		exit;
	}
}
?>