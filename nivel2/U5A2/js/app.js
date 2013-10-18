$(document).ready(function(){
	var oda = new U5A2();
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})