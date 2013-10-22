$(document).ready(function(){
	var oda = new U5A5();
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})