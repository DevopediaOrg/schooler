<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\JoomlaRegistration;
use JFactory;
use JRequest;
use JComponentHelper;
use JUserHelper;
use JError;
use JText;
use JURI;
use JRoute;
use JMail;
use JDate;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class JoomlaRegistration extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'Joomla Registration';
	//static $setup = array('simple' => array('title' => 'Captcha'));
	static $group = array('joomla' => 'Joomla');
	static $platforms = array('joomla');

	var $events = array('success' => 0, 'fail' => 0);

	var $defaults = array(
		'name' => '',
		'username' => '',
		'email' => '',
		'password' => '',
		'password2' => '',
		'override_allow_user_registration' => 1,
		'new_usertype' => 'Registered',
		'useractivation' => 1,
		'activation_link' => '',
		'random_password' => 0,
		'auto_login' => 0,
		'send_joo_activation' => 0,
		'enable_cb_support' => 0,
		'user_data_path' => '',
		'display_reg_complete' => 0
	);
	var $config = null;

	function execute(&$form, $action_id){
		$config =  $form->actions_config[$action_id];
		$config = new \GCore\Libs\Parameter($config);
		$this->config = $config;
		
		//set activation link
		if(trim($this->config->get('activation_link', '')) == ''){
			$this->config->set('activation_link', 'index.php?option=com_users&task=registration.activate');
		}
		// Get required system objects
		$user 		= clone(JFactory::getUser());
		//$config		= JFactory::getConfig();
		$authorize	= JFactory::getACL();
		$document   = JFactory::getDocument();
		$language = JFactory::getLanguage();
        $language->load('com_users');

		// If user registration is not allowed, show 403 not authorized.
		$usersConfig = JComponentHelper::getParams( 'com_users' );
		if($usersConfig->get('allowUserRegistration') == '0' && !$config->get('override_allow_user_registration', 0)){
			JError::raiseError( 403, JText::_( 'Access Forbidden' ));
			return;
		}

		// Initialize new usertype setting
		$userConfig = JComponentHelper::getParams('com_users');
		// Default to Registered.
		$defaultUserGroup = $config->get('new_usertype', '');
		if(empty($defaultUserGroup)){
			$defaultUserGroup = $userConfig->get('new_usertype', array(2));
		}else{
			$_groups = $defaultUserGroup;//explode(",", trim($defaultUserGroup));
			$defaultUserGroup = array();
			foreach($_groups as $_group){
				$defaultUserGroup[] = (int)$_group;
			}
		}
		
		//set the post fields values
		$form->data['name'] = $form->data($config->get('name', ''), '');
		$form->data['username'] = $form->data($config->get('username', ''), '');
		$form->data['email'] = $form->data($config->get('email', ''), '');
		$form->data['password'] = $form->data($config->get('password', ''), '');
		$form->data['password2'] = $form->data($config->get('password2', ''), '');
		
		//generate the random pass if enabled
		if((int)$config->get('random_password', 0) == 1){
			jimport('joomla.user.helper');
			$random_pass = JUserHelper::genRandomPassword();
			$form->data['password'] = $random_pass;
			$form->data['password2'] = $random_pass;
		}
		//check empty fields
		$checks = array('name', 'username', 'email', 'password');
		foreach($checks as $check){
			if(!trim($form->data[$check])){
				$this->events['fail'] = 1;
				$form->errors[$config->get($check)] = 'You must provide your '.$check.'.';
				//return false;
			}
		}
		if($this->events['fail'] == 1){
			return false;
		}
		//check the 2 passwords
		if($form->data['password'] != $form->data['password2']){
			$this->events['fail'] = 1;
			$form->errors[$config->get('password2')] = 'Passwords do NOT match.';
			$form->debug[] = "Couldn't create new user, Passwords do NOT match.";
			return false;
		}
		// Bind the post array to the user object
		$post_data = $form->data;
		if(!$user->bind($post_data, 'usertype')){
			//JError::raiseError( 500, $user->getError());
			$this->events['fail'] = 1;
			$form->errors[] = $user->getError();
			$form->debug[] = "Couldn't bind new user, Joomla returned this error : ".$user->getError();
			return false;
		}

		// Set some initial user values
		$user->set('id', 0);
		$user->set('usertype', 'deprecated');
		$user->set('groups', $defaultUserGroup);

		$date = JFactory::getDate();
		$user->set('registerDate', date('Y-m-d H:i:s', time()));

		// If user activation is turned on, we need to set the activation information
		$useractivation = $config->get('useractivation', $usersConfig->get('useractivation'));
		if (($useractivation == 1) || ($useractivation == 2)) {
			jimport('joomla.user.helper');
			$user->set('activation', md5(JUserHelper::genRandomPassword()));
			$user->set('block', '1');
		}

		// If there was an error with registration, set the message and display form
		if(!$user->save()){
			/*JError::raiseWarning('', JText::_( $user->getError()));
			$this->register();*/
			$this->events['fail'] = 1;
			$form->errors[] = $user->getError();
			$form->debug[] = "Couldn't save new user, Joomla returned this error : ".$user->getError();
			return false;
		}else{
			$this->events['success'] = 1;
		}
		//store user data
		$user_data = (array)$user;
		$removes = array('params', '_params', 'guest', '_errorMsg', '_errors');
		foreach($removes as $remove){
			unset($user_data[$remove]);
		}
		$form->data['_PLUGINS_']['joomla_registration'] = $user_data;
		//inject user data under the correct data path
		if(strlen(trim($config->get('user_data_path', ''))) > 0){
			$form->data = $form->set_array_value($form->data, explode('.', trim($config->get('user_data_path', ''))), $user_data);
		}
		
		//CB support
		if((bool)$config->get('enable_cb_support', 0) === true){
			/********************CB part*************************/
			$database = JFactory::getDBO();
			$database->setQuery( "SELECT * FROM #__comprofiler_fields WHERE `table`='#__comprofiler' AND name <>'NA' AND registration = '1'" );
			$fields = $database->loadObjectList();
			$default_fields_names = array('id', 'user_id');
			$default_fields_values = array($user_data['id'], $user_data['id']);
			foreach($fields as $field){
				$default_fields_names[] = $field->name;
				$fieldname = $field->name;
				$default_fields_values[] = $form->data[$fieldname];
			}
			$database->setQuery( "INSERT INTO #__comprofiler (".implode(",", $default_fields_names).") VALUES  ('".implode("','", $form->escapeVar($default_fields_values))."');" );
			if (!$database->query()) {
				JError::raiseWarning(100, $database->getErrorMsg());
			}
			/**********************************************/
		}
		// Send registration confirmation mail
		$password = $form->data['password'];//JRequest::getString('password', '', 'post', JREQUEST_ALLOWRAW);
		$password = preg_replace('/[\x00-\x1F\x7F]/', '', $password); //Disallow control chars in the email
		if((int)$config->get('send_joo_activation', 0) == 1){
			$this->_sendMail($user, $password);
		}
		// Everything went fine, set relevant message depending upon user activation state and display message
		if((int)$useractivation == 2){
			$message  = JText::_('COM_USERS_REGISTRATION_COMPLETE_VERIFY');
		}else if((int)$useractivation == 1){
			$message  = JText::_('COM_USERS_REGISTRATION_COMPLETE_ACTIVATE');
		}else{
			$message = JText::_('COM_USERS_REGISTRATION_SAVE_SUCCESS');
		}
		
		if($config->get('display_reg_complete', 0) == 1){
			echo $message;
		}
		
		if((int)$config->get('auto_login', 0) == 1){
			$credentials = array();
			$credentials['username'] = $form->data['username'];
			$credentials['password'] = $form->data['password'];
			$mainframe->login($credentials);
		}
	}
	
	function _sendMail(&$user, $password)
	{
		$mainframe = JFactory::getApplication();

		$db		= JFactory::getDBO();

		$name 		= $user->get('name');
		$email 		= $user->get('email');
		$username 	= $user->get('username');

		$usersConfig 	= JComponentHelper::getParams( 'com_users' );
		$sitename 		= $mainframe->getCfg( 'sitename' );
		$useractivation = $usersConfig->get( 'useractivation' );
		$mailfrom 		= $mainframe->getCfg( 'mailfrom' );
		$fromname 		= $mainframe->getCfg( 'fromname' );
		$siteURL		= JURI::base();
		
		$jconfig = JFactory::getConfig();
		// Compile the notification mail values.
		$data = $user->getProperties();
		$data['fromname']	= $jconfig->get('fromname');
		$data['mailfrom']	= $jconfig->get('mailfrom');
		$data['sitename']	= $jconfig->get('sitename');
		$data['siteurl']	= JUri::base();

		// Handle account activation/confirmation emails.
		if ($useractivation == 2)
		{
			// Set the link to confirm the user email.
			$uri = JURI::getInstance();
			$base = $uri->toString(array('scheme', 'user', 'pass', 'host', 'port'));
			$data['activate'] = $base.JRoute::_(trim($this->config->get('activation_link', '')).'&token='.$data['activation'], false);

			$emailSubject	= JText::sprintf(
				'COM_USERS_EMAIL_ACCOUNT_DETAILS',
				$data['name'],
				$data['sitename']
			);

			$emailBody = JText::sprintf(
				'COM_USERS_EMAIL_REGISTERED_WITH_ADMIN_ACTIVATION_BODY',
				$data['name'],
				$data['sitename'],
				$data['siteurl'].trim($this->config->get('activation_link', '')).'&token='.$data['activation'],
				$data['siteurl'],
				$data['username'],
				$data['password_clear']
			);
		}
		else if ($useractivation == 1)
		{
			// Set the link to activate the user account.
			$uri = JURI::getInstance();
			$base = $uri->toString(array('scheme', 'user', 'pass', 'host', 'port'));
			$data['activate'] = $base.JRoute::_(trim($this->config->get('activation_link', '')).'&token='.$data['activation'], false);

			$emailSubject	= JText::sprintf(
				'COM_USERS_EMAIL_ACCOUNT_DETAILS',
				$data['name'],
				$data['sitename']
			);

			$emailBody = JText::sprintf(
				'COM_USERS_EMAIL_REGISTERED_WITH_ACTIVATION_BODY',
				$data['name'],
				$data['sitename'],
				$data['siteurl'].trim($this->config->get('activation_link', '')).'&token='.$data['activation'],
				$data['siteurl'],
				$data['username'],
				$data['password_clear']
			);
		} else {

			$emailSubject	= JText::sprintf(
				'COM_USERS_EMAIL_ACCOUNT_DETAILS',
				$data['name'],
				$data['sitename']
			);

			$emailBody = JText::sprintf(
				'COM_USERS_EMAIL_REGISTERED_BODY',
				$data['name'],
				$data['sitename'],
				$data['siteurl']
			);
		}

		// Send the registration email.
		$JMail = new JMail();
		$return = $JMail->sendMail($data['mailfrom'], $data['fromname'], $data['email'], $emailSubject, $emailBody);

		// Check for an error.
		if ($return !== true) {
			JError::raiseNotice(100, JText::_('COM_USERS_REGISTRATION_SEND_MAIL_FAILED'));

			// Send a system message to administrators receiving system mails
			$db = JFactory::getDBO();
			$q = "SELECT id
				FROM #__users
				WHERE block = 0
				AND sendEmail = 1";
			$db->setQuery($q);
			$sendEmail = $db->loadResultArray();
			if (count($sendEmail) > 0) {
				$jdate = new JDate();
				// Build the query to add the messages
				$q = "INSERT INTO `#__messages` (`user_id_from`, `user_id_to`, `date_time`, `subject`, `message`)
					VALUES ";
				$messages = array();
				foreach ($sendEmail as $userid) {
					$messages[] = "(".$userid.", ".$userid.", '".$jdate->toMySQL()."', '".JText::_('COM_USERS_MAIL_SEND_FAILURE_SUBJECT')."', '".JText::sprintf('COM_USERS_MAIL_SEND_FAILURE_BODY', $return, $data['username'])."')";
				}
				$q .= implode(',', $messages);
				$db->setQuery($q);
				$db->query();
			}
			return false;
		}

		
	}

	public static function config(){
		//permissions groups
		$groups = \GCore\Admin\Models\Group::getInstance()->find('flat');
		$rules = array();
		foreach($groups as $k => $group){
			$rules[$group['Group']['id']] = $group['Group']['title'];
		}
		
		echo \GCore\Helpers\Html::formStart('action_config check_captcha_action_config', 'check_captcha_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][name]', array('type' => 'text', 'label' => l_('CF_JOOMLA_REG_NAME'), 'class' => 'M', 'sublabel' => l_('CF_JOOMLA_REG_NAME_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][username]', array('type' => 'text', 'label' => l_('CF_JOOMLA_REG_USERNAME'), 'class' => 'M', 'sublabel' => l_('CF_JOOMLA_REG_USERNAME_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][email]', array('type' => 'text', 'label' => l_('CF_JOOMLA_REG_EMAIL'), 'class' => 'M', 'sublabel' => l_('CF_JOOMLA_REG_EMAIL_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][password]', array('type' => 'text', 'label' => l_('CF_JOOMLA_REG_PASSWORD'), 'class' => 'M', 'sublabel' => l_('CF_JOOMLA_REG_PASSWORD_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][password2]', array('type' => 'text', 'label' => l_('CF_JOOMLA_REG_CONFIRM_PASSWORD'), 'class' => 'M', 'sublabel' => l_('CF_JOOMLA_REG_CONFIRM_PASSWORD_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][new_usertype][]', array('type' => 'dropdown', 'label' => l_('CF_JOOMLA_REG_USER_GROUPS'), 'multiple' => 'multiple', 'size' => 7, 'options' => $rules, 'sublabel' => l_('CF_JOOMLA_REG_USER_GROUPS_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][useractivation]', array('type' => 'dropdown', 'label' => l_('CF_JOOMLA_REG_USER_ACTIVATION'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_JOOMLA_REG_USER_ACTIVATION_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][random_password]', array('type' => 'dropdown', 'label' => l_('CF_JOOMLA_REG_RANDOM_PASS'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_JOOMLA_REG_RANDOM_PASS_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][auto_login]', array('type' => 'dropdown', 'label' => l_('CF_JOOMLA_REG_AUTO_LOGIN'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_JOOMLA_REG_AUTO_LOGIN_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][send_joo_activation]', array('type' => 'dropdown', 'label' => l_('CF_JOOMLA_REG_SEND_JOO_ACTIVATION'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_JOOMLA_REG_SEND_JOO_ACTIVATION_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][enable_cb_support]', array('type' => 'dropdown', 'label' => l_('CF_JOOMLA_REG_ENABLE_CB_SUPPORT'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_JOOMLA_REG_ENABLE_CB_SUPPORT_DESC')));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}