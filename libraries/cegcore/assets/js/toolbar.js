function toggleSelectors(status, form_id){
	jQuery('#'+form_id+' input.gc_selector').each(
		function(){
			jQuery(this).prop('checked', status);
		}
	);
	jQuery('#'+form_id+' input.gc_selector').each(
		function(){
			toggleRowActive(this, false);
		}
	);
}
//not used
function toggleSelectorBg(source){
	var tr = jQuery(source).closest('tr')[0];
	if(jQuery(source).prop('checked') == true){
		jQuery(tr).find('td').css('background-color', '#dde');
	}else{
		jQuery(tr).find('td').css('background-color', '');
	}
}

function toggleRowActive(source, checkit){
	checkit = typeof checkit !== 'undefined' ? checkit : true;
	
	var tr = jQuery(source).closest('tr')[0];
	if(checkit == true){
		jQuery(tr).find('input.gc_selector').prop('checked', checkit);
		jQuery(tr).find('td').css('background-color', '#dde');
	}else{
		if(jQuery(tr).find('input.gc_selector').prop('checked') == true){
			jQuery(tr).find('td').css('background-color', '#dde');
		}else{
			jQuery(tr).find('td').css('background-color', '');
		}
	}
}