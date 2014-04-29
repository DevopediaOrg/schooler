<?php
/**
* @package   Warp Theme Framework
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
*/

namespace Warp\Joomla\Helper;

use Warp\Warp;
use Warp\Helper\AbstractHelper;

/**
 * Option helper class, store option data.
 */
class OptionHelper extends AbstractHelper
{
   /**
    * Option file path.
    *
    * @var string
    */
	protected $file;

    /**
     * @var array
     */
	protected $data;

	/**
	 * Constructor.
	 */
    public function __construct(Warp $warp)
    {
        parent::__construct($warp);

		// load data
		$this->file = $this['system']->cache_path.sprintf('/%s.php', basename($this['path']->path('theme:')));
		$this->data = (file_exists($this->file) and $data = json_decode(file_get_contents($this->file), true) and is_array($data)) ? $data : array();
	}

	/**
	 * Get a value from data
	 *
	 * @param  string $name
	 * @param  mixed $default
	 * @return mixed
	 */
	public function get($name, $default = null)
	{
        return isset($this->data[$name]) ? $this->data[$name] : $default;
	}

	/**
	 * Set a value
	 *
	 * @param sting $name
	 * @param mixed $value
	 */
	public function set($name, $value)
	{
		$this->data[$name] = $value;
        $json = json_encode($this->data, defined('JSON_PRETTY_PRINT') ? JSON_NUMERIC_CHECK|JSON_PRETTY_PRINT : JSON_NUMERIC_CHECK);
        \JFile::write($this->file, $json);
	}
}
