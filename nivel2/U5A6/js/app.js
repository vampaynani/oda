$(document).ready(function(){
	var oda = new U5A6();
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})