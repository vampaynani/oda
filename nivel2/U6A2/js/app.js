$(document).ready(function(){
	var oda = new U4A6();
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})