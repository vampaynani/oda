var oda;
$(document).ready(function(){
	oda = new U3A6();
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})