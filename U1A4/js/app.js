$(document).ready(function(){
	var oda = new U1A4();
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})