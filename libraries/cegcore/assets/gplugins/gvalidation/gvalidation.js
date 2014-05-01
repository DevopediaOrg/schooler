jQuery(document).ready(function($){
	var GValidtaion = {
		rules : {
			required : /[^.*]/,
			alpha : /^[a-z ._-]+$/i,
			alphanum : /^[a-z0-9 ._-]+$/i,
			digit : /^[-+]?[0-9]+$/,
			nodigit : /^[^0-9]+$/,
			number : /^[-+]?\d*\.?\d+$/,
			email : /^([a-zA-Z0-9_\.\-\+%])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/,
			image : /.(jpg|jpeg|png|gif|bmp)$/i,
			phone : /^\+{0,1}[0-9 \(\)\.\-]+$/, // alternate regex : /^[\d\s ().-]+$/,/^((\+\d{1,3}(-| )?\(?\d\)?(-| )?\d{1,5})|(\(?\d{2,6}\)?))(-| )?(\d{3,4})(-| )?(\d{4})(( x| ext)\d{1,5}){0,1}$/
			phone_inter : /^\+{0,1}[0-9 \(\)\.\-]+$/,
			url : /^(http|https|ftp)\:\/\/[a-z0-9\-\.]+\.[a-z]{2,3}(:[a-z0-9]*)?\/?([a-z0-9\-\._\?\,\'\/\\\+&amp;%\$#\=~])*$/i
		},
		errors : {
			required : 'This field is required.',
			alpha : 'This field accepts alphabetic characters only.',
			alphanum : 'This field accepts alphanumeric characters only.',
			digit : 'Please enter a valid integer.',
			nodigit : 'No digits are accepted.',
			number : 'Please enter a valid number.',
			email : 'Please enter a valid email.',
			image : 'This field should only contain image types',
			phone : 'Please enter a valid phone.',
			phone_inter : 'Please enter a valid international phone number.',
			url : 'Please enter a valid url.',
			group: 'Please make at least %1 selection(s).',
			confirm: 'Please make sure that the value matches the %1 field value.',
			custom: 'The value entered is not valid.',
		},
		display : 'tooltip',
	};

	$.fn.gvalidate = function(option){
		//return this.each(function(){
			var $this = $(this);
			if($this.prop('tagName') == 'FORM'){
				$this.find(':input[class*="validate["]').each(function(i, inp){
					var matches = $(inp).prop('class').match(/validate\[(.*?)\]/);
					if(matches && typeof matches[1] != 'undefined'){
						var rules = matches[1].split(',');
						$.each(rules, function(i, rule){
							rule = rule.replace(/("|')/g, '');
							$(inp).add_gvalidate_rule(rule);
						});
						//validate the field when some events occur
						$(inp).on('change', function(){
							var change_result = $(this).gvalidate();
						});
					}
				});
				$this.on('submit', function(e){
					var validation_passed = $this.gvalidate_submit();
					if(validation_passed){
						return true;
					}else{
						e.stopImmediatePropagation();
						return false;
					}
				});
			}else if($.inArray($this.prop('tagName'), ['input','select','textarea'])){
				//get field rules and check them
				var rules = $this.data('gvalidate_rules');
				var result = true;
				var failed_rules = '';
				if(result && $.isArray(rules) && rules.length > 0){
					$.each(rules, function(i, rule){
						if(result){
							result = $this.check_gvalidate_rule(rule);
							if(!result){
								failed_rules = rule;
								return false;
							}
						}
					});
					if(!result){
						$this.show_gvalidate_error(failed_rules);
					}else{
						$this.hide_gvalidate_error();
					}
				}
				return result;
			}else{
				//some container, validate fields inside
				return $this.gvalidate_submit();
			}
		//})
	}

	$.fn.add_gvalidate_rule = function(rule){
		return this.each(function(){
			var $this = $(this);
			var rules = $this.data('gvalidate_rules');
			if(!$.isArray(rules))rules = [];
			rules.push(rule);
			$this.data('gvalidate_rules', rules);
		})
	}

	$.fn.check_gvalidate_rule = function(rule){
		var $this = $(this);
		var $type = $this.prop('type');
		//console.log($this.prop('name'));
		var $rule_parts = rule.split(':');
		if(GValidtaion.rules.hasOwnProperty($rule_parts[0])){
			if($.inArray($type, ['checkbox','radio']) > -1){
				return $this.prop('checked');
			}else{
				if($rule_parts[0] == 'required'){
					return $this.val().trim().match(GValidtaion.rules[$rule_parts[0]]);
				}else{
					return (!$this.val().trim() || $this.val().trim().match(GValidtaion.rules[$rule_parts[0]]));
				}
			}
		}else{
			if($rule_parts[0] == 'group'){
				var count = 0;
				$('input[class*="group:'+$rule_parts[1]+'"]').each(function(i, chk){
					if($(chk).prop('checked')){
						count = count + 1;
					}
				});
				var limit = ($rule_parts[2] ? $rule_parts[2] : 1);
				return (count >= limit);
			}else if($rule_parts[0] == 'confirm'){
				return ($('#'+$rule_parts[1]).val() == $this.val());
			}else if($rule_parts[0] == 'custom'){
				var fn = $rule_parts[1];
				if(fn in window){
					return window[fn]($this);
				}
				return true;
			}
		}
		return true;
	}

	$.fn.show_gvalidate_error = function(rule){
		var $this = $(this);
		//$this.focus();
		$this.removeClass('gvalidate_valid');
		$this.addClass('gvalidate_has_errors');

		//check if field is visible
		if($this.is(':hidden')){
			//if field is under some tab
			if(typeof $this.closest('.tab-pane') !== 'undefined'){
				var tab_id = $this.closest('.tab-pane').attr('id');
				$('a[href="#'+tab_id+'"]').tab('show');
			}
		}
		if($this.data('wysiwyg') == '1'){
			$this.data('gtooltip-target', $this.parent());
		}
		//if($this.hasClass('gvalidate_error_shown')){
			if(typeof $this.data('gvalidate_invalid') == 'undefined' || $this.data('gvalidate_invalid') != rule){
				$this.gtooltip('destroy', 'gtooltip gvalidation-error-tip');
			}
		//}
		if(!$this.hasClass('gvalidate_error_shown')){
			$this.data('gvalidate_invalid', rule);
			var $rule_parts = rule.split(':');
			rule = $rule_parts[0];
			if(typeof $this.data('gvalidate_errors_'+rule) == 'undefined'){
				if($this.prop('title')){
					$this.data('gvalidate_errors_'+rule, $this.prop('title'));
					//$this.prop('title', '');
				}else{
					var error_string = GValidtaion.errors[rule];
					$.each($rule_parts, function(i, val){
						error_string = error_string.replace('%'+i, val);
					});
					$this.data('gvalidate_errors_'+rule, error_string);
				}
			}

			//$this.data('title', function(){return false;});
			$this.data('content', '<span class="gvalidation-error-text">'+$this.data('gvalidate_errors_'+rule)+'</span>');
			if(GValidtaion.display == 'tooltip'){
				$this.gtooltip({'tipclass':'gtooltip gvalidation-error-tip', 'closable': 1});

				//$this.addClass('gvalidate_error_shown');
				/*$this.on('hidden.bs.popover', function(){
					$this.removeClass('gvalidate_error_shown');
				});*/
				$this.gtooltip('show');
			}else{
				$this.parent().after($($this.data('content')).css('display', 'block'));
			}
		}
		$this.focus();
	}

	$.fn.hide_gvalidate_error = function(){
		return this.each(function(){
			var $this = $(this);
			//$this.removeClass('gvalidate_error_shown');
			$this.removeClass('gvalidate_has_errors');
			$this.addClass('gvalidate_valid');
			$this.gtooltip('destroy', 'gtooltip gvalidation-error-tip');
		})
	}

	$.fn.gvalidate_submit = function(){
		var $this = $(this);
		//check if there are any errors astray
		/*$this.find('.gvalidate_has_errors').each(function(i, inp){
			var false_error = $(inp).gvalidate();
			if(false_error){
				$(inp).hide_gvalidate_error();
			}
		});*/

		var result = true;
		$this.find(':input[class*="validate["]:not(.gvalidate_valid)').each(function(i, inp){
			result = $(inp).gvalidate();
			if(!result){
				return false;
			}else{
				$(inp).hide_gvalidate_error();
			}
		});

		//return false;
		if(!result){
			return false;
		}else{
			return true;
		}
	}
});