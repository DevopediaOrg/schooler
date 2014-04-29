<?php
/**
* @package   Warp Theme Framework
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
*/

namespace Warp\Menu;

/**
 * Navbar menu renderer.
 */
class Navbar
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
        $element->first('ul:first')->attr('class', 'uk-navbar-nav');

        foreach ($element->find('ul.level2') as $ul) {

            // get parent li
            $li = $ul->parent();

            // get columns
            $columns = (int) $li->attr('data-menu-columns');

            if ($columns > 1) {

                $i = 0;
                $column = -1;
                $children = $ul->children('li');

                if ($children->length > $columns) {
                    $remainder = $children->length % $columns;
                    $colrows = ($children->length - $remainder) / $columns;
                } else {
                    $remainder = 0;
                    $colrows = 1;
                }

                foreach ($children as $child) {

                    if ($i-- == 0) {
                        $i = $remainder-- > 0 ? $colrows : $colrows - 1;
                        $column++;
                    }

                    if ($li->children('ul')->length == $column) {
                        $li->append('<ul class="level2"></ul>');
                    }

                    if ($column > 0) {
                       $li->children('ul')->item($column)->append($child);
                    }
                }

                $columns = $column + 1;

            } else {
                $columns = 1;
            }

            // get width
            $width = (int) $li->attr('data-menu-columnwidth');
            $style = $width > 0 ? sprintf(' style="width:%spx;"', $columns * $width) : null;

            // append dropdown divs
            $li->append(sprintf('<div class="uk-dropdown uk-dropdown-navbar uk-dropdown-width-%d"%s><div class="uk-grid"></div></div>', $columns, $style));
            $div = $li->first('div.uk-dropdown div.uk-grid');

            foreach ($li->children('ul') as $i => $u) {
                $u->addClass("uk-nav uk-nav-navbar");
                $div->append(sprintf('<div class="uk-width-1-%d"></div>', $columns))->children('div')->item($i)->append($u);
            }
        }

        foreach ($element->find('li.level1') as $li) {
            $li->attr("data-uk-dropdown", "{}");

            if ($li->attr('data-menu-subtitle')) {
                $li->first("a")->addClass('uk-navbar-nav-subtitle');
            }
        }

        foreach($element->find("ul.level3") as $list) {
            $list->addClass("uk-nav-sub");
        }

        return $element;
    }
}
