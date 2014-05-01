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
class Mailer {

	public static function send($to = array(), $subject = '', $body = '', $attachments = array(), $other = array()){
		require_once(\GCore\C::get('GCORE_FRONT_PATH').'vendors'.DS.'phpmailer'.DS.'class.phpmailer.php');

		$mail = new \PHPMailer();
		$mail->CharSet = 'UTF-8';
		//get recipients
		foreach((array)$to as $address){
			$mail->AddAddress(trim($address));
		}
		//subject
		$mail->Subject = $subject;
		//reply to
		$reply_name = !empty($other['reply_name']) ? $other['reply_name'] : Base::getConfig('mail_reply_name');
		$reply_email = !empty($other['reply_email']) ? $other['reply_email'] : Base::getConfig('mail_reply_email');
		if(!empty($reply_name) AND !empty($reply_email)){
			$mail->AddReplyTo($reply_email, $reply_name);
		}
		//from
		$from_name = !empty($other['from_name']) ? $other['from_name'] : Base::getConfig('mail_from_name');
		$from_email = !empty($other['from_email']) ? $other['from_email'] : Base::getConfig('mail_from_email');
		$mail->SetFrom($from_email, $from_name);

		//set custom headers
		if(!empty($other['custom'])){
			foreach($other['custom'] as $k => $v){
				$mail->addCustomHeader($k.': '.$v);
			}
		}
		
		//set CC and BCC
		if(!empty($other['cc'])){
			foreach($other['cc'] as $k => $cc){
				$mail->addCC($cc);
			}
		}
		if(!empty($other['bcc'])){
			foreach($other['bcc'] as $k => $bcc){
				$mail->addBCC($bcc);
			}
		}

		if((bool)Base::getConfig('smtp', 0) === true){
			$mail->IsSMTP();
			$mail->SMTPAuth = true;
			if(Base::getConfig('smtp_secure')){
				$mail->SMTPSecure = Base::getConfig('smtp_secure');
			}
			$mail->Host       = Base::getConfig('smtp_host');
			$mail->Port       = Base::getConfig('smtp_port');
			$mail->Username   = Base::getConfig('smtp_username');
			$mail->Password   = Base::getConfig('smtp_password');
		}
		/*
		if(Base::getConfig('mail_method', 'phpmail') == 'sendmail'){
			$mail->IsSendmail();
		}
		*/
		if(!isset($other['type']) OR $other['type'] == 'html'){
			$mail->AltBody = 'To view the message, please use an HTML compatible email viewer!'; // optional - MsgHTML will create an alternate automatically
			//$body = nl2br($body);
			//$mail->MsgHTML($body);
			$mail->Body = $body;
			$mail->IsHTML(true);
		}else{
			$mail->Body = $body;
			$mail->IsHTML(false);
		}

		//attachments
		foreach((array)$attachments as $attachment){
			$mail->AddAttachment($attachment);
		}

		if(!$mail->Send()){
			$session = Base::getSession();
			$session->setFlash('warning', 'Mailer Error: '.$mail->ErrorInfo);
			return false;
		}

		return true;
	}
}