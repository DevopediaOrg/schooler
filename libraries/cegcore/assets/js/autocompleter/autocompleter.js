$.fn.autoCompleter = function(options){
	var settings = $.extend({
		'path' : '',
		'length' : 2,
		'multiple' : 1,
	}, options);
	
	return this.each(function(){
		function split(val){
			return val.split(/,\s*/);
		}
		function extractLast(term){
			return split(term).pop();
		}
		search_tags(this, settings.path);
		$x = settings.term;
		function search_tags(ELEMENT, PATH){
			$(ELEMENT).bind("keydown", function(event){
					if(event.keyCode === $.ui.keyCode.TAB && $(this).data("autocomplete").menu.active){
						event.preventDefault();
					}
			}).autocomplete({
				source: function(request, response){
					$.getJSON(PATH, {
						'term' : extractLast(request.term)
					}, response);
				},
				search: function(){
					// custom minLength
					var term = extractLast(this.value);
					if(term.length < settings.length){
						return false;
					}
				},
				focus: function(){
					// prevent value inserted on focus
					return false;
				},
				select: function(event, ui){
					var terms = split(this.value);
					// remove the current input
					terms.pop();
					// add the selected item
					terms.push(ui.item.value);
					// add placeholder to get the comma-and-space at the end
					terms.push("");
					if(settings.multiple == 1){
						this.value = terms.join(",");
					}else{
						this.value = terms.join("");
					}
					return false;
				}
			});
		}
	});
};