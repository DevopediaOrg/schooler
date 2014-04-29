<?php
/**
* @package   Warp Theme Framework
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
*/

function renderMessage($msgList) {

    // Build the return string
    $buffer = array();

    // If messages exist render them
    if (is_array($msgList)) {

        foreach ($msgList as $type => $msgs) {

            // types: warning, error, notice, message

            $msgtype = $type;

            if($msgtype=='message') $msgtype = "success";
            if($msgtype=='error')   $msgtype = "danger";

            $buffer[] = '<div class="uk-alert uk-alert-large uk-alert-'.$msgtype.'" data-uk-alert>';

            // This requires JS so we should add it trough JS. Progressive enhancement and stuff.
            $buffer[] = '<button type="button" class="uk-alert-close uk-close"></button>';

            if (count($msgs)) {

                $buffer[] = '<h2>' . JText::_($type) . '</h2>';

                foreach ($msgs as $msg) {
                    $buffer[] = '<p>'.$msg.'</p>';
                }
            }

            $buffer[] = '</div>';
        }
    }

    return implode("\n", $buffer);
}