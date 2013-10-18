$(document).ready(function(){
	var oda = new U5A1();
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})