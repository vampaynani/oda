$(document).ready(function(){
	var oda = new U2A2();
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})