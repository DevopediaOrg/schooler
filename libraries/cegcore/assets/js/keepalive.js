/*jQuery(function(){
	var lastUpdate = 0;
	var checkInterval = setInterval(function(){
		var now = new Date();
		if(now.getTime() - lastUpdate > 600000){
			clearInterval(checkInterval);
		}else{
			jQuery.get('index.php');
		}
	}, 600000); // 10 mins * 60 * 1000
	jQuery(document).keydown(function(){
		var past = new Date();
		lastUpdate = past.getTime();
	});
});*/
setInterval(function(){ jQuery.get('index.php'); }, 300000); 