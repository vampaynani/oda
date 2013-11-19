var oda = new U6A4();
$(document).ready(function(){
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})