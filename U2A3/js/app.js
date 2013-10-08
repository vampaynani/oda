$(document).ready(function(){
	var oda = new U2A3();
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})