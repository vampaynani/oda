$(document).ready(function(){
	var oda = new U4A3();
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})