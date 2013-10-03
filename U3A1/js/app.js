$(document).ready(function(){
	var oda = new U3A1();
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})