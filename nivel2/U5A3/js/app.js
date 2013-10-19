$(document).ready(function(){
	var oda = new U5A3();
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})