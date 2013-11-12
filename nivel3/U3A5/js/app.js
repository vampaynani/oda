$(document).ready(function(){
	var oda = new U1A5();
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})