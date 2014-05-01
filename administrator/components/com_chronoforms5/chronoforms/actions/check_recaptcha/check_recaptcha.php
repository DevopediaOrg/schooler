<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\CheckRecaptcha;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class CheckRecaptcha extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'Check ReCaptcha';
	//static $setup = array('simple' => array('title' => 'Captcha'));
	static $group = array('anti_spam' => 'Anti Spam');

	var $events = array('success' => 0, 'fail' => 0);

	var $defaults = array(
		'private_key' => '6LfNoAUAAAAAABX7Dfw_9Pp4K4KVtKNCUHsIWG7O',
		'verify_server' => 'www.google.com',
		'error' => "The reCAPTCHA wasn't entered correctly. Please try it again."
	);

	function execute(&$form, $action_id){
		$config =  $form->actions_config[$action_id];
		$config = new \GCore\Libs\Parameter($config);
		
		if(!defined('RECAPTCHA_VERIFY_SERVER')){
			define('RECAPTCHA_VERIFY_SERVER', $config->get('verify_server'));
		}
        $resp = $this->recaptcha_check_answer(
            $config->get('private_key'),
            $_SERVER["REMOTE_ADDR"],
            \GCore\Libs\Request::data("recaptcha_challenge_field"),
            \GCore\Libs\Request::data("recaptcha_response_field")
		);

        if ( !$resp->is_valid ) {
			$form->errors['recaptcha'] = $config->get('error', "The reCAPTCHA wasn't entered correctly. Please try it again.");
			$form->debug[$action_id][self::$title][] = "( reCAPTCHA said: ".$resp->error." )";
			$this->events['fail'] = 1;
        }else{
			$this->events['success'] = 1;
		}
	}
	
	
	/**
     * Calls an HTTP POST function to verify if the user's guess was correct
     * @param string $privkey
     * @param string $remoteip
     * @param string $challenge
     * @param string $response
     * @param array $extra_params an array of extra variables to post to the server
     * @return CFReCaptchaResponse
     */
    function recaptcha_check_answer ($privkey, $remoteip, $challenge, $response, $extra_params = array())
    {
        if ( $privkey == null || $privkey == '' ) {
            die ("To use reCAPTCHA you must get an API key from
                <a href='https://www.google.com/recaptcha/admin/create'>https://www.google.com/recaptcha/admin/create</a>");
        }

        if ( $remoteip == null || $remoteip == '' ) {
            die ("For security reasons, you must pass the remote ip to reCAPTCHA");
        }

        //discard spam submissions
        if ( $challenge == null || strlen($challenge) == 0
                || $response == null || strlen($response) == 0) {
            $recaptcha_response = new \stdClass;
            $recaptcha_response->is_valid = false;
            $recaptcha_response->error = 'incorrect-captcha-sol';
            return $recaptcha_response;
        }
        $response = $this->_recaptcha_http_post (RECAPTCHA_VERIFY_SERVER, "/recaptcha/api/verify",
            array ( 'privatekey' => $privkey,
                    'remoteip' => $remoteip,
                    'challenge' => $challenge,
                    'response' => $response ) + $extra_params
            );

        $answers = explode ("\n", $response [1]);
        $recaptcha_response = new \stdClass;

        if (trim ($answers [0]) == 'true') {
            $recaptcha_response->is_valid = true;
        } else {
            $recaptcha_response->is_valid = false;
            $recaptcha_response->error = $answers [1];
        }
        return $recaptcha_response;
    }
    function _recaptcha_http_post($host, $path, $data, $port = 80) {

        $req = $this->_recaptcha_qsencode ($data);

        $http_request  = "POST $path HTTP/1.0\r\n";
        $http_request .= "Host: $host\r\n";
        $http_request .= "Content-Type: application/x-www-form-urlencoded;\r\n";
        $http_request .= "Content-Length: " . strlen($req) . "\r\n";
        $http_request .= "User-Agent: reCAPTCHA/PHP\r\n";
        $http_request .= "\r\n";
        $http_request .= $req;

        $response = '';
        if ( false == ( $fs = @fsockopen($host, $port, $errno, $errstr, 10) ) ) {
            die ("Could not open socket: $errno - $errstr"); ;
        }

        fwrite($fs, $http_request);

        while ( !feof($fs) ) {
            $response .= fgets($fs, 1160); // One TCP-IP packet
        }
        fclose($fs);
        $response = explode("\r\n\r\n", $response, 2);

        return $response;
    }
    /**
     * Encodes the given data into a query string format
     * @param $data - array of string elements to be encoded
     * @return string - encoded request
     */
    function _recaptcha_qsencode ($data) {
        $req = "";
        foreach ( $data as $key => $value )
        $req .= $key . '=' . urlencode( stripslashes($value) ) . '&';

        // Cut the last '&'
        $req=substr($req, 0, strlen($req) - 1);
        return $req;
    }

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config check_captcha_action_config', 'check_captcha_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][error]', array('type' => 'text', 'label' => l_('CF_RECAPTCHA_ERROR'), 'class' => 'XL', 'sublabel' => l_('CF_RECAPTCHA_ERROR_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][private_key]', array('type' => 'text', 'label' => l_('CF_RECAPTCHA_PRIVATE_KEY'), 'class' => 'XL', 'sublabel' => l_('CF_RECAPTCHA_PRIVATE_KEY_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][verify_server]', array('type' => 'text', 'label' => l_('CF_RECAPTCHA_VERIFY_SERVER'), 'class' => 'L', 'sublabel' => l_('CF_RECAPTCHA_VERIFY_SERVER_DESC')));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}