$(document).ready(function(){
	var oda = new U3A2();
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})