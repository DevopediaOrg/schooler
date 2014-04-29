<?php
/**
* @package   Warp Theme Framework
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
*/

namespace Warp\Menu;

/**
 * Nav menu renderer.
 */
class Nav
{
    /**
     * Process menu
     *
     * @param  object $module
     * @param  object $element
     * @return object
     */
    public function process($module, $element)
    {
        $ul = $element->first('ul:first')->attr('class', 'uk-nav');

        if($module->nav_settings["accordion"]) {

            $ul->addClass("uk-nav-parent-icon")->addClass("uk-nav-side")->attr("data-uk-nav", "{}");

            foreach($ul->find("ul.level2") as $list) {

                if ($list->prev()->tag() == 'a' && !$list->prev()->attr("href")) {
                    $list->prev()->attr("href", "#");
                }

                $list->addClass("uk-nav-sub");
            }
        } else {

            foreach($ul->find("ul.level2") as $list) {
                $list->addClass("uk-nav-sub");
            }
        }

        if($module->position == "offcanvas") {

            foreach($element->find("a") as $span) {

                if ($span->attr("data-type")) {
                    $span->removeAttr("data-type")->removeAttr("class");
                }
            }
        }

        return $element;
    }
}