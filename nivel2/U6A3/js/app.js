$(document).ready(function(){
	var oda = new U1A1();
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})