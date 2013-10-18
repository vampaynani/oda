$(document).ready(function(){
	var oda = new U4A1();
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})