var oda;
$(document).ready(function(){
	oda = new U3A4();
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})