$(document).ready(function(){
	var oda = new U1A2();
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})