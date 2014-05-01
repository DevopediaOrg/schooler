<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\LoadRecaptcha;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class LoadRecaptcha extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'Load ReCaptcha';
	static $group = array('anti_spam' => 'Anti Spam');
	var $defaults = array(
		'public_key' => '6LfNoAUAAAAAAKi8QZmjv-QHOvlGtyh509SG3FzG',
		'ssl_server' => '0',
		'theme' => 'red',
		'lang' => 'en',
		'api_server' => 'http://www.google.com/recaptcha/api',
		'api_secure_server' => 'https://www.google.com/recaptcha/api'
	);

	function execute(&$form, $action_id){
		$config =  $form->actions_config[$action_id];
		$config = new \GCore\Libs\Parameter($config);
		
		if(!defined('RECAPTCHA_API_SERVER')){
			define('RECAPTCHA_API_SERVER', $config->get('api_server'));
		}
		if(!defined('RECAPTCHA_API_SECURE_SERVER')){
			define('RECAPTCHA_API_SECURE_SERVER', $config->get('api_secure_server'));
		}
		$recaptcha_load = "<div id='recaptcha'>".$this->recaptcha_get_html($config->get('public_key'))."</div>";
		$script = "
	var RecaptchaOptions = {
		theme : '".$config->get('theme', 'red')."',
		lang  : '".$config->get('lang', 'en')."'
	};
    		";
		$doc = \GCore\Libs\Document::getInstance();
        $doc->addJsCode($script);
		//add CSS fix to the recaptcha input field
		$doc->addCssCode('label.recaptcha_input_area_text{line-height: 12px !important;}');
		//replace the string
		$form->form['Form']['content'] = str_replace('{ReCaptcha}', $recaptcha_load, $form->form['Form']['content']);
	}
	
	/**
     * Gets the challenge HTML (javascript and non-javascript version).
     * This is called from the browser, and the resulting reCAPTCHA HTML widget
     * is embedded within the HTML form it was called from.
     * @param string $pubkey A public key for reCAPTCHA
     * @param string $error The error given by reCAPTCHA (optional, default is null)
     * @param boolean $use_ssl Should the request be made over ssl? (optional, default is false)

     * @return string - The HTML to be embedded in the user's form.
     */
    function recaptcha_get_html($pubkey, $error = null, $use_ssl = false)
	{
        if ( $pubkey == null || $pubkey == '' ) {
            die ("To use reCAPTCHA you must get an API key from
            <a href='https://www.google.com/recaptcha/admin/create'>https://www.google.com/recaptcha/admin/create</a>");
        }

        if ( $use_ssl ) {
            $server = RECAPTCHA_API_SECURE_SERVER;
        } else {
            $server = RECAPTCHA_API_SERVER;
        }

        $errorpart = "";
        if ( $error ) {
            $errorpart = "&amp;error=" . $error;
        }
        return '<script type="text/javascript" src="'. $server . '/challenge?k=' . $pubkey . $errorpart . '"></script>
        <noscript>
            <iframe src="'. $server . '/noscript?k=' . $pubkey . $errorpart . '" height="300" width="500" frameborder="0"></iframe><br/>
            <textarea name="recaptcha_challenge_field" rows="3" cols="40"></textarea>
            <input type="hidden" name="recaptcha_response_field" value="manual_challenge"/>
        </noscript>';
    }

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config load_captcha_action_config', 'load_captcha_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][public_key]', array('type' => 'text', 'label' => l_('CF_RECAPTCHA_PUBLIC_KEY'), 'class' => 'XL', 'sublabel' => l_('CF_RECAPTCHA_PUBLIC_KEY_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][api_server]', array('type' => 'text', 'label' => l_('CF_RECAPTCHA_API_SERVER'), 'class' => 'XL', 'sublabel' => l_('CF_RECAPTCHA_API_SERVER_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][api_secure_server]', array('type' => 'text', 'label' => l_('CF_RECAPTCHA_API_SECURE_SERVER'), 'class' => 'XL', 'sublabel' => l_('CF_RECAPTCHA_API_SECURE_SERVER_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][ssl_server]', array('type' => 'dropdown', 'label' => l_('CF_RECAPTCHA_SSL_SERVER'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_RECAPTCHA_SSL_SERVER_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][theme]', array('type' => 'dropdown', 'label' => l_('CF_RECAPTCHA_THEME'), 'options' => array(
					'clean' => 'Clean', 
					'red' => 'Red',
					'white' => 'White',
					'blackglass' => 'Blackglass',
					'custom' => 'Custom'
				), 'sublabel' => l_('CF_RECAPTCHA_THEME_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][lang]', array('type' => 'dropdown', 'label' => l_('CF_RECAPTCHA_LANG'), 'options' => array(
					'en' => 'English', 
					'nt' => 'Dutch',
					'fr' => 'French',
					'de' => 'German',
					'pt' => 'Portuguese',
					'ru' => 'Russian',
					'es' => 'Spanish',
					'tr' => 'Turkish'
				), 'sublabel' => l_('CF_RECAPTCHA_LANG_DESC')));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}