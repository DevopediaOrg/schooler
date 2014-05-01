<?php
/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
namespace GCore\Admin\Extensions\Chronoforms\Actions\EventSwitcher;
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
Class EventSwitcher extends \GCore\Admin\Extensions\Chronoforms\Action{
	static $title = 'Event Switcher';
	static $group = array('validation' => 'Validation');

	var $events = array('success' => 0, 'fail' => 0);
	var $defaults = array(
		'events' => 'success,fail',
		'content' => '',
	);

	function execute(&$form, $action_id){
		$config =  $form->actions_config[$action_id];
		$config = new \GCore\Libs\Parameter($config);
		$content = $config->get('content', '');
		$return = eval('?>'.$content);
		$this->events[$return] = 1;
	}

	public static function config($configs = array(), $extra_config = array()){
		?>
		<script>
			function event_switcher_load_events(elem, SID){
				var events = jQuery('#event_switcher_events_'+SID).val().split(',');
				//delete existing events
				jQuery('#cfaction_event_switcher_element_'+SID).find('.form_event').remove();
				var events_html = '';
				var events_path = jQuery('#cfaction_event_switcher_element_'+SID).children('.panel-body').children('.events_dna').first().attr('name');
				jQuery.each(events,function(i, val){
					events_html = events_html + '<div id="cfactionevent_event_switcher_'+SID+'_'+val+'" title="'+val+'" class="form_event normal_event alert alert-info"><label class="form_event_label label label-info">On '+val+'</label><input type="hidden" name="'+events_path+'['+val+']" alt="ghost" class="events_dna" value=""></div>';
				});
				jQuery('#cfaction_event_switcher_element_'+SID).children('.panel-body').append(events_html);
				ChronoformWizard.initialize_actions_droppables(ChronoformWizard.actions_drop_settings);
				//console.log(events);
			}
		</script>
		<?php
		echo \GCore\Helpers\Html::formStart('action_config event_switcher_action_config', 'event_switcher_action_config_{N}');
		echo \GCore\Helpers\Html::formSecStart();
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][events]', array('type' => 'text', 'label' => l_('CF_EVENTS'), 'id' => 'event_switcher_events_{N}', 'class' => 'XXL', 'sublabel' => l_('CF_EVENTS_EVENT_SWITCHER_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][load_events]', array('type' => 'button', 'value' => l_('CF_LOAD_EVENTS_EVENT_SWITCHER'), 'onclick' => 'event_switcher_load_events(this, {N})', 'sublabel' => l_('CF_LOAD_EVENTS_EVENT_SWITCHER_DESC')));
		echo \GCore\Helpers\Html::formLine('Form[extras][actions_config][{N}][content]', array('type' => 'textarea', 'label' => l_('CF_CODE'), 'rows' => 20, 'cols' => 70, 'sublabel' => l_('CF_CONTENT_EVENT_SWITCHER_DESC')));
		echo \GCore\Helpers\Html::formSecEnd();
		echo \GCore\Helpers\Html::formEnd();
	}
}
?>