$(document).ready(function(){
	var oda = new U5A4();
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})