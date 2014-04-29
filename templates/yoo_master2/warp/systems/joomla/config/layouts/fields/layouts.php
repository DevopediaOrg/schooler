<?php
/**
* @package   Warp Theme Framework
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
*/

// get menu data
require_once($this['path']->path('admin:/components/com_menus/helpers/menus.php'));
$menus = \MenusHelper::getMenuLinks();

// get layout data
$layouts = $config->get('layouts', array('default' => array()));

?>

<div id="layout" data-field-name="<?php echo $name ?>">

    <p>
        Store your modifications in a layout profile and assign it to different pages. The <em>default</em> layout will be used on pages without an assigned layout.
    </p>

    <p>
        <select data-layout-selector class="uk-form-width-small">
            <?php foreach (array_keys($layouts) as $layout) : ?>
                <option value="<?php echo $layout ?>"><?php echo $layout ?></option>
            <?php endforeach ?>
        </select>

        <a data-action="add" class="uk-button" href="#">Add</a>
        <a data-action="rename" class="uk-button" href="#">Rename</a>
        <a data-action="remove" class="uk-button" href="#">Remove</a>

    </p>

    <?php foreach ($layouts as $layout => $values) : ?>
    <div data-layout="<?php echo $layout ?>">

        <?php echo $this->render('config:layouts/fields', array('config' => $config, 'fields' => $node, 'values' => $values, 'prefix' => "{$name}[{$layout}]", 'attr' => array('data-layout' => $layout))) ?>

        <hr data-assignment class="uk-article-divider">

        <h2 data-assignment>Assignment</h2>

        <p data-assignment>Assign this layout to menu items.</p>

        <div data-assignment class="uk-scrollable-box uk-margin-top tm-width tm-scrollable-box">

            <?php foreach ($menus as $menu) : ?>
            <h2 class="uk-h3 uk-margin-bottom-remove"><?php echo $menu->title ?></h2>
            <ul class="uk-list">
            <?php foreach ($menu->links as $i => $link) : ?>
                <li>
                    <label>
                        <input value="<?php echo $link->value ?>" name="<?php echo "{$name}[{$layout}][assignment][]" ?>" type="checkbox"<?php if (@in_array($link->value, $layouts[$layout]['assignment'])) echo ' checked="checked"' ?>> <?php echo ltrim($link->text, '- ') ?>
                    </label>
                    <?php
                    $diff = isset($menu->links[$i + 1]) ? $menu->links[$i + 1]->level - $link->level : 1 - $link->level;
                    if ($diff > 0) {
                        echo "<ul class=\"uk-list\">\n";
                    } elseif ($diff < 0) {
                        echo "</li>\n" . str_repeat("</ul>\n</li>\n", abs($diff));
                    } else {
                        echo "</li>\n";
                    }
                    ?>
                <?php endforeach ?>
                </ul>
            <?php endforeach ?>
        </div>
    </div>
    <?php endforeach ?>
</div>