<p>Customize your menu appearance. To configure your menus, please visit the <a href="<?php echo JRoute::_('index.php?option=com_menus') ?>">menu settings</a> screen.</p>

<div id="menus">

    <select data-menu-filter>
        <?php foreach ($menus = \JHtml::_('menu.menus') as $menu) : ?>
            <option value="<?php echo $menu->value ?>"><?php echo $menu->text ?></option>
        <?php endforeach ?>
    </select>

    <hr class="uk-article-divider">

    <?php
    foreach ($menus as $menu) :
        if (!$items = \JMenu::getInstance('site')->getItems(array('menutype', 'access', 'language'), array($menu->value, null, null))) continue;
    ?>
    <table data-menu="<?php echo $menu->value ?>" class="uk-table uk-table-hover uk-table-middle tm-table">
        <thead>
            <tr>
                <th><?php echo $menu->text ?></th>
                <?php foreach ($node->children('field') as $field) : ?>
                <th data-uk-tooltip="{pos:'left'}" title="<?php echo $field->attr('tooltip') ?>"><?php echo $field->attr('label') ?: $field->attr('column') ?></th>
                <?php endforeach ?>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($items as $item) : ?>
            <tr data-level="<?php echo $item->level?>">
                <td><?php echo $item->title ?></td>
                <?php foreach ($node->find('field') as $field) : ?>
                <td>
                    <?php
                    if (!$field->attr('max-depth') || $field->attr('max-depth') >= $item->level) {

                        $fname = $field->attr('name');
                        $fvalue = $config->get("menus.{$item->id}.{$fname}", $field->attr('default'));

                        echo $this['field']->render($field->attr('type'), "menus[{$item->id}][{$fname}]", $fvalue, $field, compact('item'));
                    }
                    ?>
                </td>
                <?php endforeach ?>
            </tr>
            <?php endforeach ?>
        </tbody>
    </table>
    <?php endforeach ?>
</div>