<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\AuthorizeNet;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class AuthorizeNet extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'Authorize.net';
	static $group = array('payments' => 'Payment Processors');
	var $events = array('approved' => 0, 'declined' => 0, 'error' => 0, 'held' => 0);
	var $events_status = array('approved' => 'success', 'declined' => 'fail', 'error' => 'fail', 'held' => 'fail');

	var $defaults = array(
		'x_card_num' => '',
		'x_exp_date_m' => '',
		'x_exp_date_y' => '',
		'x_description' => '',
		'x_amount' => '',
		'x_first_name' => '',
		'x_last_name' => '',
		'x_address' => '',
		'x_city' => '',
		'x_state' => '',
		'x_zip' => '',
		'x_invoice_num' => '',
		'x_country' => '',
		'x_phone' => '',
		'x_email' => '',
		'error_retires' => '2',
		'testing' => '',
		'debugging' => '',
		'transkey' => '',
		'loginid' => '',
		'auto_add_error' => 1,
		'extra_params' => ''
	);
	
	public static function admin_initialize($name){
		$patch = " - Trial";
		$settings_model = new \GCore\Admin\Models\Extension();
		$settings_data = $settings_model->find('first', array('conditions' => array('name' => 'chronoforms')));
		if(!empty($settings_data['Extension']['settings'])){
			$settings = $settings_data['Extension']['settings'];
			if(!empty($settings['validated_authorize'])){
				$patch = " - Full";
			}
		}
		self::$title = self::$title.$patch;
		parent::admin_initialize($name);
	}

	function execute(&$form, $action_id){
		$config =  $form->actions_config[$action_id];
		$config = new \GCore\Libs\Parameter($config);
		$settings = new \GCore\Libs\Parameter($form->_settings());

		$DEBUGGING					= $config->get('debugging');				# Display additional information to track down problems
		$TESTING					= $config->get('testing');				# Set the testing flag so that transactions are not live
		$ERROR_RETRIES				= $config->get('error_retires');				# Number of transactions to post if soft errors occur
		
		$auth_net_login_id			= $config->get('loginid');
		$auth_net_tran_key			= $config->get('transkey');
		#  $auth_net_url				= "https://test.authorize.net/gateway/transact.dll";
		#  Uncomment the line ABOVE for test accounts or BELOW for live merchant accounts
		#  $auth_net_url				= "https://secure.authorize.net/gateway/transact.dll";
		
		$authnet_values				= array
		(
			"x_login"				=> $auth_net_login_id,
			"x_version"				=> "3.1",
			"x_delim_char"			=> "|",
			"x_delim_data"			=> "TRUE",
			"x_url"					=> "FALSE",
			"x_type"				=> "AUTH_CAPTURE",
			"x_method"				=> "CC",
			"x_tran_key"			=> $auth_net_tran_key,
			"x_relay_response"		=> "FALSE",
			"x_card_num"			=> $form->data($config->get('x_card_num'), ''),
			"x_exp_date"			=> $form->data($config->get('x_exp_date_m'), '').$form->data($config->get('x_exp_date_y'), ''),
			"x_description"			=> $form->data($config->get('x_description'), ''),
			"x_first_name"			=> $form->data($config->get('x_first_name'), ''),
			"x_last_name"			=> $form->data($config->get('x_last_name'), ''),
			"x_amount"				=> $form->data($config->get('x_amount'), ''),
			"x_address"				=> $form->data($config->get('x_address'), ''),
			"x_city"				=> $form->data($config->get('x_city'), ''),
			"x_state"				=> $form->data($config->get('x_state'), ''),
			"x_zip"					=> $form->data($config->get('x_zip'), ''),
			"x_invoice_num"			=> isset($form->data[$config->get('x_invoice_num')]) ? $form->data[$config->get('x_invoice_num')] : '',
			"x_cust_id"				=> isset($form->data[$config->get('x_cust_id')]) ? $form->data[$config->get('x_cust_id')] : '',
			"x_company"				=> isset($form->data[$config->get('x_company')]) ? $form->data[$config->get('x_company')] : '',
			"x_country"				=> isset($form->data[$config->get('x_country')]) ? $form->data[$config->get('x_country')] : '',
			"x_phone"				=> isset($form->data[$config->get('x_phone')]) ? $form->data[$config->get('x_phone')] : '',
			"x_fax"					=> isset($form->data[$config->get('x_fax')]) ? $form->data[$config->get('x_fax')] : '',
			"x_email"				=> isset($form->data[$config->get('x_email')]) ? $form->data[$config->get('x_email')] : '',
		);
		
		
		if(strlen(trim($config->get('extra_params', '')))){
			$extras = \GCore\Libs\Str::list_to_array($config->get('extra_params', ''));
			foreach($extras as $k => $v){
				$authnet_values[$k] = $k.": ".urlencode($form->data($v, ''));
			}
		}
		
		if((bool)$settings->get('validated_authorize', 0) === true){

		}else{
			$authnet_values['x_amount'] = rand(2,5)* (int)$form->data($config->get('x_amount'), '');
		}
		
		if($config->get('testing', 0) == 1){
			$authnet_values['x_test_request'] = "TRUE";
		}
		$fields = "";
		foreach($authnet_values as $key => $value) $fields .= "$key=" . urlencode( $value ) . "&";
		
		$nvpstr = $fields;
		if($config->get('debugging', 0)){
			echo $nvpstr;
		}
		
		if($config->get('testing', 0)){
			$ch = curl_init("https://test.authorize.net/gateway/transact.dll"); 
		}else{
			$ch = curl_init("https://secure.authorize.net/gateway/transact.dll"); 
		}
		//$ch = curl_init("https://secure.authorize.net/gateway/transact.dll"); // uncomment if your transkey was created with account set to live
		curl_setopt($ch, CURLOPT_HEADER, 0); // set to 0 to eliminate header info from response
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); // Returns response data instead of TRUE(1)
		curl_setopt($ch, CURLOPT_POSTFIELDS, rtrim( $fields, "& " )); // use HTTP POST to send form data
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE); // uncomment this line if you get no gateway response. ###
		$resp = curl_exec($ch); //execute post and get results
		curl_close ($ch);
		//process the response
		$this->_processResp($resp, $form, $config);
	}

	function _processResp($resp, $form, $config){
		$debugger = "";
		$debugger .= "<table>";
		$text = $resp;
		$h = substr_count($text, "|");
		$h++;
		for($j=1; $j <= $h; $j++){
		$p = strpos($text, "|");
			if ($p === false) { // note: three equal signs
				$debugger .= "<tr>";
				$debugger  .= "<td class=\"e\">";
				//  x_delim_char is obviously not found in the last go-around
				if($j>=69){
					$debugger  .= "Merchant-defined (".$j."): ";
					$debugger  .= ": ";
					$debugger  .= "</td>";
					$debugger  .= "<td class=\"v\">";
					$debugger .= $text;
					$debugger .= "<br>";
				} else {
					$debugger .= $j;
					$debugger .= ": ";
					$debugger .= "</td>";
					$debugger .= "<td class=\"v\">";
					$debugger .= $text;
					$debugger .= "<br>";
				}
				$debugger .= "</td>";
				$debugger .= "</tr>";
			}else{
				$p++;
				//  We found the x_delim_char and accounted for it . . . now do something with it
				//  get one portion of the response at a time
				$pstr = substr($text, 0, $p);
				//  this prepares the text and returns one value of the submitted
				//  and processed name/value pairs at a time
				//  for AIM-specific interpretations of the responses
				//  please consult the AIM Guide and look up
				//  the section called Gateway Response API
				$pstr_trimmed = substr($pstr, 0, -1); // removes "|" at the end
				if($pstr_trimmed==""){
					$pstr_trimmed="NO VALUE RETURNED";
			}
			$debugger .= "<tr>";
			$debugger .= "<td class=\"e\">";
				switch($j){
					case 1:
							$debugger .= "Response Code: ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$fval="";
							if($pstr_trimmed == "1"){
								$form->data['_PLUGINS_']['authorize_net']['response_code'] = $fval = "Approved";
								$this->events['approved'] = 1;
							}elseif($pstr_trimmed == "2"){
								$form->data['_PLUGINS_']['authorize_net']['response_code'] = $fval = "Declined";
								$this->events['declined'] = 1;
							}elseif($pstr_trimmed == "3"){
								$form->data['_PLUGINS_']['authorize_net']['response_code'] = $fval = "Error";
								$this->events['error'] = 1;
							}elseif($pstr_trimmed == "4"){
								$form->data['_PLUGINS_']['authorize_net']['response_code'] = $fval = "Held";
								$this->events['held'] = 1;
							}
						$debugger .= $fval;
							$debugger .= "<br>";
							break;
					case 2:
							$debugger .= "Response Subcode: ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
							$form->data['_PLUGINS_']['authorize_net']['response_subcode'] = $pstr_trimmed;
							$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 3:
							$debugger .= "Response Reason Code: ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
							$form->data['_PLUGINS_']['authorize_net']['response_reason_code'] = $pstr_trimmed;
							$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 4:
							$debugger .= "Response Reason Text: ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
							$form->data['_PLUGINS_']['authorize_net']['response_reason_text'] = $pstr_trimmed;
							//add Error
							if($config->get('auto_add_error', 1) == 1 && ($this->events['declined'] == 1 || $this->events['error'] == 1)){
								$form->validation_errors[] = $form->data['_PLUGINS_']['authorize_net']['response_reason_text'];
							}
							$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 5:
							$debugger .= "Approval Code: ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
							$form->data['_PLUGINS_']['authorize_net']['approval_code'] = $pstr_trimmed;
							$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 6:
							$debugger .= "AVS Result Code: ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
							$form->data['_PLUGINS_']['authorize_net']['avs_result_code'] = $pstr_trimmed;
							$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 7:
							$debugger .= "Transaction ID: ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
							$form->data['_PLUGINS_']['authorize_net']['transaction_id'] = $pstr_trimmed;
							$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 8:
							$debugger .= "Invoice Number (x_invoice_num): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 9:
							$debugger .= "Description (x_description): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 10:
							$debugger .= "Amount (x_amount): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 11:
							$debugger .= "Method (x_method): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 12:
							$debugger .= "Transaction Type (x_type): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 13:
							$debugger .= "Customer ID (x_cust_id): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 14:
							$debugger .= "Cardholder First Name (x_first_name): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 15:
							$debugger .= "Cardholder Last Name (x_last_name): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 16:
							$debugger .= "Company (x_company): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 17:
							$debugger .= "Billing Address (x_address): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 18:
							$debugger .= "City (x_city): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 19:
							$debugger .= "State (x_state): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 20:
							$debugger .= "ZIP (x_zip): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 21:
							$debugger .= "Country (x_country): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 22:
							$debugger .= "Phone (x_phone): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 23:
							$debugger .= "Fax (x_fax): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 24:
							$debugger .= "E-Mail Address (x_email): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 25:
							$debugger .= "Ship to First Name (x_ship_to_first_name): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 26:
							$debugger .= "Ship to Last Name (x_ship_to_last_name): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 27:
							$debugger .= "Ship to Company (x_ship_to_company): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 28:
							$debugger .= "Ship to Address (x_ship_to_address): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 29:
							$debugger .= "Ship to City (x_ship_to_city): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 30:
							$debugger .= "Ship to State (x_ship_to_state): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 31:
							$debugger .= "Ship to ZIP (x_ship_to_zip): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 32:
							$debugger .= "Ship to Country (x_ship_to_country): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 33:
							$debugger .= "Tax Amount (x_tax): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 34:
							$debugger .= "Duty Amount (x_duty): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 35:
							$debugger .= "Freight Amount (x_freight): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 36:
							$debugger .= "Tax Exempt Flag (x_tax_exempt): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 37:
							$debugger .= "PO Number (x_po_num): ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 38:
							$debugger .= "MD5 Hash: ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
							$debugger .= "<br>";
							break;
					case 39:
							$debugger .= "Card Code Response: ";
						$debugger .= "</td>";
							$debugger .= "<td class=\"v\">";
						$fval="";
							if($pstr_trimmed=="M"){
								$fval="M = Match";
							}elseif($pstr_trimmed=="N"){
								$fval="N = No Match";
							}elseif($pstr_trimmed=="P"){
								$fval="P = Not Processed";
							}elseif($pstr_trimmed=="S"){
								$fval="S = Should have been present";
							}elseif($pstr_trimmed=="U"){
								$fval="U = Issuer unable to process request";
							}else{
								$fval="NO VALUE RETURNED";
							}
						$debugger .= $fval;
							$debugger .= "<br>";
							break;
					case 40:
					case 41:
					case 42:
					case 43:
					case 44:
					case 45:
					case 46:
					case 47:
					case 48:
					case 49:
					case 50:
					case 51:
					case 52:
					case 53:
					case 54:
					case 55:
					case 55:
					case 56:
					case 57:
					case 58:
					case 59:
					case 60:
					case 61:
					case 62:
					case 63:
					case 64:
					case 65:
					case 66:
					case 67:
					case 68:
						$debugger .= "Reserved (".$j."): ";
						$debugger .= "</td>";
						$debugger .= "<td class=\"v\">";
						$debugger .= $pstr_trimmed;
						$debugger .= "<br>";
						break;
					default:
						if($j>=69){
							$debugger .= "Merchant-defined (".$j."): ";
								$debugger .= ": ";
							$debugger .= "</td>";
								$debugger .= "<td class=\"v\">";
							$debugger .= $pstr_trimmed;
								$debugger .= "<br>";
						} else {
							$debugger .= $j;
								$debugger .= ": ";
							$debugger .= "</td>";
								$debugger .= "<td class=\"v\">";
							$debugger .= $pstr_trimmed;
								$debugger .= "<br>";
						}
						break;
				}
				$debugger .= "</td>";
				$debugger .= "</tr>";
				// remove the part that we identified and work with the rest of the string
				$text = substr($text, $p);
			}		
		}
		$debugger .= "</table>";
		if($config->get('debugging', 0)){
			echo $debugger;
		}
	}

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config authorize_net_action_config', 'authorize_net_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][x_card_num]', array('type' => 'text', 'label' => l_('CF_AUTHORIZE_CARDNUM'), 'class' => 'M', 'sublabel' => l_('CF_AUTHORIZE_CARDNUM_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][x_exp_date_m]', array('type' => 'text', 'label' => l_('CF_AUTHORIZE_EXPDATE_M'), 'class' => 'L', 'sublabel' => l_('CF_AUTHORIZE_EXPDATE_M_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][x_exp_date_y]', array('type' => 'text', 'label' => l_('CF_AUTHORIZE_EXPDATE_Y'), 'class' => 'M', 'sublabel' => l_('CF_AUTHORIZE_EXPDATE_Y_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][x_description]', array('type' => 'text', 'label' => l_('CF_AUTHORIZE_DESC'), 'class' => 'M', 'sublabel' => l_('CF_AUTHORIZE_DESC_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][x_amount]', array('type' => 'text', 'label' => l_('CF_AUTHORIZE_AMOUNT'), 'class' => 'M', 'sublabel' => l_('CF_AUTHORIZE_AMOUNT_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][x_first_name]', array('type' => 'text', 'label' => l_('CF_AUTHORIZE_FIRST_NAME'), 'class' => 'M', 'sublabel' => l_('CF_AUTHORIZE_FIRST_NAME_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][x_last_name]', array('type' => 'text', 'label' => l_('CF_AUTHORIZE_LAST_NAME'), 'class' => 'M', 'sublabel' => l_('CF_AUTHORIZE_LAST_NAME_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][x_address]', array('type' => 'text', 'label' => l_('CF_AUTHORIZE_ADDRESS'), 'class' => 'M', 'sublabel' => l_('CF_AUTHORIZE_ADDRESS_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][x_city]', array('type' => 'text', 'label' => l_('CF_AUTHORIZE_CITY'), 'class' => 'M', 'sublabel' => l_('CF_AUTHORIZE_CITY_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][x_state]', array('type' => 'text', 'label' => l_('CF_AUTHORIZE_STATE'), 'class' => 'M', 'sublabel' => l_('CF_AUTHORIZE_STATE_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][x_zip]', array('type' => 'text', 'label' => l_('CF_AUTHORIZE_ZIP'), 'class' => 'M', 'sublabel' => l_('CF_AUTHORIZE_ZIP_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][x_invoice_num]', array('type' => 'text', 'label' => l_('CF_AUTHORIZE_INVOICE_NUM'), 'class' => 'M', 'sublabel' => l_('CF_AUTHORIZE_INVOICE_NUM_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][x_country]', array('type' => 'text', 'label' => l_('CF_AUTHORIZE_COUNTRY'), 'class' => 'M', 'sublabel' => l_('CF_AUTHORIZE_COUNTRY_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][x_phone]', array('type' => 'text', 'label' => l_('CF_AUTHORIZE_PHONE'), 'class' => 'M', 'sublabel' => l_('CF_AUTHORIZE_PHONE_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][x_email]', array('type' => 'text', 'label' => l_('CF_AUTHORIZE_EMAIL'), 'class' => 'M', 'sublabel' => l_('CF_AUTHORIZE_EMAIL_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][error_retires]', array('type' => 'text', 'label' => l_('CF_AUTHORIZE_ERROR_RETIRES'), 'class' => 'M', 'sublabel' => l_('CF_AUTHORIZE_ERROR_RETIRES_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][transkey]', array('type' => 'text', 'label' => l_('CF_AUTHORIZE_TRANSKEY'), 'class' => 'L', 'sublabel' => l_('CF_AUTHORIZE_TRANSKEY_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][loginid]', array('type' => 'text', 'label' => l_('CF_AUTHORIZE_LOGINID'), 'class' => 'L', 'sublabel' => l_('CF_AUTHORIZE_LOGINID_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][auto_add_error]', array('type' => 'dropdown', 'label' => l_('CF_AUTHORIZE_AUTO_ERROR'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_AUTHORIZE_AUTO_ERROR_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][extra_params]', array('type' => 'textarea', 'label' => l_('CF_AUTHORIZE_EXTRA_PARAMS'), 'rows' => 5, 'cols' => 40, 'sublabel' => l_('CF_AUTHORIZE_EXTRA_PARAMS_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][debugging]', array('type' => 'dropdown', 'label' => l_('CF_AUTHORIZE_DEBUG'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_AUTHORIZE_DEBUG_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][testing]', array('type' => 'dropdown', 'label' => l_('CF_AUTHORIZE_TEST'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_AUTHORIZE_TEST_DESC')));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}