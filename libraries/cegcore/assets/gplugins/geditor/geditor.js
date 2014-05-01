/**
* ChronoCMS version 1.0
* Copyright (c) 2012 ChronoCMS.com, All rights reserved.
* Author: (ChronoCMS.com Team)
* license: Please read LICENSE.txt
* Visit http://www.ChronoCMS.com for regular updates and information.
**/
$.fn.gcoreEditor = function(options){
// extend the option with the default ones	
	var buttonsList = [
		{
			type : 'a',
			'class' : 'gcore-editor-button gcore-editor-button-bold',
			title : 'Bold',
			data : {
				startTag : '<strong>',
				endTag : '</strong>',
				evnt : 'click'
			},
		},
		{
			type : 'a',
			'class' : 'gcore-editor-button gcore-editor-button-italic',
			title : 'Italic',
			data : {
				startTag : '<em>',
				endTag : '</em>',
				evnt : 'click'
			},
		},
		{
			type : 'a',
			'class' : 'gcore-editor-button gcore-editor-button-underline',
			title : 'Underlined',
			data : {
				startTag : '<span style="text-decoration: underline;">',
				endTag : '</span>',
				evnt : 'click'
			},
		},
		{
			type : 'a',
			'class' : 'gcore-editor-button gcore-editor-button-strikethrough',
			title : 'Strike Through',
			data : {
				startTag : '<span style="text-decoration: line-through;">',
				endTag : '</span>',
				evnt : 'click'
			},
		},
		{type : 'spacer',},
		{
			type : 'a',
			title : 'Change Font',
			'class' : 'gcore-editor-button gcore-editor-button-font',
			data : {
				'options' : {'Arial' : 'Arial','Comic Sans MS': 'Comic Sans MS','Courier New': 'Courier New','Monotype Corsiva': 'Monotype Corsiva','Tahoma': 'Tahoma','Times': 'Times'},
				'options_classes' : {
					'Arial': 'gceditor_font_arial',
					'Comic Sans MS': 'gceditor_font_comic',
					'Courier New': 'gceditor_font_courier',
					'Monotype Corsiva': 'gceditor_font_monotype',
					'Tahoma': 'gceditor_font_tahoma',
					'Times': 'gceditor_font_times',
				},
				'startTags' : {
					'Arial': '<font style="font-family: Arial;">',
					'Comic Sans MS': '<font style="font-family: Comic Sans MS;">',
					'Courier New': '<font style="font-family: Courier New;">',
					'Monotype Corsiva': '<font style="font-family: Monotype Corsiva;">',
					'Tahoma': '<font style="font-family: Tahoma;">',
					'Times': '<font style="font-family: Times;">',
				},
				'endTags' : {
					'Arial': '</font>',
					'Comic Sans MS': '</font>',
					'Courier New': '</font>',
					'Monotype Corsiva': '</font>',
					'Tahoma': '</font>',
					'Times': '</font>',
				},
			},
		},
		{
			type : 'a',
			title : 'Font Size',
			'class' : 'gcore-editor-button gcore-editor-button-size',
			data : {
				'options' : {
					'very big': 'Very Big',
					'big': 'Big',
					'normal': 'Normal',
					'small': 'Small',
				},
				'options_classes' : {
					'very big': 'gceditor_font_size_vbig',
					'big': 'gceditor_font_size_big',
					'normal': 'gceditor_font_size_normal',
					'small': 'gceditor_font_size_small',
				},
				'startTags' : {
					'very big': '<span style="font-size: 24px; line-height: 24px;">',
					'big': '<span style="font-size: 18px; line-height: 18px;">',
					'normal': '<span style="font-size: 12px;">',
					'small': '<span style="font-size: 10px;">',
				},
				'endTags' : {
					'very big': '</span>',
					'big': '</span>',
					'normal': '</span>',
					'small': '</span>',
				},
			},
		},
		{
			type : 'a',
			title : 'Font Color',
			'class' : 'gcore-editor-button gcore-editor-button-colors',
			data : {
				'options' : {
					'yellow': 'Yellow',
					'orange': 'Orange',
					'red': 'Red',
					'blue': 'Blue',
					'purple': 'Purple',
					'green': 'Green',
					'white': 'White',
					'grey': 'Grey',
					'black': 'Black',
				},
				'options_classes' : {
					'yellow': 'gceditor_color_yellow',
					'orange': 'gceditor_color_orange',
					'red': 'gceditor_color_red',
					'blue': 'gceditor_color_blue',
					'purple': 'gceditor_color_purple',
					'green': 'gceditor_color_green',
					'white': 'gceditor_color_white',
					'grey': 'gceditor_color_grey',
					'black': 'gceditor_color_black',
				},
				'startTags' : {
					'yellow': '<span style="color: yellow;">',
					'orange': '<span style="color: orange;">',
					'red': '<span style="color: red;">',
					'blue': '<span style="color: blue;">',
					'purple': '<span style="color: purple;">',
					'green': '<span style="color: green;">',
					'white': '<span style="color: white;">',
					'grey': '<span style="color: grey;">',
					'black': '<span style="color: black;">',
				},
				'endTags' : {
					'yellow': '</span>',
					'orange': '</span>',
					'red': '</span>',
					'blue': '</span>',
					'purple': '</span>',
					'green': '</span>',
					'white': '</span>',
					'grey': '</span>',
					'black': '</span>',
				},
				iconic: true,
			},
		},
		{
			type : 'a',
			title : 'Change Formatting',
			'class' : 'gcore-editor-button gcore-editor-button-formatting',
			data : {
				'options' : {
					'h1': 'Header 1',
					'h2': 'Header 2',
					'h3': 'Header 3',
					'h4': 'Header 4',
					'h5': 'Header 5',
					'h6': 'Header 6',
					/*'p': 'Paragraph',
					'q': 'Quote',
					'pre': 'Preformatted',*/
				},
				'options_classes' : {
					'h1': 'gceditor_formatblock_h1',
					'h2': 'gceditor_formatblock_h2',
					'h3': 'gceditor_formatblock_h3',
					'h4': 'gceditor_formatblock_h4',
					'h5': 'gceditor_formatblock_h5',
					'h6': 'gceditor_formatblock_h6',
					/*'p': 'gceditor_formatblock_p',
					'q': 'gceditor_formatblock_q',
					'pre': 'gceditor_formatblock_pre',*/
				},
				iconic: true,
				'startTags' : {
					'h1': '<h1>',
					'h2': '<h2>',
					'h3': '<h3>',
					'h4': '<h4>',
					'h5': '<h5>',
					'h6': '<h6>',
					/*'p': '<p>',
					'q': '<blockquote>',
					'pre': '<pre>',*/
				},
				'endTags' : {
					'h1': '</h1>',
					'h2': '</h2>',
					'h3': '</h3>',
					'h4': '</h4>',
					'h5': '</h5>',
					'h6': '</h6>',
					/*'p': '</p>',
					'q': '</blockquote>',
					'pre': '</pre>',*/
				},
			},
		},
		{
			type : 'a',
			'class' : 'gcore-editor-button gcore-editor-button-p',
			title : 'Paragraph',
			data : {
				startTag : '<p>',
				endTag : '</p>',
				evnt : 'click'
			},
		},
		{type : 'spacer',},
		{
			type : 'a',
			title : 'Change Align',
			'class' : 'gcore-editor-button gcore-editor-button-align',
			data : {
				'options' : {
					'align-left': 'Align Left',
					'align-right': 'Align Right',
					'align-center': 'Align Center',
					'align-justify': 'Align Full/Justify',
				},
				'options_classes' : {
					'align-left': 'gceditor_btn_align_left',
					'align-right': 'gceditor_btn_align_right',
					'align-center': 'gceditor_btn_align_center',
					'align-justify': 'gceditor_btn_align_justify',
				},
				iconic: true,
				'startTags' : {
					'align-left': '<p style="text-align: left;">',
					'align-right': '<p style="text-align: right;">',
					'align-center': '<p style="text-align: center;">',
					'align-justify': '<p style="text-align: justify;">',
				},
				'endTags' : {
					'align-left': '</p>',
					'align-right': '</p>',
					'align-center': '</p>',
					'align-justify': '</p>',
				},
			},
		},
		{
			type : 'a',
			'class' : 'gcore-editor-button gcore-editor-button-indent',
			title : 'Indent',
			data : {
				startTag : '<font style="padding-left: 20px;">',
				endTag : '</font>',
				evnt : 'click'
			},
		},
		{type : 'spacer',},
		{
			type : 'a',
			'class' : 'gcore-editor-button gcore-editor-button-code',
			title : 'Preformatted',
			data : {
				startTag : '<pre>',
				endTag : '</pre>',
				evnt : 'click'
			},
		},
		{
			type : 'a',
			'class' : 'gcore-editor-button gcore-editor-button-quote',
			title : 'Quote',
			data : {
				startTag : '<blockquote>',
				endTag : '</blockquote>',
				evnt : 'click'
			},
		},
		{type : 'spacer',},
		{
			type : 'a',
			title : 'Change Align',
			'class' : 'gcore-editor-button gcore-editor-button-bullets',
			data : {
				'options' : {
					'bullets': 'Bullets List',
					'numbers': 'Numbered List',
					'item': 'List item',
				},
				'options_classes' : {
					'bullets': 'gcore-editor-button-bullets',
					'numbers': 'gcore-editor-button-numbers',
					'item': 'gcore-editor-button-item',
				},
				iconic: true,
				'startTags' : {
					'bullets': '<ul>',
					'numbers': '<ol>',
					'item': '<li>',
				},
				'endTags' : {
					'bullets': '</ul>',
					'numbers': '</ol>',
					'item': '</li>',
				},
			},
		},
		{type : 'spacer',},
		{
			type : 'a',
			href : 'javascript:void(null);',
			'class' : 'gcore-editor-button gcore-editor-button-link',
			title : 'Insert Link',
			data : {
				fn_call: 'openLinkDialog',
				evnt : 'click'
			},
		},
		{
			type : 'a',
			href : 'javascript:void(null);',
			'class' : 'gcore-editor-button gcore-editor-button-image',
			title : 'Insert Image',
			data : {
				fn_call: 'openImageDialog',
				evnt : 'click'
			},
		},
		{type : 'spacer',},
		{
			type : 'a',
			'class' : 'gcore-editor-button gcore-editor-button-hrule',
			title : 'Horizontal ruler',
			data : {
				startTag : '<hr />',
				endTag : '',
				evnt : 'click'
			},
		},
		{
			type : 'a',
			'class' : 'gcore-editor-button gcore-editor-button-super',
			title : 'Superscript',
			data : {
				startTag : '<sup>',
				endTag : '</sup>',
				evnt : 'click'
			},
		},
		{
			type : 'a',
			'class' : 'gcore-editor-button gcore-editor-button-sub',
			title : 'Subscript',
			data : {
				startTag : '<sub>',
				endTag : '</sub>',
				evnt : 'click'
			},
		},
		{type : 'spacer',},
		{
			type : 'a',
			href : 'javascript:void(null);',
			'class' : 'gcore-editor-button gcore-editor-button-html',
			title : 'HTML',
			data : {
				fn_call: 'switchMode',
				evnt : 'click'
			},
		},
	];
		
	var settings = $.extend({
		wysiwyg : true,
		width : 685,
		height : 300,
		toolbar_height: 25,
		active_mode: 'wysiwyg',
		wysiwyg_element: 'iframe',
	},options);
	
	var storedSelectionStart = null;
	var storedSelectionEnd = null;
	
	return this.each(function(){
		//var $this = $(this).hide();
		var editor = this;
		var textarea = editor;		
		
		function prepareArea(EditorElement){
			$(EditorElement).css('width', settings.width+'px');
			$(EditorElement).css('height', (settings.height - settings.toolbar_height - 15)+'px');
			$(EditorElement).css('padding', '5px');
			$(EditorElement).css('resize', 'none');
			$(EditorElement).css('overflow', 'auto');
			$(EditorElement).css('background-color', '#fff');
		}
		
		prepareArea(textarea);
		initializeEditorElement(textarea);
		var text_editor = $('#gcore_editor_container_'+$(textarea).attr('id'));
		var wysiwyg_editor = null;
		
		if(settings.wysiwyg){
			var editable = $('<'+settings.wysiwyg_element+'/>',{
				'class' : 'gcore-editor-editable',
				'contenteditable' : true,
				'id' : 'editable_'+$(textarea).attr('id')
			});
			
			text_editor.after(editable);
			prepareArea(editable);
			initializeEditorElement(editable);
			
			var wysiwyg_editor = $('#gcore_editor_container_'+$(editable).attr('id'));
			
			text_editor.after(wysiwyg_editor);
			text_editor.hide();
			
			if(settings.wysiwyg_element == 'iframe'){
				editable.get(0).contentWindow.document.open();
				editable.get(0).contentWindow.document.close();
				editable.get(0).contentWindow.document.designMode = "on";
			}
			//apply events
			$(textarea).on('keyup', function(){				
				if(settings.wysiwyg_element == 'iframe'){
					$(editable.get(0).contentWindow.document.body).html($(textarea).val());
				}else{
					$(editable).html($(textarea).val());
				}
			});
			
			if(settings.wysiwyg_element == 'iframe'){
				$(editable.get(0).contentWindow.document).on('keyup', function(){
					$(textarea).val($(editable.get(0).contentWindow.document.body).html());
				});
			}else{
				$(editable).on('keyup', function(){
					$(textarea).val($(editable).html());
				});
			}
			//add initial contents
			if(settings.wysiwyg_element == 'iframe'){
				setTimeout(function(){
					$(editable.get(0).contentWindow.document.body).html($(textarea).val());
				}, 0.5);
			}else{
				$(editable).html($(textarea).val());
			}
		}else{
			settings.active_mode = 'text';
		}

		function initializeEditorElement(EditorElement){
			// create a container div on the fly
			var containerDiv = $('<div/>',{
				css : {
					width : (settings.width + 10) +'px',
					height : (settings.height + 10) +'px',
					border : '3px solid #ccc'
				},
				'class' : 'gcore-editor-container',
				'id' : 'gcore_editor_container_'+$(EditorElement).attr('id')
			});
			$(EditorElement).wrap(containerDiv);
			
			//add toolbar
			var buttonsBar = $('<ul/>',{
				'class' : 'gcore-editor-btns-bar ui-widget-header',
				css : {
					width : '100%',
					height : settings.toolbar_height+'px',
					border: '1px solid #ccc'
				}
			});
			$(EditorElement).before(buttonsBar);
			
			$.each(buttonsList, function(i, btn){
				//var btn_type = btn.type;
				//btn.type = null;
				var buttonElement = $('<li/>',{
					'class' : 'gcore-editor-btn-element',
				}).appendTo(buttonsBar);
				btn.href = 'javascript:void(null);';
				
				if(btn.type == 'spacer'){
					buttonElement.addClass('gcore-editor-btn-spacer');
				}else{
					var newBTN = $('<'+btn.type+'/>', btn).appendTo(buttonElement);
					if(btn.data.options){
						var UL = $('<ul/>', {'class' : 'gcore-editor-dropdown-sub'});
						if(btn.data.iconic){
							UL.addClass('dropdown-sub-iconic');
						}
						$.each(btn.data.options,function(opti, optv){
							var LI = $('<li/>');
							if(btn.data.options_classes != undefined){
								var option_class = btn.data.options_classes[opti];
							}else{
								option_class = '';
							}
							$dd_item = $('<a/>',{
								text : optv,
								title : optv,
								href : 'javascript:void(null);',
								'class' : option_class
							});
							$dd_item.on('click', function(){
								EditorElement.focus();
								applyTag(EditorElement, btn.data.startTags[opti], btn.data.endTags[opti]);
								return false;
							});
							$dd_item.appendTo(LI);
							LI.appendTo(UL);
						});
						UL.appendTo(buttonElement);
						buttonElement.addClass('gcore-editor-btn-dropdown');
						buttonElement.on('hover', function(){
							$(this).find('.gcore-editor-dropdown-sub').toggle();
						});
					}
					if(btn.data.startTag || btn.data.endTag){
						newBTN.on(btn.data.evnt, function(){
							//$(this).toggleClass('gcore-editor-btn-selected');
							//EditorElement.focus();
							applyTag(EditorElement, btn.data.startTag, btn.data.endTag);
							return false;
						});
					}else if(btn.data.fn){
						newBTN.on(btn.data.evnt, function(){
							$(this).toggleClass('gcore-editor-btn-selected');
							$(this).data('fn')();
							return false;
						});
					}else if(btn.data.fn_call){
						newBTN.on(btn.data.evnt, function(){
							$(this).toggleClass('gcore-editor-btn-selected');
							var fn_name = $(this).data('fn_call');
							eval(fn_name+'(EditorElement)');
							return false;
						});
					}
				}
			});
		}
		
		function switchMode(EditorElement){
			if(EditorElement != textarea){
				//switch to html mode
				wysiwyg_editor.hide();
				text_editor.show();
				settings.active_mode = 'text';
			}else{
				//switch to editable mode
				wysiwyg_editor.show();
				text_editor.hide();
				settings.active_mode = 'wysiwyg';
			}
		}
		
		function openLinkDialog(EditorElement){
			storedSelectionStart = getSelectionStart(EditorElement);
			storedSelectionEnd = getSelectionEnd(EditorElement);
			injectLinkDialog(EditorElement);
			$('#gceditor-link-dialog-'+$(EditorElement).attr('id')).dialog('open');
		}
		
		function injectLinkDialog(EditorElement){
			var dialog = $(
				'<div id="gceditor-link-dialog-'+$(EditorElement).attr('id')+'" class="gceditor-link-dialog" title="Insert Link">'+
					'<div class="gform-line-td">'+
						'<label for="gceditor-link-dialog-url-'+$(EditorElement).attr('id')+'" class="gform-label-top">URL</label>'+
						'<div class="gform-input-wide">'+
						'<input type="text" id="gceditor-link-dialog-url-'+$(EditorElement).attr('id')+'" size="50" class="gform-text" value="http://" />'+
						'</div>'+
					'</div>'+
					'<div class="gform-line-td">'+
						'<label for="gceditor-link-dialog-target-'+$(EditorElement).attr('id')+'" class="gform-label-top">Target</label>'+
						'<div class="gform-input-wide">'+
						'<select id="gceditor-link-dialog-target-'+$(EditorElement).attr('id')+'" class="gform-dropdown">'+
							'<option value="_blank">New Page</option>'+
							'<option value="_parent">Parent Page</option>'+
						'</select>'+
						'</div>'+
					'</div>'+
					'<div class="gform-line-td">'+
						'<label for="gceditor-link-dialog-title-'+$(EditorElement).attr('id')+'" class="gform-label-top">Title</label>'+
						'<div class="gform-input-wide">'+
						'<input type="text" id="gceditor-link-dialog-title-'+$(EditorElement).attr('id')+'" size="50" class="gform-text" />'+
						'</div>'+
					'</div>'+
				'</div>'
			);
			$(EditorElement).after(dialog);
			dialog.dialog({
				autoOpen: false,
				height: 350,
				width: 400,
				modal: true,
				buttons: {
					'Insert': function(){
						var tag = '<a';
						tag = tag + ' href="'+$('#gceditor-link-dialog-url-'+$(EditorElement).attr('id')).val()+'"';
						$('#gceditor-link-dialog-url-'+$(EditorElement).attr('id')).val('http://');
						tag = tag + ' target="'+$('#gceditor-link-dialog-target-'+$(EditorElement).attr('id')).val()+'"';
						tag = tag + ' title="'+$('#gceditor-link-dialog-title-'+$(EditorElement).attr('id')).val()+'"';
						$('#gceditor-link-dialog-title-'+$(EditorElement).attr('id')).val('');
						tag = tag + '>';
						applyTag(EditorElement, tag, '</a>', storedSelectionStart, storedSelectionEnd);
						$(this).dialog('close');
					},
					Cancel: function(){
						$(this).dialog('close');
					}
				},
				open: function(){
					
				},
				close: function(){
					$(this).remove();
				}
			});
		}
		
		function openImageDialog(EditorElement){
			storedSelectionStart = getSelectionStart(EditorElement);
			storedSelectionEnd = getSelectionEnd(EditorElement);
			injectImageDialog(EditorElement);
			$('#gceditor-image-dialog-'+$(EditorElement).attr('id')).dialog('open');
		}
		
		function injectImageDialog(EditorElement){
			var dialog = $(
				'<div id="gceditor-image-dialog-'+$(EditorElement).attr('id')+'" class="gceditor-image-dialog" title="Insert Image">'+
					'<div class="gform-line-td">'+
						'<label for="gceditor-image-dialog-url-'+$(EditorElement).attr('id')+'" class="gform-label-top">URL/Path</label>'+
						'<div class="gform-input-wide">'+
						'<input type="text" id="gceditor-image-dialog-url-'+$(EditorElement).attr('id')+'" size="50" class="gform-text" value="" />'+
						'</div>'+
					'</div>'+
					'<div class="gform-line-td">'+
						'<label for="gceditor-image-dialog-align-'+$(EditorElement).attr('id')+'" class="gform-label-top">Alignment</label>'+
						'<div class="gform-input-wide">'+
						'<select id="gceditor-image-dialog-align-'+$(EditorElement).attr('id')+'" class="gform-dropdown">'+
							'<option value="">Not Set</option>'+
							'<option value="vertical-align:top;">Top</option>'+
							'<option value="vertical-align:middle;">Middle</option>'+
							'<option value="vertical-align:bottom;">Bottom</option>'+
							'<option value="vertical-align:baseline;">Baseline</option>'+
							'<option value="float:right;">Right</option>'+
							'<option value="float:left;">Left</option>'+
						'</select>'+
						'</div>'+
					'</div>'+
					'<div class="gform-line-td">'+
						'<label for="gceditor-image-dialog-title-'+$(EditorElement).attr('id')+'" class="gform-label-top">Title</label>'+
						'<div class="gform-input-wide">'+
						'<input type="text" id="gceditor-image-dialog-title-'+$(EditorElement).attr('id')+'" size="50" class="gform-text" />'+
						'</div>'+
					'</div>'+
					'<div class="gform-line-td">'+
						'<label for="gceditor-image-dialog-border-'+$(EditorElement).attr('id')+'" class="gform-label-top">Border</label>'+
						'<div class="gform-input-wide">'+
						'<input type="text" id="gceditor-image-dialog-border-'+$(EditorElement).attr('id')+'" size="3" class="gform-text" />'+
						'</div>'+
					'</div>'+
				'</div>'
			);
			$(EditorElement).after(dialog);
			dialog.dialog({
				autoOpen: false,
				height: 420,
				width: 400,
				modal: true,
				buttons: {
					'Media Manager': function(){
						var media_dialog = $('<div id="media_manager_dialog"><iframe src="index.php?cont=media&tvout=plain&editor=1" style="width:100%; height:100%;"></iframe></div>');
						media_dialog.dialog({
							autoOpen: false,
							height: 520,
							width: 650,
							modal: true,
							title : 'Media Manager',
							close: function(){
								media_dialog.remove();
							}
						});
						media_dialog.dialog('open');
						/*
						$.ajax({
							url: "index.php?cont=media&tvout=plain&editor=1",
						}).done(function(msg){
							$('#media_manager_dialog').html(msg);
						});
						*/
					},
					'Insert': function(){
						var tag = '<img';
						tag = tag + ' src="'+$('#gceditor-image-dialog-url-'+$(EditorElement).attr('id')).val()+'"';
						$('#gceditor-image-dialog-url-'+$(EditorElement).attr('id')).val('');
						tag = tag + ' style="'+$('#gceditor-image-dialog-align-'+$(EditorElement).attr('id')).val()+'"';
						tag = tag + ' alt="'+$('#gceditor-image-dialog-title-'+$(EditorElement).attr('id')).val()+'"';
						$('#gceditor-image-dialog-title-'+$(EditorElement).attr('id')).val('');
						tag = tag + ' border="'+$('#gceditor-image-dialog-border-'+$(EditorElement).attr('id')).val()+'"';
						$('#gceditor-image-dialog-border-'+$(EditorElement).attr('id')).val('');
						tag = tag + ' />';
						applyTag(EditorElement, tag, '', storedSelectionStart, storedSelectionEnd);
						$(this).dialog('close');
					},
					'Cancel': function(){
						$(this).dialog('close');
					}
				},
				open: function(){
					
				},
				close: function(){
					$(this).remove();
				}
			});
		}
		
		function applyTag(el, start_code, end_code, startAt, endAt){
			if(settings.wysiwyg == false || settings.active_mode == 'text'){
				if(el.setSelectionRange){
					//get range
					var startPos = (typeof startAt !== 'undefined') ? startAt : el.selectionStart;
					var endPos = (typeof endAt !== 'undefined') ? endAt : el.selectionEnd;
					//replace
					el.value = el.value.substring(0, startPos) + start_code
					+ el.value.substring(startPos, endPos) + end_code 
					+ el.value.substring(endPos, el.value.length);
					//store new pos
					var newPos = endPos + start_code.length + end_code.length;
					//set the selection range to the end of the new range
					el.setSelectionRange(newPos, newPos);
				}else{// IE code
					var selectedText = document.selection.createRange().text;
					if(selectedText != ''){
						var newText = start_code + selectedText + end_code;
						document.selection.createRange().text = newText;
					}
				}
				if(settings.wysiwyg){
					if(settings.wysiwyg_element == 'iframe'){
						$(editable.get(0).contentWindow.document.body).html($(textarea).val());
					}else{
						$(editable).html($(textarea).val());
					}
				}
			}else{
				var sel, range, node, doc;
				if(window.getSelection){
					// IE9 and non-IE
					sel = window.getSelection();
					doc = document;
					
					if(settings.wysiwyg_element == 'iframe'){
						sel = el.get(0).contentWindow.document.getSelection();
						doc = el.get(0).contentWindow.document;
					}
					
					if(typeof startAt !== 'undefined'){
						sel.addRange(startAt);
					}
					//range = sel.getRangeAt(0);
					if(sel.getRangeAt && sel.rangeCount){
						range = sel.getRangeAt(0);
						//var originalRange = range.cloneRange();
						//insert start tag
						//range.collapse(true);
						var container = doc.createElement("div");
						for (var i = 0, len = sel.rangeCount; i < len; ++i) {
							container.appendChild(sel.getRangeAt(i).cloneContents());
						}
						html = container.innerHTML;

						var el = doc.createElement("div");
						el.innerHTML = start_code+html+end_code;
						var frag = doc.createDocumentFragment(), node, lastNode;
						while((node = el.firstChild)){
							lastNode = frag.appendChild(node);
						}
						range.deleteContents();
						range.insertNode(frag);
						//originalRange.setEndAfter(lastNode);
						//sel.removeAllRanges();
						//sel.addRange(originalRange);
					}
				}/*else if(document.selection && document.selection.createRange){
					// IE < 9
					range = document.selection.createRange();
					range.collapse(isBefore);
					range.pasteHTML(html);
				}*/
				if(settings.wysiwyg_element == 'iframe'){
					$(textarea).val($(editable.get(0).contentWindow.document.body).html());
				}else{
					$(textarea).val($(editable).html());
				}
			}
		}
		
		function getSelectionStart(el){
			if(settings.wysiwyg == false || settings.active_mode == 'text'){
				if(el.setSelectionRange){
					return el.selectionStart;
				}else{//old browsers, not supported now
					return 0;
				}
			}else{
				if(window.getSelection){
					var sel = window.getSelection();
					if(settings.wysiwyg_element == 'iframe'){
						sel = el.get(0).contentWindow.document.getSelection();
					}
					if(sel.rangeCount){
						return sel.getRangeAt(0);
					}else{
						return undefined;
					}
				}else{
					return 0;
				}
			}
		}
		
		function getSelectionEnd(el){
			if(el.setSelectionRange){
				return el.selectionEnd;
			}else{//old browsers, not supported now
				return 0;
			}
		}
		
	});
};