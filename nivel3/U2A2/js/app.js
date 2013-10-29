$(document).ready(function(){
	var oda = new U2A4();
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})