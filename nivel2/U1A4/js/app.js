var oda = new U1A4();
$(document).ready(function(){
	$(window).on('resize', function(){
	oda.resize();
	});
	oda.initialize();
})