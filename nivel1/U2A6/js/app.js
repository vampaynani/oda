$(document).ready(function(){
	var oda = new U2A6();
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})