var oda = new U1A3();
$(document).ready(function(){
	$(window).on('resize', function(){
	oda.resize();
	});
	oda.initialize();
})