$(document).ready(function(){
	var oda = new U2A1();
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})