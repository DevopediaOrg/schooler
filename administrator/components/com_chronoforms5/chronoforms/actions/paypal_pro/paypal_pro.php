<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\PaypalPro;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class PaypalPro extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'PayPal Pro';
	static $group = array('payments' => 'Payment Processors');
	var $events = array('success' => 0, 'fail' => 0);

	var $defaults = array(
		'AMT' => '',
		'PAYMENTACTION' => 'Sale',
		'CREDITCARDTYPE' => '',
		'ACCT' => '',
		'EXPDATE_m' => '',
		'EXPDATE_y' => '',
		'CVV2' => '',
		'FIRSTNAME' => '',
		'LASTNAME' => '',
		'STREET' => '',
		'CITY' => '',
		'STATE' => '',
		'ZIP' => '',
		'COUNTRYCODE' => '',
		'CURRENCYCODE' => '',
		'API_USERNAME' => '',
		'API_PASSWORD' => '',
		'API_SIGNATURE' => '',
		'USE_PROXY' => 0,
		'PROXY_HOST' => '',
		'PROXY_PORT' => '',
		'debugging' => 0,
		'sandbox' => 0,
		'extra_params' => ''
	);
	
	public static function admin_initialize($name){
		$patch = " - Trial";
		$settings_model = new \GCore\Admin\Models\Extension();
		$settings_data = $settings_model->find('first', array('conditions' => array('name' => 'chronoforms')));
		if(!empty($settings_data['Extension']['settings'])){
			$settings = $settings_data['Extension']['settings'];
			if(!empty($settings['validated_paypal'])){
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

		$this->_DEBUGGING = $config->get('debugging', 0);
		$this->_TESTING = $config->get('sandbox', 0);

		$this->_API_UserName = $config->get('API_USERNAME');
		$this->_API_Password = $config->get('API_PASSWORD');
		$this->_API_Signature = $config->get('API_SIGNATURE');
		//$API_ENDPOINT			= $config->get('API_ENDPOINT');
		if((int)$config->get('sandbox', 0) == 1){
			$this->_API_Endpoint = 'https://api-3t.sandbox.paypal.com/nvp';
		}else{
			$this->_API_Endpoint = 'https://api-3t.paypal.com/nvp';
		}
		if((int)$config->get('USE_PROXY') == 1){
			$this->_USE_PROXY = TRUE;
		}else{
			$this->_USE_PROXY = FALSE;
		}
		$this->_PROXY_HOST = $config->get('PROXY_HOST', '');
		$this->_PROXY_PORT = $config->get('PROXY_PORT', '');
		//$PAYPAL_URL			= $config->get('PAYPAL_URL;
		$this->_version = '56.0';

		$paypal_values = array(
			"PAYMENTACTION"	=> urlencode($config->get('PAYMENTACTION', 'Sale') ),
			"EXPDATE" => str_pad(urlencode($form->data($config->get('EXPDATE_m'))), 2, '0', STR_PAD_LEFT).urlencode($form->data($config->get('EXPDATE_y'))),
			"AMT" => urlencode($form->data($config->get('AMT'))),
			"CREDITCARDTYPE" => urlencode($form->data($config->get('CREDITCARDTYPE'))),
			"ACCT" => urlencode($form->data($config->get('ACCT'))),
			"CVV2" => urlencode($form->data($config->get('CVV2'))),
			"FIRSTNAME" => urlencode($form->data($config->get('FIRSTNAME'))),
			"LASTNAME" => urlencode($form->data($config->get('LASTNAME'))),
			"STREET" => urlencode($form->data($config->get('STREET'))),
			"CITY" => urlencode($form->data($config->get('CITY'))),
			"STATE" => urlencode($form->data($config->get('STATE'))),
			"ZIP" => urlencode($form->data($config->get('ZIP'))),
			"COUNTRYCODE" => urlencode($form->data($config->get('COUNTRYCODE'))),
			"CURRENCYCODE" => urlencode($form->data($config->get('CURRENCYCODE')))
		);

		if(strlen(trim($config->get('extra_params', '')))){
			$extras = \GCore\Libs\Str::list_to_array($config->get('extra_params', ''));
			foreach($extras as $k => $v){
				$paypal_values[$k] = $k.": ".urlencode($form->data($v, ''));
			}
		}
		if((bool)$settings->get('validated_paypal', 0) === true){

		}else{
			$paypal_values["AMT"] = rand(2,5) * $paypal_values["AMT"];
		}

		$fields = "";
		foreach($paypal_values as $key => $value ){
			$fields .= "&$key=" .$value;
		}

		if((int)$config->get('sandbox', 0)){
			$PAYPAL_URL = 'https://www.sandbox.paypal.com/webscr&cmd=_express-checkout&token=';
		}else{
			$PAYPAL_URL = 'https://www.paypal.com/webscr&cmd=_express-checkout&token=';
		}

		/* Construct the request string that will be sent to PayPal.
		   The variable $nvpstr contains all the variables and is a
		   name value pair string with & as a delimiter */
		$nvpstr = $fields;
		if($config->get('debugging', 0) == 1){
			echo $nvpstr;
		}

		/* Make the API call to PayPal, using API signature.
		   The API response is stored in an associative array called $resArray */
		$resArray = $this->hash_call("doDirectPayment", $nvpstr);

		$form->data['paypal_pro']['transaction_id'] = isset($resArray['TRANSACTIONID']) ? $resArray['TRANSACTIONID'] : '';
		$form->data['paypal_pro']['error_message'] = $resArray['L_LONGMESSAGE0'];
		$form->data['paypal_pro']['error_code'] = $resArray['L_ERRORCODE0'];
		$form->data['paypal_pro']['correlation_id'] = $resArray['CORRELATIONID'];
		$form->data['paypal_pro']['avs_code'] = isset($resArray['AVSCODE']) ? $resArray['AVSCODE'] : '';
		/* Display the API response back to the browser.
		   If the response from PayPal was a success, display the response parameters'
		   If the response was an error, display the errors received using APIError.php.
		   */
		$ack = strtoupper($resArray["ACK"]);
		$form->data['paypal_pro']['payment_status'] = $ack;
		//set the events
		if($ack != "SUCCESS"){
			$this->events['fail'] = 1;
		}else{
			$this->events['success'] = 1;
		}
		//do the debug
		if((int)$config->get('debugging', 0) == 1){
			if($ack!="SUCCESS"){
				$_SESSION['reshash'] = $resArray;
				$this->APIERROR($resArray);
			}else{
				$_SESSION['reshash'] = $resArray;
				$this->APISUCCESS($resArray);
			}
		}
	}

	function hash_call($methodName,$nvpStr){
		//setting the curl parameters.
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $this->_API_Endpoint);
		curl_setopt($ch, CURLOPT_VERBOSE, 1);

		//turning off the server and peer verification(TrustManager Concept).
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);

		curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
		curl_setopt($ch, CURLOPT_POST, 1);
		//if USE_PROXY constant set to TRUE in Constants.php, then only proxy will be enabled.
		//Set proxy name to PROXY_HOST and port number to PROXY_PORT in constants.php
		if($this->_USE_PROXY)
		curl_setopt ($ch, CURLOPT_PROXY, $this->_PROXY_HOST.":".$this->_PROXY_PORT);

		//NVPRequest for submitting to server
		$nvpreq="METHOD=".urlencode($methodName)."&VERSION=".urlencode($this->_version)."&PWD=".urlencode($this->_API_Password)."&USER=".urlencode($this->_API_UserName)."&SIGNATURE=".urlencode($this->_API_Signature).$nvpStr;

		//setting the nvpreq as POST FIELD to curl
		curl_setopt($ch,CURLOPT_POSTFIELDS,$nvpreq);

		//getting response from server
		$response = curl_exec($ch);

		//convrting NVPResponse to an Associative Array
		$nvpResArray=$this->deformatNVP($response);
		$nvpReqArray=$this->deformatNVP($nvpreq);
		$_SESSION['nvpReqArray']=$nvpReqArray;

		if(curl_errno($ch)){
			// moving to display page to display curl errors
			$_SESSION['curl_error_no']=curl_errno($ch) ;
			$_SESSION['curl_error_msg']=curl_error($ch);
			//$this->APIERROR($resArray);
		} else {
			//closing the curl
			curl_close($ch);
		}

		return $nvpResArray;
	}

	/** This function will take NVPString and convert it to an Associative Array and it will decode the response.
	  * It is usefull to search for a particular key and displaying arrays.
	  * @nvpstr is NVPString.
	  * @nvpArray is Associative Array.
	  */

	function deformatNVP($nvpstr){
		$intial = 0;
		$nvpArray = array();

		while(strlen($nvpstr)){
			//postion of Key
			$keypos = strpos($nvpstr,'=');
			//position of value
			$valuepos = strpos($nvpstr,'&') ? strpos($nvpstr,'&'): strlen($nvpstr);

			/*getting the Key and Value values and storing in a Associative Array*/
			$keyval=substr($nvpstr,$intial,$keypos);
			$valval=substr($nvpstr,$keypos+1,$valuepos-$keypos-1);
			//decoding the respose
			$nvpArray[urldecode($keyval)] =urldecode( $valval);
			$nvpstr=substr($nvpstr,$valuepos+1,strlen($nvpstr));
		 }
		return $nvpArray;
	}

	function APIERROR($resArray){
	?>
		<table width="700">
			<tr>
				<td colspan="2" class="header">The PayPal API has returned an error!</td>
			</tr>
			<?php  //it will print if any URL errors
				if(isset($_SESSION['curl_error_no'])){
					$errorCode = $_SESSION['curl_error_no'] ;
					$errorMessage = $_SESSION['curl_error_msg'] ;
					session_unset();
			?>
				<tr>
					<td>Error Number:</td>
					<td><?php $errorCode ?></td>
				</tr>
				<tr>
					<td>Error Message:</td>
					<td><?php $errorMessage ?></td>
				</tr>
			</table>
			<?php } else {

			/* If there is no URL Errors, Construct the HTML page with
			   Response Error parameters.
			   */
			?>
				<tr>
					<td>Ack:</td>
					<td><?php $resArray['ACK'] ?></td>
				</tr>
				<tr>
					<td>Correlation ID:</td>
					<td><?php $resArray['CORRELATIONID'] ?></td>
				</tr>
				<tr>
					<td>Version:</td>
					<td><?php $resArray['VERSION']?></td>
				</tr>
			<?php
				$count=0;
				while (isset($resArray["L_SHORTMESSAGE".$count])) {
					  $errorCode    = $resArray["L_ERRORCODE".$count];
					  $shortMessage = $resArray["L_SHORTMESSAGE".$count];
					  $longMessage  = $resArray["L_LONGMESSAGE".$count];
					  $count=$count+1;
			?>
				<tr>
					<td>Error Number:</td>
					<td><?php $errorCode ?></td>
				</tr>
				<tr>
					<td>Short Message:</td>
					<td><?php $shortMessage ?></td>
				</tr>
				<tr>
					<td>Long Message:</td>
					<td><?php $longMessage ?></td>
				</tr>

			<?php }//end while
			}// end else
			?>
		</table>
	<?php
	}

	function APISUCCESS($resArray){
	?>
		<table width = 400>
			<tr>
				<td>
					Transaction ID:</td>
				<td><?php $resArray['TRANSACTIONID'] ?></td>
			</tr>
			<tr>
				<td>
					Amount:</td>
				<td><?php $currencyCode?> <?php $resArray['AMT'] ?></td>
			</tr>
			<tr>
				<td>
					AVS:</td>
				<td><?php $resArray['AVSCODE'] ?></td>
			</tr>
			<tr>
				<td>
					CVV2:</td>
				<td><?php $resArray['CVV2MATCH'] ?></td>
			</tr>
		</table>
	<?php
	}

	public static function config(){
		echo \GCore\Helpers\Html::formStart('action_config paypal_redirect_action_config', 'paypal_redirect_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		//echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][enabled]', array('type' => 'dropdown', 'label' => l_('CF_ENABLED'), 'options' => array(0 => l_('NO'), 1 => l_('YES'))));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][PAYMENTACTION]', array('type' => 'hidden', /*'label' => l_('CF_PAYPAL_PAYMENTACTION'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_PAYMENTACTION_DESC')*/));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][CREDITCARDTYPE]', array('type' => 'text', 'label' => l_('CF_PAYPAL_CREDITCARDTYPE'), 'class' => 'L', 'sublabel' => l_('CF_PAYPAL_CREDITCARDTYPE_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][ACCT]', array('type' => 'text', 'label' => l_('CF_PAYPAL_ACCT'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_ACCT_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][AMT]', array('type' => 'text', 'label' => l_('CF_PAYPAL_AMOUNT'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_AMOUNT_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][CURRENCYCODE]', array('type' => 'text', 'label' => l_('CF_PAYPALPRO_CURRENCY_CODE'), 'class' => 'M', 'sublabel' => l_('CF_PAYPALPRO_CURRENCY_CODE_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][CVV2]', array('type' => 'text', 'label' => l_('CF_PAYPAL_CVV2'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_CVV2_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][FIRSTNAME]', array('type' => 'text', 'label' => l_('CF_PAYPAL_FNAME'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_FNAME_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][LASTNAME]', array('type' => 'text', 'label' => l_('CF_PAYPAL_LNAME'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_LNAME_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][STREET]', array('type' => 'text', 'label' => l_('CF_PAYPAL_ADD1'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_ADD1_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][CITY]', array('type' => 'text', 'label' => l_('CF_PAYPAL_CITY'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_CITY_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][STATE]', array('type' => 'text', 'label' => l_('CF_PAYPAL_STATE'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_STATE_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][ZIP]', array('type' => 'text', 'label' => l_('CF_PAYPAL_ZIP'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_ZIP_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][COUNTRYCODE]', array('type' => 'text', 'label' => l_('CF_PAYPAL_COUNTRY'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_COUNTRY_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][EXPDATE_m]', array('type' => 'text', 'label' => l_('CF_PAYPAL_EXPDATE_m'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_EXPDATE_m_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][EXPDATE_y]', array('type' => 'text', 'label' => l_('CF_PAYPAL_EXPDATE_y'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_EXPDATE_y_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][API_USERNAME]', array('type' => 'text', 'label' => l_('CF_PAYPAL_API_USERNAME'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_API_USERNAME_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][API_PASSWORD]', array('type' => 'text', 'label' => l_('CF_PAYPAL_API_PASSWORD'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_API_PASSWORD_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][API_SIGNATURE]', array('type' => 'text', 'label' => l_('CF_PAYPAL_API_SIGNATURE'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_API_SIGNATURE_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][USE_PROXY]', array('type' => 'dropdown', 'label' => l_('CF_PAYPAL_USE_PROXY'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_PAYPAL_USE_PROXY_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][PROXY_HOST]', array('type' => 'text', 'label' => l_('CF_PAYPAL_PROXY_HOST'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_PROXY_HOST_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][PROXY_PORT]', array('type' => 'text', 'label' => l_('CF_PAYPAL_PROXY_PORT'), 'class' => 'M', 'sublabel' => l_('CF_PAYPAL_PROXY_PORT_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][extra_params]', array('type' => 'textarea', 'label' => l_('CF_PAYPAL_EXTRA_PARAMS'), 'rows' => 5, 'cols' => 40, 'sublabel' => l_('CF_PAYPAL_EXTRA_PARAMS_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][debugging]', array('type' => 'dropdown', 'label' => l_('CF_PAYPALPRO_DEBUG'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_PAYPALPRO_DEBUG_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][sandbox]', array('type' => 'dropdown', 'label' => l_('CF_PAYPAL_SANDBOX'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_PAYPAL_SANDBOX_DESC')));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}