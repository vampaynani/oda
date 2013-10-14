$(document).ready(function(){
	var oda = new U1A6();
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})