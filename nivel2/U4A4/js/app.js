$(document).ready(function(){
	var oda = new U4A4();
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})