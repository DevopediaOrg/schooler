<?php
/**
* @package   Warp Theme Framework
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
*/

namespace Warp\Menu;

/**
 * Post menu renderer.
 */
class Post
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
        foreach ($element->find('a') as $ele) {

            if($type = $ele->attr("data-type")) {

                if($type=="separator") {
                    $ele->parent()->addClass("uk-nav-divider");
                    $ele->parent()->removeChild($ele);
                } else {

                    $ele->removeAttr('data-type');

                    if (!$ele->parent()->parent()->hasClass('uk-navbar-nav') && !($module->nav_settings["accordion"] && $ele->parent()->first("ul.level2"))) {

                        $ele->parent()->addClass("uk-nav-header");

                        foreach ($ele->children() as $child) {
                            $ele->parent()->prepend($child);
                        }

                        $ele->replaceWith($ele->text());
                    }

                }
            }
        }

        foreach($element->first("ul:first")->addClass($module->nav_settings["modifier"])->find('ul.level2 ul') as $ul) {
            if(!$ul->hasClass('uk-nav-sub')) $ul->removeAttr("class");
        }

        foreach ($element->find('li') as $li) {
            $li->removeAttr('data-id')->removeAttr('data-menu-active')->removeAttr('data-menu-columns')->removeAttr('data-menu-columnwidth')->removeAttr('data-menu-icon')->removeAttr('data-menu-image')->removeAttr('data-menu-subtitle');
            $li->removeClass("level1")
               ->removeClass("level2")
               ->removeClass("level3")
               ->removeClass("level4")
            ->parent()
               ->removeClass("level1")
               ->removeClass("level2")
               ->removeClass("level3")
               ->removeClass("level4");
        }

        return $element;
    }
}
