$(document).ready(function(){
	var oda = new U1A3();
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})