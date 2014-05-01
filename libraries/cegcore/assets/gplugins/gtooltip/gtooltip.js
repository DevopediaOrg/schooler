(function($){
	var GTooltip = {
		'tipclass' : 'gtooltip',
		'awaytime': 800,
		'ajax_cache': {},
		'append': 'after',
		'ajaxloading': 'Loading....',
		'position':'top',
		'ontime': 0,
		'closable':0,
	};
	
	$.fn.gtooltip_tipref = function(tipclass){
		var $this = $(this);
		if(typeof tipclass == 'undefined'){
			var tipclass = $this.data('gtooltip_params').tipclass;
		}
		return tipclass.replace(/ /, '');
	};
	
	$.fn.gtooltip_return = function(tipclass){
		var $this = $(this);
		if(typeof tipclass == 'undefined'){
			var tipclass = $this.data('gtooltip_params').tipclass;
		}
		if(typeof $this.data('gtooltip-tips') != 'undefined' && typeof $this.data('gtooltip-tips')[$this.gtooltip_tipref(tipclass)] != 'undefined'){
			return $this.data('gtooltip-tips')[$this.gtooltip_tipref(tipclass)];
		}else{
			return $();	
		}
		//return $this.next('.gtooltip');
	};

	$.fn.gtooltip = function(option, tipclass){
		if(!$(this).length){
			return false;	
		}
		$.each($(this), function(i, elem){
			var $this = $(elem);
			if(!$this.data('gtooltip_params')){
				$this.data('gtooltip_params', $.extend({}, GTooltip));
			}
			if($.type(option) == 'string'){
				if(option == 'show'){// && ($this.gtooltip_return().length < 1 || !($this.gtooltip_tipref() in $this.data('gtooltip-tips')))){//$this.next('.gtooltip').attr('class') != $this.data('gtooltip_params').tipclass)){
					if($this.data('gtooltip-tips')){
						if(!($this.gtooltip_tipref() in $this.data('gtooltip-tips'))){
							//remove an existing tip which has a different class
							$this.gtooltip('destroy');
						}
						if(($this.gtooltip_tipref() in $this.data('gtooltip-tips'))){
							//similar tip exists, so return
							return;
						}
					}
					//check ajax data
					if($this.data('ajax')){
						if(GTooltip[$this.data('ajax')]){
							$this.data('content', GTooltip[$this.data('ajax')]);
						}else{
							$this.data('content', $this.data('gtooltip_params').ajaxloading);
							$.ajax({
								"type" : "GET",
								"url" : $this.data('ajax'),
								"cache" : true,
								"success" : function(res){
									$this.data('content', res);
									$this.gtooltip('destroy');
									$this.gtooltip('render');
									GTooltip[$this.data('ajax')] = res;
								},
							});
						}
					}
					$this.gtooltip('render');
				}
				if(option == 'render'){
					var tip_content = $this.prop('title');
					if($this.data('content')){
						tip_content = $this.data('content');
					}else{
						$this.data('content', $this.prop('title'));
						$this.prop('title', '');
					}
					if($this.data('gtooltip_params').closable){
						var $close_button = '<div class="gtooltip-close">x</div>';
					}else{
						var $close_button = '';	
					}
					var $tip = $('<div class="'+$this.data('gtooltip_params').tipclass+'">'+$close_button+'<div class="gtooltip-content">'+tip_content+'</div><div class="gtooltip-arrow-border gtooltip-arrow-border-'+$this.data('gtooltip_params').position+'"></div><div class="gtooltip-arrow gtooltip-arrow-'+$this.data('gtooltip_params').position+'"></div></div>');
					var $offset = $this.offset();
					var $position = $this.position();
					if($this.data('gtooltip-target')){
						var $offset = $this.data('gtooltip-target').offset();
						var $position = $this.data('gtooltip-target').position();
					}
					var $location;
					if($this.data('gtooltip_params').append == 'after'){
						$this.after($tip);
						$location = $position;
					}else if($this.data('gtooltip_params').append == 'body'){
						$('body').append($tip);
						$location = $offset;
					}
					if($this.data('gtooltip_params').position == 'top'){
						var $top = $location.top - $tip.outerHeight() - 10;//$tip.find('.gtooltip-arrow-border').outerHeight()/2;
						var $left = $location.left + $this.outerWidth()/2 - 30 - 10;
					}else if($this.data('gtooltip_params').position == 'bottom'){
						var $top = $location.top + $this.outerHeight() + 10;//$tip.find('.gtooltip-arrow-border').outerHeight()/2;
						var $left = $location.left + $this.outerWidth()/2 - 30 - 10;
					}else if($this.data('gtooltip_params').position == 'right'){
						var $top = $location.top + $this.outerHeight()/2 - $tip.outerHeight()/2;
						var $left = $location.left + $this.outerWidth() + 10;//$tip.find('.gtooltip-arrow-border').outerWidth()/2;
						$tip.find('.gtooltip-arrow-border').css('top', $tip.outerHeight()/2 - 10);
						$tip.find('.gtooltip-arrow').css('top', $tip.outerHeight()/2 - 10);
					}else if($this.data('gtooltip_params').position == 'left'){
						var $top = $location.top + $this.outerHeight()/2 - $tip.outerHeight()/2;
						var $left = $location.left - $tip.outerWidth() - 10;//$tip.find('.gtooltip-arrow-border').outerWidth()/2;
						$tip.find('.gtooltip-arrow-border').css('top', $tip.outerHeight()/2 - 10);
						$tip.find('.gtooltip-arrow').css('top', $tip.outerHeight()/2 - 10);
					}
					$tip.css('top', $top);
					//$tip.css('left', $this.outerWidth()/2 - 30 - 10); //element width - tooltip arrow left shift - arrow's border width
					$tip.css('left', $left);
					
					$tip.find('.gtooltip-close').on('click', function(){
						$this.gtooltip('destroy');
					});
					
					var tip_ref = $this.gtooltip_tipref();
					if(!$this.data('gtooltip-tips')){
						$this.data('gtooltip-tips', {});
					}
					$this.data('gtooltip-tips')[tip_ref] = $tip;
				}
				if(option == 'destroy'){
					$this.gtooltip_return(tipclass).remove();
					if(typeof $this.data('gtooltip-tips') != 'undefined' && typeof $this.data('gtooltip-tips')[$this.gtooltip_tipref(tipclass)] != 'undefined'){
						delete $this.data('gtooltip-tips')[$this.gtooltip_tipref(tipclass)];
					}
				}
				if(option == 'return'){
					return $this.gtooltip_return();
				}
				if(option == 'hover'){
					$this.on('mouseover', function(){
						clearTimeout($this.data('gtooltip-awaytime'));
						//$this.gtooltip('show');
						var ontime_timeout = setTimeout(function(){
							$this.gtooltip('show');
							$this.gtooltip_return().on('mouseover', function(){
								clearTimeout($this.data('gtooltip-awaytime'));
							});
							$this.gtooltip_return().on('mouseleave', function(){
								var awaytime_timeout = setTimeout(function(){
									$this.gtooltip('destroy');
								}, $this.data('gtooltip_params').awaytime);
								$this.data('gtooltip-awaytime', awaytime_timeout);
							});
						}, $this.data('gtooltip_params').ontime);
						$this.data('gtooltip-ontime', ontime_timeout);
					});
					$this.on('mouseleave', function(){
						clearTimeout($this.data('gtooltip-ontime'));
						var awaytime_timeout = setTimeout(function(){
							$this.gtooltip('destroy');
						}, $this.data('gtooltip_params').awaytime);
						$this.data('gtooltip-awaytime', awaytime_timeout);
						//$this.gtooltip('destroy');
					});
				}
			}else if($.type(option) == 'object'){
				/*$.each(option, function(k, v){
					$this.gtooltip_params[k] = v;
				});*/
				$this.data('gtooltip_params', $.extend({}, GTooltip, option));
			}
		});
	}
}(jQuery));