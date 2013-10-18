$(document).ready(function(){
	var oda = new U3A3();
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})