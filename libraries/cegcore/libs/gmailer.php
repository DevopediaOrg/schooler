<?php
namespace GCore\Libs;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
class GMailer{
	protected $_wrap = 70;
	protected $_to = NULL;
	protected $_subject = NULL;
	protected $_message = NULL;
	protected $_headers = array();
	protected $_additionalParameters	= NULL;
	protected $_throwExceptions = FALSE;
	protected $_attachment = array();
	protected $_attachmentPath = array();
	protected $_attachmentFilename = array();
	
	public function __construct($throwExceptions = FALSE){
		$this->_headers = array();
		$this->setThrowExceptions($throwExceptions);
	}
	
	public function setThrowExceptions($bool = FALSE){
		if ( ! is_bool($bool) && $this->_throwExceptions) {
			throw new InvalidArgumentException('First parameter must be boolean');
		}	
		$this->_throwExceptions = $bool;
	}

	public function setTo($email, $name, $addHeader = FALSE){
		if ( ! is_string($email) && $this->_throwExceptions) {
			throw new InvalidArgumentException();
		}
		
		if ( ! is_string($name) && $this->_throwExceptions) {
			throw new InvalidArgumentException();
		}
		
		if ( ! is_bool($addHeader) && $this->_throwExceptions) {
			throw new InvalidArgumentException();
		}
		
		$this->_to = $this->_formatHeader($email, $name);
		if ( $addHeader ) $this->addMailHeader('To', $email, $name);
		return $this;
	}
	
	public function setSubject($subject){
		if ( ! is_string($subject) && $this->_throwExceptions) {
			throw new InvalidArgumentException();
		}
		
		$this->_subject = $this->_filterOther($subject);
		return $this;
	}
	
	public function setMessage($message){
		if ( ! is_string($message) && $this->_throwExceptions) {
			throw new InvalidArgumentException();
		}
		
		$this->_message = str_replace("\n.", "\n..", $message);
		return $this;
	}
	
	public function addAttachment($path, $filename = NULL){
		$this->_attachmentPath[] = $path;
		$this->_attachmentFilename[] = empty($filename) ? basename($path) : $filename;
		
		$fileSize = filesize($path);
		$handle = fopen($path, "r");
		$attachment = fread($handle, $fileSize);
		fclose($handle);
		$this->_attachment[] = chunk_split(base64_encode($attachment));

		return $this;
	}
	
	public function setFrom($email, $name){
		if ( ! is_string($email) && $this->_throwExceptions) {
			throw new InvalidArgumentException();
		}
		
		if ( ! is_string($name) && $this->_throwExceptions) {
			throw new InvalidArgumentException();
		}
		
		$this->addMailHeader('From', $email, $name);
		return $this;
	}
	
	public function addMailHeader($header, $email = NULL, $name = NULL){
		if ( ! is_string($header) && $this->_throwExceptions) {
			throw new InvalidArgumentException();
		}
		
		if ( ! is_string($email) && $this->_throwExceptions) {
			throw new InvalidArgumentException();
		}
		
		if ( ! is_string($name) && $this->_throwExceptions) {
			throw new InvalidArgumentException();
		}
		
		$this->_headers[] = "$header: " . $this->_formatHeader($email, $name);		
		return $this;
	}
	
	public function addGenericHeader($header, $value){
		if ( ! is_string($header) && $this->_throwExceptions) {
			throw new InvalidArgumentException();
		}
		
		if ( ! is_string($value) || ! is_string($value) && $this->_throwExceptions) {
			throw new InvalidArgumentException();
		}
		
		$this->_headers[] = "$header: $value";
		return $this;
	}
	
	public function setAdditionalParameters($additionalParameters){
		if ( ! is_string($additionalParameters) && $this->_throwExceptions) {
			throw new InvalidArgumentException();
		}
		
		$this->_additionalParameters = $additionalParameters;
		return $this;
	}
	
	public function setWrap($wrap = 70){
		if ( ! is_int($wrap) && $wrap < 1 && $this->_throwExceptions) {
			throw new InvalidArgumentException('Wrap must be an integer larger than 0');
		}
		
		$this->_wrap = $wrap;
		return $this;
	}
	
	public function send(){	
		$headers = ( !empty($this->_headers) ) ? join("\r\n", $this->_headers) : array();
		
		if ( ! empty($this->_attachment)) {
			$uid = md5(uniqid(time()));
			$headers .= "MIME-Version: 1.0\r\n";
			$headers .= "Content-Type: multipart/mixed; boundary=\"".$uid."\"\r\n\r\n";
			$headers .= "This is a multi-part message in MIME format.\r\n";
			$headers .= "--".$uid."\r\n";
			$headers .= "Content-type:text/html; charset=\"utf-8\"\r\n";
			$headers .= "Content-Transfer-Encoding: 7bit\r\n\r\n";
			$headers .= $this->_message."\r\n\r\n";
			$headers .= "--".$uid."\r\n";
			
			foreach ($this->_attachmentFilename as $key => $value) {
				$headers .= "Content-Type: application/octet-stream; name=\"".$value."\"\r\n";
				$headers .= "Content-Transfer-Encoding: base64\r\n";
				$headers .= "Content-Disposition: attachment; filename=\"".$value."\"\r\n\r\n";
				$headers .= $this->_attachment[$key]."\r\n\r\n";
				$headers .= "--".$uid."\r\n";
			}
			$send = mail($this->_to, $this->_subject, "", $headers, $this->_additionalParameters);
		}
		else {
			$send = mail($this->_to, $this->_subject, wordwrap($this->_message, $this->_wrap), $headers, $this->_additionalParameters);
		}
		
		if ( ! $send && $this->_throwExceptions) {
			throw new Exception('Email failed to send');
		}
		
		if ( ! $send) {
			return false;
		}
		
		return true;
	}
	
	protected function _formatHeader($email, $name){
		$name	= $this->_filterName($name);
		$email	= $this->_filterEmail($email);
		return sprintf('%s <%s>', $name, $email);
	}
	
	protected function _filterEmail($email){
		$rule = array("\r" => '',
					  "\n" => '',
					  "\t" => '',
					  '"'  => '',
					  ','  => '',
					  '<'  => '',
					  '>'  => '',
		);

		$email = strtr($email, $rule);
		$email = filter_var($email, FILTER_SANITIZE_EMAIL);

		return $email;
	}

	protected function _filterName($name){
		$rule = array("\r" => '',
					  "\n" => '',
					  "\t" => '',
					  '"'  => "'",
					  '<'  => '[',
					  '>'  => ']',
		);

		return trim(strtr(filter_var($name, FILTER_SANITIZE_STRING, FILTER_FLAG_STRIP_HIGH), $rule));
	}

	protected function _filterOther($data){
		$rule = array("\r" => '',
					  "\n" => '',
					  "\t" => '',
		);

		return strtr(filter_var($data, FILTER_SANITIZE_STRING, FILTER_FLAG_STRIP_HIGH), $rule);
	}

}