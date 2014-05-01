<?php
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
?>
<div class="chrono-page-container">
<div class="container" id="wizard_page" style="width:100%;">
<div class="row" id="page_top"></div>
<?php
	$doc = \GCore\Libs\Document::getInstance();
	$doc->_('jquery');
	$doc->_('jquery-ui');
	$doc->_('bootstrap');
	//$doc->_('forms');
	$doc->_('keepalive');
	$doc->_('gtooltip');
	$doc->_('gvalidation');
	$doc->addCssFile(\GCore\C::get('GCORE_ADMIN_URL').'extensions/chronoforms/assets/css/wizard.css');
	$doc->addCssFile(\GCore\C::get('GCORE_ADMIN_URL').'extensions/chronoforms/assets/css/wizard-bs3.css');
	//tour
	//$doc->addJsFile('extensions/chronoforms/assets/bootstrap-tour/bootstrap-tour.min.js');
	//$doc->addCssFile('extensions/chronoforms/assets/bootstrap-tour/bootstrap-tour.min.css');

	$this->Html->active_set('div');

	//$doc->_('editor');
	$doc->addJsFile(\GCore\C::get('GCORE_FRONT_URL').'extensions/editors/assets/tinymce/tinymce.min.js');

	$save_ext = '';
	if($chronoforms_settings->get('wizard.safe_save', 1)){
		$save_ext = '
		jQuery("#serialized_form_data").val(jQuery("#admin_form").serialize());
		jQuery("#admin_form :input").prop("disabled", true);
		jQuery("#serialized_form_data").prop("disabled", false);
		';
	}
	$doc->addJsCode('
		function test_form(){
			'.(!empty($this->data['Form']['title']) ? 'window.open("'.r_(\GCore\C::get('GCORE_ROOT_URL').'index.php?ext=chronoforms&chronoform='.$this->data['Form']['title']).'");' : 'alert("'.l_('CF_SAVE_FORM_FIRST').'");').'
		}
		function validate_form(){
			if(!jQuery("#cform_name").val().trim()){
				alert("'.l_('CF_FORM_TITLE_REQUIRED').'");
			}else{
				'.$save_ext.'
				jQuery("#admin_form").submit();
			}
		}
	');
	/*if(empty($this->data['Form']['title'])){
		$this->Toolbar->setTitle(l_('CF_NEW_FORM'));
	}else{
		$this->Toolbar->setTitle($this->data['Form']['title']);
	}*/

	$this->Toolbar->addButton('test_form', r_('index.php?ext=chronoforms'), l_('CF_TEST_FORM'), \GCore\C::get('GCORE_ADMIN_URL').'extensions/chronoforms/assets/images/preview.png', 'test_form');
	$this->Toolbar->addButton('apply', r_('index.php?ext=chronoforms&act=save&save_act=apply'), l_('CF_SAVE'), $this->Assets->image('apply', 'toolbar/'), 'validate_form');
	$this->Toolbar->addButton('save', r_('index.php?ext=chronoforms&act=save'), l_('CF_SAVE_AND_CLOSE'), $this->Assets->image('save', 'toolbar/'), 'validate_form');
	$this->Toolbar->addButton('cancel', r_('index.php?ext=chronoforms'), l_('CF_CLOSE'), $this->Assets->image('cancel', 'toolbar/'), 'link');
?>
<?php
	ob_start();
?>
<script>
	/*jQuery(document).ready(function($){
		var tour = new Tour({
			debug:true,
			storage:false,
		});
		tour.addSteps([
			{
				//element: "#cform_name",
				orphan: true,
				backdrop: true,
				title: "<?php echo l_('CF_STARTTOUR_WELCOME_TITLE'); ?>",
				content: "<?php echo l_('CF_STARTTOUR_WELCOME_CONTENT'); ?>",
			},
			{
				//backdrop: true,
				//placement: 'top',
				element: "#cform_name",
				title: "<?php echo l_('CF_STARTTOUR_FORMNAME_TITLE'); ?>",
				content: "<?php echo l_('CF_STARTTOUR_FORMNAME_CONTENT'); ?>",
			},
			{
				//backdrop: true,
				//placement: 'top',
				element: "#cform_bootstrap",
				title: "<?php echo l_('CF_STARTTOUR_BOOTSTRAP_TITLE'); ?>",
				content: "<?php echo l_('CF_STARTTOUR_BOOTSTRAP_CONTENT'); ?>",
			},
			{
				//backdrop: true,
				reflex: true,
				placement: 'top',
				element: "#layout-wizard-tab-key",
				title: "<?php echo l_('CF_STARTTOUR_BOOTSTRAP_TITLE'); ?>",
				content: "<?php echo l_('CF_STARTTOUR_BOOTSTRAP_CONTENT'); ?>",
			},
			{
				//backdrop: true,
				//placement: 'top',
				element: ".field_source_item#text",
				title: "<?php echo l_('CF_STARTTOUR_BOOTSTRAP_TITLE'); ?>",
				content: "<?php echo l_('CF_STARTTOUR_BOOTSTRAP_CONTENT'); ?>",
			},
			{
				//backdrop: true,
				//placement: 'top',
				element: "#preview",
				title: "<?php echo l_('CF_STARTTOUR_BOOTSTRAP_TITLE'); ?>",
				content: "<?php echo l_('CF_STARTTOUR_BOOTSTRAP_CONTENT'); ?>",
			},
			{
				//backdrop: true,
				//placement: 'top',
				element: "#preview .edit_icon:first-child",
				title: "<?php echo l_('CF_STARTTOUR_BOOTSTRAP_TITLE'); ?>",
				content: "<?php echo l_('CF_STARTTOUR_BOOTSTRAP_CONTENT'); ?>",
			},
		]);
		tour.init();
		tour.start();
	});*/
</script>
<script>
	jQuery(document).ready(function($){
		$('.gcore .nav > li:first-child').addClass('active');
		$('.gcore .tab-content > div.tab-pane:first').addClass('active');
	});
	jQuery(document).ready(function($){
		//$('#admin_form').gvalidate();
		/*$('.PopOverReady').popover({'trigger':'hover', 'container':'body'});
		$(".PopOverReady").on("hidden.bs.tooltip", function(){
			$(this).show();
		});*/
		$(".PopOverReady").gtooltip({"append":"body", "awaytime":0, "position":"right"});
		$(".PopOverReady").gtooltip("hover");
	});
</script>
<script>
function HideEditor(Element_Config){
	Element_Config.find('textarea').each(function(i, textarea){
		if(jQuery(textarea).css('display') == 'none'){
			tinymce.execCommand('mceRemoveEditor', false, jQuery(textarea).attr('id'));
		}
	});
}
function toggleEditor(elem, id){
	var textarea = jQuery(elem).closest('.form-group').next().find('textarea');
	if(textarea.length == 0){
		var textarea = jQuery(elem).closest('.form-group').prev().find('textarea');
	}
	if(textarea.css('display') != 'none'){
		tinymce.execCommand('mceAddEditor', false, jQuery(textarea).attr('id'));
	}else{
		tinymce.execCommand('mceRemoveEditor', false, jQuery(textarea).attr('id'));
	}
}
function addFieldEvent(elem, button_id){
	var last_event = jQuery(elem).closest('.form-group').prev();
	//var event_count = jQuery(elem).closest('.form-group').parent().find('.form-group').length - 1;//this has been changed below
	var event_count = parseInt(last_event.clone().wrap('<p>').parent().html().match(/\[events\]\[[0-9]+\]/).pop().replace('[events][', '').replace(']', '')) + 1;
	jQuery(elem).closest('.form-group').before(last_event.clone().wrap('<p>').parent().html().replace(/\[events\]\[[0-9]+\]/g, '[events]['+event_count+']'));
}
function removeFieldEvent(elem, button_id){
	var last_event = jQuery(elem).closest('.form-group').prev();
	var event_count = last_event.clone().wrap('<p>').parent().html().match(/\[events\]\[[0-9]+\]/).pop().replace('[events][', '').replace(']', '');
	if(event_count != '0'){
		last_event.remove();
	}
}
jQuery(window).scroll(function(){
	if(jQuery(window).scrollTop() > jQuery('#droppable_area_actions').offset().top){
		jQuery('#actions_list').stop().animate({'marginTop': (jQuery(window).scrollTop() - jQuery('#droppable_area_actions').offset().top + 30) + 'px'}, 'slow');
	}else{
		jQuery('#actions_list').stop().animate({'marginTop': (0) + 'px'}, 'slow');
	}
	if(jQuery(window).scrollTop() > jQuery('.fields_panel').first().offset().top){
		jQuery('#fields_list').stop().animate({'marginTop': (jQuery(window).scrollTop() - jQuery('.fields_panel').first().offset().top + 30) + 'px'}, 'fast');
	}else{
		jQuery('#fields_list').stop().animate({'marginTop': (0) + 'px'}, 'fast');
	}
});
</script>
<script>
	jQuery(document).ready(function($){
		//$('#locales_tabs_heads a:last').tab('show'); //activate last tab when page loads
		$('#add_new_locale').on('show.bs.modal', function () {
			$('#locale_name').val('');
		})
		$('#add_new_locale_button').on('click', function(){
			var locale_name = $('#locale_name').val();
			if(locale_name == '')return false;
			$('#locales_tabs_heads').append('<li><a href="#locale-'+locale_name+'" data-g-toggle="tab">'+locale_name+'</a></li>');
			var tab_content = $('#locale_generic_config').html().replace(/{N}/ig, $('#locale_name').val());
			$('#locales_tabs_contents').append('<div class="tab-pane" id="locale-'+locale_name+'">'+tab_content+'</div>');
			$('#locales_tabs_heads a:last').tab('show');
		});
	});
	function remove_locale(id){
		jQuery('#locale-'+id).remove();
		jQuery('a[href="#locale-'+id+'"]').parent('li').remove();
		jQuery('#locales_tabs_heads a:last').tab('show'); //activate last tab when page loads
		jQuery('html, body').animate({
			scrollTop: jQuery('#page_top').offset().top
		}, 300);
		return false;
	}
	jQuery(document).ready(function($){
		//$('.action_config').css('display', 'none');
		//$('.hidden_event').css('display', 'none');
		$('.collapse').on('show.bs.collapse', function(){
			$(this).closest('.panel-group').find('.in').each(function(i, inp){
				$(inp).collapse('hide');
			});
		});
	});
</script>
<?php if(!empty($this->data['Form']['id'])): ?>
<div class="loading_overlay"></div>
<?php endif; ?>
<script>
	var ChronoformWizard = {};
	
	jQuery(document).ready(function($) {
		//replace config replacers
		<?php if(!empty($this->data['Form']['id'])): ?>
			var overlay = $(".loading_overlay");
			//$('#details-panel').append(overlay);
			$.each($('.field_config_replacer'), function(k, inp){
				$.ajax({
					url: '<?php echo r_('index.php?ext=chronoforms&act=render_field_config&tvout=ajax'); ?>',
					data: {'field_id':$(inp).attr('field_id'), 'form_id': '<?php echo $this->data['Form']['id']; ?>'},
					type: 'POST',
					async: false,
				}).done(function(msg){
					//$('.loading_gif').remove();
					var $config_loaded = $(msg);
					$config_loaded.addClass('config_box');
					$(inp).replaceWith($config_loaded);
				});
			});
			overlay.remove();
		<?php endif; ?>
	});
	
	jQuery(document).ready(function($) {
		var fields_count = <?php echo (!empty($this->data['Form']['extras']['fields']) ? max(array_keys($this->data['Form']['extras']['fields'])) + 1 : 1); ?>;
		$('.field_source_item').draggable({
			appendTo: 'body',
			helper: 'clone',
			start: function(event, ui){
				pos_fixed = 0;            // we're about to start, set to not fixed yet
			},
			drag: function(event, ui){
				if(pos_fixed == 0){       // check if the fix hasn't been fired for this instance yet
					var help_pos = $(ui.helper).offset().top, // get helpers offset
					targ_pos = $(event.target).offset().top,  // get targets(the dragged elements) offset
					marg = targ_pos-help_pos; // calculate the margin the helper has to have to put it on the same y-position as our target
					$(ui.helper).css('margin-top', marg); // put our helper on the same y-position as the target
					pos_fixed = 1;            // we've fixed it, we don't want it to fire again
				}
			}
		});
		var $field_drop_settings = {
			activeClass: 'form-event-active',
			hoverClass: 'form-event-hover',
			accept: '.field_source_item',
			greedy: true,
			tolerance: 'pointer',
			drop: function(event, ui){
				if(ui.draggable.attr('id') == 'multi'){
					var Element_Container = $(this);
					//$add_multi_field_dialog.data('container', $(this));
					//$add_multi_field_dialog.dialog('open');

					$('#modal_generic_config').find('.modal-body').empty();
					$('#modal_generic_config').find('.modal-title').html('<?php echo l_('CF_INSERT_MULTI_FIELD'); ?>');
					var Element_Config = $('#add_multi_field_dialog');
					Element_Config.css('display', 'block');
					$('#modal_generic_config').find('.modal-body').append(Element_Config);
					$('#modal_generic_config').css('top', jQuery(window).scrollTop());
					$('#modal_generic_config').modal();
					$('#modal_generic_config').off('hide.bs.modal');
					$('#modal_generic_config').on('hide.bs.modal', function(){
						//HideEditor(Element_Config);
						addMultiField(Element_Container);
						Element_Config.css('display', 'none');
						$('#wizard_page').append(Element_Config);
					});
				}else if(ui.draggable.attr('id') == 'container'){
					addContainer($(this));
				}else{
					addField($(this), ui.draggable.attr('id'));
				}
			}
		}

		function initialize_fields_droppables(){
			$('.fields_container').droppable($field_drop_settings).sortable({
				items: 'div.element_box',
				//containment:'parent',
				//axis:'y',
				scroll:false,
				//handle:'.drag_icon',
			});
			//$('.fields_container').disableSelection();
		}
		initialize_fields_droppables();

		$('#stack_field').button().click(function(){
			var fldval = $('#fields_types_list').val();
			$('#multi_field_stack').append('<option value="'+fldval+'" selected="selected">'+fldval+'</option>');
		});

		function initialize_container_icons(container){
			container.find('.delete_container_icon').first().on('click', function(){
				$(this).closest('.element_box').remove();
			});
			/*
			container.find('.copy_container_icon').first().on('click', function(){
				ChronoformWizard.fields_clipboard = $(this).closest('.element_box').clone(true, true);
			});
			*/
			container.find('.paste_container_icon').first().on('click', function(){
				if(typeof ChronoformWizard.fields_clipboard != 'undefined'){
					var field_number = ChronoformWizard.fields_clipboard.find('span.field_icon_number').first().text();
					//console.log(field_number);
					//re = '\\['+field_number+'\\]';
					var regex = new RegExp('\\['+field_number+'\\]', 'g');
					var copy_code = ChronoformWizard.fields_clipboard.wrap('<p>').parent().html().replace(regex, '['+fields_count+']');
					var regex = new RegExp('-'+field_number+'"', 'g');
					var copy_code = copy_code.replace(regex, '-'+fields_count+'"');
					var copy_code_p = $('<p>').append(copy_code);
					copy_code_p.find('span.field_icon_number').first().text(fields_count);
					var Element = copy_code_p.children().first();
					Element.find('.panel-heading').first().find('.action_icon').remove();
					Element.find('.panel-heading').first().find('.clearfix').remove();
					Element.children('.config_box').find('[id^=container_id]').first().val(container.attr('container_num'));
					addLinks(Element);
					//copy_code = copy_code_p.html();
					//console.log(copy_code);
					$(this).closest('.element_box').children('.fields_container').first().append(Element);
					fields_count = fields_count + 1;
				}
			});

			container.find('.collapse_container_icon').first().on('click', function(){
				if($(this).closest('.element_box').children('.panel-body').css('display') == 'none'){
					$(this).closest('.element_box').children('.panel-body').removeAttr('style');
					$(this).text('<?php echo l_('CF_COLLAPSE'); ?>');
					$('#' + $(this).closest('.element_box').attr('id') + '_collapsed').val('0');
				}else{
					$(this).closest('.element_box').children('.panel-body').css('display', 'none');
					$(this).text('<?php echo l_('CF_EXPAND'); ?>');
					$('#' + $(this).closest('.element_box').attr('id') + '_collapsed').val('1');
				}
			});

			container.find('.edit_container_icon').first().on('click', function(){
				var Element = $(this).closest('.element_box');
				var container_label = Element.find('.container_label').first();
				var container_type = Element.find('.container_type').first();
				var container_num = Element.attr('container_num');
				$('#modal_generic_config').find('.modal-body').empty();
				$('#modal_generic_config').find('.modal-title').html('<?php echo l_('CF_EDIT_CONTAINER_SETTINGS'); ?>');
				var Element_Config = Element.find('.config_box').first();
				Element_Config.css('display', 'block');
				$('#modal_generic_config').find('.modal-body').append(Element_Config);
				$('#modal_generic_config').css('top', jQuery(window).scrollTop());
				$('#modal_generic_config').modal();
				$('#modal_generic_config').off('hide.bs.modal');
				$('#modal_generic_config').on('hide.bs.modal', function(){
					HideEditor(Element_Config);
					Element_Config.css('display', 'none');
					Element.find('.fields_container').first().before(Element_Config);
					container_label.text($('#container_label_config_'+container_num).val());
					container_type.text($('#container_type_config_'+container_num).val());
					if($('#container_type_config_'+container_num).val() == 'column'){
						container.resizable({
							stop: function(e, ui){console.log(ui.size.width/ui.element.parent().width());
								$('#' + ui.element.attr('id') + '_width').val(Math.floor((ui.size.width/ui.element.parent().width()) * 100));
							},
						});
					}else{
						container.resizable();
						container.resizable('destroy');
					}
				});
			});

			if(container.find('#container_type_config_'+ container.attr('container_num')).val() == 'column'){
				container.resizable({
					stop: function(e, ui){console.log(ui.size.width/ui.element.parent().width());
						$('#' + ui.element.attr('id') + '_width').val(Math.floor((ui.size.width/ui.element.parent().width()) * 100));
					},
				});
			}
		}

		$('#layout-wizard-tab-key').on('shown.bs.tab', function(e){
			$.each($('div[id^="fields_container"]'), function(i, container){
				var container_num = $(container).attr('container_num');
				var parent_width = Math.floor($(container).parent().width());
				var set_container_width = $(container).find('#fields_container_'+container_num+'_width').first().val();
				$(container).css('width', ((set_container_width/100) * parent_width));
				//set collapse state
				var container_collapsed = $(container).find('#fields_container_'+container_num+'_collapsed').first().val();
				if(container_collapsed == 1){
					$(container).children('.panel-body').css('display', 'none');
					$(container).children('.panel-heading').find('.collapse_container_icon').text('<?php echo l_('CF_EXPAND'); ?>');
				}
			});
		});

		$.each($('div[id^="fields_container"]'), function(i, container){
			initialize_container_icons($(container));
		});
		
		//add paste link for main preview
		var pasteLink = $('<span/>', {
			'class':'paste_icon paste_container_icon action_icon label label-default pull-right',
			'title':'<?php echo l_('CF_PASTE'); ?>',
			'text':'<?php echo l_('CF_PASTE'); ?>',
		}).on('click', function(){
			if(typeof ChronoformWizard.fields_clipboard != 'undefined'){
				var field_number = ChronoformWizard.fields_clipboard.find('span.field_icon_number').first().text();
				//console.log(field_number);
				//re = '\\['+field_number+'\\]';
				var regex = new RegExp('\\['+field_number+'\\]', 'g');
				var copy_code = ChronoformWizard.fields_clipboard.wrap('<p>').parent().html().replace(regex, '['+fields_count+']');
				var regex = new RegExp('-'+field_number+'"', 'g');
				var copy_code = copy_code.replace(regex, '-'+fields_count+'"');
				var copy_code_p = $('<p>').append(copy_code);
				copy_code_p.find('span.field_icon_number').first().text(fields_count);
				var Element = copy_code_p.children().first();
				Element.find('.panel-heading').first().find('.action_icon').remove();
				Element.find('.panel-heading').first().find('.clearfix').remove();
				Element.children('.config_box').find('[id^=container_id]').first().val(0);
				addLinks(Element);
				//copy_code = copy_code_p.html();
				//console.log(copy_code);
				$('#preview').append(Element);
				fields_count = fields_count + 1;
			}
		});
		$('#preview').prepend('<div class="clearfix"></div>');
		$('#preview').prepend(pasteLink);
		

		function addContainer(container){
			if(container == null){
				var container = $('#preview');
			}
			var container_number = container.attr('container_num');
			if(container_number == null){
				container_number = 0;
			}
			var new_container = $('<div/>',{
				'class':'fields_container_area element_box panel panel-success',
				'id':'fields_container_'+fields_count,
				'container_num':fields_count,
				'item_id':'container',
				css:{}
			}).append('<div class="panel-heading"><div class="pull-left"><span class="form_field_label container_label label label-primary">Container #'+fields_count+'</span><span class="label label-info action_icon_number" style="">'+fields_count+'</span><span class="label label-info action_icon_number container_type" style=""></span></div></div>');
			var container_icons = $('<div/>', {
				'id':'field_icons_'+fields_count,
				'class':'field_icons pull-right',
			});

			var deleteLink = $('<span/>', {
				'class':'delete_icon delete_container_icon action_icon label label-danger',
				'title':'<?php echo l_('CF_DELETE'); ?>',
				'text':'<?php echo l_('CF_DELETE'); ?>',
			}).on('click', function(){
				$(this).closest('.element_box').remove();
			});

			var dragLink = $('<span/>', {
				'class':'drag_icon action_icon label label-warning',
				'title':'<?php echo l_('CF_DRAG'); ?>',
				'text':'<?php echo l_('CF_DRAG'); ?>',
			}).on('click', function(){

			});

			var editLink = $('<span/>', {
				'class':'edit_icon edit_container_icon action_icon label label-primary',
				'title':'<?php echo l_('CF_EDIT'); ?>',
				'text':'<?php echo l_('CF_EDIT'); ?>',
			}).on('click', function(){

			});

			var collapseLink = $('<span/>', {
				'class':'collapse_icon collapse_container_icon action_icon label label-default',
				'title':'<?php echo l_('CF_COLLAPSE'); ?>',
				'text':'<?php echo l_('CF_COLLAPSE'); ?>',
			}).on('click', function(){

			});
			/*
			var copyLink = $('<span/>', {
				'class':'copy_icon copy_container_icon action_icon label label-default',
				'title':'<?php echo l_('CF_COPY'); ?>',
				'text':'<?php echo l_('CF_COPY'); ?>',
			}).on('click', function(){
				ChronoformWizard.fields_clipboard = $(this).closest('.element_box').clone(true, true);
			});
			*/
			var pasteLink = $('<span/>', {
				'class':'paste_icon paste_container_icon action_icon label label-default',
				'title':'<?php echo l_('CF_PASTE'); ?>',
				'text':'<?php echo l_('CF_PASTE'); ?>',
			}).on('click', function(){
				if(typeof ChronoformWizard.fields_clipboard != 'undefined'){
					var field_number = ChronoformWizard.fields_clipboard.find('span.field_icon_number').first().text();
					//console.log(field_number);
					//re = '\\['+field_number+'\\]';
					var regex = new RegExp('\\['+field_number+'\\]', 'g');
					var copy_code = ChronoformWizard.fields_clipboard.wrap('<p>').parent().html().replace(regex, '['+fields_count+']');
					var regex = new RegExp('-'+field_number+'"', 'g');
					var copy_code = copy_code.replace(regex, '-'+fields_count+'"');
					var copy_code_p = $('<p>').append(copy_code);
					copy_code_p.find('span.field_icon_number').first().text(fields_count);
					var Element = copy_code_p.children().first();
					Element.find('.panel-heading').first().find('.action_icon').remove();
					Element.find('.panel-heading').first().find('.clearfix').remove();
					Element.children('.config_box').find('[id^=container_id]').first().val(container_number);
					addLinks(Element);
					//copy_code = copy_code_p.html();
					//console.log(copy_code);
					$(this).closest('.element_box').children('.fields_container').first().append(Element);
					fields_count = fields_count + 1;
				}
			});

			container_icons.append(pasteLink);
			container_icons.append(collapseLink);
			//container_icons.append(copyLink); we can't update fields numbers inside container
			container_icons.append(editLink);
			container_icons.append(dragLink);
			container_icons.append(deleteLink);
			new_container.find('.panel-heading').append(container_icons);
			new_container.find('.panel-heading').append('<div class="clearfix"></div>');

			var $new_container_config = $('#container_origin_config').clone().removeAttr('id').addClass('config_box');
			$new_container_config.html($new_container_config.html().replace(/{N}/ig, fields_count));
			$new_container_config.css({'display':'none'});
			$new_container_config.find('[id^=container_id]').first().val(container_number);

			new_container.append($new_container_config);
			new_container.append('<div class="fields_container panel-body" container_num="'+fields_count+'"></div>');

			container.append(new_container);
			fields_count++;

			initialize_container_icons(new_container);
			initialize_fields_droppables();
		}

		function addField(container, field_type){
			if(container == null){
				var container = $('#preview');
			}
			var container_number = container.attr('container_num');
			if(container_number == null){
				container_number = 0;
			}

			if(field_type == null){
				var field_type = $('#field_type_selector').val();
			}

			var $new_element = $('#'+field_type+'_origin').clone().removeAttr('id');
			$new_element.html($new_element.html().replace(/{N}/ig, fields_count));

			var $new_element_config = $('#'+field_type+'_origin_config').clone().removeAttr('id').addClass('config_box');
			$new_element_config.html($new_element_config.html().replace(/{N}/ig, fields_count));

			$new_element_config.find('[id^=container_id]').first().val(container_number);

			$new_element_config.css({'display':'none'});

			$new_element.addClass('panel-body');
			var $new_element_box = $('<div/>', {'class':'element_box panel panel-default', 'item_id':field_type});

			var new_field_label = ($new_element_config.find('.element_field_name').length > 0) ? $new_element_config.find('.element_field_name').val() : field_type;

			$new_element_box.append('<div class="panel-heading"><div class="pull-left"><span class="form_field_label label label-primary">'+new_field_label+'</span><span class="label label-info field_icon_number" style="">'+fields_count+'</span></div></div>');
			$new_element_box.append($new_element);
			$new_element_box.append($new_element_config);
			addLinks($new_element_box);
			//$new_element_box.find('.panel-heading').append('<div class="clearfix"></div>');

			container.append($new_element_box);
			fields_count++;
		}
		function addMultiField(container){
			if(container == null){
				var container = $('#preview');
			}
			var container_number = container.attr('container_num');
			if(container_number == null){
				container_number = 0;
			}

			var types = $('#multi_field_stack').val();
			if(types == null){
				return;
			}
			var $new_element_box = $('<div/>', {'class':'element_box panel panel-warning', 'item_id':'multi'});
			var obj = {};
			$.each(types, function(i, val){
				obj['fields['+i+']'] = val;
			});
			obj['fields_count'] = fields_count;
			$.ajax({
				url: '<?php echo r_('index.php?ext=chronoforms&act=render_multi_field&tvout=ajax'); ?>',
				data: obj
			}).done(function(msg){
				$('#loading_gif').remove();
				var $resp = $('<div/>');
				$resp.append(msg);
				var $new_element = $resp.find('.original_element');

				$new_element_box.append('<div class="panel-heading"><div class="pull-left"><span class="form_field_label label label-primary">'+'Multi Field'+'</span><span class="label label-info field_icon_number" style="">'+fields_count+'</span></div></div>');
				//addLinks($new_element);
				$new_element.addClass('panel-body');

				$resp.find('.single_element_config').removeClass('original_element_config').addClass('panel-body').removeAttr('id');
				$resp.find('.original_element_config').css('display', 'none').addClass('config_box').removeAttr('id');
				var $config = $resp.find('.original_element_config').detach();
				//console.log($config);
				//$new_element_box.append($resp.html());
				//$new_element.detach();
				$new_element_box.append($new_element);

				$config.find('[id^=container_id]').val(container_number);
				$new_element_box.append($config);
				addLinks($new_element_box);
			});
			container.append($new_element_box);
			fields_count = fields_count + types.length;
			//fields_count++;
			$('#multi_field_stack').html('');
		}

		function addLinks(Element){
			//Element.on('mouseenter', function(){
				var editLink = $('<span/>', {
					'class':'edit_icon action_icon label label-primary',
					'title':'<?php echo l_('CF_EDIT'); ?>',
					'text':'<?php echo l_('CF_EDIT'); ?>',
				}).on('click', function(){
					//var Element = $(this).closest('.form_action');
					$('#modal_generic_config').find('.modal-body').empty();
					$('#modal_generic_config').find('.modal-title').html('<?php echo l_('CF_EDIT_ELEMENT_SETTINGS'); ?>');
					var Element_Config = Element.find('.config_box');
					Element_Config.css('display', 'block');
					$('#modal_generic_config').find('.modal-body').append(Element_Config);
					$('#modal_generic_config').css('top', jQuery(window).scrollTop());

					Element_Config.find('.nav > li').removeClass('active');
					Element_Config.find('.nav > li:first-child').addClass('active');
					Element_Config.find('.tab-content > div.tab-pane').removeClass('active');
					Element_Config.find('.tab-content > div.tab-pane:first-child').addClass('active');
					$('#help_link').attr('href', 'http://www.chronoengine.com/chronoforms-wizard-help.html?term=' + Element.attr('item_id'));

					$('#modal_generic_config').modal();
					$('#modal_generic_config').off('hide.bs.modal');
					$('#modal_generic_config').on('hide.bs.modal', function(){
						HideEditor(Element_Config);
						Element_Config.css('display', 'none');
						Element.append(Element_Config);
						//apply
						Element.find('.original_element').empty().append('<span class="loading_gif"><img src="<?php echo $this->Assets->image('loading-small.gif'); ?>" /></span>');
						var obj = {};
						Element_Config.find(':input').each(function(i, inp){
							var inpData = $(inp).val();
							if($(inp).attr('alt') == 'options'){
								inpData = {};
								var lines = $(inp).val().split("\n");
								$.each(lines, function(ln, ld){
									var opts = ld.split('=');
									inpData[opts[0]] = ((typeof opts[1] != 'undefined') ? opts[1] : opts[0]);
								});
							}
							if($(inp).attr('alt') == 'multiline'){
								inpData = {};
								var lines = $(inp).val().split("\n");
								inpData = lines;
							}
							if($(inp).attr('data-render') != 'no'){
								if($(inp).attr('data-render') == 'code'){
									obj[$(inp).attr('name')] = inpData;
								}else{
									obj[$(inp).attr('name')] = inpData;
								}
							}
						});
						$.ajax({
							url: '<?php echo r_('index.php?ext=chronoforms&act=render_field&tvout=ajax'); ?>',
							data: obj,
							type: 'POST',
						}).done(function(msg){
							$('.loading_gif').remove();
							var $newElem = $(msg);
							$newElem.addClass('panel-body');
							Element.find('.original_element').replaceWith($newElem);
							var new_field_label = (Element_Config.find('.element_field_name').length > 0) ? Element_Config.find('.element_field_name').val() : null;
							if(new_field_label){
								Element.find('.form_field_label').html(Element_Config.find('.element_field_name').val());
							}
							//Element = $newElem.removeAttr('id');
							//addLinks(Element);
						});
					});

				});

				var deleteLink = $('<span/>', {
					'class':'delete_icon action_icon label label-danger',
					'title':'<?php echo l_('CF_DELETE'); ?>',
					'text':'<?php echo l_('CF_DELETE'); ?>',
				}).on('click', function(){
					$(this).closest('.element_box').remove();
				});

				var dragLink = $('<span/>', {
					'class':'drag_icon action_icon label label-warning',
					'title':'<?php echo l_('CF_DRAG'); ?>',
					'text':'<?php echo l_('CF_DRAG'); ?>',
				}).on('click', function(){

				});
			
				var copyLink = $('<span/>', {
					'class':'copy_icon action_icon label label-default',
					'title':'<?php echo l_('CF_COPY'); ?>',
					'text':'<?php echo l_('CF_COPY'); ?>',
				}).on('click', function(){
					ChronoformWizard.fields_clipboard = $(this).closest('.element_box').clone(true, true);
					$('.element_box').removeClass('field_copied');
					$(this).closest('.element_box').addClass('field_copied');
				});

				var field_icons = $('<div/>', {
					'id':'field_icons_'+fields_count,
					'class':'field_icons pull-right',
				});

				field_icons.append(copyLink);
				field_icons.append(editLink);
				field_icons.append(dragLink);
				field_icons.append(deleteLink);
				Element.find('.panel-heading').first().append(field_icons);
				Element.find('.panel-heading').first().append('<div class="clearfix"></div>');
				//Element.css('background-color', '#D0F5A9');
				//Element.parent().css('cursor', 'move');
			//});
		}
		//fix old fields
		$('.element_box .original_element_config').css('display', 'none').addClass('config_box').removeAttr('id');
		$('.element_box .original_element_config').find('.single_element_config').each(function(i, inp){
			$(inp).addClass('panel-body');
		});
		$('.element_box .original_element_config').removeAttr('id');
		$('.element_box .original_element').removeAttr('id').addClass('panel-body');
		$('.element_box.field_box').each(function(i, El){
			addLinks($(El));
		});
		//sortable
	});
</script>
<script>
	//var ChronoformWizard = {};
	//jQuery(document).ready(function($){
	(function($){
		var action_count = <?php echo (!empty($this->data['Form']['extras']['actions_config']) ? max(array_keys($this->data['Form']['extras']['actions_config'])) + 1 : 0); ?>;

		jQuery(document).ready(function($){
			$('.action_source_item').draggable({
				appendTo: 'body',
				helper: 'clone',
				start: function(event, ui){
					pos_fixed = 0;            // we're about to start, set to not fixed yet
				},
				drag: function(event, ui){
					if(pos_fixed == 0){       // check if the fix hasn't been fired for this instance yet
						var help_pos = $(ui.helper).offset().top, // get helpers offset
						targ_pos = $(event.target).offset().top,  // get targets(the dragged elements) offset
						marg = targ_pos-help_pos; // calculate the margin the helper has to have to put it on the same y-position as our target
						$(ui.helper).css('margin-top', marg); // put our helper on the same y-position as the target
						pos_fixed = 1;            // we've fixed it, we don't want it to fire again
					}
				}
			});
		});

		ChronoformWizard.initialize_actions_droppables = function initialize_droppables(settings){
			$('.form_event').droppable(settings).sortable({
				items: 'div.form_action',
				axis:'y',
				sort: function(){
					// gets added unintentionally by droppable interacting with sortable
					// using connectWithSortable fixes this, but doesn't allow you to customize active/hoverClass options
					//$(this).removeClass("ui-state-default");
				}
			});
			//old actions
			$('.action_icons .delete_icon').on('click', function(){
				$(this).closest('.form_action').remove();
			});

			$('.action_icons .edit_icon').off('click');
			$('.action_icons .edit_icon').on('click', function(){
				var Element = $(this).closest('.form_action');
				//$(this).closest('.form_action').find('.action_config').last().modal();
				$('#modal_generic_config').find('.modal-body').empty();
				$('#modal_generic_config').find('.modal-title').html('<?php echo l_('CF_EDIT_ACTION_SETTINGS'); ?>');
				var Element_Config = Element.children('.panel-body').children('.action_config').last();
				Element_Config.css('display', 'block');
				$('#modal_generic_config').find('.modal-body').append(Element_Config);
				$('#modal_generic_config').css('top', jQuery(window).scrollTop());
				$('#help_link').attr('href', 'http://www.chronoengine.com/chronoforms-wizard-help.html?term=' + Element.attr('item_id'));
				$('#modal_generic_config').modal();
				$('#modal_generic_config').off('hide.bs.modal');
				$('#modal_generic_config').on('hide.bs.modal', function(){
					HideEditor(Element_Config);
					Element_Config.css('display', 'none');
					Element.children('.panel-body').append(Element_Config);
				});
			});

		}
		ChronoformWizard.actions_drop_settings = $drop_settings = {
			activeClass: 'form-event-active',
			hoverClass: 'form-event-hover',
			accept: '.action_source_item',
			greedy: true,
			tolerance: 'pointer',
			drop: function(event, ui){
				var form_action = $('<div/>', {
					'id':'cfaction_'+ui.draggable.attr('id')+'_element_'+action_count,
					'class':'cfaction_'+ui.draggable.attr('id')+'_element_view wizard_element form_action panel panel-default',
					'item_id':ui.draggable.attr('id'),
				});
				form_action.append('<div class="panel-heading"><div class="pull-left"><span class="form_action_label label label-primary">'+ui.draggable.attr('title')+'</span><span class="label label-info action_icon_number" style="">'+action_count+'</span></div></div>');

				var action_icons = $('<div/>', {
					'id':'action_icons_'+action_count,
					'class':'action_icons pull-right',
				});
				var deleteLink = $('<span/>', {
					'class':'delete_icon action_icon label label-danger',
					'title':'<?php echo l_('CF_DELETE'); ?>',
					'text':'<?php echo l_('CF_DELETE'); ?>',
				});

				var dragLink = $('<span/>', {
					'class':'drag_icon action_icon label label-warning',
					'title':'<?php echo l_('CF_DRAG'); ?>',
					'text':'<?php echo l_('CF_DRAG'); ?>',
				}).on('click', function(){

				});

				var action_config = ui.draggable.find('.action_config').clone().addClass('hidden_config');
				var editLink = $('<span/>', {
					'class':'edit_icon action_icon label label-primary',
					'title':'<?php echo l_('CF_EDIT'); ?>',
					'text':'<?php echo l_('CF_EDIT'); ?>',
				});

				action_icons.append(editLink);
				action_icons.append(dragLink);
				action_icons.append(deleteLink);


				form_action.find('.panel-heading').append(action_icons);
				form_action.find('.panel-heading').append('<div class="clearfix"></div>');
				form_action.append('<div class="panel-body"></div>');

				var droppable_dna = $(this).find('.events_dna').attr('name')+'['+ui.draggable.attr('id')+'_'+action_count+']';
				var dna = $(this).find('.events_dna').first().clone().attr('name', droppable_dna);
				form_action.find('.panel-body').append(dna);

				var action_events = ui.draggable.find('.form_event').clone().removeClass('hidden_event');
				action_events.each(function(i, action_event){
					$(action_event).find('.events_dna').attr('name', droppable_dna+'['+$(action_event).attr('title')+']');
				});
				action_events = $($('<div/>').append(action_events).html().replace(/{N}/ig, action_count));
				form_action.find('.panel-body').append(action_events);


				action_config = $($('<div/>').append(action_config).html().replace(/{N}/ig, action_count));
				form_action.find('.panel-body').append(action_config);

				//form_action.append('<div class="clear">&nbsp;</div>');
				$(this).append(form_action);
				//$(this).append($('<div/>').append(form_action).html().replace(/{N}/ig, action_count));
				action_count = action_count + 1;

				ChronoformWizard.initialize_actions_droppables(ChronoformWizard.actions_drop_settings);
			}
		}
	//})(jQuery);
		jQuery(document).ready(function($){
			ChronoformWizard.initialize_actions_droppables(ChronoformWizard.actions_drop_settings);
			//handle new main events
			$('#add_new_event').on('show.bs.modal', function () {
				$('#new_event_name').val('');
			})
			$('#add_new_event_button').on('click', function(){
				var new_event_name = $('#new_event_name').val();
				if(new_event_name == '')return false;
				addEvent();
			});

			function addEvent(){
				var event_box = $('<div/>', {
					'class':'form_event main_event good_event alert alert-success',
					'id':'FormOn'+$('#new_event_name').val()+'Event',
				}).append(
					$('<label/>', {'class':'form_event_label label label-success pull-left', text:'On '+$('#new_event_name').val()})
				).append(
					$('<label/>', {'class':'form_event_delete_label label label-danger pull-right', text:'<?php echo l_('CF_DELETE'); ?>'})
				).append(
					$('<div/>', {'class':'clearfix'})
				).append(
					'<input type="hidden" value="" class="events_dna" alt="ghost" name="Form[extras][DNA]['+$('#new_event_name').val()+']">'
				).insertBefore($('#add_new_event_modal_toggler'));
				ChronoformWizard.initialize_actions_droppables(ChronoformWizard.actions_drop_settings);
				initialize_event_deleters();
			}
			initialize_event_deleters();
			
			function initialize_event_deleters(){
				$('.form_event_delete_label').on('click', function(){
					$(this).parent().remove();
				});
			}
		});
	})(jQuery);
</script>
<?php
	$wizard_jscode = ob_get_clean();
	$doc->addHeaderTag($wizard_jscode);
?>
<div class="row" style="margin-top:20px;">
	<div class="col-md-6">
		<h3><?php echo !empty($this->data['Form']['title']) ? $this->data['Form']['title'] : l_('CF_NEW_FORM').'...'; ?></h3>
	</div>
	<div class="col-md-6 pull-right text-right">
		<?php
			echo $this->Toolbar->renderBar();
		?>
	</div>
</div>
<div class="row">
<form action="<?php echo r_('index.php?ext=chronoforms&act=save'); ?>" method="post" name="admin_form" id="admin_form">
	<?php echo $this->Html->input('Form[id]', array('type' => 'hidden')); ?>
	<?php echo $this->Html->input('serialized_form_data', array('type' => 'textarea', 'id' => 'serialized_form_data', 'style' => 'display:none;')); ?>
	<div id="details-panel">
		<div class="panel panel-default">
			<div class="panel-heading">
				<ul class="nav nav-pills">
					<li class="active"><a href="#general" data-g-toggle="tab"><?php echo l_('CF_GENERAL'); ?></a></li>
					<li><a href="#layout-wizard" id="layout-wizard-tab-key" data-g-toggle="tab"><?php echo l_('CF_DESIGNER'); ?></a></li>
					<li><a href="#form-code" data-g-toggle="tab"><?php echo l_('CF_CODE'); ?></a></li>
					<li><a href="#events-list" id="events-list-tab-key" data-g-toggle="tab"><?php echo l_('CF_SETUP'); ?></a></li>
					<li><a href="#locales" data-g-toggle="tab"><?php echo l_('CF_LOCALES'); ?></a></li>
					<li><a href="#db_settings" data-g-toggle="tab"><?php echo l_('CF_DB_SETTINGS'); ?></a></li>
				</ul>
			</div>
			<div class="panel-body">
				<div class="tab-content">
					<div id="general" class="tab-pane active">
						<?php echo $this->Html->formStart(); ?>
						<?php echo $this->Html->formSecStart(); ?>
						<?php echo $this->Html->formLine('Form[title]', array('type' => 'text', 'id' => 'cform_name', 'label' => l_('CF_FORM_NAME'), 'class' => 'L validate["required"]', 'sublabel' => l_('CF_FORM_NAME_DESC'))); ?>
						<?php echo $this->Html->formLine('Form[params][description]', array('type' => 'text', 'label' => l_('CF_FORM_DESC'), 'class' => 'XL', 'sublabel' => l_('CF_FORM_DESC_DESC'))); ?>
						<?php echo $this->Html->formLine('Form[published]', array('type' => 'dropdown', 'label' => l_('CF_PUBLISHED'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'values' => 1)); ?>
						<?php echo $this->Html->formLine('Form[params][setup]', array('type' => 'dropdown', 'id' => 'cform_setup', 'label' => l_('CF_SETUP_MODE'), 'values' => (!empty($this->data['setup']) ? 1 : 0), 'options' => array(0 => l_('CF_ADVANCED'), 1 => l_('CF_SIMPLE')), 'sublabel' => l_('CF_SETUP_MODE_DESC'))); ?>
						<?php //echo $this->Html->formLine('Form[params][html_helper_set]', array('type' => 'dropdown', 'label' => l_('CF_DESIGNER_SET'), 'options' => array('div' => 'DIV', 'table' => 'TABLE', 'ul' => 'UL'), 'sublabel' => l_('CF_DESIGNER_SET_DESC'))); ?>
						<?php echo $this->Html->formLine('Form[params][theme]', array('type' => 'dropdown', 'id' => 'cform_bootstrap', 'label' => l_('CF_FORM_THEME'), 'values' => 'bootstrap3', 'options' => array('gcoreui' => l_('GCoreUI'), 'bootstrap3' => l_('Bootstrap3'), 'none' => l_('CF_NONE')/*, 'semantic1' => l_('Semantic 1')*/), 'sublabel' => l_('CF_FORM_THEME_DESC'))); ?>
						<?php echo $this->Html->formLine('Form[params][tight_layout]', array('type' => 'dropdown', 'label' => l_('CF_TIGHT_LAYOUT'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_TIGHT_LAYOUT_DESC'))); ?>
						<?php //echo $this->Html->formLine('Form[params][jquery]', array('type' => 'dropdown', 'label' => l_('CF_LOAD_JQUERY'), 'values' => 1, 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_LOAD_JQUERY_DESC'))); ?>
						<?php echo $this->Html->formLine('Form[app]', array('type' => 'text', 'label' => l_('CF_FORM_APP'), 'class' => 'M', 'sublabel' => l_('CF_FORM_APP_DESC'))); ?>
						<?php echo $this->Html->formSecEnd(); ?>
						<?php echo $this->Html->formEnd(); ?>
					</div>
					<div id="form-code" class="tab-pane">
						<?php echo $this->Html->formStart(); ?>
						<?php echo $this->Html->formSecStart(); ?>
						<?php echo $this->Html->formLine('Form[form_type]', array('type' => 'dropdown', 'label' => l_('CF_FORM_TYPE'), 'options' => array(1 => l_('CF_WIZARD_DESIGNER'), 0 => l_('CF_CUSTOM_CODE')), 'sublabel' => l_('CF_FORM_TYPE_DESC'))); ?>
						<?php echo $this->Html->formLine('Form[content]', array('type' => 'textarea', 'label' => l_('CF_FORM_CODE'), 'style' => 'width:auto;', 'rows' => 20, 'cols' => 100, 'sublabel' => l_('CF_FORM_CODE_DESC'), 'value' => (!empty($form['content']) ? htmlspecialchars($form['content']) : ''))); ?>
						<?php echo $this->Html->formSecEnd(); ?>
						<?php echo $this->Html->formEnd(); ?>
					</div>
					<div id="layout-wizard" class="tab-pane">
						<div id="wizard-area" class="actions_tabs">
							<div id="designer-container" class="container" style="width:100%;">
								<div class="row">
									<?php
										$foptions = array();
										$field_cats = array('basic' => l_('CF_BASIC'));
										foreach($fields_types as $type){
											$class = '\GCore\Admin\Extensions\Chronoforms\Fields\\'.\GCore\Libs\Str::camilize($type).'\\'.\GCore\Libs\Str::camilize($type);
											$foptions[$type] = $class::$title;
											if(!empty($class::$cat_id)){
												$field_cats[$class::$cat_id] = $class::$cat_title;
											}
										}
										//$foptions['multi_field'] = l_('CF_MULTI_FIELD');
										$groups_ids = array_keys($field_cats);
										$first_group_id = $groups_ids[0];
									?>
									<div id="fields_list" class="col-md-2">
										<div class="panel-group" id="fields-accordion">
											<?php foreach($field_cats as $group_id => $group): ?>
												<div class="panel panel-default">
													<div class="panel-heading" style="padding:4px 15px;">
														<h4 class="panel-title">
															<a data-g-toggle="collapse" data-g-parent="#fields-accordion" href="#collapse-<?php echo $group_id; ?>"><?php echo $group; ?></a>
														</h4>
													</div>
													<div id="collapse-<?php echo $group_id; ?>" class="panel-collapse<?php if($group_id == $first_group_id): ?> in<?php else: ?> collapse<?php endif; ?>">
														<div class="panel-body">
														<?php foreach($foptions as $field => $field_title): ?>
															<?php $field_class = '\GCore\Admin\Extensions\Chronoforms\Fields\\'.\GCore\Libs\Str::camilize($field).'\\'.\GCore\Libs\Str::camilize($field); ?>
															<?php if(class_exists($field_class) AND !empty($field_class::$cat_id) AND $field_class::$cat_id != $group_id)continue; ?>
															<div class="field_source_item" id="<?php echo $field; ?>" title="<?php echo $field_title; ?>" style="margin:1px;">
																<span class="btn btn-primary btn-xs btn-block"><?php echo $field_title; ?></span>
																<?php
																	if(class_exists($field_class)){
																		$field_class::config();
																	}
																?>
															</div>
														<?php endforeach; ?>
														</div>
													</div>
												</div>
											<?php endforeach; ?>
										</div>
									</div>
									<div class="fields_panel col-md-10">
										<div id="preview" container_num="0" class="fields_container alert alert-info">
											<?php
												$containers_ids = array();
												$config_templates = array();
												if(!empty($this->data['Form']['extras']['fields'])){
													foreach($this->data['Form']['extras']['fields'] as $f_k => $f_info){
														if(strpos($f_k, '{N}') !== false){
															unset($this->data['Form']['extras']['fields'][$f_k]);
														}
													}
													//pr($this->data['Form']['extras']['fields']);
													foreach($this->data['Form']['extras']['fields'] as $k => $wizard_field){
														$type = isset($wizard_field['render_type']) ? $wizard_field['render_type'] : $wizard_field['type'];
														$class = '\GCore\Admin\Extensions\Chronoforms\Fields\\'.\GCore\Libs\Str::camilize($type).'\\'.\GCore\Libs\Str::camilize($type);

														if(!class_exists($class)){
															continue;
														}
														if($wizard_field['type'] == 'container'){
															//if this container is also a root container then close existing ones
															if($wizard_field['container_id'] == 0){
																//close all open containers
																foreach($containers_ids as $containers_id){
																	array_pop($containers_ids);
																	//close container div and panel-body
																	echo '</div></div>';
																}
															}else{
																//this container is a child of another container
																check_parent_container:
																if(!empty($containers_ids)){
																	$last_container_id = array_pop($containers_ids);
																	if($wizard_field['container_id'] == $last_container_id){
																		//do nothing, we should add the field as regular
																		array_push($containers_ids, $last_container_id);
																	}else{
																		//one container has just ended, because the element belongs to a differnt one, close it
																		//close container div and panel-body
																		echo '</div></div>';
																		goto check_parent_container;
																	}
																}
															}
															echo '<div class="fields_container_area element_box panel panel-success" id="fields_container_'.$k.'" container_num="'.$k.'" item_id="container">';
															$container_heading = '
																<div class="panel-heading">
																	<div class="pull-left">
																		<span class="form_field_label container_label label label-primary">'.$wizard_field['label'].'</span>
																		<span style="" class="label label-info action_icon_number">'.$k.'</span>
																		<span style="" class="label label-info action_icon_number container_type">'.$wizard_field['container_type'].'</span>
																	</div>
																	<div id="field_icons_'.$k.'" class="field_icons pull-right">';
															$container_heading .= '<span class="paste_icon paste_container_icon action_icon label label-default" title="'.l_('CF_PASTE').'">'.l_('CF_PASTE').'</span>';
															$container_heading .= '<span class="collapse_icon collapse_container_icon action_icon label label-default" title="'.l_('CF_COLLAPSE').'">'.l_('CF_COLLAPSE').'</span>';
															$container_heading .= '<span class="edit_icon edit_container_icon action_icon label label-primary" title="'.l_('CF_EDIT').'">'.l_('CF_EDIT').'</span>';
															$container_heading .= '<span class="drag_icon action_icon label label-warning" title="'.l_('CF_DRAG').'">'.l_('CF_DRAG').'</span>';
															$container_heading .= '<span class="delete_icon delete_container_icon action_icon label label-danger" title="'.l_('CF_DELETE').'">'.l_('CF_DELETE').'</span>';
															$container_heading .= '</div>
																	<div class="clearfix"></div>
																</div>';
															echo $container_heading;
															$class::config($wizard_field, $k);
															echo '<div container_num="'.$k.'" class="fields_container panel-body">';
															array_push($containers_ids, $k);
														}else{
															if(isset($wizard_field['container_id'])){
																if($wizard_field['container_id'] == 0){
																	//close all open containers
																	foreach($containers_ids as $containers_id){
																		array_pop($containers_ids);
																		//close container div and panel-body
																		echo '</div></div>';
																	}
																}else{
																	check_container:
																	if(!empty($containers_ids)){
																		$last_container_id = array_pop($containers_ids);
																		if($wizard_field['container_id'] == $last_container_id){
																			//do nothing, we should add the field as regular
																			array_push($containers_ids, $last_container_id);
																		}else{
																			//one container has just ended, because the element belongs to a differnt one, close it
																			//close container div and panel-body
																			echo '</div></div>';
																			goto check_container;
																		}
																	}
																}
															}
															echo '<div class="element_box field_box panel panel-'.(($wizard_field['type'] == 'multi') ? 'warning' : 'default').'" item_id="'.$wizard_field['type'].'">';
															if(isset($wizard_field['name'])){
																$element_title = $wizard_field['name'];
															}else{
																$element_title = $wizard_field['type'];
															}
															echo '
																<div class="panel-heading">
																	<div class="pull-left">
																		<span class="form_field_label label label-primary">'.$element_title.'</span>
																		<span style="" class="label label-info field_icon_number">'.$k.'</span>
																	</div>
																</div>';
															$element_info = $wizard_field;
															if(isset($element_info['options'])){
																$options = array();
																if(!empty($element_info['options'])){
																	$lines = explode("\n", $element_info['options']);
																	foreach($lines as $line){
																		$opts = explode("=", $line);
																		$options[$opts[0]] = isset($opts[1]) ? $opts[1] : $opts[0];
																	}
																}
																$element_info['options'] = $options;
															}
															if(isset($element_info['values'])){
																$values = array();
																if(!empty($element_info['values'])){
																	$values = explode("\n", $element_info['values']);
																}
																$element_info['values'] = $values;
															}
															$class::element($element_info);
															ob_start();
															if(count($this->data['Form']['extras']['fields']) <= $chronoforms_settings->get('wizard.safe_loading_fields_count', 20)){
																$class::config($wizard_field, $k);
															}else{
																echo '<div class="field_config_replacer" field_id="'.$k.'"></div>';
															}
															$element_config = ob_get_clean();
															echo str_replace('{N}', $k, $element_config);
															echo '</div>';
														}
													}
													//close any empty containers with no fields after them
													while($container_id = array_pop($containers_ids)){
														echo '</div></div>';
													}
												}
											?>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="origins" style="display:none;">
							<?php
								foreach($fields_types as $type){
									$class = '\GCore\Admin\Extensions\Chronoforms\Fields\\'.\GCore\Libs\Str::camilize($type).'\\'.\GCore\Libs\Str::camilize($type);
									$class::element();
									$class::config();
								}
							?>
						</div>
					</div>
					<div id="events-list" class="tab-pane">
						<div id="boxes-container" class="container" style="width:100%;">
							<?php if(!empty($this->data['setup']) OR !empty($this->data['Form']['params']['setup'])): ?>
							<?php $easy_actions = $this->DnaBuilder->config = false;; ?>
							<?php $easy_actions = $this->DnaBuilder->get_actions($this->data['Form']['extras']['DNA']); ?>
							<div class="row">
								<div class="panel panel-success">
									<div class="panel-heading">
										<ul class="nav nav-pills">
											<?php $counter = 0; ?>
											<?php foreach($easy_actions as $easy_action_id => $easy_action_name): ?>
												<?php
													$action_class = '\GCore\Admin\Extensions\Chronoforms\Actions\\'.\GCore\Libs\Str::camilize($easy_action_name).'\\'.\GCore\Libs\Str::camilize($easy_action_name);
													if(class_exists($action_class) AND property_exists($action_class, 'setup')):
												?>
													<li class="<?php echo empty($class) ? 'active' : ''; ?>">
														<a href="#<?php echo $easy_action_name.$easy_action_id; ?>" data-g-toggle="tab"><?php echo $action_class::$setup['simple']['title']; ?> <span class="label label-info"><?php echo str_replace('_', '', $easy_action_id); ?></span></a>
													</li>
												<?php $counter++; ?>
												<?php endif; ?>
											<?php endforeach; ?>
										</ul>
									</div>
									<div class="panel-body">
										<div class="tab-content">
											<?php $counter = 0; ?>
											<?php foreach($easy_actions as $easy_action_id => $easy_action_name): ?>
												<?php
													$action_class = '\GCore\Admin\Extensions\Chronoforms\Actions\\'.\GCore\Libs\Str::camilize($easy_action_name).'\\'.\GCore\Libs\Str::camilize($easy_action_name);
													if(class_exists($action_class) AND property_exists($action_class, 'setup')):
												?>
													<div id="<?php echo $easy_action_name.$easy_action_id; ?>" class="tab-pane <?php echo (empty($counter)) ? 'active' : ''; ?>">
														<?php
															ob_start();
															$action_class::config();
															$action_config = ob_get_clean();
															$action_config = str_replace('{N}', str_replace('_', '', $easy_action_id), $action_config);
															echo $action_config;
														?>
													</div>
												<?php $counter++; ?>
												<?php else: ?>
													<div style="display:none;">
														<?php
															ob_start();
															$action_class::config();
															$action_config = ob_get_clean();
															$action_config = str_replace('{N}', str_replace('_', '', $easy_action_id), $action_config);
															echo $action_config;
														?>
													</div>
												<?php endif; ?>
											<?php endforeach; ?>
										</div>
									</div>
								</div>
							</div>
							<?php endif; ?>
							<div class="row"<?php if(!empty($this->data['setup']) OR !empty($this->data['Form']['params']['setup'])): ?> style="display:none;"<?php endif; ?>>
								<?php
									$action_cats = array();
									foreach($actions_list as $action){
										$action_class = '\GCore\Admin\Extensions\Chronoforms\Actions\\'.\GCore\Libs\Str::camilize($action).'\\'.\GCore\Libs\Str::camilize($action);
										if(class_exists($action_class)){
											if(isset($action_class::$platforms) AND !in_array(\GCore\C::get('GSITE_PLATFORM'), $action_class::$platforms)){
												continue;
											}
											if(isset($action_class::$group)){
												$group_ids = array_keys($action_class::$group);
												$actions_groups[$group_ids[0]][] = $action;
												$action_cats[$group_ids[0]] = $action_class::$group[$group_ids[0]];
											}else{
												$actions_groups['1_basic'][] = $action;
												$action_cats['1_basic'] = l_('CF_BASIC');
											}
										}
									}
									ksort($action_cats);
								?>
								<div id="actions_list" class="col-md-2">
									<div class="panel-group" id="actions-accordion">
										<?php
											$groups_ids = array_keys($action_cats);
											$first_group_id = $groups_ids[0];
										?>
										<?php foreach($action_cats as $group_id => $group): ?>
											<div class="panel panel-default">
												<div class="panel-heading" style="padding:4px 15px;">
													<h4 class="panel-title">
														<a data-g-toggle="collapse" data-g-parent="#actions-accordion" href="#collapse-<?php echo $group_id; ?>"><?php echo $group; ?></a>
													</h4>
												</div>
												<div id="collapse-<?php echo $group_id; ?>" class="panel-collapse<?php if($group_id == $first_group_id): ?> in<?php else: ?> collapse<?php endif; ?>">
													<div class="panel-body">
														<?php $actions = $actions_groups[$group_id]; ?>
														<?php foreach($actions as $action): ?>
															<?php
																$action_class = '\GCore\Admin\Extensions\Chronoforms\Actions\\'.\GCore\Libs\Str::camilize($action).'\\'.\GCore\Libs\Str::camilize($action);
																if(class_exists($action_class) AND isset($action_class::$title)):
																$action_class = new $action_class();
																$action_class::admin_initialize($action);
																if(!isset($action_class::$info)){
																	$action_info = array('title' => $action_class::$title, 'content' => $action_class::$title);
																}else{
																	$action_info = $action_class::$info;
																}
															?>
															<div class="action_source_item" id="<?php echo $action; ?>" title="<?php echo $action_class::$title; ?>" style="margin:1px;">
																<span class="btn btn-primary btn-xs btn-block PopOverReady" data-title="<?php echo $action_info['title']; ?>" data-content="<?php echo $action_info['content']; ?>"><?php echo $action_class::$title; ?></span>
																<?php if(!empty($action_class->events)): ?>
																	<?php foreach($action_class->events as $event => $val): ?>
																		<?php
																			if($event == 'success' OR (isset($action_class->events_status[$event]) AND $action_class->events_status[$event] == 'success')){
																				$e_cl = array('good_event', 'success');
																			}else{
																				$e_cl = array('bad_event', 'danger');
																			}
																		?>
																		<div class="form_event <?php echo $e_cl[0]; ?> alert alert-<?php echo $e_cl[1]; ?> hidden_event" title="<?php echo $event; ?>" id="cfactionevent_<?php echo $action; ?>_{N}_<?php echo $event; ?>">
																			<label class="form_event_label label label-<?php echo $e_cl[1]; ?>">On <?php echo \GCore\Libs\Str::camilize($event); ?></label>
																			<input type="hidden" value="" class="events_dna" alt="ghost" name="">
																		</div>
																	<?php endforeach; ?>
																<?php endif; ?>
																<?php
																	ob_start();
																	$action_class::config();
																	$default_action_contents = ob_get_clean();
																	if(isset($action_class->defaults)){
																		echo \GCore\Helpers\DataLoader::load($default_action_contents, array('Form' => array('extras' => array('actions_config' => array('{N}' => $action_class->defaults)))));
																	}else{
																		echo $default_action_contents;
																	}
																?>
															</div>
															<?php endif; ?>
														<?php endforeach; ?>
													</div>
												</div>
											</div>
										<?php endforeach; ?>
									</div>
								</div>
								<div id="droppable_area_actions" class="droppable col-md-10">
								<?php
									if(empty($this->data['Form']['extras']['DNA'])){
										$this->data['Form']['extras']['DNA'] = array('load' => array(), 'submit' => array());
									}
									foreach($this->data['Form']['extras']['DNA'] as $event => $info):
								?>
								<div class="form_event main_event good_event alert alert-success" id="FormOn<?php echo \GCore\Libs\Str::camilize($event); ?>Event">
									<label class="form_event_label label label-success pull-left">On <?php echo $event; ?></label>
									<?php if(!in_array($event, array('load', 'submit'))): ?>
									<label class="form_event_delete_label label label-danger pull-right"><?php echo l_('CF_DELETE'); ?></label>
									<?php endif; ?>
									<div class="clearfix"></div>
									<input type="hidden" value="" class="events_dna" alt="ghost" name="Form[extras][DNA][<?php echo $event; ?>]">
									<?php echo $this->DnaBuilder->build($info, 'Form[extras][DNA]['.$event.']', isset($this->data['Form']['extras']['actions_config']) ? $this->data['Form']['extras']['actions_config'] : array()); ?>
								</div>
								<?php endforeach; ?>
								<button class="btn btn-success" data-g-toggle="modal" data-g-target="#add_new_event" id="add_new_event_modal_toggler" onclick="jQuery('#add_new_event').css('top', jQuery(window).scrollTop());">
									<?php echo l_('CF_ADD_NEW_EVENT'); ?>
								</button>
								<br>
								<!-- Modal -->
								<div class=" fade" id="add_new_event" tabindex="-1" role="dialog" aria-labelledby="Event_ModalLabel" aria-hidden="true" style="display:none; position:absolute; top:0; left:0; width:100%;">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-g-dismiss="modal" aria-hidden="true">&times;</button>
												<h4 class="modal-title" id="Event_Label"><?php echo l_('CF_ADD_NEW_EVENT'); ?></h4>
											</div>
											<div class="modal-body">
												<?php echo $this->Html->formSecStart(); ?>
												<?php echo $this->Html->formLine('new_event_name', array('type' => 'text', 'id' => 'new_event_name', 'label' => 'Event Name')); ?>
												<?php echo $this->Html->formSecEnd(); ?>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-success" data-g-dismiss="modal" id="add_new_event_button"><?php echo l_('CF_ADD_NEW_EVENT'); ?></button>
											</div>
										</div>
									</div>
								</div>
							</div>
							</div>
						</div>
					</div>
					<div id="locales" class="tab-pane">
						<button class="btn btn-success" data-g-toggle="modal" data-g-target="#add_new_locale">
							<?php echo l_('CF_ADD_NEW_LOCALE'); ?>
						</button>
						<br>
						<!-- Modal -->
						<div class=" fade" id="add_new_locale" tabindex="-1" role="dialog" aria-labelledby="Locale_ModalLabel" aria-hidden="true" style="display:none;">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-g-dismiss="modal" aria-hidden="true">&times;</button>
										<h4 class="modal-title" id="Locale_Label"><?php echo l_('CF_ADD_NEW_LOCALE'); ?></h4>
									</div>
									<div class="modal-body">
										<?php echo $this->Html->formSecStart(); ?>
										<?php echo $this->Html->formLine('locale_name', array('type' => 'text', 'id' => 'locale_name', 'label' => l_('CF_LANG_NAME'), 'sublabel' => l_('CF_LANG_NAME_DESC'))); ?>
										<?php echo $this->Html->formSecEnd(); ?>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-success" data-g-dismiss="modal" id="add_new_locale_button"><?php echo l_('CF_ADD_NEW_LOCALE'); ?></button>
									</div>
								</div>
							</div>
						</div>

						<!-- tabs -->
						<ul class="nav nav-tabs" id="locales_tabs_heads" style="margin-top:10px;">
							<?php if(isset($this->data['Form']['extras']['locales'])):	?>
								<?php foreach($this->data['Form']['extras']['locales'] as $k => $locale): ?>
									<li class=""><a href="#locale-<?php echo $k; ?>" data-g-toggle="tab"><?php echo $k; ?></a></li>
								<?php endforeach; ?>
							<?php endif; ?>
						</ul>

						<!-- Tab panes -->
						<div class="tab-content" id="locales_tabs_contents">
							<?php if(isset($this->data['Form']['extras']['locales'])):	?>
								<?php foreach($this->data['Form']['extras']['locales'] as $k => $locale): ?>
									<div class="tab-pane" id="locale-<?php echo $k; ?>">
										<?php echo $this->Html->formStart(); ?>
										<?php echo $this->Html->formSecStart(); ?>
											<?php echo $this->Html->formLine('Form[extras][locales]['.$k.'][lang_tag]', array('type' => 'text', 'label' => l_('CF_LANG_TAG'), 'sublabel' => l_('CF_LANG_TAG_DESC'))); ?>
											<?php echo $this->Html->formLine('Form[extras][locales]['.$k.'][strict]', array('type' => 'dropdown', 'label' => l_('CF_LANG_STRICT'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_LANG_STRICT_DESC'))); ?>
											<?php echo $this->Html->formLine('Form[extras][locales]['.$k.'][strings]', array('type' => 'textarea', 'style' => 'width:auto;', 'rows' => 10, 'cols' => 80, 'label' => l_('CF_LANG_STRINGS'), 'sublabel' => l_('CF_LANG_STRINGS_DESC'))); ?>
										<?php echo $this->Html->formSecEnd(); ?>
										<?php echo $this->Html->formEnd(); ?>
										<a class="remove_locale_button btn btn-danger" onclick="remove_locale('<?php echo $k; ?>');" href="#">
											<?php echo l_('REMOVE_LOCALE'); ?>
										</a>
									</div>
								<?php endforeach; ?>
							<?php endif; ?>
						</div>
					</div>
					
					<div id="db_settings" class="tab-pane">
						<?php echo $this->Html->formStart(); ?>
						<?php echo $this->Html->formSecStart(); ?>
						<?php
						$tables = array();
						if(!empty($this->data['Form']['extras']['actions_config'])){
							foreach($this->data['Form']['extras']['actions_config'] as $i => $action_config){
								if(!empty($action_config['tablename'])){
									$tables[] = $action_config['tablename'];
								}
							}
						}
						?>
						<?php foreach($tables as $table): ?>
							<?php echo $this->Html->formLine('Form[extras][db_fields_list]['.$table.']', array('type' => 'textarea', 'label' => array('text' => sprintf(l_('CF_DB_FIELDS_LIST'), $table), 'position' => 'top'), 'style' => 'width:auto;', 'rows' => 7, 'cols' => 100, 'sublabel' => l_('CF_DB_FIELDS_LIST_DESC'))); ?>
						<?php endforeach; ?>
						<?php echo $this->Html->formSecEnd(); ?>
						<?php echo $this->Html->formEnd(); ?>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</form>
</div>

<div id="locale_generic_config" class="generic_config" title="Generic" style="display:none;">
	<?php echo $this->Html->formStart(); ?>
	<?php echo $this->Html->formSecStart(); ?>
	<?php echo $this->Html->formLine('Form[extras][locales][{N}][lang_tag]', array('type' => 'text', 'label' => l_('CF_LANG_TAG'), 'sublabel' => l_('CF_LANG_TAG_DESC'))); ?>
	<?php echo $this->Html->formLine('Form[extras][locales][{N}][strict]', array('type' => 'dropdown', 'label' => l_('CF_LANG_STRICT'), 'options' => array(0 => l_('NO'), 1 => l_('YES')), 'sublabel' => l_('CF_LANG_STRICT_DESC'))); ?>
	<?php echo $this->Html->formLine('Form[extras][locales][{N}][strings]', array('type' => 'textarea', 'style' => 'width:auto;', 'rows' => 10, 'cols' => 80, 'label' => l_('CF_LANG_STRINGS'), 'sublabel' => l_('CF_LANG_STRINGS_DESC'))); ?>

	<?php echo $this->Html->formSecEnd(); ?>
	<?php echo $this->Html->formEnd(); ?>
	<a class="remove_locale_button btn btn-danger" onclick="remove_locale('{N}');" href="#">
		<?php echo l_('REMOVE_LOCALE'); ?>
	</a>
</div>

<div class=" fade" id="modal_generic_config" tabindex="-1" role="dialog" aria-labelledby="Modal_ModalLabel" aria-hidden="true" style="display:none; position:absolute; top:0; left:0; width:100%;">
	<div class="modal-dialog" style="width:800px;">
		<div class="modal-content" style="width:800px;">
			<div class="modal-header">
				<button type="button" class="close" data-g-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="Modal_Label"><?php echo l_('CF_EDIT_ACTION_SETTINGS'); ?></h4>
			</div>
			<div class="modal-body">

			</div>
			<div class="modal-footer">
				<a class="btn btn-info pull-left" target="_blank" href="http://www.chronoengine.com/faqs.html" id="help_link">More info on ChronoEngine.com</a>
				<button type="button" class="btn btn-success" data-g-dismiss="modal" id="apply_config_button"><?php echo l_('CF_SAVE_AND_CLOSE'); ?></button>
			</div>
		</div>
	</div>
</div>
<div id="add_multi_field_dialog" class="add_action_dialog" title="<?php echo l_('CF_INSERT_MULTI_FIELD'); ?>" style="display:none;">
	<?php echo $this->Html->formSecStart(); ?>
	<?php
		unset($foptions['container']);
		unset($foptions['multi']);
		echo $this->Html->formLine('field_type_selector', array('type' => 'multi', 'layout' => 'wide', 'label' => 'Field Type', 'inputs' => array(
			array('type' => 'dropdown', 'name' => 'fields_types_list', 'id' => 'fields_types_list', 'options' => $foptions, 'style' => 'width:auto;'),
			array('type' => 'button', 'name' => 'stack_field', 'id' => 'stack_field', 'value' => ' >> '),
			array('type' => 'dropdown', 'name' => 'multi_field_stack', 'id' => 'multi_field_stack', 'options' => array(), 'size' => 5, 'multiple' => 'multiple', 'style' => 'width:200px;'),
		)));
	?>
	<?php echo $this->Html->formSecEnd(); ?>
</div>

</div>
</div>